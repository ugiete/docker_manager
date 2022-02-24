import 'package:app/components/layouts/default.dart';
import 'package:app/models/service.dart';
import 'package:flutter/material.dart';

class EditServicePage extends StatelessWidget {
  final bool isNew;
  final ServiceModel service;

  const EditServicePage({required this.service, Key? key})
      : isNew = false,
        super(key: key);

  EditServicePage.newService({Key? key})
      : service = ServiceModel.newService(),
        isNew = true,
        super(key: key);

  static const String editRoute = '/edit-service';
  static const String newRoute = '/new-service';

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: isNew ? 'New Service' : 'Edit Service',
      currentMenu: 0,
      action: ElevatedButton(
          onPressed: () => print('save'), child: const Text('Save')),
      backPath: true,
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: const []),
    );
  }
}
