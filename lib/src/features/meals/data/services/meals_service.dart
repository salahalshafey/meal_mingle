import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions_without_message.dart';

import '../../../../core/util/functions/string_manipulations_and_search.dart';
import '../models/meal.dart';
import 'api_keys.dart';

abstract class MealsSrevice {
  Future<Meal> getMealInfo(String mealName);
}

class MealsGeminiProVisionImpl implements MealsSrevice {
  @override
  Future<Meal> getMealInfo(String mealName) async {
    const apiKey = makerSuiteAPIKey;
    const url =
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=$apiKey";

    Map<String, dynamic> requestData = {
      "contents": [
        {
          "role": "user",
          "parts": [
            {
              "text":
                  "Act as a Chef with 30 years of experience in the field. Please give me The ingredients and steps to make a meal.\nI will ask you to make a meal in any language, answer me in that language.\ngive the result in \"Json format\" only with no extra text.\n\nthe result Json should be in the following format\n\n```\n{\n  \"recipe\": {\n    \"name\": \"full recipe name\",\n    \"name_in_english\": \"name of the meal in English\",\n    \"language\": \"language code '2 letters code' of the result\",\n    \"cuisine\": \"country of this cuisine\",\n    \"duration_in_minutes\": the time to make this meal in minutes,\n    \"complexity\": \"the complexity of this meal [simple, challenging, or hard]\",\n    \"affordability\": \"the affordability of this meal [affordable, pricey, luxurious]\",\n    \"ingredients\": [      {\n        \"name\": \"ingredient 1\",\n        \"quantity\": \"ingredient 1 quantity\",\n        \"name_in_english\": \"name of the ingredient 1 in English\"\n      },\n        {\n        \"name\": \"ingredient 2\",\n        \"quantity\": \"ingredient 2 quantity\",\n\t\"name_in_english\": \"name of the ingredient 2 in English\"\n      },\n       {\n        \"name\": \"ingredient 3\",\n        \"quantity\": \"ingredient 3 quantity\",\n\t\"name_in_english\": \"name of the ingredient 3 in English\"\n      },\n        {\n        \"name\": \"ingredient 4\",\n        \"quantity\": \"ingredient 4 quantity\",\n\t\"name_in_english\": \"name of the ingredient 4 in English\"\n      },\n      etc...\n    ],\n    \"instructions\": [\n     \"step 1\",         \"step 2\",         \"step 3\",     \"step 4\",     etc...\n    ]\n  }\n}\n```"
            }
          ]
        },
        {
          "role": "model",
          "parts": [
            {
              "text":
                  "Sure, I'd be happy to help you with a recipe! Please specify the type of meal you'd like me to provide a recipe for, and I will answer in your given language."
            }
          ]
        },
        {
          "role": "user",
          "parts": [
            {"text": "كشري"}
          ]
        },
        {
          "role": "model",
          "parts": [
            {
              "text":
                  "```\n{\n  \"recipe\": {\n    \"name\": \"كشري\",\n    \"name_in_english\": \"Koushari\",\n    \"language\": \"ar\",\n    \"cuisine\": \"مصري\",\n    \"duration_in_minutes\": 30,\n    \"complexity\": \"سهل\",\n    \"affordability\": \"بسعر معقول\",\n    \"ingredients\": [\n      {\n        \"name\": \"عدس بني\",\n        \"quantity\": \"1 كوب\",\n\t\"name_in_english\": \"Brown lentils\"\n      },\n      {\n        \"name\": \"أرز قصير الحبة\",\n        \"quantity\": \"1 كوب\",\n\t\"name_in_english\": \"Short grain rice\n      },\n      {\n        \"name\": \"مكرونة شعيرية\",\n        \"quantity\": \"1 كوب\",\n\t\"name_in_english\": \"Vermicelli pasta\"\n      },\n      {\n        \"name\": \"حمص منقوع ومنظف\",\n        \"quantity\": \"نصف كوب\",\n\t\"name_in_english\": \"chickpeas\"\n      },\n      {\n        \"name\": \"شعيرية محمصة\",\n        \"quantity\": \"نصف كوب\",\n\t\"name_in_english\": \"Roasted vermicelli\"\n      },\n      {\n        \"name\": \"صلصة طماطم\",\n        \"quantity\": \"ملعقة كبيرة\",\n\t\"name_in_english\": \"tomato sauce\"\n      },\n      {\n        \"name\": \"معجون طماطم\",\n        \"quantity\": \"ملعقة كبيرة\",\n\t\"name_in_english\": \"Tomato paste\"\n      },\n      {\n        \"name\": \"كمون\",\n        \"quantity\": \"ملعقة صغيرة\",\n\t\"name_in_english\": \"cumin\"\n      }\n    ],\n    \"instructions\": [\n      \"اغسل العدس والأرز والمكرونة والشعيرية بشكل منفصل.\",\n       \"في قدر كبير، ضع العدس والماء واتركه يغلي على نار متوسطة لمدة 20 دقيقة.\",\n       \"أضف الأرز وقلّب واتركه يغلي لمدة 10 دقائق.\",\n       \"أضف المكرونة والشعيرية وقلّب واتركه يغلي لمدة 10 دقائق إضافية.\",\n       \"في قدر منفصل، ضع الحمص والماء واتركه يغلي على نار متوسطة لمدة 30  دقيقة.\",\n       \"أضف الصلصة ومعجون الطماطم والكمون والكزبرة والفلفل والملح إلى قدر العدس والأرز والمكرونة والشعيرية.\",\n       \"قلّب المزيج واتركه يغلي على نار خفيفة لمدة 10 دقائق.\",\n       \"صفي الحمص من الماء وأضفه إلى قدر العدس والأرز والمكرونة والشعيرية.\",\n       \"قلّب المزيج واتركه يغلي على نار خفيفة لمدة 5 دقائق إضافية.\",\n       \"اسكب الكشري في أطباق التقديم وزينه بالبصل المحمر والثومية والليمون.\"\n      ]\n  }\n}\n```"
            }
          ]
        },
        {
          "role": "user",
          "parts": [
            {"text": mealName}
          ]
        }
      ],
      "generationConfig": {
        "temperature": 0.9,
        "topK": 1,
        "topP": 1,
        "maxOutputTokens": 2048,
        "stopSequences": []
      },
      "safetySettings": [
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
      ]
    };

    var response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
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

    final mealJson =
        responseMap["candidates"][0]["content"]["parts"][0]["text"] as String;

    final mealJsonWithCodeAnotation = patternMatcher(
      mealJson,
      patterns: [
        // code Anotation
        RegExp(
          r"^```.*?```",
          multiLine: true,
          dotAll: true,
        ),
      ],
      types: ["code", "normal"],
    ).firstWhere((string) => string.type == "code").string;

    final mealJsonRemovedCodeAnotation = (mealJsonWithCodeAnotation.split("\n")
          ..removeAt(0)
          ..removeLast())
        .join("\n");

    final result =
        jsonDecode(mealJsonRemovedCodeAnotation) as Map<String, dynamic>;

    print(result);

    return Meal.fromJson(result["recipe"]);
  }
}
