import 'package:app/components/layouts/default.dart';
import 'package:app/components/pages/home/table.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
        body: ContainersTable(columns: [
      'Container ID',
      'Names',
      'Ports',
      'Status',
      'Created At'
    ]));
  }
}
