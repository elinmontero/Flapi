class Climate {
  final String country;
  var main;
  var weather;

  Climate({required this.country, required this.main, required this.weather});

  factory Climate.fromJson(Map<String, dynamic> json) {
    return Climate(
        country: json["country"], main: json["main"], weather: json["weather"]);
  }
}
