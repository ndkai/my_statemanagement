import 'package:example/core/error/failure.dart';
import 'package:example/trivia/domain/entities/trivia.dart';
import 'package:example/trivia/domain/use_cases/delete_trivia.dart';
import 'package:flutter/cupertino.dart';
import 'package:generators/annotations/kaism.dart';
import 'package:statemanagement/statemanagement.dart';
import '../../domain/use_cases/get_list_trivia.dart';
part 'get_trivia_kaism.g.dart';



@kaism
abstract class GetTrivia{
  late Failure errorState;
  late List<Trivia> successState;

  GetListTriviaUseCase GetTriviaDataEvent(int value);
  DeleteTriviaUseCase DeleteTriviaDataEvent(int value);
}

