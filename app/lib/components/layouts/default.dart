import 'package:app/components/pages/home/home.dart';
import 'package:app/components/pages/settings/settings.dart';
import 'package:app/components/ui/bottom.dart';
import 'package:app/components/ui/header.dart';
import 'package:app/components/ui/side_menu.dart';
import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final String title;
  final Widget body;
  final bool backPath;
  final int currentMenu;
  final Widget? action;
  final Widget? floatButton;

  const DefaultLayout(
      {required this.title,
      required this.body,
      required this.currentMenu,
      this.backPath = false,
      this.action,
      this.floatButton,
      Key? key})
      : super(key: key);

  void onNavigate(BuildContext context, String path, Object? arguments) {
    Navigator.of(context).pushNamed(path, arguments: arguments);
  }

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
          onNavigate: (String path, {Object? arguments}) =>
              onNavigate(context, path, arguments)),
      body: Row(
        children: [
          AppSideBarMenu(
            data: [
              MenuData(
                  Icons.account_tree_rounded, HomePage.route, currentMenu == 0),
              MenuData(Icons.settings, SettingsPage.route, currentMenu == 1),
            ],
          ),
          Expanded(
              child: Container(
                  padding: const EdgeInsets.all(20.0),
                  height: double.infinity,
                  child: SingleChildScrollView(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      PageHeader(
                          title: title, action: action, backPath: backPath),
                      body,
                    ],
                  ))))
        ],
      ),
      bottomNavigationBar: AppBottom(data: InfoData(0, false)),
      floatingActionButton: floatButton,
    );
  }
}
