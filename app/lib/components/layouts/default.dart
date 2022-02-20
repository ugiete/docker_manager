import 'package:app/components/ui/bottom.dart';
import 'package:app/components/ui/header.dart';
import 'package:app/components/ui/side_menu.dart';
import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Widget body;
  final Widget? floatButton;

  const DefaultLayout({required this.body, this.floatButton, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppHeader(),
      body: Row(
        children: [
          const AppSideBarMenu(
            data: [MenuData(Icons.settings, 'settings-path', true)],
          ),
          Expanded(
              child: Container(
                  padding: const EdgeInsets.all(20.0),
                  height: double.infinity,
                  child: SingleChildScrollView(child: body)))
        ],
      ),
      bottomNavigationBar: AppBottom(
          data: InfoData('127.0.0.1', true, 0, false), loading: false),
      floatingActionButton: floatButton,
    );
  }
}
