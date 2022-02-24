import 'package:app/bloc/conn/conn_bloc.dart';
import 'package:app/components/pages/home/home.dart';
import 'package:app/models/conn.dart';
import 'package:app/resources/routes.dart';
import 'package:app/resources/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DockerManagerApp extends StatelessWidget {
  const DockerManagerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConnectionBloc>(
            create: (BuildContext context) =>
                ConnectionBloc(Connection.local()))
      ],
      child: MaterialApp(
        theme: lightTheme,
        title: 'Docker Manager',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoute,
        initialRoute: HomePage.route,
      ),
    );
  }
}
