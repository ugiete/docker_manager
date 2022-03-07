import 'package:app/bloc/services/services_bloc.dart';
import 'package:app/components/layouts/default.dart';
import 'package:app/components/pages/home/edit-service/edit_service.dart';
import 'package:app/components/pages/home/table.dart';
import 'package:app/components/pages/templates/table.dart';
import 'package:app/models/service.dart';
import 'package:app/models/templates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TemplatesPage extends StatelessWidget {
  const TemplatesPage({Key? key}) : super(key: key);

  static const String route = '/templates';

  void navigateToEdit(BuildContext context, {Service? service}) {
    if (service == null) {
      Navigator.of(context).pushNamed(EditServicePage.newRoute);
    } else {
      Navigator.of(context)
          .pushNamed(EditServicePage.editRoute, arguments: service);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: 'Templates',
        currentMenu: 1,
        action: ElevatedButton(
            onPressed: () => navigateToEdit(context),
            child: const Text('New Template')),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                child: BlocBuilder<ServicesBloc, ServiceState>(
                    builder: (BuildContext context, ServiceState state) {
                  return TemplatesTable(columns: const [
                    '#',
                    'Description',
                    ''
                  ], rows: [
                    Template('Banco de dados local'),
                    Template('Mosquitto Broker local')
                  ]);
                }),
              )
            ]));
  }
}
