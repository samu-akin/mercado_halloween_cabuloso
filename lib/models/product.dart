class Product {
  final int id; // ID único do produto
  final String name; // Nome do produto
  final String emoji; // Emoji associado ao produto
  final String description; // Descrição detalhada do produto
  final double price; // Preço do produto

  // Construtor do Produto
  Product({
    required this.id,
    required this.name,
    required this.emoji,
    required this.description,
    required this.price,
  });

  // Construtor de fábrica para criar um objeto Product a partir de um JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['nome'],
      emoji: json['emoji'],
      description: json['descricao'],
      price: json['preco'].toDouble(), // Converte o preço para double
    );
  }
}
