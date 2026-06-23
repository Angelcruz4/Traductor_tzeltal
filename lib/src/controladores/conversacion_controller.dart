import 'package:get/get.dart';

class ConversacionController extends GetxController {
  // Estado reactivo para la animación del micrófono
  var isListening = false.obs;

  // Lista de mensajes reactiva con un contexto médico inicial
  var messages = <Map<String, dynamic>>[
    {'content': 'Buenos días doctor, me duele mucho el estómago.', 'isTseltal': false},
    {'content': 'Lek me sakubel k\'inal poxtaywanej, k\'ux me jk\'u\'un.', 'isTseltal': true},
    {'content': '¿Desde cuándo empezó el dolor?', 'isTseltal': false},
    {'content': '¿Binti k\'al lik te k\'uxule?', 'isTseltal': true},
  ].obs;

  // Simulación de escuchar y traducir voz
  void toggleListening() async {
    if (isListening.value) {
      isListening.value = false;
      return;
    }

    isListening.value = true;

    // Simulamos el tiempo de escucha y procesamiento de la API
    await Future.delayed(Duration(seconds: 3));

    if (isListening.value) {
      // Agregamos un nuevo mensaje simulado del paciente
      messages.add({'content': 'Empezó ayer por la noche.', 'isTseltal': false});
      messages.add({'content': 'Lik me ta ak\'bal nax.', 'isTseltal': true});
      isListening.value = false;
    }
  }
}