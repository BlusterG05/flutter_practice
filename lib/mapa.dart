import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'components/custom_app_bar.dart';
import 'components/custom_drawer.dart';
import 'dart:html' as html;

class MapaScreen extends StatefulWidget {
  const MapaScreen({Key? key}) : super(key: key);

  @override
  _MapaScreenState createState() => _MapaScreenState();
}

class _MapaScreenState extends State<MapaScreen> {
  GoogleMapController? _controller;
  Set<Marker> _markers = {};
  bool _isLoading = false;

  // Define la ubicación específica
  static const LatLng _specificLocation = LatLng(-0.260291, -79.196177);

  static const CameraPosition _initialPosition = CameraPosition(
    target: _specificLocation,
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
    _addMarker();
  }

  void _addMarker() {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('specific_location'),
          position: _specificLocation,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Mapa'),
      drawer: CustomDrawer(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _initialPosition,
      onMapCreated: (GoogleMapController controller) {
        _controller = controller;
      },
      markers: _markers,
    );
  }
}