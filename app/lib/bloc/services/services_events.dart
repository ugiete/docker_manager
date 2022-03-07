import 'package:app/models/service.dart';

abstract class ServicesEventBloc {}

class ServicesListEvent extends ServicesEventBloc {
  final List<Service> services;

  ServicesListEvent(this.services);
}
