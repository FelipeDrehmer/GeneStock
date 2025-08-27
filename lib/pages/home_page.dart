import 'package:flutter/material.dart';
import '../utils/app_scaffold.dart';
// ignore: unused_import
import 'package:sqflite/sqflite.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  build(BuildContext context) {
    return AppScaffold(
      title: 'Gene Stock',
      showSearchButton: false,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Center(
                child: Text(
                  "Bem-vindo à página inicial",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
      menuItems: [
        MenuItem(icon: Icons.home, label: 'Início', route: '/home'),
        MenuItem(
          icon: Icons.shopping_cart,
          label: 'Estoque',
          route: '/estoque',
        ),
        MenuItem(
          icon: Icons.note_alt,
          label: 'Lista de Compras',
          route: '/lista',
        ),
      ],
    );
  }
}
