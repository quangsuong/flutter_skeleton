part of 'dialog_bloc.dart';

abstract class DialogEvent extends Equatable {
  const DialogEvent();
  @override
  List<Object?> get props => [];
}

class ShowDialogEvent extends DialogEvent {
  final String? title;
  final String content;

  const ShowDialogEvent(this.title, this.content);

  const ShowDialogEvent.withMessage(String content) : this(null, content);

  @override
  List<Object?> get props => [title, content];
}

class HideDialogEvent extends DialogEvent {}
