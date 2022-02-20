import 'package:app/components/pages/settings/settings.dart';
import 'package:app/resources/theme.dart';
import 'package:flutter/material.dart';

class DockerManagerApp extends StatelessWidget {
  const DockerManagerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      title: 'Docker Manager',
      debugShowCheckedModeBanner: false,
      home: const SettingsPage(),
    );
  }
}
