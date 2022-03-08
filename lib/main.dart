import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/blocs.dart';
import 'pages/pages.dart';

void main() => runApp(State());

class State extends StatelessWidget {
  const State({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (BuildContext context) => PagarBloc(),)
    ], 
    child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'pago_completo': (BuildContext context) => PagoCompletoPage(),
      },
      theme: ThemeData.light().copyWith(
        primaryColor: const Color(0xff284879),
        scaffoldBackgroundColor: const Color(0xff21232A)
      ),
    );
  }
}