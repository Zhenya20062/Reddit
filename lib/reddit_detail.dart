class RedditDetailData {
  late String title;
  late String id;
  late int ups;
  late String selfText;

  RedditDetailData(
      {required this.title, required this.ups, required this.selfText, required this.id});

  RedditDetailData.fromJson(Map<String, dynamic> json, int item) {
    title = _getTitle(json, item);
    id = _getId(json, item);
    ups = _getUps(json, item);
    selfText = _getSelfText(json, item);
  }

  dynamic _getSelfText(Map<String, dynamic> json, int item) {
    return _getCommonPath(json, item)["selftext"];
  }

  dynamic _getUps(Map<String, dynamic> json, int item) {
    return _getCommonPath(json, item)["ups"];
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