class Food {
  const Food({
    required String title,
    required double price,
    required String imagepath,
    required double rating,
  })  : _title = title,
        _price = price,
        _imagepath = imagepath,
        _rating = rating;

  final String _title;
  final double _price;
  final String _imagepath;
  final double _rating;

  String get title => _title;
  String get price => _price.toString();
  String get imagePath => _imagepath;
  String get rating => _rating.toString();



}
