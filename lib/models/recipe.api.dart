import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipe/models/recipe.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      "adb88341c2mshcb11cd59cedb378p1e9691jsna59394101220":
          "YOUR API KEY FROM YUMMLY API",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List temp = [];

    for (var i in data['feed']) {
      temp.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapshot(temp);
  }
}
