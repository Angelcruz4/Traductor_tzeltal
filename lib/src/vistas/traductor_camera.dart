import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:get/get.dart';
import 'package:traductor_tseltal/colores/paleta_de_colores.dart';
import 'package:traductor_tseltal/src/controladores/camera_controller.dart';
import 'package:traductor_tseltal/src/vistas/cabecera.dart';

class CameraView extends StatelessWidget {
  final CameraController controller = Get.put(CameraController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppHeader(title: 'Escanear Documento\nTseltal - Español'),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                _buildCameraFrame(),
                SizedBox(height: 20),
                Expanded(child: _buildResultArea()),
                _buildCameraControls(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCameraFrame() {
    return DottedBorder(
      color: kAccentColor,
      strokeWidth: 2,
      dashPattern: [8, 4],
      borderType: BorderType.RRect,
      radius: Radius.circular(20),
      padding: EdgeInsets.all(2),
      child: Container(
        height: 250,
        width: double.infinity,
        color: Colors.transparent,
        child: Obx(() {
          if (controller.isProcessing.value) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: kAccentColor),
                  SizedBox(height: 16),
                  Text('Procesando imagen...', style: TextStyle(color: kAccentColor)),
                ],
              ),
            );
          }
          return Center(
            child: Icon(Icons.camera_alt_outlined, color: kAccentColor, size: 40),
          );
        }),
      ),
    );
  }

  Widget _buildResultArea() {
    return Obx(() {
      if (controller.scannedText.value.isEmpty && !controller.isProcessing.value) {
        return Center(
          child: Text(
            'Enfoca un texto para traducir',
            style: TextStyle(color: Colors.grey.shade500),
          ),
        );
      }

      if (controller.scannedText.value.isNotEmpty) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildResultCard('Texto Detectado (Español)', controller.scannedText.value),
              SizedBox(height: 12),
              _buildResultCard('Traducción (Tseltal)', controller.translatedText.value, isPrimary: true),
            ],
          ),
        );
      }

      return SizedBox.shrink();
    });
  }

  Widget _buildResultCard(String title, String content, {bool isPrimary = false}) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isPrimary ? kPrimaryColor.withOpacity(0.1) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: isPrimary ? Border.all(color: kPrimaryColor, width: 1) : null,
        boxShadow: isPrimary ? [] : [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: kAccentColor)),
          SizedBox(height: 8),
          Text(content, style: TextStyle(fontSize: 14, color: kTextDark)),
        ],
      ),
    );
  }

  Widget _buildCameraControls() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildControlButton(Icons.image_outlined, onTap: controller.processImage),
          GestureDetector(
            onTap: controller.processImage,
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: kAccentColor,
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))],
              ),
            ),
          ),
          _buildControlButton(Icons.refresh, onTap: controller.resetCamera),
        ],
      ),
    );
  }

  Widget _buildControlButton(IconData icon, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(color: kAccentColor.withOpacity(0.1), shape: BoxShape.circle),
        child: Icon(icon, color: kAccentColor, size: 24),
      ),
    );
  }
}