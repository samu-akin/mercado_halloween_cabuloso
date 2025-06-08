// Tela de detalhes de um produto específico
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import 'package:mercado_halloween_cabuloso/models/product.dart'; 
import 'package:mercado_halloween_cabuloso/providers/cart_provider.dart'; 
import 'package:mercado_halloween_cabuloso/widgets/custom_snackbar.dart'; 
class ProductDetailScreen extends StatelessWidget {
  final Product product; // O produto a ser exibido

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {

    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name), // Título é o nome do produto
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Botão de voltar
          onPressed: () => Navigator.pop(context), 
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                product.emoji, // Exibe o emoji em destaque
                style: const TextStyle(fontSize: 100), 
              ),
            ),
            const SizedBox(height: 24),
            Text(
              product.name, // Nome do produto
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 12),
            Text(
              product.description, // Descrição do produto
              style: const TextStyle(fontSize: 18, color: Colors.black87),
            ),
            const SizedBox(height: 16),
            Text(
              'Preço: R\$${product.price.toStringAsFixed(2)}', // Preço do produto
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const Spacer(), 
            SizedBox(
              width: double.infinity, 
              child: ElevatedButton.icon(
                onPressed: () {
                  // Adiciona o produto ao carrinho
                  cartProvider.addItemToCart(product);
                  // Exibe uma mensagem de sucesso usando o CustomSnackBar
                  CustomSnackBar.show(
                    context,
                    message: '${product.name} adicionado ao carrinho!',
                    type: SnackBarType.success,
                  );
                },
                icon: const Icon(Icons.add_shopping_cart), // Ícone do botão
                label: const Text('Adicionar ao Carrinho'), // Texto do botão
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple, // Cor de fundo do botão
                  foregroundColor: Colors.white, // Cor do texto do botão
                  padding: const EdgeInsets.symmetric(vertical: 18), 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), 
                  ),
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pop(context), // Botão de voltar
                icon: const Icon(Icons.arrow_back),
                label: const Text('Voltar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300], // Cor de fundo cinza
                  foregroundColor: Colors.black87, // Cor do texto
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
