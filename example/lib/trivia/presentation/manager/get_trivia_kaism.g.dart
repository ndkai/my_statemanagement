// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_trivia_kaism.dart';

// **************************************************************************
// KaismGenerator
// **************************************************************************

// Kaism generation
class GetTriviaKaism extends KaiSM<GetTriviaEvent, GetTriviaState> {
  final GetListTriviaUseCase getListTriviaUseCase;
  final DeleteTriviaUseCase deleteTriviaUseCase;
  GetTriviaKaism(
    this.getListTriviaUseCase,
    this.deleteTriviaUseCase,
  ) : super(GetTriviaInitial()) {
    handle.register<GetTriviaDataEvent>((event) {
      _doGetTriviaDataEvent(event);
    });
    handle.register<DeleteTriviaDataEvent>((event) {
      _doDeleteTriviaDataEvent(event);
    });
  }
  void _doGetTriviaDataEvent(GetTriviaDataEvent event) async {
    updateState(GetTriviaLoading());
    var result = await getListTriviaUseCase(event.param);

    return updateState(
        result.fold((l) => GetTriviaError(l), (r) => GetTriviaSuccess(r)));
  }

  void _doDeleteTriviaDataEvent(DeleteTriviaDataEvent event) async {
    updateState(GetTriviaLoading());
    var result = await deleteTriviaUseCase(event.param);
    return updateState(
        result.fold((l) => GetTriviaError(l), (r) => GetTriviaSuccess(r)));
  }
}

// Event generation
@immutable
sealed class GetTriviaEvent {}

class GetTriviaDataEvent extends GetTriviaEvent {
  final int param;
  GetTriviaDataEvent(this.param);
}

class DeleteTriviaDataEvent extends GetTriviaEvent {
  final int param;
  DeleteTriviaDataEvent(this.param);
}

// State generation
@immutable
sealed class GetTriviaState {}

final class GetTriviaInitial extends GetTriviaState {}

final class GetTriviaLoading extends GetTriviaState {}

final class GetTriviaError extends GetTriviaState {
  final Failure data;
  GetTriviaError(this.data);
}

final class GetTriviaSuccess extends GetTriviaState {
  final List<Trivia> data;
  GetTriviaSuccess(this.data);
}
