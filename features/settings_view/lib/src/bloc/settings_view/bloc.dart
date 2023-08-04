import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:meta/meta.dart';

part 'event.dart';
part 'state.dart';

class SettingsViewBloc extends Bloc<SettingsViewEvent, SettingsViewState> {
  final SaveThemeUseCase _saveThemeUseCase;
  final FetchThemeUseCase _fetchThemeUseCase;
  final SignOutUseCase _signOutUseCase;
  final SaveScaleFactorUseCase _saveScaleFactorUseCase;
  final FetchScaleFactorUseCase _fetchScaleFactorUseCase;
  final AuthService _authService;

  SettingsViewBloc({
    required SaveThemeUseCase saveThemeUseCase,
    required FetchThemeUseCase fetchThemeUseCase,
    required SaveScaleFactorUseCase saveScaleFactorUseCase,
    required FetchScaleFactorUseCase fetchScaleFactorUseCase,
    required SignOutUseCase signOutUseCase,
    required AuthService authService,
  })  : _saveThemeUseCase = saveThemeUseCase,
        _fetchThemeUseCase = fetchThemeUseCase,
        _fetchScaleFactorUseCase = fetchScaleFactorUseCase,
        _saveScaleFactorUseCase = saveScaleFactorUseCase,
        _signOutUseCase = signOutUseCase,
        _authService = authService,
        super(SettingsViewState(isDark: false)) {
    on<InitEvent>(_init);
    on<OnSignOutEvent>(_onSignOut);
    on<OnSwitchThemeEvent>(_onSetTheme);
    on<OnSetScaleFactor>(_onSetScaleFactor);
    on<OnGetScaleFactor>(_onGetScaleFactor);
    on<OnLaunchUrlEvent>(_onLaunchUrl);

    add(InitEvent());
    add(OnGetScaleFactor());
  }

  void _init(InitEvent event, Emitter<SettingsViewState> emit) {
    final bool result = _fetchThemeUseCase.execute(const NoParams());
    emit(SettingsViewState(isDark: result));
  }

  void _onSetTheme(OnSwitchThemeEvent event, Emitter<SettingsViewState> emit) {
    _saveThemeUseCase.execute(event.isDark);
    emit(state.copyWith(isDark: event.isDark));
  }

  void _onSetScaleFactor(
    OnSetScaleFactor event,
    Emitter<SettingsViewState> emit,
  ) {
    _saveScaleFactorUseCase.execute(event.scaleFactor);
    emit(state.copyWith(scaleFactor: event.scaleFactor));
  }

  void _onGetScaleFactor(
    OnGetScaleFactor event,
    Emitter<SettingsViewState> emit,
  ) {
    final result = _fetchScaleFactorUseCase.execute(const NoParams());
    emit(state.copyWith(scaleFactor: result));
  }

  void _onLaunchUrl(
    OnLaunchUrlEvent event,
    Emitter<SettingsViewState> emit,
  ) async {
    final Uri url = Uri.parse(event.url);
    await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(enableJavaScript: true),
    );
  }

  void _onSignOut(
    OnSignOutEvent event,
    Emitter<SettingsViewState> emit,
  ) async {
    await _signOutUseCase.execute(const NoParams());
    _authService.authenticated = false;
  }
}
