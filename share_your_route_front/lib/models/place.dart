class Place {
  final String name;
  final double entryPrice;

  Place({
    required this.name,
    required this.entryPrice,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      name: json['name'] as String,
      // ignore: avoid_dynamic_calls
      entryPrice: json['entryPrice'].toDouble()
          as double, // Convertir a double si es necesario
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'entryPrice': entryPrice,
    };
  }
}
