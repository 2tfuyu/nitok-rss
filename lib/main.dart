import 'package:flutter/material.dart';
import 'package:webfeed/webfeed.dart';
import 'package:nitok/parser.dart';
import 'package:nitok/viewer.dart';
import 'package:nitok/simple_round_icon_button.dart';

void main() async{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NIT-Ok',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Text(
                        "NIT-Ok",
                        style: TextStyle(
                          fontSize: 60.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w100,
                        )
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: SimpleRoundIconButton(
                          backgroundColor: Colors.lightBlue,
                          buttonText: "学校の活動",
                          textColor: Colors.white,
                          textSize: 20.0,
                          icon: Icon(Icons.local_activity),
                          iconColor: Colors.blueGrey,
                          iconAlignment: Alignment.centerRight,
                          onPressed: () async{
                            RssFeed feed = await Parser().getFeed(RSS.SchoolActivity);
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => Viewer(feed: feed)));
                          }
                      )
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: SimpleRoundIconButton(
                          backgroundColor: Colors.lightBlue,
                          buttonText: "受験をお考えの方へ",
                          textColor: Colors.white,
                          textSize: 20.0,
                          icon: Icon(Icons.school),
                          iconColor: Colors.blueGrey,
                          iconAlignment: Alignment.centerRight,
                          onPressed: () async{
                            RssFeed feed = await Parser().getFeed(RSS.ExamInfo);
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => Viewer(feed: feed)));
                          }
                      )
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: SimpleRoundIconButton(
                          backgroundColor: Colors.lightBlue,
                          buttonText: "学生・保護者の方へ",
                          textColor: Colors.white,
                          textSize: 20.0,
                          icon: Icon(Icons.face),
                          iconColor: Colors.blueGrey,
                          iconAlignment: Alignment.centerRight,
                          onPressed: () async{
                            RssFeed feed = await Parser().getFeed(RSS.ToStudent);
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => Viewer(feed: feed)));
                          }
                      )
                  )
                ]
            )
        )
    );
  }
}
