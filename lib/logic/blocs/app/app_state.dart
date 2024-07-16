part of 'app_bloc.dart';

enum LanguageType { en, vi }

sealed class AppState extends Equatable {
  final LanguageType language;

  const AppState({required this.language});

  @override
  List<Object> get props => [language];
}

final class AppLanguage extends AppState {
  const AppLanguage(LanguageType language) : super(language: language);
}
