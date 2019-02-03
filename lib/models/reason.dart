class Reason {
  String title;

  @override
  String toString() {
    return this.title;
  }

  Reason(this.title);

  Map<String, dynamic> toJson() =>
      {
        'title': title,
      };

  factory Reason.fromJson(Map<String, dynamic> json) {
    return Reason(json['title']);
  }
}
