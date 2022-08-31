class RedditMainData {
  late String title;
  late String thumbnailUrl;
  late String id;

  RedditMainData({required this.title, required this.thumbnailUrl, required this.id});

  RedditMainData.fromJson(Map<String, dynamic> json, int item) {
    title = _getTitle(json, item);
    thumbnailUrl = _getThumbnailUrl(json, item);
    id = _getId(json, item);
  }

  dynamic _getId(Map<String, dynamic> json, int item) {
    return _getCommonPath(json, item)["id"];
  }
  dynamic _getThumbnailUrl(Map<String, dynamic> json, int item) {
    return _getCommonPath(json, item)["thumbnail"];
  }
  dynamic _getTitle(Map<String, dynamic> json, int item) {
    return _getCommonPath(json, item)["title"];
  }
  dynamic _getCommonPath(Map<String, dynamic> json, int item) {
    return json["data"]["children"][item]["data"];
  }
}
