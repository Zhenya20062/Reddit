import 'package:flutter/material.dart';
import 'package:reddit/reddit_data.dart';

class DetailRoute extends StatelessWidget {
  final RedditMainData data;

  const DetailRoute({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: RedditDetail(
        data: data,
      ),
    );
  }
}

class RedditDetail extends StatefulWidget {
  final RedditMainData data;

  const RedditDetail({Key? key, required this.data}) : super(key: key);

  @override
  State<RedditDetail> createState() => _RedditDetailState();
}

class _RedditDetailState extends State<RedditDetail> {
  late RedditMainData _data;

  Widget buildRate() {
    Color backgroundColor = _data.ups >= 0 ? Colors.green : Colors.red;
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(_data.ups.toString()),
      ),
      decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: const EdgeInsets.all(8.0), child: buildRate()),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        _data.title,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        _data.selfText,
                        style: TextStyle(fontSize: 19),
                      )
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
    _data = widget.data;
  }
}
