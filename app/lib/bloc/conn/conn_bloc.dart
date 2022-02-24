import 'package:app/bloc/conn/conn_state.dart';
import 'package:app/models/conn.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectionBloc extends Bloc<ConnectionEventBloc, Connection> {
  ConnectionBloc(Connection initialState) : super(initialState) {
    on<ConnectionServiceDown>(
        (event, emit) => emit(Connection.from(state, newActive: true)));
    on<ConnectionServiceUp>(
        (event, emit) => emit(Connection.from(state, newActive: false)));
    on<ConnectionSetHost>(
        (event, emit) => emit(Connection.from(state, newHost: event.host)));
    on<ConnectionSetUsername>((event, emit) =>
        emit(Connection.from(state, newUsername: event.username)));
    on<ConnectionSetPort>(
        (event, emit) => emit(Connection.from(state, newPort: event.port)));
  }
}
