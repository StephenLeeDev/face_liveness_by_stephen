import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:face_liveness_sdk_stephen/face_liveness_sdk_stephen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _faceLivenessSdkStephenPlugin = FaceLivenessSdkStephen();
  String _platformVersion = 'Unknown';
  bool _firstApiKeyVerified = false;
  bool _secondApiKeyVerified = false;

  @override
  void initState() {
    super.initState();

    initPlatformState();
    validateApiKey();
  }

  Future<void> validateApiKey() async {
    bool first = await _faceLivenessSdkStephenPlugin.verifyApiKey("ThisIsApiKey");
    bool second = await _faceLivenessSdkStephenPlugin.verifyApiKey("");

    setState(() {
      _firstApiKeyVerified = first;
      _secondApiKeyVerified = second;
    });
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion =
          await _faceLivenessSdkStephenPlugin.getPlatformVersion() ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Running on: $_platformVersion\n'),
              Text('First API Key Verified: $_firstApiKeyVerified'),
              Text('Second API Key Verified: $_secondApiKeyVerified'),
            ],
          ),
        ),
      ),
    );
  }
}
