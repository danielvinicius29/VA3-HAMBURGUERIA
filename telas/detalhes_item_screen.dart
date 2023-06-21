import 'package:flutter/material.dart';
import '../modelos/item.dart';

class DetalhesItemScreen extends StatelessWidget {
  final Item item;

  DetalhesItemScreen(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.nome),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(item.imagem),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item.descricao,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'R\$ ${item.preco.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}