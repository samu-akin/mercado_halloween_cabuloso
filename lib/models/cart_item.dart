// Modelo de dados para um Item no Carrinho
import 'package:mercado_halloween_cabuloso/models/product.dart';

class CartItem {
  final Product product; // O produto no carrinho
  int quantity; // A quantidade deste produto no carrinho

  // Construtor do CartItem
  CartItem({required this.product, this.quantity = 1});

  // Getter para calcular o preço total deste item (produto * quantidade)
  double get totalPrice => product.price * quantity;
}
