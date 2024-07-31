// lib/presentation/pages/settings_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/core/constants/language.dart';
import 'package:flutter_skeleton/core/di/locator.dart';
import 'package:flutter_skeleton/core/utils/localization.dart';
import 'package:flutter_skeleton/logic/blocs/app/lang/language_bloc.dart';

import '../../../core/utils/my_animations.dart';
import '../../../logic/blocs/app/theme/theme_bloc.dart';
import '../../../logic/blocs/app/theme/theme_event.dart';
import '../../../logic/blocs/app/theme/theme_state.dart';
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
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.white24),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        image: DecorationImage(
                          image: Image.asset(MyAnimations.noResult,
                                  color: Colors.grey, fit: BoxFit.contain)
                              .image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 16),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: const Text(
                                "Basic",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              const Text('Press the button to toggle dark mode'),
              const SizedBox(height: 20),
              Switch(
                value: context.watch<ThemeBloc>().state is DarkThemeState,
                onChanged: (bool value) {
                  if (value) {
                    context.read<ThemeBloc>().add(EnableDarkMode());
                  } else {
                    context.read<ThemeBloc>().add(DisableDarkMode());
                  }
                },
              ),
              const SizedBox(height: 20),
              const Text('Press the button to change language'),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shadowColor: Colors.white,
                ),
                onPressed: () {
                  viewModel.changeLanguage(state.locale == MyLanguages.en
                      ? MyLanguages.vi
                      : MyLanguages.en);
                },
                child: Text(
                    AppLocalizations.of(context).translate('changeLanguage')),
              )
            ],
          ),
        );
      },
    );
  }
}
