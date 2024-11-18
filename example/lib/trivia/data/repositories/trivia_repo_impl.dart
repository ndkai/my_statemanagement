import 'package:either_dart/src/either.dart';

import 'package:example/core/error/failure.dart';
import 'package:example/trivia/data/data_sources/remote_trivia_datasource.dart';

import 'package:example/trivia/domain/entities/trivia.dart';

import '../../../core/error/exceptions.dart';
import '../../domain/repositories/trivia_repo.dart';

class TriviaRepoImpl implements TriviaRepo{
  @override
  Future<Either<Failure, List<Trivia>>> getListTrivia(int param) async {
    try {
      final remoteData = RemoteTriviaDatasourceImpl();
      final result = await remoteData.getTrivia(param);
      return Right(result.results!.map((e) => Trivia.fromJson(e.toJson())).toList());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteTrivia(int param) async{
    return Right(true);
  }
  
}