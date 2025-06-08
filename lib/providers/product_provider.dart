import 'package:flutter/material.dart'; 
import 'package:mercado_halloween_cabuloso/models/product.dart'; 
import 'package:mercado_halloween_cabuloso/data/products_data.dart'; // Importa o utilitário de dados

class ProductProvider with ChangeNotifier {
  // Lista privada de produtos
  List<Product> _products = [];

  // Getter público para acessar a lista de produtos
  List<Product> get products => _products;

  ProductProvider() {
    _products = loadProducts(); // Carrega os produtos do arquivo de dados
  }
}
