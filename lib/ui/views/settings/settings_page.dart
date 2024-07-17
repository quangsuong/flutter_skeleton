// lib/presentation/pages/settings_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_skeleton/core/di/locator.dart';
import 'package:flutter_skeleton/core/utils/localization.dart';
import 'package:flutter_skeleton/logic/blocs/app/app_bloc.dart';
import 'settings_view_model.dart';

class SettingsPage extends StatelessWidget {
  final SettingViewModel viewModel =
      ServiceLocator.instance.get<SettingViewModel>();

  SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      bloc: viewModel.appBloc,
      builder: (context, state) {
        return Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shadowColor: Colors.white,
            ),
            onPressed: () {
              viewModel.changeLanguage(state.language == LanguageType.en
                  ? LanguageType.vi
                  : LanguageType.en);
            },
            child: Text(AppLocalizations.of(context).translate('changeLanguage')),
          ),
        );
      },
    );
  }
}
