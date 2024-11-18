part of '../../pages/trivia_screen.dart';

class _TriviaScreen extends StatelessWidget {
  const _TriviaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: KaismBuilder<GetTriviaKaism, GetTriviaState>(
          builder: (context, state) {
            print("sssss ${state}");

            if (state is GetTriviaLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is GetTriviaError) {
              return Center(child: Text(state.data.message));
            }
            if (state is GetTriviaSuccess) {
              return SafeArea(
                  child: ListView(
                      children: state.data.map(
                              (e) => _BuildTrivia(trivia: e,)
                      ).toList()
                  ));
            }
            return SizedBox();
          })),
    );
  }
}



class _BuildTrivia extends StatefulWidget {
  final Trivia trivia;
  const _BuildTrivia({super.key, required this.trivia});

  @override
  State<_BuildTrivia> createState() => __BuildTriviaState();
}

class __BuildTriviaState extends State<_BuildTrivia> {
  TextEditingController _controller = TextEditingController();
  Color boxColors = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: boxColors,
          borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        children: [
          Text(widget.trivia.question??""),
          TextField(controller: _controller,),
          SizedBox(height: 10,),
          InkWell(
            onTap: (){
              setState(() {
                if(_controller.text.toLowerCase() == widget.trivia.correctAnswer){
                  boxColors = Colors.greenAccent;
                }
                boxColors = Colors.redAccent;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.blueAccent
              ),
              child: Center(child: Text("Submit"),),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
}