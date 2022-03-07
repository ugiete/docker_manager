import 'package:app/models/templates.dart';
import 'package:flutter/material.dart';

class TemplatesTable extends StatelessWidget {
  final List<String> columns;
  final List<Template> rows;
  final bool isLoading;

  const TemplatesTable(
      {required this.columns,
      this.rows = const [],
      this.isLoading = true,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
        headingRowColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          return Theme.of(context).colorScheme.primary.withOpacity(0.08);
        }),
        columns: columns
            .map((String label) => DataColumn(label: Text(label)))
            .toList(),
        rows: rows.asMap().keys.map((int index) {
          Template template = rows[index];

          return DataRow(cells: [
            DataCell(Text('${index + 1}')),
            DataCell(Text(template.description)),
            DataCell(IconButton(
                onPressed: () => print('temp'),
                icon: const Icon(Icons.more_vert))),
          ]);
        }).toList());
  }
}
