import 'package:flutter/material.dart';
import '../utils/app_scaffold.dart';
import '../utils/modal_adicionar_categoria.dart';
import '../data/categorias_estoque.dart';

class EstoquePage extends StatefulWidget {
  const EstoquePage({super.key});

  @override
  State<EstoquePage> createState() => _EstoquePageState();
}

class _EstoquePageState extends State<EstoquePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int abaSelecionada = 0;

  final List<List<String>> todasCategorias = [
    comidas,
    refrigerados,
    bebidas,
    limpezaHigiene,
    infantil,
    pets,
    domestico,
    farmacia,
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: nomesDasAbas.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) return;
      setState(() {
        abaSelecionada = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      showSearchButton: true,
      title: 'Estoque',
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          mostrarModalAdicionarCategoria(
            context: context,
            nomeDaAba: nomesDasAbas[abaSelecionada],
            onCriarCategoria: (novaCategoria) {
              setState(() {
                todasCategorias[abaSelecionada].add(novaCategoria);
              });
            },
          );
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            controller: _tabController,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            labelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: const TextStyle(fontSize: 16),
            indicatorColor: Colors.black,
            tabs: nomesDasAbas.map((nome) => Tab(text: nome)).toList(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TabBarView(
                controller: _tabController,
                children: todasCategorias
                    .map((lista) => _buildCardGrid(lista))
                    .toList(),
              ),
            ),
          ),
        ],
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

  Widget _buildCardGrid(List<String> itens) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      childAspectRatio: 5 / 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: itens.map((titulo) {
        return InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(12),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Colors.grey, width: 2),
            ),
            elevation: 4,
            shadowColor: Colors.grey,
            child: Center(
              child: Text(titulo, style: const TextStyle(fontSize: 16)),
            ),
          ),
        );
      }).toList(),
    );
  }
}
