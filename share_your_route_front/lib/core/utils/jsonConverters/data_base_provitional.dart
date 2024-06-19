// information that will be obtained from the database
List<Map<String, dynamic>> publicRoutes = [
  {
    'name': 'Centro artístico',
    'placesList': [
      {
        'place': {'name': 'Lugar1', 'entryPrice': 0.0},
        'dateTime': '2023-06-09T10:30:00.000'
      },
      {
        'place': {'name': 'Lugar2', 'entryPrice': 0.0},
        'dateTime': '2023-06-09T11:00:00.000'
      },
      {
        'place': {'name': 'Lugar3', 'entryPrice': 0.0},
        'dateTime': '2023-06-09T11:30:00.000'
      },
      {
        'place': {'name': 'Lugar4', 'entryPrice': 0.0},
        'dateTime': '2023-06-09T12:00:00.000'
      },
      {
        'place': {'name': 'Lugar5', 'entryPrice': 0.0},
        'dateTime': '2023-06-09T12:15:00.000'
      },
    ],
    'currentPlaceIndex': 0,
    'startTime': '2023-06-09T10:30:00.000',
    'endTime': '2023-06-09T12:30:00.000',
    'image': 'centro_artistico',
    'description': 'Descubre las maravillas artísticas',
    'hasStarted': false,
    'routeType': ['culture', 'city'],
  },
  {
    'name': 'Fauna silvestre',
    'placesList': [
      {
        'place': {'name': 'Lugar1', 'entryPrice': 0.0},
        'dateTime': '2023-06-09T10:30:00.000'
      },
      {
        'place': {'name': 'Lugar2', 'entryPrice': 0.0},
        'dateTime': '2023-06-09T11:00:00.000'
      },
      {
        'place': {'name': 'Lugar3', 'entryPrice': 0.0},
        'dateTime': '2023-06-09T11:30:00.000'
      },
      {
        'place': {'name': 'Lugar4', 'entryPrice': 0.0},
        'dateTime': '2023-06-09T12:00:00.000'
      },
      {
        'place': {'name': 'Lugar5', 'entryPrice': 0.0},
        'dateTime': '2023-06-09T12:15:00.000'
      },
    ],
    'currentPlaceIndex': 0,
    'startTime': '2023-06-09T10:30:00.000',
    'endTime': '2023-06-09T12:30:00.000',
    'image': 'fauna_silvestre',
    'description': 'Descubre la fauna del lugar',
    'hasStarted': false,
    'routeType': ['nature'],
  },
  {
    'name': 'Ruta gastronómica',
    'placesList': [
      {
        'place': {'name': 'Lugar1', 'entryPrice': 0.0},
        'dateTime': '2023-06-09T10:30:00.000'
      },
      {
        'place': {'name': 'Lugar2', 'entryPrice': 0.0},
        'dateTime': '2023-06-09T11:00:00.000'
      },
      {
        'place': {'name': 'Lugar3', 'entryPrice': 0.0},
        'dateTime': '2023-06-09T11:30:00.000'
      },
      {
        'place': {'name': 'Lugar4', 'entryPrice': 0.0},
        'dateTime': '2023-06-09T12:00:00.000'
      },
      {
        'place': {'name': 'Lugar5', 'entryPrice': 0.0},
        'dateTime': '2023-06-09T12:15:00.000'
      },
    ],
    'currentPlaceIndex': 0,
    'startTime': '2023-06-09T10:30:00.000',
    'endTime': '2023-06-09T12:30:00.000',
    'image': 'ruta_gastronomica',
    'description': 'Encuentra los mejores platos típicos',
    'hasStarted': false,
    'routeType': ['gastronomic', 'city'],
  },
];

List<Map<String, dynamic>> privateRoutes = [
  {
    'name': 'Tarde con amigos',
    'placesList': [
      {
        'place': {'name': 'Lugar1', 'entryPrice': 0.0},
        'dateTime': '2023-06-09T10:30:00.000'
      },
      {
        'place': {'name': 'Lugar2', 'entryPrice': 0.0},
        'dateTime': '2023-06-09T11:00:00.000'
      },
      {
        'place': {'name': 'Lugar3', 'entryPrice': 0.0},
        'dateTime': '2023-06-09T11:30:00.000'
      },
      {
        'place': {'name': 'Lugar4', 'entryPrice': 0.0},
        'dateTime': '2023-06-09T12:00:00.000'
      },
      {
        'place': {'name': 'Lugar5', 'entryPrice': 0.0},
        'dateTime': '2023-06-09T12:15:00.000'
      },
    ],
    'startTime': '2023-06-09T10:30:00.000',
    'endTime': '2023-06-09T12:30:00.000',
    'image': 'no_image',
    'description': 'Paseo privado con amigos',
    'hasStarted': false,
    'routeType': ['gastronomic', 'adventure', 'city'],
  },
];
