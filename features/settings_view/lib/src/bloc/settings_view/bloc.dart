import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:meta/meta.dart';

part 'event.dart';
part 'state.dart';

class SettingsViewBloc extends Bloc<SettingsViewEvent, SettingsViewState> {
  final SaveThemeUseCase _saveThemeUseCase;
  final FetchThemeUseCase _fetchThemeUseCase;

  SettingsViewBloc({
    required SaveThemeUseCase saveThemeUseCase,
    required FetchThemeUseCase fetchThemeUseCase
  }) : _saveThemeUseCase = saveThemeUseCase,
      _fetchThemeUseCase = fetchThemeUseCase,
  super(SettingsViewState(isDark: false)) {
    on<InitEvent>(_init);
    on<OnSwitchThemeEvent>(_onSetTheme); 

    add(InitEvent());
  }

  void _init(InitEvent event, Emitter<SettingsViewState> emit){
    final bool result = _fetchThemeUseCase.execute(const NoParams());
    emit(SettingsViewState(isDark: result));
  }

  void _onSetTheme(OnSwitchThemeEvent event, Emitter<SettingsViewState> emit){
    _saveThemeUseCase.execute(event.isDark);
    emit(SettingsViewState(isDark: event.isDark));
  }
}
