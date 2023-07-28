part of 'bloc.dart';

class DetailedDishViewState {
  final String errorMessage;

  DetailedDishViewState({
    this.errorMessage = '',
  });

  DetailedDishViewState copyWith({
    String? errorMessage,
  }) {
    return DetailedDishViewState(
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
