import 'package:share_your_route_front/models/place.dart';

List<Map<Place, DateTime>> places = [
  {Place(name: "Lugar1", entryPrice: 0.0): DateTime(2023, 6, 9, 10, 30)},
  {Place(name: "Lugar2", entryPrice: 0.0): DateTime(2023, 6, 9, 11, 00)},
  {Place(name: "Lugar3", entryPrice: 0.0): DateTime(2023, 6, 9, 11, 30)},
  {Place(name: "Lugar4", entryPrice: 0.0): DateTime(2023, 6, 9, 12, 00)},
  {Place(name: "Lugar5", entryPrice: 0.0): DateTime(2023, 6, 9, 12, 15)}
];

List<Map<String, dynamic>> placesToJson(List<Map<Place, DateTime>> placesList) {
  List<Map<String, dynamic>> jsonList = [];
  for (var placeMap in placesList) {
    Place place = placeMap.keys.first;
    DateTime dateTime = placeMap.values.first;
    jsonList.add({
      'place': {
        'name': place.name,
        'entryPrice': place.entryPrice,
      },
      'dateTime': dateTime.toIso8601String(),
    });
  }
  return jsonList;
}

List<Map<Place, DateTime>> placesFromJson(List<Map<String, dynamic>> jsonList) {
  List<Map<Place, DateTime>> placesList = [];
  for (var json in jsonList) {
    Place place = Place.fromJson(json['place']);
    DateTime dateTime = DateTime.parse(json['dateTime']);
    placesList.add({place: dateTime});
  }
  return placesList;
}
