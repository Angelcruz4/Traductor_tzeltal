import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TraductorController extends GetxController {
  // Estado reactivo de los idiomas y textos
  var isTseltalToSpanish = true.obs;
  var sourceText = ''.obs;
  var translatedText = ''.obs;
  var isLoading = false.obs;

  // Intercambiar idiomas
  void swapLanguages() {
    isTseltalToSpanish.value = !isTseltalToSpanish.value;
    
    // Al cambiar de idioma, invertimos los textos para mayor fluidez
    String temp = sourceText.value;
    sourceText.value = translatedText.value;
    translatedText.value = temp;
  }

  // Lógica principal de traducción
  void translateText(String text) async {
    sourceText.value = text;
    
    if (text.trim().isEmpty) {
      translatedText.value = '';
      return;
    }

    isLoading.value = true;

    // TODO: Aquí integrarás la llamada real a la API de Gemini AI
    // Por ahora, simulamos el tiempo de respuesta de la red (1.5 segundos)
    await Future.delayed(Duration(milliseconds: 1500));

    if (isTseltalToSpanish.value) {
      translatedText.value = "[Simulación Español]: Traducción generada por IA para cualquier persona que la necesite.";
    } else {
      translatedText.value = "[Simulación Tseltal]: Lekuk sskubet k'inal.";
    }

    isLoading.value = false;
  }

  // Copiar el texto traducido al portapapeles
  void copyToClipboard() {
    if (translatedText.value.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: translatedText.value));
      Get.snackbar(
        '¡Copiado!',
        'El texto se ha guardado en tu portapapeles.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFF007B5F).withOpacity(0.8),
        colorText: const Color(0xFFFFFFFF),
        margin: const EdgeInsets.all(16),
      );
    }
  }
}