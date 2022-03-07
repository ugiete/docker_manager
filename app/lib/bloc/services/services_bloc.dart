import 'package:app/bloc/services/services_events.dart';
import 'package:app/models/service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesBloc extends Bloc<ServicesEventBloc, ServiceState> {
  ServicesBloc(ServiceState initialState) : super(initialState) {
    on<ServicesListEvent>((event, emit) =>
        emit(ServiceState.from(state, newServices: event.services)));
  }
}
