class News {
  String? title;
  String? imageUrl;
  String? summary;
  String? url;

  News({
    this.title,
    this.imageUrl,
    this.summary,
    this.url,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'].toString(),
      imageUrl: json['image_url'].toString(),
      summary: json['summary'].toString(),
      url: json['url'].toString(),
    );
  }
}
