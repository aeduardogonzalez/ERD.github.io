import 'package:proyecto_erd/models/question.dart';

class QuestionController {
  final List<Question> _questions = [
    Question('¿Qué es ERP Siesa Enterprise?', 'Es un sistema de gestión empresarial que permite...'),
    Question('¿Qué puedo hacer en ERP?', 'Esta aplicación te ayudará a gestionar y optimizar tu negocio...'),
    Question('¿Puedo usar ERP para una tienda?', 'Sí, ERP es flexible y se adapta a diferentes tipos de negocio...')
  ];

  List<Question> getQuestions() {
    return _questions;
  }
}
