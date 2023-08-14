part of 'bloc.dart';

class MainState {
  final bool isDark;
  final double textScale;

  MainState({
    required this.isDark,
    required this.textScale,
  });

  MainState copyWith({
    required bool? isDark,
    required double? textScale,
  }) {
    return MainState(
      isDark: isDark ?? this.isDark,
      textScale: textScale ?? this.textScale,
    );
  }
}
