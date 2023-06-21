import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import '../modelos/item.dart';
import 'detalhes_item_screen.dart';


class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<Item> itens = [];

  @override
  void initState() {
    super.initState();
    carregarItens();
  }
  Future<void> salvarItensLocalmente() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/itens.json');

    final List<Map<String, dynamic>> itensJson = itens.map((item) => item.toJson()).toList();
    final jsonString = json.encode(itensJson);

    await file.writeAsString(jsonString);
  }

  Future<void> carregarItens() async {
    // TROCAR POR API CRIADA PELA EMPRESA
    final response = await http.get(Uri.parse('http://138.94.166.118:4000/produtos'));
    final data = json.decode(response.body);

    List<Item> itensCarregados = [];

    for (var itemData in data) {
      itensCarregados.add(Item.fromJson(itemData));
    }

    setState(() {
      itens = itensCarregados;
    });
    await salvarItensLocalmente();
 }
  void abrirDetalhesItem(Item item) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => DetalhesItemScreen(item),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Mobile Burguers'),
      ),
      body: ListView.builder(
        itemCount: itens.length,
        itemBuilder: (ctx, index) {
          final item = itens[index];

          return ListTile(
            onTap: () => abrirDetalhesItem(item),
            leading: Image.network(item.imagem),
            title: Text(item.nome),
            subtitle: Text(item.descricao),
            trailing: Text('R\$ ${item.preco.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}