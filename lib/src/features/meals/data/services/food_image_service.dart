import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

import '../../../../core/error/exceptions_without_message.dart';
import '../../../../core/util/functions/string_manipulations_and_search.dart';

abstract class FoodImageService {
  Future<String> getImageLink(String foodName, [int squareDimension = 200]);
}

class FoodImageWikipediaScrapingImpl implements FoodImageService {
  @override
  Future<String> getImageLink(
    String foodName, [
    int squareDimension = 200,
  ]) async {
    try {
      final isFirstCharArabic = firstCharIsArabic(foodName);

      final searchKey = foodName.split(RegExp(r" +")).join("+");

      final lang = isFirstCharArabic ? "ar" : "en";
      final searchHeaderTitle = isFirstCharArabic
          ? "%D8%AE%D8%A7%D8%B5%3A%D8%A8%D8%AD%D8%AB"
          : "Special:Search";

      final url = Uri.parse(
          'https://$lang.wikipedia.org/w/index.php?search=$searchKey&title=$searchHeaderTitle&profile=advanced&fulltext=1&ns0=1');

      final headers = {
        'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36',
        'Referer': 'https://www.google.com/',
      };

      //print(url);
      final response = await http.get(url, headers: headers);

      if (response.statusCode != 200) {
        throw ServerException();
      }

      final html = dom.Document.html(response.body);
      final targetElements =
          html.getElementsByClassName("searchResultImage-thumbnail");

      final images = targetElements
          .map((element) => element.children[0].children[0].attributes['src'])
          .toList();

      final imageLink =
          images.firstWhere((image) => image != null, orElse: () => null);

      final scaledImage = _scaleWikipediaImage(imageLink, squareDimension);

      return "https:$scaledImage";
    } catch (error) {
      return error.toString();
    }
  }

  String? _scaleWikipediaImage(
    String? wikipediaImageLink, [
    int squareDimension = 200,
  ]) {
    if (wikipediaImageLink == null || wikipediaImageLink.isEmpty) {
      return wikipediaImageLink;
    }

    RegExp regex = RegExp(r'\/\d+px');

    return wikipediaImageLink.replaceFirst(regex, "/${squareDimension}px");
  }
}
