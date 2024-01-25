import 'package:flutter/material.dart';

import '../../../data/models/food_scanning_result_model.dart';
import 'sharing_with_state.dart';

class ShareFoodScanningResultButton extends StatelessWidget {
  const ShareFoodScanningResultButton(this.dataToShare, {super.key});

  final FoodScanningResultModel dataToShare;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: null,
      tooltip: "Share as PDF",
      onPressed: () => _showSharingWithStateDialog(context, dataToShare),
      child: const Icon(Icons.share),
    );
  }
}

void _showSharingWithStateDialog(
  BuildContext context,
  FoodScanningResultModel dataToShare,
) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext dialogContext) {
      return PopScope(
        canPop: false,
        child: Dialog(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: ShareWithState(dataToShare),
            ),
          ),
        ),
      );
    },
  );
}



/////////////////////////////////////////////////////////////////////////
///////////////////////////////////////
///////////////

/*class TestMyMarkDown extends StatelessWidget {
  const TestMyMarkDown({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: TextWellFormattedWithBulleted(
          data: data,
        ),
      ),
    );
  }
}*/

/*const test3 = """ * bgbgb
          This is a photo of a glass of tea. 
**Tea** is a beverage made from the Camellia sinensis plant. It is typically brewed with hot water and can be served with milk, sugar, or other flavorings. Tea contains caffeine, which is a stimulant. The amount of caffeine in tea varies depending on the type of tea and how it is brewed.
      
The calorie `content` of tea also varies depending on how it is prepared. 
* A cup of black tea without milk or sugar contains about 2 calories. 
  1. btbt
  2. hhg


- A cup of green tea without milk or sugar contains about 0 calories. 
  + A cup of tea with milk and sugar contains about **100 calories**. jjv
+ The calorie `content` of tea also varies depending on how it is prepared. 
10. A cup of black tea without milk or sugar contains about 2 calories.
2. A cup of green tea without milk or sugar contains about 0 calories. 
* hi there
30. A cup of tea with milk and sugar contains about **100 calories**.

Tea is a healthy beverage that can be enjoyed as part of a balanced diet. It is a good source of antioxidants, which can help to protect the body from damage caused by free radicals. Tea can also help to improve heart health and reduce the risk of some types of cancer.
  
The image contains a roasted turkey, mashed potatoes, stuffing, green bean casserole, cranberry sauce, and dinner rolls. There are also some nuts and fruits on the table.

follow this link: https://www.google.com or this www.facebook.com
contact us: salahalshafey@gmail.com.eg
call us: 01010630524

The nutrition facts for each item are as follows:

| Item | Calories | Proteins (g) | Fats (g) | Carbohydrates (g) | Sodium (mg) | Potassium (mg) |
|---|---|---|---|---|---|---|
| Roasted turkey (1 cup) | 400 | 40 | 15 | 0 | 100 | 300 |
| Mashed potatoes (1/2 cup) | 100 | 2 | 5 | 15 | 10 | 200 |
| Stuffing (1/2 cup) | 200 | 5 | 10 | 25 | 200 | 200 |
| Green bean casserole (1/2 cup) | 100 | 4 | 5 | 10 | 100 | 200 |
| Cranberry sauce (1/4 cup) | 50 | 0 | 0 | 15 | 10 | 100 |
| Dinner rolls (1 roll) | 100 | 3 | 5 | 15 | 100 | 100 |
| Nuts (1/4 cup) | 200 | 5 | 20 | 5 | 0 | 100 |
| Fruits (1/2 cup) | 50 | 1 | 0 | 10 | 0 | 100 |
| **Total** | **1,200** | **60** | **60** | **85** | **620** | **1,300** |

hhf

```
final String name;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: null,
      tooltip: "Share as PDF",
      onPressed: () => _covertToPdfAndShare(context),
      child: const Icon(Icons.share),
    );
  }
}
```
mum
```dart
class CodeContainer extends StatelessWidget {
  const CodeContainer({
    super.key,
    required this.code,
    required this.languageName,
    this.animateTheCode = false,
  });

  final String code;
  final String languageName;
  final bool animateTheCode;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.black,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.grey.shade800,
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.ltr,
              children: [
                Text(
                  languageName,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
                CopyCode(code: code),
              ],
            ),
          ),
          Scrollbar(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: Directionality.of(context) == TextDirection.rtl,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20), padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: animateTheCode
                  ? Animate().custom(
                      duration: (code.length * 10).ms,
                      begin: 0,
                      end: code.length.toDouble(),
                      builder: (_, value, __) {
                        return SelectableText(
                          code.substring(0, value.toInt()),
                          textDirection: TextDirection.ltr,
                          style: const TextStyle(color: Colors.white),
                        );
                      },
                    )
                  : SelectableText(
                      code,
                      textDirection: TextDirection.ltr,
                      style: const TextStyle(color: Colors.white),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
```

The `overall` nutrition facts for the meal are as follows:

| Nutrients | Amount |
|---|---|
| Calories | 1,200 |
| Proteins | 60 g |
| Fats | 60 g |
| Carbohydrates | 85 g |
| Sodium | 620 mg |
| Potassium | 1,300 mg | 
""";

const testString =
    """Flutter Speech to Text is a **plugin that** allows you to easily integrate `speech recognition` into your Flutter apps. It uses the Google Cloud Speech-to-Text API to convert audio to text, and it supports a variety of languages.

To use `Flutter Speech to Text`, you first need to create a project in the Google Cloud Platform Console. Once you have created a project, you need to enable the Google Cloud Speech-to-Text API.

After you have enabled the API, you need to create a service account and download the JSON key file. You will need to provide the JSON key file to the Flutter Speech to Text plugin.

To **install** the Flutter Speech to Text plugin, you can use the following command:

```
pub add flutter_speech_to_text
```

Once the plugin is installed, you can use it in your Flutter app. The following code snippet shows how to use the Flutter Speech to Text plugin to convert audio to text:

```
import 'package:flutter/material.dart';
import 'package:flutter_speech_to_text/flutter_speech_to_text.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Speech to Text',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Speech to Text'),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () async {
              // Create a SpeechToText object.
              final speechToText = SpeechToText();

              // Set the language code.
              speechToText.setLanguageCode('en-US');

              // Start listening for speech.
              final result = await speechToText.listen();

              // Print the result.
              print(result.text);
            },
            child: Text('Listen'),
          ),
        ),
      ),
    );
  }
}
```

When you run the **app**, you will see a button that says "Listen". When you click on the button, the app will start listening for speech. The text that is spoken will be converted to text and printed to the `console`.

* that is `awesom` man you are **great** if you think
* **you** can visit thi link www.google.com to chech fo ervery thing and https://www.hyth.com
* `Emial` is salahalshafey@gmail.com is valid.

Flutter Speech to Text is a powerful tool that can be used to add speech recognition to your Flutter apps. It is easy to use and supports a variety of languages.
""";

const testString2 =
    """فلاتر Speech to Text هو **مكون إضافي** يسمح لك بدمج `التعرف على الكلام` بسهولة في تطبيقات Flutter. ويستخدم Google Cloud Speech-to-Text API لتحويل الصوت إلى نص، ويدعم مجموعة متنوعة من اللغات.

لاستخدام `Flutter Speech to Text`، تحتاج أولاً إلى إنشاء مشروع في Google Cloud Platform Console. بمجرد إنشاء مشروع، تحتاج إلى تمكين Google Cloud Speech-to-Text API.

بعد تمكين واجهة برمجة التطبيقات (API)، يتعين عليك إنشاء حساب خدمة وتنزيل ملف مفتاح JSON. سوف تحتاج إلى تقديم ملف مفتاح JSON إلى البرنامج المساعد Flutter Speech to Text.

**لتثبيت** المكون الإضافي Flutter Speech to Text، يمكنك استخدام الأمر التالي:

```
حانة إضافة Flutter_Speech_to_text
```

بمجرد تثبيت المكون الإضافي، يمكنك استخدامه في تطبيق Flutter. يوضح مقتطف الكود التالي كيفية استخدام البرنامج المساعد Flutter Speech to Text لتحويل الصوت إلى نص:

```
import 'package:flutter/material.dart';
import 'package:flutter_speech_to_text/flutter_speech_to_text.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Speech to Text',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Speech to Text'),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () async {
              // Create a SpeechToText object.
              final speechToText = SpeechToText();

              // Set the language code.
              speechToText.setLanguageCode('en-US');

              // Start listening for speech.
              final result = await speechToText.listen();

              // Print the result.
              print(result.text);
            },
            child: Text('Listen'),
          ),
        ),
      ),
    );
  }
}
```

عند تشغيل **التطبيق**، سترى زرًا مكتوبًا عليه "استمع". عند النقر على الزر، سيبدأ التطبيق في الاستماع للكلام. سيتم تحويل النص المنطوق إلى نص وطباعته على "وحدة التحكم".

* هذا رجل رائع، أنت ** عظيم ** إذا كنت تعتقد ذلك
* **أنت** يمكنك زيارة الرابط www.google.com للتحقق من كل شيء وhttps://www.hyth.com
* و`Emial` هو salahalshafey@gmail.com صالح.

يعد Flutter Speech to Text أداة قوية يمكن استخدامها لإضافة ميزة التعرف على الكلام إلى تطبيقات Flutter. إنه سهل الاستخدام ويدعم مجموعة متنوعة من اللغات.
""";
*/