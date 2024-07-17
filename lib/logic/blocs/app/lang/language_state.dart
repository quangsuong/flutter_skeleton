part of 'language_bloc.dart';

class LanguageState extends Equatable {
  final String locale;
  const LanguageState(this.locale);

  @override
  List<Object> get props => [locale];
}
