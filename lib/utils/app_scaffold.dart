import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/estoque_page.dart';
import '../pages/lista_compras_page.dart';

class MenuItem {
  final IconData icon;
  final String label;
  final String route;

  MenuItem({required this.icon, required this.label, required this.route});
}

class AppScaffold extends StatefulWidget {
  final Widget body;
  final String title;
  final List<MenuItem> menuItems;
  final bool showSearchButton;
  final Widget? floatingActionButton;

  const AppScaffold({
    super.key,
    required this.body,
    required this.title,
    required this.menuItems,
    required this.showSearchButton,
    this.floatingActionButton,
  });

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  bool _modoBusca = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Widget? _getPageFromRoute(String route) {
    switch (route) {
      case '/home':
        return const HomePage();
      case '/estoque':
        return const EstoquePage();
      case '/lista':
        return const ListaComprasPage();
      default:
        return null;
    }
  }

  void _navigateWithAnimation(BuildContext context, String route) {
    final destino = _getPageFromRoute(route);
    if (destino != null) {
      Navigator.pop(context);
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 0),
          pageBuilder: (_, __, ___) => destino,
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.0, 0.2),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            );
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Builder(
          builder: (context) => Container(
            width: 32,
            height: 32,
            margin: const EdgeInsets.only(left: 12, top: 8, bottom: 8),
            decoration: BoxDecoration(
              color: _modoBusca ? Colors.black : Colors.transparent,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: _modoBusca ? Colors.black : Colors.white,
              ),
              iconSize: 36,
              tooltip: 'Menu',
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ),
        title: _modoBusca
            ? TextField(
                controller: _searchController,
                autofocus: true,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Buscar produto ou categoria...',
                  hintStyle: TextStyle(color: Colors.white54),
                  border: InputBorder.none,
                ),
                onSubmitted: (valor) {
                  print('Buscar por: $valor');
                  setState(() => _modoBusca = false);
                },
              )
            : Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
        centerTitle: true,
        actions: [
          if (widget.showSearchButton && !_modoBusca)
            Container(
              margin: const EdgeInsets.only(left: 12, top: 2, bottom: 8),
              child: IconButton(
                icon: const Icon(Icons.search, color: Colors.white),
                tooltip: 'Pesquisar',
                iconSize: 36,
                onPressed: () {
                  setState(() => _modoBusca = true);
                },
              ),
            ),
          if (_modoBusca)
            IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              tooltip: 'Cancelar',
              onPressed: () {
                setState(() => _modoBusca = false);
                _searchController.clear();
              },
            ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 36, left: 16),
              height: 95,
              color: Colors.black,
              alignment: Alignment.centerLeft,
              child: const Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ),
            ...widget.menuItems.map(
              (item) => ListTile(
                leading: Icon(item.icon),
                title: Text(item.label),
                onTap: () {
                  if (ModalRoute.of(context)?.settings.name != item.route) {
                    _navigateWithAnimation(context, item.route);
                  } else {
                    Navigator.pop(context);
                  }
                },
              ),
            ),
          ],
        ),
      ),
      body: widget.body,
      floatingActionButton: widget.floatingActionButton,
    );
  }
}
