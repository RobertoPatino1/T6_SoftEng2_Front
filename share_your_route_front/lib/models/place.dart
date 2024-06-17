class Place {
  final String name;
  final double entryPrice;

  Place({
    required this.name,
    required this.entryPrice,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      name: json['name'],
      entryPrice:
          json['entryPrice'].toDouble(), // Convertir a double si es necesario
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'entryPrice': entryPrice,
    };
  }
}
