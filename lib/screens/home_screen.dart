// Tela principal que exibe a lista de produtos
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Importa o pacote provider
import 'package:mercado_halloween_cabuloso/providers/product_provider.dart'; // Importa o provider de produtos
import 'package:mercado_halloween_cabuloso/screens/product_detail_screen.dart'; // Importa a tela de detalhes do produto
import 'package:mercado_halloween_cabuloso/models/product.dart'; // Importa o modelo Product

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Acessa a lista de produtos do ProductProvider
    final productProvider = Provider.of<ProductProvider>(context);
    final products = productProvider.products;

    return ListView.builder(
      itemCount: products.length, // Número de itens na lista
      itemBuilder: (context, index) {
        final product = products[index]; 
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          color: const Color(0xFFf1f1f1), // Cor de fundo do cartão
          elevation: 4, 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), 
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(12.0), 
            leading: Text(
              product.emoji, // Exibe o emoji do produto
              style: const TextStyle(fontSize: 36), // Tamanho do emoji
            ),
            title: Text(
              product.name, // Exibe o nome do produto
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            trailing: Text(
              'R\$${product.price.toStringAsFixed(2)}', // Exibe o preço
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            onTap: () {
              // Navega para a tela de detalhes do produto ao tocar no item
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(product: product),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
