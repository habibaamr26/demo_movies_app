

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week6_task/config/theme/theme_cubit/theme_cubit.dart';
import 'package:week6_task/core/constant/images.dart';
import 'package:week6_task/core/constant/text.dart';
import 'package:week6_task/core/constant/text_style.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
                leading: SizedBox(child: Image.asset(Images.jerry)),
                title: Text(
                  Texts.welcomeBack,
                  style: TextStyles.textStyleSemiBold20(context),
                ),
                subtitle: Text(
                  Texts.userName,
                  style: TextStyles.textStyleBold25(context),
                ),
                trailing: IconButton(
                  icon: context.read<ThemeCubit>().isDark
                      ? const Icon(Icons.dark_mode)
                      : const Icon(Icons.light_mode),
                  onPressed: () {
                    // toggle between light and dark themes
                    context.read<ThemeCubit>().themeSwitch();
                  },
                ),
              );
  }
}