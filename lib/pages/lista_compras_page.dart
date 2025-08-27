import 'package:flutter/material.dart';
import '../utils/app_scaffold.dart';

class ListaComprasPage extends StatelessWidget {
  const ListaComprasPage({super.key});

  @override
  build(BuildContext context) {
    return AppScaffold(
      showSearchButton: false,
      title: 'Listas',
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Center(
                child: Text(
                  "Bem-vindo à página de listas de compras",
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
