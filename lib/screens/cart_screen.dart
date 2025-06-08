// Tela que exibe os itens do carrinho e o total da compra
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import 'package:mercado_halloween_cabuloso/providers/cart_provider.dart'; 
import 'package:mercado_halloween_cabuloso/models/cart_item.dart'; 
import 'package:mercado_halloween_cabuloso/widgets/custom_snackbar.dart'; 
import 'package:mercado_halloween_cabuloso/widgets/custom_modal.dart'; 

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        final cartItems = cartProvider.cartItems; // Itens no carrinho

        return Column(
          children: [
            Expanded(
              child: cartItems.isEmpty
                  ? const Center(
                      // Mensagem se o carrinho estiver vazio
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_bag_outlined, size: 80, color: Colors.grey),
                          SizedBox(height: 16),
                          Text(
                            'Seu carrinho está vazio!',
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: cartItems.length, // Número de itens no carrinho
                      itemBuilder: (context, index) {
                        final item = cartItems[index]; // Item atual do carrinho
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          color: const Color(0xFFf1f1f1), // Cor de fundo do cartão
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(12.0),
                            leading: Text(
                              item.product.emoji, // Emoji do produto
                              style: const TextStyle(fontSize: 36),
                            ),
                            title: Text(
                              '${item.product.name} (x${item.quantity})', // Nome e quantidade
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            subtitle: Text(
                              'R\$${item.totalPrice.toStringAsFixed(2)}', // Preço total do item
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrange),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red), // Ícone de remover
                              onPressed: () {
           
                                cartProvider.removeItemFromCart(item.product.id);
                                CustomSnackBar.show(
                                  context,
                                  message: 'Item "${item.product.name}" removido!',
                                  type: SnackBarType.error,
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
            // Se o carrinho não estiver vazio, exibe o resumo e o botão de finalizar compra
            if (cartItems.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  color: Color(0xFF444444), 
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Valor Total:',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          'R\$${cartProvider.totalCartValue.toStringAsFixed(2)}', // Valor total
                          style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.greenAccent),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Finaliza a compra e mostra o modal de sucesso
                          cartProvider.finalizePurchase();
                          CustomModal.show(
                            context,
                            title: 'Sucesso!',
                            message: 'Sua compra foi realizada com sucesso!',
                            icon: Icons.check_circle,
                            iconColor: Colors.green,
                          );
                        },
                        icon: const Icon(Icons.payment), // Ícone de pagamento
                        label: const Text('Finalizar Compra'), // Texto do botão
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green, // Cor de fundo verde
                          foregroundColor: Colors.white, // Cor do texto
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
