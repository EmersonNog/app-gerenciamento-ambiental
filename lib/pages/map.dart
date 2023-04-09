import 'package:flutter/material.dart';
import 'package:flutter_map_arcgis/flutter_map_arcgis.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const Mapa());
}

class Mapa extends StatefulWidget {
  const Mapa({Key? key}) : super(key: key);

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  Position position = Position(
    latitude: 0.0,
    longitude: 0.0,
    accuracy: 1,
    altitude: 1,
    heading: 1,
    speed: 1,
    speedAccuracy: 1,
    timestamp: DateTime.now(),
  );
  List<LatLng> polygonPoints = [];

  @override
  void initState() {
    super.initState();
    Geolocator.getCurrentPosition().then((position) {
      setState(() {
        this.position = position;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('ArcGIS')),
        body: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              Flexible(
                child: GestureDetector(
                  onTapUp: (TapUpDetails tapDetails) {
                    setState(() {
                      polygonPoints.add(
                        LatLng(
                          tapDetails.localPosition.dx,
                          tapDetails.localPosition.dy,
                        ),
                      );
                    });
                  },
                  child: FlutterMap(
                    options: MapOptions(
                      center: LatLng(-5.083310, -42.795612),
                      zoom: 11.0,
                      plugins: [EsriPlugin()],
                    ),
                    layers: [
                      TileLayerOptions(
                        urlTemplate:
                            'https://services.arcgisonline.com/arcgis/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}',
                      ),
                      if (position != null)
                        MarkerLayerOptions(
                          markers: [
                            Marker(
                              point: LatLng(position.latitude, position.longitude),
                              builder: (context) =>
                                  const Icon(Icons.location_on, color: Color.fromARGB(255, 255, 255, 255)),
                            )
                          ],
                        ),
                      if (polygonPoints.length > 2)
                        PolygonLayerOptions(
                          polygons: [
                            Polygon(
                              points: polygonPoints,
                              color: const Color.fromARGB(255, 255, 1, 1).withOpacity(0.5),
                              borderColor: Color.fromARGB(255, 255, 255, 255),
                              borderStrokeWidth: 2.0,
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
