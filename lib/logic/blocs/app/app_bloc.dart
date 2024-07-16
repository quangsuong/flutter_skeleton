import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_skeleton/core/utils/bloc_extensions.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppLanguage(LanguageType.en)) {
    on<ChangeLanguageEvent>((event, emit) {
      emitSafely(AppLanguage(event.language));
    });
  }
}
