import 'package:flutter/material.dart';

import '../../../core/network/network_info.dart';

import 'get_api.dart';

class FoodScan with ChangeNotifier {
  late String _imagePath;
  late String _resultOverview;

  final List<String> _questionsChoices = [
    """Is this food considered Healthy? Explain The benefits of this food in detail and Why?
If there is more than one item, "Give the result in table format for each item".""",
    """Please give me the following Nutrition Facts: 
-  Calories.
-  Proteins (g).
-  Fats (g). 
-  What Vitamins are in it?
-  Carbohydrates (g).
-  Sodium (mg).
-  Potassium (mg).
-  and more...

If there is more than one item, "Give the result in table format for each item and the overall (sum) of the results of all the above".""",
    """Please answer the following:

-  Does this food contain "Pork or Alcohol"?
-  Does this food contain "Gluten"?
-  Does this food contain Lactose?
-  Is this food considered "Vegetarian"?
-  Is this food considered "Vegan"?
-  and more...

If there is more than one item, "Give the result in table format for each item and the overall (sum) of the results of all the above".
""",
    """How to prepare this food?

If there is more than one item, "Give the result for each item".""",
  ];

  final List<String> _questionsChoicesArabic = [
    """هل يعتبر هذا الطعام صحي؟ اشرح فوائد هذا الطعام بالتفصيل ولماذا؟
إذا كان هناك أكثر من عنصر واحد، "أعط النتيجة في جدول لكل عنصر".""",
    """من فضلك أعطني الحقائق الغذائية التالية:
-  سعرات حرارية.
- البروتينات (ز).
- الدهون (ز).
- ما هي الفيتامينات الموجودة فيه؟
- الكربوهيدرات (جم).
- الصوديوم (ملغ).
- البوتاسيوم (ملغ).
-  و اكثر...

إذا كان هناك أكثر من عنصر، "أعط النتيجة في جدول لكل عنصر وإجمالي (مجموع) نتائج كل ما سبق".""",
    """الرجاء الإجابة على ما يلي:

- هل يحتوي هذا الطعام على "لحم الخنزير أو الكحول"؟
- هل يحتوي هذا الطعام على "الجلوتين"؟
- هل يحتوي هذا الطعام على اللاكتوز؟
- هل يعتبر هذا الطعام "نباتي"؟
- هل يعتبر هذا الطعام "فيجان"؟
-  و اكثر...

إذا كان هناك أكثر من عنصر، "أعط النتيجة في جدول لكل عنصر وإجمالي (مجموع) نتائج كل ما سبق".
""",
    """طريقة تحضير هذا الطعام؟ "المكونات والخطوات"

إذا كان هناك أكثر من عنصر واحد، "أعط النتيجة لكل عنصر".""",
  ];

  final List<String?> _questionsResults = [
    null,
    null,
    null,
    null,
  ];

  Future<String> getFoodOverview(String imagePath) async {
    try {
      if (await MyNetworkInfoImpl().isNotConnected) {
        throw ErrorDescription("You Are Offline.");
      }

      _imagePath = imagePath;
      _resultOverview = await foodOverview(imagePath);
      notifyListeners();

      return _resultOverview;
    } catch (error) {
      rethrow;
    }
  }

  Future<String> getfoodMoreDetails(int questionIndex) async {
    if (_questionsResults[questionIndex] != null) {
      return _questionsResults[questionIndex]!;
    }

    try {
      if (await MyNetworkInfoImpl().isNotConnected) {
        throw ErrorDescription("You Are Offline.");
      }

      _questionsResults[questionIndex] = await foodMoreDetails(
        _imagePath,
        _resultOverview,
        _questionsChoicesArabic[questionIndex],
      );

      notifyListeners();

      return _questionsResults[questionIndex]!;
    } catch (error) {
      rethrow;
    }
  }
}
