import 'package:flutter/material.dart';

class MenuData {
  final IconData icon;
  final String path;
  final bool selected;

  const MenuData(this.icon, this.path, this.selected);
}

class AppSideBarMenu extends StatelessWidget {
  final List<MenuData> data;

  const AppSideBarMenu({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20.0),
      width: 48.0,
      color: Theme.of(context).appBarTheme.backgroundColor?.withOpacity(0.8),
      child: Column(
        children: data
            .map((MenuData item) => IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(item.path);
                },
                icon: Icon(
                  item.icon,
                  color:
                      item.selected ? Colors.greenAccent : Colors.grey.shade200,
                )))
            .toList(),
      ),
    );
  }
}
