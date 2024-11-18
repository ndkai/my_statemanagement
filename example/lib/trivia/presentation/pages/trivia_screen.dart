import 'package:example/trivia/domain/entities/trivia.dart';
import 'package:example/trivia/domain/use_cases/delete_trivia.dart';
import 'package:example/trivia/presentation/manager/get_trivia_kaism.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement/statemanagement.dart';
import '../../domain/use_cases/get_list_trivia.dart';
part '../widgets/local_trivia_screen/local_trivia_screen.dart';

class TriviaScreen extends StatelessWidget {
  const TriviaScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return KaismFactory(
        kaism: GetTriviaKaism(GetListTriviaUseCase(), DeleteTriviaUseCase())..add(GetTriviaDataEvent(10)),
        child: const _TriviaScreen()
    );
  }


}



