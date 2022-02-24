import 'package:app/models/service.dart';

List<ServiceModel> services = [
  ServiceModel(
      '38de8cb548b9', 'mqtt_parser_1', '', 'Up 7 hours', '2 weeks ago'),
  ServiceModel('dbf974899252', 'mqtt_database_1', '0.0.0.0:15432->5432/tcp ',
      'Up 7 hours', '2 weeks ago'),
  ServiceModel('b2bbfd94745b', 'mqtt_broker_1', '0.0.0.0:1883->1883/tcp',
      'Up 7 hours', '2 weeks ago'),
  ServiceModel('36076e3eb782', 'mqtt_timescaledb_1', '0.0.0.0:1883->1883/tcp',
      'Up 7 hours', '2 weeks ago'),
];
