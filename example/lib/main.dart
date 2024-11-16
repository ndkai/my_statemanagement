import 'package:example/src/kaism_builder.dart';
import 'package:example/src/kaism_factory.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement/statemanagement.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Example(),
    );
  }
}

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KaismFactory(
          kais: TestBloc(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              KaismBuilder<TestBloc, StateX>(
                  builder: (context, state){
                    return Center(
                      child: Text(state.toString()),
                    );
                  }
              ),
              InkWell(
                onTap: (){

                },
                child: Container(
                  color: Colors.redAccent,
                  height: 100,
                  width: 100,
                ),
              )
            ],
          )),
    );
  }
}

abstract class EventX {}

class EventX1 extends EventX {}

class EventX2 extends EventX {}

abstract class StateX {}

class StateX1 extends StateX {}

class StateX2 extends StateX {}
