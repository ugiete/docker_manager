import 'package:app/components/pages/home/edit-service/edit_service.dart';
import 'package:app/components/pages/home/home.dart';
import 'package:app/components/pages/not-found/not-found.dart';
import 'package:app/components/pages/settings/settings.dart';
import 'package:app/components/pages/templates/templates.dart';
import 'package:app/models/service.dart';
import 'package:flutter/material.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  Widget page = const NotFoundPage();

  if (settings.name == EditServicePage.editRoute) {}

  switch (settings.name) {
    case HomePage.route:
      page = const HomePage();
      break;

    case EditServicePage.editRoute:
      page = EditServicePage(service: settings.arguments as Service);
      break;

    case EditServicePage.newRoute:
      page = EditServicePage.newService();
      break;

    case SettingsPage.route:
      page = SettingsPage();
      break;

    case TemplatesPage.route:
      page = const TemplatesPage();
      break;

    default:
      break;
  }

  return PageRouteBuilder(
    pageBuilder: (_, __, ___) => page,
  );
}
