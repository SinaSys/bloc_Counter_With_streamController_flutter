import 'dart:developer';

import 'package:bloc_flutter/counter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: InputPage());
  }
}

class InputPage extends StatelessWidget {
  CounterBloc counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Bloc"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("You have pushed the Button : "),
          ),
          StreamBuilder(
            stream: counterBloc.counterStream,
            initialData: 0,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              return Center(
                child: Text("${snapshot.data}"),
              );
            },
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              counterBloc.eventSink.add(CounterAction.Decrement);
            },
          ),
          SizedBox(width: 10.0),
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              counterBloc.eventSink.add(CounterAction.Increment);
            },
          ),
          SizedBox(width: 10.0),
          FloatingActionButton(
            child: Icon(Icons.refresh),
            onPressed: () {
              counterBloc.eventSink.add(CounterAction.Reset);
            },
          )
        ],
      ),
    );
  }
}
