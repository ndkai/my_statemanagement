import 'package:flutter/material.dart';
import 'package:statemanagement/statemanagement.dart';

class KaismBuilder extends StatelessWidget {
  const KaismBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    TestBloc test = TestBloc();
    return Column(
      children: [
        StreamBuilder<StateX>(stream: test.stream, builder: (context, snapshot){
          print("snapshot ${snapshot.data}");
          if(snapshot.data is StateX1){
            return const Text("1", style: TextStyle(color: Colors.blue),);
          }
          if(snapshot.data is StateX2){
            return const Text("2", style: TextStyle(color: Colors.blue));
          }
          return const Text("3", style: TextStyle(color: Colors.blue));
        }),
        const SizedBox(height: 50,),
        InkWell(
          onTap: (){
            test.handle.handle(EventX2());
          },
          child: Container(
            height: 100,
            width: 100,
            color: Colors.redAccent,
          ),
        )
      ],
    );
  }
}
