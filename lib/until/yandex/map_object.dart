import 'package:yandex_mapkit/yandex_mapkit.dart';

List<MapObject> mapObject = [];


void addMapObject({required double latitude, required double longitude, required String objectId, required String icon}){
  mapObject!.add(PlacemarkMapObject(
      mapId:  MapObjectId(objectId),
      point: Point(
        latitude: latitude,
        longitude: longitude,
      ),
      icon: PlacemarkIcon.single(
          PlacemarkIconStyle(image: BitmapDescriptor.fromAssetImage(icon), scale: 0.2))));
}