import 'dart:convert';

import 'package:http/http.dart';
import 'package:reddit/reddit_data.dart';

class RedditRepo {
  final int _maxDataCount = 25;

  Future<List<RedditMainData>> getData() async {
    Uri uri = Uri.parse("https://www.reddit.com/r/flutterdev/new.json");
    Response response = await get(uri);
    var json = jsonDecode(response.body);
    List<RedditMainData> list = [];

    for (int i = 0; i < _maxDataCount; i++) {
      RedditMainData model = RedditMainData.fromJson(json, i);
      list.add(model);
    }
    return list;
  }
}
