

import 'package:flutter/material.dart';
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
                  icon: const Icon(Icons.dark_mode),
                  onPressed: () {
                    // toggle between light and dark themes
                  },
                ),
              );
  }
}