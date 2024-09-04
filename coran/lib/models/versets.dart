class Verset {
  final int number;
  final String text_arabe;
  final String text;
  final int juz;
  final int page;

  Verset({
    required this.number,
    required this.text_arabe,
    required this.text,
    required this.juz,
    required this.page,
  });

  factory Verset.fromJson(Map<String, dynamic> json) {
    return Verset(
      number: json['number'],
      text_arabe: json['text_arabe'],
      text: json['text'],
      juz: json['juz'],
      page: json['page'],
    );
  }
    Map<String, dynamic> toJson() => {
        "number": number,
        "text_arabe": text_arabe,
        "text": text,

      };
}