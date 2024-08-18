import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/core/utils/locale_support.dart';

import '../../core/di/locator.dart';
import '../../core/utils/navigator.dart';
import '../../logic/blocs/dialog/dialog_bloc.dart';

class GlobalDialog extends StatelessWidget {
  final Widget child;

  const GlobalDialog({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final DialogBloc dialogBloc = ServiceLocator.instance.get<DialogBloc>();
    return BlocListener<DialogBloc, DialogState>(
      bloc: dialogBloc,
      listener: (context, state) {
        if (state is DialogVisible) {
          showDialog(
            context: navigatorKey.currentContext!,
            // Use the navigator key context
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                    state.title ?? context.locale.translate('notification')),
                content: Text(state.content),
                elevation: 12.0,
                actions: <Widget>[
                  TextButton(
                    child: Text(context.locale.translate('close')),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          ).then((onValue) => {dialogBloc.add(HideDialogEvent())});
        }
      },
      child: child,
    );
  }
}
