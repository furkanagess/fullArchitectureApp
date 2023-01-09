class ImageConstants {
  static ImageConstants? _instance;
  static ImageConstants get instance {
    if (_instance != null) return _instance!;

    _instance = ImageConstants._init();
    return _instance!;
  }

  ImageConstants._init();

  final cat = "cat".toPng;
}

extension _ImageExtension on String {
  String get toPng => "assets/image/$this.png";
}
