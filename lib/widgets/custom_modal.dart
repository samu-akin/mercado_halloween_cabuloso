// Um widget utilitário para exibir modais personalizados
import 'package:flutter/material.dart';

class CustomModal {
  static void show(
    BuildContext context, {
    required String title,
    required String message,
    IconData? icon, 
    Color? iconColor, 
  }) {
    showDialog(
      context: context,
      barrierDismissible: false, // O modal não é fechado ao tocar fora
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Card(
            margin: EdgeInsets.zero, 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min, 
                children: [
                  if (icon != null)
                    Icon(
                      icon,
                      color: iconColor ?? Colors.blue, 
                      size: 70,
                    ),
                  if (icon != null) const SizedBox(height: 16),
                  Text(
                    title, // Título do modal
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    message, 
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); 
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple, 
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      child: const Text('Fechar'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
