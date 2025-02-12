import 'dart:ui';

class FontList {
  static List<Font> fonts = [
    Font('Verdana', [FontWeight.normal, FontWeight.bold, FontWeight.w900]),
    Font('Timer New Roman',
        [FontWeight.normal, FontWeight.bold, FontWeight.w900]),
    Font('Segeo UI This', [FontWeight.normal, FontWeight.bold]),
    Font('Cambria', [FontWeight.normal, FontWeight.bold]),
    Font(
      'Calibri',
      [FontWeight.normal, FontWeight.bold],
    ),
    Font(
      'Arial',
      [FontWeight.normal, FontWeight.bold],
    )
  ];
}

class Font {
  String name;
  List<FontWeight> weights;

  Font(this.name, this.weights);
}
