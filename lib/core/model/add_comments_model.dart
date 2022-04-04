class AddCommentsModel {
  String? title;
  String? description;

  AddCommentsModel({
    this.title,
    this.description,
  });

  factory AddCommentsModel.fromJson(Map<String, dynamic> json) =>
      AddCommentsModel(
        title: json["title"],
        description: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
      };
}
