import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:navigation/navigation.dart';

part 'event.dart';
part 'state.dart';

class MainViewBloc extends Bloc<MainViewEvent, MainViewState> {
  final AuthService _authService;
  final CheckUserUseCase _getUserUseCase;
  final AppRouter _appRouter = appLocator.get<AppRouter>();

  MainViewBloc({
    required AuthService authService,
    required CheckUserUseCase getUserUseCase,
  })  : _authService = authService,
        _getUserUseCase = getUserUseCase,
        super(MainViewBlocInitial()) {
    on<InitEvent>(_init);

    add(InitEvent());
  }

  void _init(InitEvent event, Emitter<MainViewState> emit) {
    _authService.authenticated = _getUserUseCase.execute(const NoParams());
    _appRouter.replace(const HomeRoute());
  }
}
