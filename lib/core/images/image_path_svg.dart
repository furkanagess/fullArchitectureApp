class SVGImagePaths {
  static SVGImagePaths? _instance;
  static SVGImagePaths get instance {
    if (_instance != null) return _instance!;

    _instance = SVGImagePaths._init();
    return _instance!;
  }

  SVGImagePaths._init();

  final catSVG = "cat".toSVG;
  final dogSVG = "dog".toSVG;
  final goodDogSVG = "good_dog".toSVG;
}

extension _SVGPATH on String {
  String get toSVG => "assets/svg/$this.svg";
}
