class Author {
  final String url;
  final String name;

  Author({
    this.url,
    this.name,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        url: json["url"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "name": name,
      };
}
