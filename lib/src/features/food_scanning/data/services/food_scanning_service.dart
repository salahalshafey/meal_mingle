import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions_without_message.dart';

import 'api_keys.dart';

abstract class FoodScanningService {
  Future<String> getResult(String imagePath,
      [String? foodOverview, String? question]);
}

class GeminiProVisionImpl implements FoodScanningService {
  @override
  Future<String> getResult(String imagePath,
      [String? foodOverview, String? question]) async {
    const apiKey = makerSuiteAPIKey;
    // print(getImageFormatOrExtention(imagePath));

    const apiUrl =
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro-vision:generateContent?key=$apiKey";

    final contents = [
      {
        "parts": [
          {
            "text":
                "Act as a nutritionist with 30 years of experience in the field. What is in this image? And how many calories are in it?\n\n"
            // "text":
            //    "تصرف كخبير تغذية بخبرة 30 عامًا في هذا المجال.ماذا يوجد في هذه الصورة؟ وكم عدد السعرات الحرارية فيه؟\n"
          },
          {
            "inlineData": {
              "mimeType": "image/${getImageFormatOrExtention(imagePath)}",
              "data": base64Encode(File(imagePath).readAsBytesSync())
            }
          },
          if (foodOverview != null)
            {
              "text": foodOverview,
            },
          if (question != null)
            {
              "text": question,
            },
        ],
      },
    ];

    final generationConfig = {
      "temperature": 0.4,
      "topK": 32,
      "topP": 1,
      "maxOutputTokens": 4096,
      "stopSequences": []
    };

    final safetySettings = [
      {
        "category": "HARM_CATEGORY_HARASSMENT",
        "threshold": "BLOCK_MEDIUM_AND_ABOVE"
      },
      {
        "category": "HARM_CATEGORY_HATE_SPEECH",
        "threshold": "BLOCK_MEDIUM_AND_ABOVE"
      },
      {
        "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
        "threshold": "BLOCK_MEDIUM_AND_ABOVE"
      },
      {
        "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
        "threshold": "BLOCK_MEDIUM_AND_ABOVE"
      }
    ];

    final requestData = {
      "contents": contents,
      "generationConfig": generationConfig,
      "safetySettings": safetySettings,
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(requestData),
    );

    if (response.statusCode != 200) {
      //print('Response: ${response.body}');

      throw ServerException();
    }

    final responseMap = jsonDecode(response.body) as Map<String, dynamic>;

    if (responseMap["candidates"] == null) {
      // print('Filtered');
      // print('Response: ${response.body}');
      throw FilterException();
    }

    return responseMap["candidates"][0]["content"]["parts"][0]["text"];

    /*  await Future.delayed(Duration(seconds: 1));

    return test;*/
  }
}

String getImageFormatOrExtention(String imagePath) => imagePath.split(".").last;

const test =
    """"This is a photo of a glass of tea. Tea is a beverage made from the Camellia sinensis plant. It is typically brewed with hot water and can be served with milk, sugar, or other flavorings. Tea contains caffeine, which is a stimulant. The amount of caffeine in tea varies depending on the type of tea and how it is brewed.

The calorie content of tea also varies depending on how it is prepared. A cup of black tea without milk or sugar contains about 2 calories. A cup of green tea without milk or sugar contains about 0 calories. A cup of tea with milk and sugar contains about 100 calories.

Tea is a healthy beverage that can be enjoyed as part of a balanced diet. It is a good source of antioxidants, which can help to protect the body from damage caused by free radicals. Tea can also help to improve heart health and reduce the risk of some types of cancer.""";
