import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = 'today';
  List<WebToonModel> webtoonInstances = [];
  Future<List<WebToonModel>> getTodaysToons() async {
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebToonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }
}
