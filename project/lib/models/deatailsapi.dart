import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project/models/recipedetails.dart';

class RecipeDetailAPI {
  static Future<Content> getRecipeDetail(String id) async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list-similarities', {
      "limit": "18",
      "start": "0",
      "id":"15-Minute-Baked-Salmon-with-Lemon-9029477",  // Use the provided id parameter here
      "apiFeedType": "moreFrom",
      "authorId": "Yummly"
    });

    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': '262bd6b036mshc5786c354fe6865p10612djsnd8150de46e72',
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com',
      'useQueryString': 'true'
    });

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      List temp = [];

      for (var i in data['feed']) {
        temp.add(i['content']);
      }

      var content = Content.fromJson(temp[0]);
      return content;
    } else {
      throw Exception('Failed to load recipe detail');
    }
  }
}