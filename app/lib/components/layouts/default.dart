import 'dart:async';

import 'package:app/components/pages/home/home.dart';
import 'package:app/components/pages/settings/settings.dart';
import 'package:app/components/pages/templates/templates.dart';
import 'package:app/components/ui/bottom.dart';
import 'package:app/components/ui/header.dart';
import 'package:app/components/ui/side_menu.dart';
import 'package:app/models/socket.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DefaultLayout extends StatefulWidget {
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

  @override
  State<DefaultLayout> createState() => _DefaultLayoutState();
}

class _DefaultLayoutState extends State<DefaultLayout> {
  late Timer timer;
  bool loading = true;

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

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
              MenuData(Icons.account_tree_rounded, HomePage.route,
                  widget.currentMenu == 0),
              MenuData(Icons.file_present_sharp, TemplatesPage.route,
                  widget.currentMenu == 1),
              MenuData(
                Icons.settings,
                SettingsPage.route,
                widget.currentMenu == 2,
              ),
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
                          title: widget.title,
                          action: widget.action,
                          backPath: widget.backPath),
                      widget.body,
                    ],
                  ))))
        ],
      ),
      bottomNavigationBar: Consumer<ManagerSocket>(
          builder: (BuildContext context, ManagerSocket state, Widget? child) {
        if (loading) {
          Future.delayed(const Duration(seconds: 10), () {
            state.list();
            loading = false;
          });
        }
        timer = Timer.periodic(const Duration(seconds: 9), ((Timer timer) {
          // Verify status every 10 seconds
          state.status();
        }));
        return const AppBottom();
      }),
      floatingActionButton: widget.floatButton,
    );
  }
}
