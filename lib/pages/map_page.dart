import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';


class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MaptourState();
}

class _MaptourState extends State<MapPage> {
  final MapController mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
                mapController: mapController,
                options: MapOptions(
                center: LatLng(11.3263187, 75.9719164), // 11.605°N 76.083°E
                  zoom: 13,
                  onMapReady: () => {},
                ),

      )
    );}}