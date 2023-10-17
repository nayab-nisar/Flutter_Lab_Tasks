import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Position? _currentposition; //cordinates honge x and y
  String?
      _currentAddress; //string man name wagera aega means address string man

  Future<bool> _handlepermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("enable location service")));
      return false;
    }
    permission = await Geolocator.checkPermission(); //permission di hui ya nhi
    if (permission == LocationPermission.denied) {
      //nhi di hui to request krr rha hai user
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("location permisssion denied")));
        return false;
      }
      if (permission == LocationPermission.deniedForever) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content:
                Text("location permission denied! go to your app setting")));
        return false;
      }
    }
    return true;
  }

  Future<void> _getcurrentlocation() async {
    final bool haspermission = await _handlepermission();
    if (!haspermission) {
      return;
    }
    try {
      final Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _currentposition = position;
      });
      getAddressFromCoordinates(_currentposition!);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getAddressFromCoordinates(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    final place = placemark[0];
    setState(() {
      _currentAddress =
          "${place.name}, ${place.street} ,${place.locality},${place.country}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('LAT: ${_currentposition?.latitude ?? ""}'),
            Text(
              'LNG: ${_currentposition?.longitude ?? ""}',
            ),
            Text(
              'ADDRESS:${_currentAddress ?? ""}',
            ),
            ElevatedButton(onPressed: _getcurrentlocation, child: Text("save"))
          ],
        ),
      ),
    );
  }
}

