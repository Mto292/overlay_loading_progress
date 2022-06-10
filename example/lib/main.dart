import 'package:flutter/material.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: onTapStartBtn,
              child: const Text('Start Loading Progress'),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: onTapStartGifLoadingProgressBtn,
              child: const Text('Start Gif Loading Progress'),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: onTapStartCustomLoadingProgressBtn,
              child: const Text('Start Custom Loading Progress'),
            ),
          ],
        ),
      ),
    );
  }

  onTapStartBtn() async {
    OverlayLoadingProgress.start(context, barrierDismissible: false);
    await Future.delayed(const Duration(seconds: 5));
    OverlayLoadingProgress.stop(context);
  }

  onTapStartGifLoadingProgressBtn() async {
    OverlayLoadingProgress.start(
      context,
      gifOrImagePath: 'assets/loading.gif',
      barrierDismissible: true
    );
    await Future.delayed(const Duration(seconds: 3));
    OverlayLoadingProgress.stop(context);
  }

  onTapStartCustomLoadingProgressBtn() async {
    OverlayLoadingProgress.start(context,
        gifOrImagePath: 'assets/loading.gif',
        barrierDismissible: true,
        widget: Container(
          height: 100,
          width: 100,
          color: Colors.black38,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ));
    await Future.delayed(const Duration(seconds: 8));
    OverlayLoadingProgress.stop(context);
  }
}
