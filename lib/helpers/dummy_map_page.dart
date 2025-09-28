import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class DummyMapPage extends StatefulWidget {
  const DummyMapPage({super.key});

  @override
  State<DummyMapPage> createState() => _DummyMapPageState();
}

class _DummyMapPageState extends State<DummyMapPage> {
  final mapController = MapController();

  final LatLng pickup = const LatLng(13.0827, 80.2707);
  final LatLng delivery = const LatLng(13.0878, 80.2785);
  late final List<LatLng> routePoints = [
    const LatLng(13.0830, 80.2709),
    const LatLng(13.0832, 80.2712),
    const LatLng(13.0840, 80.2712),
    const LatLng(13.0840, 80.2735),
    const LatLng(13.0855, 80.2735),
    const LatLng(13.0855, 80.2760),
    const LatLng(13.0875, 80.2782),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var bounds = LatLngBounds.fromPoints(routePoints);
      mapController.fitCamera(CameraFit.bounds(
        bounds: bounds,
        padding: const EdgeInsets.all(40),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          mapController: mapController,
          options: MapOptions(
            initialCenter: pickup,
            initialZoom: 13,
          ),
          children: [
            TileLayer(
              urlTemplate:
              'https://cartodb-basemaps-a.global.ssl.fastly.net/light_all/{z}/{x}/{y}{r}.png',
              subdomains: const ['a', 'b', 'c', 'd'],
              userAgentPackageName: 'com.example.app',
            ),
            PolylineLayer(
              polylines: [
                Polyline(
                  points: routePoints,
                  strokeWidth: 4,
                  color: const Color.fromRGBO(198, 124, 78, 1),
                ),
              ],
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: pickup,
                  width: 40,
                  height: 50,
                  alignment: Alignment.topCenter,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Color.fromRGBO(198, 124, 78, 1),
                        size: 40,
                      ),
                      Positioned(
                        bottom: 2,
                        child: Container(
                          width: 10,
                          height: 4,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(198, 124, 78, 1)
                                .withOpacity(0.4),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Marker(
                  point: delivery,
                  width: 44,
                  height: 44,
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.delivery_dining,
                      color: Color.fromRGBO(198, 124, 78, 1),
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Positioned(
          top: 70,
          left: 16,
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFFEDEDED),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: (){
                Navigator.pushNamedAndRemoveUntil(context, '/home',(route) => false,);
              },
            ),
          ),
        ),
        Positioned(
          top: 70,
          right: 16,
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFFEDEDED),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(Icons.gps_fixed, color: Colors.black),
              onPressed: () {
                mapController.fitCamera(CameraFit.bounds(
                  bounds: LatLngBounds.fromPoints(routePoints),
                  padding: const EdgeInsets.all(40),
                ));
              },
            ),
          ),
        ),
      ],
    );
  }
}
