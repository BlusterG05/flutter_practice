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
  LatLng? _currentPosition;
  bool _permissionGranted = false;
  bool _isLoading = true;

  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(0, 0),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  Future<void> _checkLocationPermission() async {
    setState(() {
      _isLoading = true;
    });

    if (kIsWeb) {
      _permissionGranted = true;
      _getCurrentLocation();
      return;
    }

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _permissionGranted = false;
        _isLoading = false;
      });
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _permissionGranted = false;
          _isLoading = false;
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _permissionGranted = false;
        _isLoading = false;
      });
      return;
    }

    setState(() {
      _permissionGranted = true;
    });
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    try {
      if (kIsWeb) {
        await html.window.navigator.geolocation.getCurrentPosition(
          enableHighAccuracy: true,
        ).then((position) {
          setState(() {
            _currentPosition = LatLng(
              position.coords!.latitude as double,
              position.coords!.longitude as double,
            );
            _isLoading = false;
          });

          _moveCamera();
        });
      } else {
        Position position = await Geolocator.getCurrentPosition();
        setState(() {
          _currentPosition = LatLng(position.latitude, position.longitude);
          _isLoading = false;
        });

        _moveCamera();
      }
    } catch (e) {
      print("Error getting location: $e");
      setState(() {
        _isLoading = false;
        _permissionGranted = false;
      });
    }
  }

  void _moveCamera() {
    if (_currentPosition != null && _controller != null) {
      _controller!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: _currentPosition!,
            zoom: 14.4746,
          ),
        ),
      );
    }
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

    if (!_permissionGranted) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Por favor, activa los permisos de ubicación',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Verificar permisos'),
              onPressed: _checkLocationPermission,
            ),
          ],
        ),
      );
    }

    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _initialPosition,
      onMapCreated: (GoogleMapController controller) {
        _controller = controller;
        _moveCamera();
      },
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
    );
  }
}