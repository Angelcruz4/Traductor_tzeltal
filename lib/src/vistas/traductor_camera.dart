import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart'; // Usamos el paquete para fidelidad
import 'package:traductor_tseltal/colores/paleta_de_colores.dart';
import 'package:traductor_tseltal/src/vistas/cabecera.dart';

class CameraView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppHeader(
          title: 'Pon algo.\nTseltal',
        ), // Título específico
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Spacer(),
                // Marco simulado de la cámara con borde discontinuo
                DottedBorder(
                  color: kAccentColor,
                  strokeWidth: 2,
                  dashPattern: [8, 4], // Recrea el patrón discontinuo
                  borderType: BorderType.RRect,
                  radius: Radius.circular(20),
                  padding: EdgeInsets.all(2),
                  child: Container(
                    height: 250,
                    width: 250,
                    color: Colors.transparent,
                    child: Center(
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: kAccentColor,
                        size: 40,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                // Controles de la cámara
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildControlButton(Icons.image_outlined), // Galería
                      _buildShutterButton(), // Botón de obturador grande
                      _buildControlButton(Icons.flash_on_outlined), // Flash
                    ],
                  ),
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildControlButton(IconData icon) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: kAccentColor.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: kAccentColor, size: 24),
    );
  }

  // El botón de obturador grande y circular
  Widget _buildShutterButton() {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        color: kAccentColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
    );
  }
}
