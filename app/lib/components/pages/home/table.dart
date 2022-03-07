import 'package:app/models/service.dart';
import 'package:flutter/material.dart';

class ContainersTable extends StatelessWidget {
  final List<String> columns;
  final List<Service> rows;
  final bool isLoading;

  const ContainersTable(
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
        rows: rows
            .map((Service service) => DataRow(cells: [
                  DataCell(Text(service.containerID)),
                  DataCell(Text(service.name)),
                  DataCell(Text(service.parsePort)),
                  DataCell(Text(service.status)),
                  DataCell(Text(service.createdAt)),
                  DataCell(IconButton(
                      onPressed: () => print('ib'),
                      icon: const Icon(Icons.more_vert))),
                ]))
            .toList());
  }
}
