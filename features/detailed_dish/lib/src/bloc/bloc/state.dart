part of 'bloc.dart';

class DetailedDishState {
  final String errorMessage;

  DetailedDishState({
    this.errorMessage = '',
  });

  DetailedDishState copyWith({
    String? errorMessage,
  }) {
    return DetailedDishState(
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
