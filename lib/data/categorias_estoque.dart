// ignore_for_file: unused_import

import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';

class categoriaEstoque {
  late final int id;
  late final String nome_categoria;
}

final List<String> comidas = ['Arroz'];
final List<String> refrigerados = ['Leite'];
final List<String> bebidas = ['Água'];
final List<String> limpezaHigiene = ['Detergente'];
final List<String> infantil = ['Papinha'];
final List<String> pets = ['Ração'];
final List<String> domestico = ['Saco de lixo'];
final List<String> farmacia = ['Comprimidos'];

final List<String> nomesDasAbas = [
  'Comidas',
  'Refrigerados | Congelados',
  'Bebidas',
  'Limpeza | Higiene',
  'Infantil',
  'Pets',
  'Utilidades Domésticas',
  'Farmácia e Cuidados',
];
