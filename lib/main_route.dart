import 'package:flutter/material.dart';
import 'package:reddit/reddit_data.dart';
import 'package:reddit/reddit_repo.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'detail_route.dart';

class MainRoute extends StatelessWidget {
  const MainRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Reddit"),
      ),
      backgroundColor: Colors.blueGrey,
      body: RedditMain(),
    );
  }
}

class RedditMain extends StatefulWidget {
  const RedditMain({Key? key}) : super(key: key);

  @override
  State<RedditMain> createState() => _RedditMainState();
}

class _RedditMainState extends State<RedditMain> {
  final RedditRepo _redditRepo = RedditRepo();
  List<RedditMainData> _list = [];

  final RefreshController _controller = RefreshController();

  void _onRefresh() async {
    _redditRepo.getData().then((value) {
      setState(() {
        _list = value;
      });
      _controller.refreshCompleted();
    }, onError: (_) {
      _controller.refreshFailed();
    });
  }

  Widget buildRedditItem(RedditMainData data) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailRoute(
                      data: data,
                    )));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 8),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  data.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Image.network(
                data.thumbnailUrl,
                fit: BoxFit.fill,
                errorBuilder: (_, __, ___) {
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _redditRepo.getData().then((value) => setState(() {
          _list = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _controller,
      header: WaterDropMaterialHeader(
        backgroundColor: Colors.red,
        color: Colors.white,
      ),
      onRefresh: _onRefresh,
      child: ListView.builder(
          itemCount: _list.length,
          itemBuilder: (context, position) {
            return buildRedditItem(_list[position]);
          }),
    );
  }
}
