import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_skeleton/core/utils/bloc_extensions.dart';

part 'dialog_event.dart';
part 'dialog_state.dart';

class DialogBloc extends Bloc<DialogEvent, DialogState> {
  DialogBloc() : super(DialogHidden()) {
    on<ShowDialogEvent>(
        (event, emit) => emitSafely(DialogVisible(event.title, event.content)));
    on<HideDialogEvent>((event, emit) => emitSafely(DialogHidden()));
  }
}
