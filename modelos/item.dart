class Item {
  final String id;
  final String nome;
  final String descricao;
  final String imagem;
  final double preco;

  Item({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.imagem,
    required this.preco,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      nome: json['nome'],
      descricao: json['descricao'],
      imagem: json['imagem'],
      preco: json['preco'].toDouble(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'imagem': imagem,
      'preco': preco,
    };
  }
}