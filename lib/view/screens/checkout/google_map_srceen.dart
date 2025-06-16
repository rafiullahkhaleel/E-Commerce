import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  GoogleMapController? mapController;
  LatLng? currentPosition;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied.');
    }

    // ✅ More accurate location
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );

    setState(() {
      currentPosition = LatLng(position.latitude, position.longitude);
    });

    // ✅ Move the camera if map is already created
    if (mapController != null) {
      mapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: currentPosition!,
            zoom: 16,
          ),
        ),
      );
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

    // ✅ اگر currentPosition پہلے سے available ہے تو camera move کریں
    if (currentPosition != null) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: currentPosition!,
            zoom: 16,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Google Map")),
      body: currentPosition == null
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
        onMapCreated: _onMapCreated,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        initialCameraPosition: CameraPosition(
          target: currentPosition!,
          zoom: 16,
        ),
      ),
    );
  }
}







// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
//
// class GoogleMapScreen extends StatefulWidget {
//   const GoogleMapScreen({super.key});
//
//   @override
//   State<GoogleMapScreen> createState() => _GoogleMapScreenState();
// }
//
// class _GoogleMapScreenState extends State<GoogleMapScreen> {
//   late GoogleMapController mapController;
//   LatLng? currentPosition;
//
//   @override
//   void initState() {
//     super.initState();
//     getCurrentLocation();
//   }
//
//   Future<void> getCurrentLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//
//     // Check if location services are enabled
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Future.error('Location services are disabled.');
//     }
//
//     // Check permission
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied');
//       }
//     }
//
//     if (permission == LocationPermission.deniedForever) {
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }
//
//     // Get the current position
//     Position position = await Geolocator.getCurrentPosition();
//     setState(() {
//       currentPosition = LatLng(position.latitude, position.longitude);
//     });
//   }
//
//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Google Map")),
//       body: currentPosition == null
//           ? Center(child: CircularProgressIndicator())
//           : GoogleMap(
//         onMapCreated: _onMapCreated,
//         myLocationEnabled: true,
//         myLocationButtonEnabled: true,
//         initialCameraPosition: CameraPosition(
//           target: currentPosition!,
//           zoom: 15,
//         ),
//       ),
//     );
//   }
// }














// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class GoogleMapScreen extends StatefulWidget {
//   const GoogleMapScreen({super.key});
//
//   @override
//   State<GoogleMapScreen> createState() => _GoogleMapScreenState();
// }
//
// class _GoogleMapScreenState extends State<GoogleMapScreen> {
//   late GoogleMapController mapController;
//   final LatLng initialPosition = LatLng(34.10312, 71.47889);
//
//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: GoogleMap(
//         myLocationEnabled: true,
//         onMapCreated: _onMapCreated,
//         initialCameraPosition: CameraPosition(
//           target: initialPosition,
//           zoom: 11,
//
//         ),
//       ),
//     );
//   }
// }
