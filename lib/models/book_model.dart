class BookModel {
  String id;
  String title;
  String status;
  String longDescription;
  String sortDescription;
  List<String> categories;
  List<String> authors;
  BookModel({
    this.id = '',
    required this.title,
    required this.status,
    required this.longDescription,
    required this.sortDescription,
    required this.categories,
    required this.authors,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "status": status,
        "longDescription": longDescription,
        "shortDescription": sortDescription,
        "categories": categories,
        "authors": authors
      };
  static BookModel fromJson(Map<String, dynamic> json) => BookModel(
      id: json["id"],
      title: json["title"],
      status: json["status"],
      longDescription: json["longDescription"],
      sortDescription: json["shortDescription"],
      categories: json["categories"],
      authors: json["authors"]);
}
