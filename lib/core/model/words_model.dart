import 'dart:convert';

Words wordsFromJson(String str) {
  final jsonData = json.decode(str);
  return jsonData;
}

String wordsToJson(Words words) {
  final dyn = words.toMap();
  return json.encode(dyn);
}

class Words {
  final int id;
  final String words;

  Words({this.id, this.words});

  factory Words.fromMap(Map<String,dynamic> json) => new Words(
    id: json['id'],
    words: json['words']
  );

  Map<String, dynamic> toMap() {
    return {'id': id, 'words': words};
  }
}