import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

part 'event.dart';
part 'state.dart';

class MainViewBloc extends Bloc<MainViewEvent, MainState> {
  final AuthService _authService;
  final CheckUserExistenceUseCase _getUserUseCase;
  final FetchThemeUseCase _fetchThemeUseCase;
  final FetchScaleFactorUseCase _fetchScaleFactorUseCase;
  final AppRouter _appRouter;

  MainViewBloc({
    required AuthService authService,
    required CheckUserExistenceUseCase getUserUseCase,
    required FetchThemeUseCase fetchThemeUseCase,
    required FetchScaleFactorUseCase fetchScaleFactorUseCase,
    required AppRouter appRouter,
  })  : _authService = authService,
        _appRouter = appRouter,
        _getUserUseCase = getUserUseCase,
        _fetchThemeUseCase = fetchThemeUseCase,
        _fetchScaleFactorUseCase = fetchScaleFactorUseCase,
        super(MainState(isDark: false, textScale: TextScaleType.small.value)) {
    on<InitEvent>(_init);

    add(InitEvent());
  }

  void _init(InitEvent event, Emitter<MainState> emit) {
    final bool themeResult = _fetchThemeUseCase.execute(const NoParams());
    final double textScaleResult =
        _fetchScaleFactorUseCase.execute(const NoParams());
    emit(state.copyWith(isDark: themeResult, textScale: textScaleResult));
    _authService.authenticated = _getUserUseCase.execute(const NoParams());
    _appRouter.replace(const HomeRoute());
  }
}
