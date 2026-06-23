import 'package:get/get.dart';

class CameraController extends GetxController {
  var isProcessing = false.obs;
  var scannedText = ''.obs;
  var translatedText = ''.obs;

  // Simulación de captura o selección de imagen
  void processImage() async {
    isProcessing.value = true;
    scannedText.value = '';
    translatedText.value = '';

    // Simulamos el retraso del OCR y la API de traducción
    await Future.delayed(Duration(seconds: 2));

    // Datos simulados (ej. extrayendo texto de una indicación médica)
    scannedText.value = 'Tomar una pastilla cada 8 horas por 5 días.';
    translatedText.value = 'Ich\'a jun poxta ta waxakeb ora ta jo\'eb k\'in.';
    
    isProcessing.value = false;
  }

  void resetCamera() {
    scannedText.value = '';
    translatedText.value = '';
  }
}