// lib/presentation/pages/settings_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_skeleton/core/constants/language.dart';
import 'package:flutter_skeleton/core/di/locator.dart';
import 'package:flutter_skeleton/core/utils/localization.dart';
import 'package:flutter_skeleton/logic/blocs/app/lang/language_bloc.dart';
import 'settings_view_model.dart';

class SettingsPage extends StatelessWidget {
  final SettingViewModel viewModel =
      ServiceLocator.instance.get<SettingViewModel>();

  SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      bloc: viewModel.languageBloc,
      builder: (context, state) {
        return Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shadowColor: Colors.white,
            ),
            onPressed: () {
              viewModel.changeLanguage(state.locale == MyLanguages.en
                  ? MyLanguages.vi
                  : MyLanguages.en);
            },
            child: Text(AppLocalizations.of(context).translate('changeLanguage')),
          ),
        );
      },
    );
  }
}
