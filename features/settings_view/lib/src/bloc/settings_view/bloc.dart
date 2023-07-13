import 'package:core/core.dart';
import 'package:meta/meta.dart';

part 'event.dart';
part 'state.dart';

class SettingsViewBloc extends Bloc<SettingsViewEvent, SettingsViewState> {
  SettingsViewBloc() : super(SettingsViewState(isDark: false)) {
    on<OnSwitchThemeEvent>(_onSetTheme);
  }

  void _onSetTheme(OnSwitchThemeEvent event, Emitter<SettingsViewState> emit){
    emit(SettingsViewState(isDark: event.isDark));
  }
}
