class Cover {
  final String small;
  final String medium;
  final String large;

  Cover({this.large, this.medium, this.small});

  factory Cover.fromJson(Map<String, dynamic> json) => Cover(
        small: json["small"],
        medium: json["medium"],
        large: json["large"],
      );

  Map<String, dynamic> toJson() => {
        "small": small,
        "large": large,
        "medium": medium,
      };
}
