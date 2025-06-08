import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Importa o pacote provider

import 'package:mercado_halloween_cabuloso/providers/cart_provider.dart'; // Importa o provider do carrinho
import 'package:mercado_halloween_cabuloso/providers/product_provider.dart'; // Importa o provider de produtos
import 'package:mercado_halloween_cabuloso/screens/home_screen.dart'; // Importa a tela inicial
import 'package:mercado_halloween_cabuloso/screens/cart_screen.dart'; // Importa a tela do carrinho

void main() {
  runApp(
    // Gerenciar múltiplos providers na aplicação
    MultiProvider(
      providers: [
        // Provider para o estado dos produtos
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        // Provider para o estado do carrinho
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MyApp(), // O widget raiz da aplicação
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mercado Halloween Cabuloso', // Título
      theme: ThemeData(
        // Tema da aplicação
        primarySwatch: Colors.deepPurple, 
        scaffoldBackgroundColor: const Color(0xFF1a1a1a), // Cor Fundo
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF333333), // Cor da App Bar (cinza escuro)
          foregroundColor: Colors.white, // Cor do texto 
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF444444), 
          selectedItemColor: Colors.deepOrangeAccent, 
          unselectedItemColor: Colors.white70, //
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
        fontFamily: 'Inter', // Fonte padrão para a maioria do texto
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MainScreen(), // Tela inicial da aplicação
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; 

  // Lista de widgets (telas) para as abas
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    CartScreen(),
  ];

  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Atualiza o índice da aba selecionada
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mercado Halloween Cabuloso',
          style: TextStyle(
            fontFamily: 'Nosifier', // Aplica a fonte "Nosifier" ao título
            fontSize: 28, // Tamanho da fonte do título
            color: Colors.white,
          ),
        ),
        centerTitle: true, 
      ),
      body: _widgetOptions.elementAt(_selectedIndex), // Exibe a tela correspondente à aba selecionada
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 20), // Ícone Home, 
            label: 'Home', // Texto Home
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, size: 20), // Ícone Carrinho
            label: 'Carrinho', // Texto Carrinho
          ),
        ],
        currentIndex: _selectedIndex, // Índice da aba atualmente selecionada
        onTap: _onItemTapped, // Função chamada ao tocar em uma aba
        type: BottomNavigationBarType.fixed, 
        selectedLabelStyle: const TextStyle(fontSize: 12), 
        unselectedLabelStyle: const TextStyle(fontSize: 12), 
        
      ),
    );
  }
}
