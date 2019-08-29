import 'package:flutter/material.dart';
import 'package:webfeed/webfeed.dart';

class Viewer extends StatelessWidget {

  RssFeed feed;

  Viewer({this.feed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("View"),
        ),
        body: ListView.builder(
            itemCount: this.feed.items.length,
            itemBuilder: (BuildContext context, int i) {
              final item = this.feed.items[i];
              return ListTile(
                title: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                        item.title,
                        style: TextStyle(fontSize: 20.0)
                    )
                ),
                subtitle: Text('Published at ' + item.pubDate),
                contentPadding: EdgeInsets.all(16.0),
                onTap: null
                /* () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WebViewContainer(item.link.replaceFirst('http', 'https'))
                      )
                  );
                },
                */
              );
            }
        )
    );
  }
}