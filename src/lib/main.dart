import 'package:flutter/material.dart';
import 'package:iholder_app/ui/android/screens/tab.screen.dart';
import 'package:provider/provider.dart';

import 'blocs/usuario.bloc.dart';

void main() {
  runApp(IoC());
  // final response = UsuarioRepository()
  //     .Login(
  //         UsuarioLogin(login: "diego.romario@outlook.com", password: "123456"))
  //     .then((onValue) {
  //   debugPrint(onValue.toString());
  // });
}

class IoC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UsuarioBloc>.value(
          value: UsuarioBloc(),
        )
      ],
      child: Main(),
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.indigo[600],
        accentColor: Colors.red[300],
        scaffoldBackgroundColor: Colors.blue[50],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.indigo[800],
          textTheme: ButtonTextTheme.accent,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: TabsScreen(),
    );
  }
}
