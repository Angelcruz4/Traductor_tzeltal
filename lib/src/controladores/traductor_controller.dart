import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TraductorController extends GetxController {
  var isTseltalToSpanish = true.obs;
  var sourceText = ''.obs;
  var translatedText = ''.obs;
  var isLoading = false.obs;

  void swapLanguages() {
    isTseltalToSpanish.value = !isTseltalToSpanish.value;
    
    String temp = sourceText.value;
    sourceText.value = translatedText.value;
    translatedText.value = temp;
  }

  void translateText(String text) async {
    sourceText.value = text;
    
    if (text.trim().isEmpty) {
      translatedText.value = '';
      return;
    }

    isLoading.value = true;
    await Future.delayed(Duration(milliseconds: 1500));

    // Textos simulados con enfoque clínico
    if (isTseltalToSpanish.value) {
      translatedText.value = "[Simulación Español]: Tómese este medicamento cada 8 horas.";
    } else {
      translatedText.value = "[Simulación Tseltal]: Ich'a te pox ini ta waxakeb ora.";
    }

    isLoading.value = false;
  }

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

  // Nueva función para mostrar la explicación gramatical
  void showGrammarExplanation() {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.lightbulb_outline, color: const Color(0xFFD82C73), size: 28),
                SizedBox(width: 8),
                Text(
                  'Estructura Gramatical', 
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xFFD82C73))
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'En el idioma tseltal, especialmente en contextos de la salud, la estructura de la oración frecuentemente coloca la acción o el estado al principio.\n\nPor ejemplo, al recetar un medicamento ("pox"), el verbo recae directamente sobre el objeto con prefijos posesivos. El orden suele ser: Verbo + Sujeto/Objeto + Complemento de tiempo ("ta waxakeb ora").',
              style: TextStyle(fontSize: 15, color: Colors.black87, height: 1.4),
            ),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF007B5F),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12)
                ),
                onPressed: () => Get.back(),
                child: Text('Entendido', style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            )
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }
}