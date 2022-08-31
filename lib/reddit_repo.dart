import 'dart:convert';

import 'package:http/http.dart';
import 'package:reddit/reddit_data.dart';
import 'package:reddit/reddit_detail.dart';

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

  Future<RedditDetailData> getRedditDataById(String id) async {
    Uri uri = Uri.parse("https://www.reddit.com/r/flutterdev/new.json");
    Response response = await get(uri);
    var json = jsonDecode(response.body);

    for (int i = 0; i < _maxDataCount; i++) {
      RedditDetailData model = RedditDetailData.fromJson(json, i);
      if (model.id == id) {
        return model;
      }
    }
    throw Exception("Something went wrong");
  }

  Future<Map<String, dynamic>> _getJsonFromUrl(String url) async {
    Uri uri = Uri.parse(url);
    Response response = await get(uri);
    return jsonDecode(response.body);
  }
}
