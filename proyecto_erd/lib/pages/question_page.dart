import 'package:flutter/material.dart';
import 'package:proyecto_erd/Controllers/question_controller.dart';
import 'package:proyecto_erd/models/question.dart';

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPage createState() => _QuestionPage();
}

class _QuestionPage extends State<QuestionPage> {
  final QuestionController controller = QuestionController();

  @override
  Widget build(BuildContext context) {
    List<Question> questions = controller.getQuestions();
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayuda'),
        backgroundColor: const Color.fromARGB(255, 9, 32, 234),
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: Color(0xFFDCE9FD),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),
            Text(
              'Hola! ¿En qué te podemos ayudar?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            // Usar Expanded para que ListView ocupe el espacio disponible
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  final question = questions[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    elevation: 0, // Sin sombra
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Borde redondeado
                      side: BorderSide(color: Colors.transparent), // Sin borde visible
                    ),
                    child: ExpansionTile(
                      title: Text(question.question),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(question.answer),
                        ),
                      ],
                    ),
                  );
                },

              ),
            ),
          ],
        ),
      ),
    );
  }
}
