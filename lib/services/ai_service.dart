import 'dart:convert';
import 'package:http/http.dart' as http;

class AIService {
  final String apiKey = "AIzaSyD5M4vSZ2a0k0uw7Z5-9N95b6VzcyRSOrI";

  Future<String> generateInsight(String text) async {
    try {
      final url = Uri.parse(
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=$apiKey",
      );

      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {
                  "text": """
                  Você é um assistente contábil de um aplicativo de tarefas. 
                  Analise as seguintes tarefas do dia e dê dicas de forma simples e direta.
                  Use tópicos curtos (com uma bolinha •) para organizar o texto.
                  Separe em uma parte de Dicas Gerais, outra de O que é mais urgente.
                  
                  Tarefas para analisar:
                  $text
                  """
                }
              ]
            }
          ]
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        String textContent = data["candidates"][0]["content"]["parts"][0]["text"];
        return textContent;
      } else {
        
        return "O servidor recusou a requisição. Verifique se o modelo está liberado na sua conta.";
      }
    } catch (e) {
      print("ERRO DETALHADO NO HTTP: $e");
      return "Erro ao carregar o painel de insights contábeis.";
    }
  }
}
