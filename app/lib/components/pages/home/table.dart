import 'package:flutter/material.dart';

class ContainersTable extends StatelessWidget {
  final List<String> columns;

  const ContainersTable({required this.columns, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
        border: TableBorder(borderRadius: BorderRadius.circular(5.0)),
        headingRowColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          return Theme.of(context).colorScheme.primary.withOpacity(0.08);
        }),
        columns: columns
            .map((String label) => DataColumn(label: Text(label)))
            .toList(),
        rows: List<int>.generate(10, (index) => index)
            .map((e) => const DataRow(cells: [
                  DataCell(Text('AAAAAAAAAA')),
                  DataCell(Text('AAAAAAAAAA')),
                  DataCell(Text('AAAAAAAAAA')),
                  DataCell(Text('AAAAAAAAAA')),
                  DataCell(Text('AAAAAAAAAA')),
                ]))
            .toList());
  }
}
