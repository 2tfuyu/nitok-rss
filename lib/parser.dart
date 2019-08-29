import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';
import 'dart:async';

enum RSS {
  SchoolActivity,
  ExamInfo,
  ToStudent,
}

class Parser {

  final _schoolActivity = "http://www.okinawa-ct.ac.jp/rss/RssFeed.jsp?select=%B3%D8%B9%BB%A4%CE%B3%E8%C6%B0";
  final _examInfo = "http://www.okinawa-ct.ac.jp/rss/RssFeed.jsp?select=%BC%F5%B8%B3%A4%F2%A4%AA%B9%CD%A4%A8%A4%CE%CA%FD%A4%D8";
  final _toStudent = "http://www.okinawa-ct.ac.jp/rss/RssFeed.jsp?select=%B3%D8%C0%B8%A1%A6%CA%DD%B8%EE%BC%D4%A4%CE%CA%FD%A4%D8";

  Future<RssFeed> getFeed(RSS rss) async{
    var sXml = await http.read(getUrl(rss));
    return RssFeed.parse(sXml);
  }

  String getUrl(RSS rss) {
    if (rss == RSS.SchoolActivity) {
      return _schoolActivity;
    }

    if (rss == RSS.ExamInfo) {
      return _examInfo;
    }

    if (rss == RSS.ToStudent) {
      return _toStudent;
    }
    return "none";
  }
}