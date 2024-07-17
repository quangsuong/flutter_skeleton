part of 'dialog_bloc.dart';

abstract class DialogState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DialogHidden extends DialogState {}

class DialogVisible extends DialogState {
  final String? title;
  final String content;

  DialogVisible(this.title, this.content);

  @override
  List<Object?> get props => [title, content];
}
