import 'package:app/app/utils.dart';
import 'package:app/components/layouts/default.dart';
import 'package:app/components/pages/home/edit-service/edit_environment.dart';
import 'package:app/components/pages/home/edit-service/edit_ports.dart';
import 'package:app/components/pages/home/edit-service/edit_volumes.dart';
import 'package:app/components/ui/input.dart';
import 'package:app/models/service.dart';
import 'package:flutter/material.dart';

class EditServicePage extends StatefulWidget {
  final bool isNew;
  final Service service;

  const EditServicePage({required this.service, Key? key})
      : isNew = false,
        super(key: key);

  EditServicePage.newService({Key? key})
      : service = Service.newService(),
        isNew = true,
        super(key: key);

  static const String editRoute = '/edit-service';
  static const String newRoute = '/new-service';

  @override
  State<EditServicePage> createState() => _EditServicePageState();
}

class _EditServicePageState extends State<EditServicePage> {
  late TextEditingController nameCtrl;
  late TextEditingController imageCtrl;
  late TextEditingController portCtrl;
  late TextEditingController volumesCtrl;

  @override
  void initState() {
    nameCtrl = controllerFrom(widget.service.name);
    imageCtrl = controllerFrom(widget.service.image);
    super.initState();
  }

  void refresh(String value) {
    setState(() {});
  }

  void updateEnvironmentVariables(
      int? index, bool? op, bool? isName, String? data) {
    switch (op) {
      case false:
        widget.service.environments.removeAt(index!);
        break;

      case true:
        widget.service.environments.add({'name': '', 'value': ''});
        break;

      case null:
        String key = isName! ? 'name' : 'value';
        widget.service.environments[index!][key] = data!;
        break;

      default:
        break;
    }

    refresh('');
  }

  void updateVolumes(int? index, bool? op, bool? isName, String? data) {
    switch (op) {
      case false:
        widget.service.volumes.removeAt(index!);
        break;

      case true:
        widget.service.volumes.add({'host': '', 'container': ''});
        break;

      case null:
        String key = isName! ? 'host' : 'container';
        widget.service.volumes[index!][key] = data!;
        break;

      default:
        break;
    }

    refresh('');
  }

  void updatePorts(int? index, bool? op, bool? isName, String? data) {
    switch (op) {
      case false:
        widget.service.ports.removeAt(index!);
        break;

      case true:
        widget.service.ports.add({'host': '', 'container': ''});
        break;

      case null:
        String key = isName! ? 'host' : 'container';
        widget.service.ports[index!][key] = data!;
        break;

      default:
        break;
    }

    refresh('');
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: widget.isNew ? 'New Service' : 'Edit Service',
      currentMenu: 0,
      action: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () => print('export'),
            child: const Text('Dockerfile'),
            style: ElevatedButton.styleFrom(primary: Colors.green),
          ),
          widget.isNew
              ? Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: ElevatedButton(
                    onPressed: () => print('template'),
                    child: const Text('By Template'),
                    style: ElevatedButton.styleFrom(primary: Colors.orange),
                  ),
                )
              : Container(),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: ElevatedButton(
                onPressed: () => print('save'), child: const Text('Save')),
          ),
        ],
      ),
      backPath: true,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    LabeledInput(
                        label: 'Container ID',
                        hint: widget.service.containerID.isEmpty
                            ? '######'
                            : widget.service.containerID,
                        width: 150,
                        enabled: false),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: LabeledInput(
                          label: 'Container Name',
                          hint: 'Service name',
                          width: 150,
                          controller: nameCtrl,
                          onChange: refresh),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: LabeledInput(
                      label: 'Image',
                      hint: 'python:3.8',
                      width: 300,
                      controller: imageCtrl,
                      onChange: refresh),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: EditEnvironment(
                      variables: widget.service.environments,
                      onChange: updateEnvironmentVariables),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: EditPorts(
                      ports: widget.service.ports, onChange: updatePorts),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: EditVolumes(
                      volumes: widget.service.volumes, onChange: updateVolumes),
                )
              ]),
          Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(5.0)),
              width: MediaQuery.of(context).size.width / 3.0,
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '# Dockerfile.${nameCtrl.text}',
                    style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'FROM ${imageCtrl.text}',
                      style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.pinkAccent),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.service.environments
                            .map((Map<String, String> variable) {
                          return Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                'ENV ${variable['name']}=${variable['value']}',
                                style: const TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pinkAccent),
                              ));
                        }).toList()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.service.ports
                            .map((Map<String, String> port) {
                          return Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                'EXPOSE ${port['container']}',
                                style: const TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pinkAccent),
                              ));
                        }).toList()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.service.volumes
                            .map((Map<String, String> volume) {
                          return Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                'VOLUME ${volume['container']}',
                                style: const TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pinkAccent),
                              ));
                        }).toList()),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
