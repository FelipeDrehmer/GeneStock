import 'package:flutter/material.dart';

void mostrarModalAdicionarCategoria({
  required BuildContext context,
  required String nomeDaAba,
  required Function(String) onCriarCategoria,
}) {
  final TextEditingController controller = TextEditingController();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.4,
        minChildSize: 0.2,
        maxChildSize: 0.6,
        builder: (_, scrollController) {
          return Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
            ),
            child: ListView(
              controller: scrollController,
              children: [
                Text(
                  'Adicionar nova categoria na aba de "$nomeDaAba"',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: 'Nome da categoria',
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      icon: Icon(Icons.check),
                      label: Text('Criar'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {
                        final nome = controller.text.trim();
                        if (nome.isNotEmpty) {
                          onCriarCategoria(nome);
                          Navigator.pop(context);
                        }
                      },
                    ),
                    TextButton.icon(
                      icon: Icon(Icons.close),
                      label: Text('Cancelar'),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
