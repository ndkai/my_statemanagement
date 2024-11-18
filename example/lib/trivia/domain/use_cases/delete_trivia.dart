import 'package:either_dart/either.dart';
import 'package:example/trivia/data/repositories/trivia_repo_impl.dart';
import 'package:example/trivia/domain/entities/trivia.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/usecase.dart';

class DeleteTriviaUseCase implements UseCase<List<Trivia>, int>{
  @override
  Future<Either<Failure, List<Trivia>>> call(int params) {
    final repository = TriviaRepoImpl();
    return repository.getListTrivia(params);
  }
}