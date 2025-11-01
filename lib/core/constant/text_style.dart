
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextStyles {
  TextStyles._();
  static TextStyle textStyleBold25(BuildContext context) => TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Theme.of(context).colorScheme.onSurface,
  );
 static TextStyle textStyleBold15(BuildContext context) => TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Theme.of(context).colorScheme.onSurface,
  );
static TextStyle textStyleSemiBold20(BuildContext context) => TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Theme.of(context).colorScheme.secondary,
  );
  static TextStyle textStyleRegular15(BuildContext context) => TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: Theme.of(context).colorScheme.surface,
  );

}