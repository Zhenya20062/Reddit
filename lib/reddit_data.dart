class RedditMainData {
  late String title;
  late String thumbnailUrl;
  late int ups;
  late String selfText;

  RedditMainData(
      {required this.title,
      required this.thumbnailUrl,
      required this.ups,
      required this.selfText});

  RedditMainData.fromJson(Map<String, dynamic> json, int item) {
    title = _getTitle(json, item);
    thumbnailUrl = _getThumbnailUrl(json, item);
    ups = _getUps(json, item);
    selfText = _getSelfText(json, item);
  }

  dynamic _getSelfText(Map<String, dynamic> json, int item) {
    return _getCommonPath(json, item)["selftext"];
  }

  dynamic _getUps(Map<String, dynamic> json, int item) {
    return _getCommonPath(json, item)["ups"];
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
