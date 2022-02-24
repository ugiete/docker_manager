import 'package:flutter/material.dart';

void navigateTo(BuildContext context, String routeName, {Object? arguments}) {
  Navigator.of(context).pushNamed(routeName, arguments: arguments);
}

void navigateReplaceTo(BuildContext context, String routeName,
    {Object? arguments}) {
  Navigator.of(context).pushReplacementNamed(routeName, arguments: arguments);
}
