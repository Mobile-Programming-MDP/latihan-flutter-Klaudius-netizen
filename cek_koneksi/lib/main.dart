import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Cek Koneksi",
        theme: ThemeData(primarySwatch: Colors.green),
        home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late bool isConnected;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    isConnected = true;
    _initConnectivityStatus().then((_) {
      _connectivitySubscription =
          _connectivity.onConnectivityChanged.listen((result) {
        setState(() {
          isConnected = !result.contains(ConnectivityResult.none);
        });
      });
    });
  }

  Future<void> _initConnectivityStatus() async {
    final result = await _connectivity.checkConnectivity();
    setState(() {
      isConnected = result != ConnectivityResult.none;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aplikasi Cek Koneksi"),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Image.asset(
        isConnected ? 'images/connected.png' : 'images/disconnected.png',
        key: ValueKey<bool>(isConnected),
        width: 200,
        height: 200,
      )),
    );
  }
}
