import 'package:either_dart/either.dart';
import 'package:example/core/error/failure.dart';
import 'package:example/trivia/domain/entities/trivia.dart';

abstract class TriviaRepo{
  Future<Either<Failure, List<Trivia>>> getListTrivia(int param);
  Future<Either<Failure, bool>> deleteTrivia(int param);
}