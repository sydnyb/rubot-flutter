import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const RuBotApp());
}

class RuBotApp extends StatelessWidget {
  const RuBotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RuBot',
      debugShowCheckedModeBanner: false,
      home: const HologramScreen(),
    );
  }
}

class HologramScreen extends StatefulWidget {
  const HologramScreen({super.key});

  @override
  State<HologramScreen> createState() => _HologramScreenState();
}

class _HologramScreenState extends State<HologramScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadFlutterAsset('assets/rubot.html');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: WebViewWidget(controller: _controller),
      ),
    );
  }
}
