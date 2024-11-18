import 'package:either_dart/either.dart';

import '../error/failure.dart';

abstract class UseCase<T, R>{
  Future<Either<Failure, T>> call(R params);
}

abstract class NonEitherUseCase<T, R>{
  Future<T> call(R params);
}

abstract class SyncUseCase<T, R>{
  T call(R params);
}

