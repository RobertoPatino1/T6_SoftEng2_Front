# T6_SoftEng2_Front

## How to run the project
**1. Clone the repository**
```
git clone https://github.com/RobertoPatino1/T6_SoftEng2.git
```
**2. Move to project directory**
```
cd T6_SoftEng2/share_your_route_front/
```

**3. Install dependencies**
```
flutter pub get
```

**4. Create .env config file**
```
mkdir lib/core/configs
touch lib/core/configs/.env
```

**5. Place your Mapbox access token inside the .env file**
```
MAPBOX_ACCESS_TOKEN = <TOKEN>
```
If you don't have an access token make sure to check the following [link](https://docs.mapbox.com/help/getting-started/access-tokens/)

**6. Run the project**
```
flutter run -t lib/main/main.dart
```
