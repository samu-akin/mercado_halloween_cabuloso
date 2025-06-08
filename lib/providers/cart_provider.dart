// Gerencia o estado do carrinho de compras
import 'package:flutter/material.dart'; 
import 'package:mercado_halloween_cabuloso/models/product.dart'; // Importa o modelo Product
import 'package:mercado_halloween_cabuloso/models/cart_item.dart'; // Importa o modelo CartItem

class CartProvider with ChangeNotifier {
  // Lista privada de itens no carrinho
  final List<CartItem> _cartItems = [];

  // Getter público para acessar a lista de itens no carrinho
  List<CartItem> get cartItems => _cartItems;

  // Getter para calcular o valor total de todos os itens no carrinho
  double get totalCartValue {
    return _cartItems.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  // Adiciona um produto ao carrinho
  void addItemToCart(Product product) {
    // Verifica se o produto já existe no carrinho
    final existingItemIndex =
        _cartItems.indexWhere((item) => item.product.id == product.id);

    if (existingItemIndex != -1) {
      // Se o produto já existe, incrementa a quantidade
      _cartItems[existingItemIndex].quantity++;
    } else {
      // Se não existe, adiciona um novo item ao carrinho
      _cartItems.add(CartItem(product: product));
    }
    notifyListeners(); 
  }

  // Remove um item do carrinho pelo ID do produto
  void removeItemFromCart(int productId) {
    _cartItems.removeWhere((item) => item.product.id == productId);
    notifyListeners(); 
  }

  // Finaliza a compra, limpando o carrinho
  void finalizePurchase() {
    _cartItems.clear(); // Limpa a lista de itens do carrinho
    notifyListeners(); 
  }
}
