import 'package:coronatracker/data/news.dart';
import 'package:coronatracker/models/news_model.dart';
import 'package:coronatracker/screens/webview.dart';
import 'package:flutter/material.dart';

class NewsBodyContainer extends StatefulWidget {
  @override
  _NewsBodyContainerState createState() => _NewsBodyContainerState();
}

class _NewsBodyContainerState extends State<NewsBodyContainer> {
  Map data = {};
  List<News> newsData = [];

  NewsResponse response = NewsResponse();

  Future fetchNews() async {
    List<News> res = await response.fetchNews();
    setState(() {
      newsData = res;
    });
    return data;
  }

  void initState() {
    fetchNews();
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsData.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                child: Column(
              children: <Widget>[
                Image.network(
                  newsData[index].imageUrl!,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
                Text(
                  "${newsData[index].title}",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${newsData[index].summary}",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                ElevatedButton(
                  child: Text("See more"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WebViewPage(
                                  newsData[index].url!,
                                )));
                  },
                ),
              ],
            )),
          ),
        );
      },
    );
  }
}
