class RandomFact {
  RandomFact({
    required this.id,
    required this.text,
  });

  String? id;
  String? text;

  factory RandomFact.fromJson(Map<String, dynamic> json) => RandomFact(
        id: json["id"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
      };
}
