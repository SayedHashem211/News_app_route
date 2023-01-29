import 'Source.dart';

/// source : {"id":"bbc-news","name":"BBC News"}
/// author : "https://www.facebook.com/bbcnews"
/// title : "Idaho murders: Police say suspect's DNA found at the crime scene"
/// description : "Court records released on Thursday have revealed new details in the case."
/// url : "https://www.bbc.co.uk/news/world-us-canada-64180185"
/// urlToImage : "https://ichef.bbci.co.uk/news/1024/branded_news/16BB7/production/_128211139_gettyimages-1246006827.jpg"
/// publishedAt : "2023-01-05T18:41:38Z"
/// content : "The DNA of the man accused of murdering four students at the University of Idaho was found at the crime scene, according to allegations in newly released court documents.\r\nSuspect Bryan Kohberger, 28… [+1460 chars]"

class News {
  News({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,});

  News.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}
