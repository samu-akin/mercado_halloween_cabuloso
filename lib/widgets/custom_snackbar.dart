// Um widget utilitário para exibir SnackBar personalizados
import 'package:flutter/material.dart';

enum SnackBarType { success, error, info }

class CustomSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    SnackBarType type = SnackBarType.info, // Tipo padrão é 'info'
  }) {
    Color backgroundColor; // Cor de fundo do SnackBar
    Color textColor = Colors.white; // Cor do texto do SnackBar
    IconData icon; 
    
    switch (type) {
      case SnackBarType.success:
        backgroundColor = Colors.green[700]!;
        icon = Icons.check_circle;
        break;
      case SnackBarType.error:
        backgroundColor = Colors.red[700]!;
        icon = Icons.error;
        break;
      case SnackBarType.info:
      default:
        backgroundColor = Colors.blueGrey[700]!;
        icon = Icons.info;
        break;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: textColor), 
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                message, 
                style: TextStyle(color: textColor),
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor, /
        behavior: SnackBarBehavior.floating, 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), 
        ),
        margin: const EdgeInsets.all(10), 
        duration: const Duration(seconds: 3), 
      ),
    );
  }
}
