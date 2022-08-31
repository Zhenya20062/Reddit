
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddit/reddit_detail.dart';
import 'package:reddit/reddit_repo.dart';

class DetailRoute extends StatelessWidget {
  final String id;

  const DetailRoute({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: RedditDetail(
        id: id,
      ),
    );
  }
}

class RedditDetail extends StatefulWidget {
  final String id;

  const RedditDetail({Key? key, required this.id}) : super(key: key);

  @override
  State<RedditDetail> createState() => _RedditDetailState();
}

class _RedditDetailState extends State<RedditDetail> {
  final RedditRepo repo = RedditRepo();
  RedditDetailData? data;

  @override
  Widget build(BuildContext context) {
    if (data == null) return Container();

    return SafeArea(
      child: Center(
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(data!.ups.toString()),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black)),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        data!.title,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20,),
                      Text(data!.selfText, style: TextStyle(fontSize: 19),)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    repo.getRedditDataById(widget.id).then((value) => setState(() {
      data = value;
    }));
  }
}