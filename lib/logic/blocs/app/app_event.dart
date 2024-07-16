part of 'app_bloc.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class ChangeLanguageEvent extends AppEvent {
  final LanguageType language;
  const ChangeLanguageEvent(this.language);

  @override
  List<Object> get props => [language];
}