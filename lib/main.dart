import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/estoque_page.dart';
import 'pages/lista_compras_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/estoque': (context) => const EstoquePage(),
        '/lista': (context) => const ListaComprasPage(),
      },
    );
  }
}
