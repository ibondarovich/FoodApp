import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:meta/meta.dart';

part 'event.dart';
part 'state.dart';

class SettingsViewBloc extends Bloc<SettingsViewEvent, SettingsViewState> {
  final SaveThemeUseCase _saveThemeUseCase;
  final FetchThemeUseCase _fetchThemeUseCase;
  final SaveScaleFactorUseCase _saveScaleFactorUseCase;
  final FetchScaleFactorUseCase _fetchScaleFactorUseCase;

  SettingsViewBloc({
    required SaveThemeUseCase saveThemeUseCase,
    required FetchThemeUseCase fetchThemeUseCase,
    required SaveScaleFactorUseCase saveScaleFactorUseCase,
    required FetchScaleFactorUseCase fetchScaleFactorUseCase,
  }) : _saveThemeUseCase = saveThemeUseCase,
      _fetchThemeUseCase = fetchThemeUseCase,
      _fetchScaleFactorUseCase = fetchScaleFactorUseCase,
      _saveScaleFactorUseCase = saveScaleFactorUseCase,
  super(SettingsViewState(isDark: false)) {
    on<InitEvent>(_init);
    on<OnSwitchThemeEvent>(_onSetTheme); 
    on<OnSetScaleFactor>(_onSetScaleFactor);
    on<OnGetScaleFactor>(_onGetScaleFactor);

    add(InitEvent());
    add(OnGetScaleFactor());
  }

  void _init(InitEvent event, Emitter<SettingsViewState> emit){
    final bool result = _fetchThemeUseCase.execute(const NoParams());
    emit(SettingsViewState(isDark: result));
  }

  void _onSetTheme(OnSwitchThemeEvent event, Emitter<SettingsViewState> emit) {
    _saveThemeUseCase.execute(event.isDark);
    emit(state.copyWith(isDark: event.isDark));
  }

  void _onSetScaleFactor(
      OnSetScaleFactor event, Emitter<SettingsViewState> emit) {
    _saveScaleFactorUseCase.execute(event.scaleFactor);
    emit(state.copyWith(scaleFactor: event.scaleFactor));
  }

  void _onGetScaleFactor(
      OnGetScaleFactor event, Emitter<SettingsViewState> emit) {
    final result = _fetchScaleFactorUseCase.execute(const NoParams());
    emit(state.copyWith(scaleFactor: result));
  }
}
