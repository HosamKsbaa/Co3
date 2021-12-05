import 'package:co3/trackabke.dart';
import 'package:flutter/material.dart';

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
  double x = 0.0;

  double y = 0.0;

  void _updateLocation(PointerEvent details) {
    setState(() {
      x = details.position.dx;
      y = details.position.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MouseRegion(
        onHover: _updateLocation,
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  Trackable(
                    title: "first box ",
                    child: Element(),
                  ),
                  Trackable(
                    title: "2 box ",
                    child: Element(),
                  ),
                ],
              ),
            ),
            Text(
              'The cursor is here: (${x.toStringAsFixed(2)}, ${y.toStringAsFixed(2)})',
            )
          ],
        ),
      ),
    );
  }
}

class Element extends StatefulWidget {
  const Element({Key? key}) : super(key: key);

  @override
  State<Element> createState() => _ElementState();
}

class _ElementState extends State<Element> {
  int _enterCounter = 0;

  int _exitCounter = 0;

  double x = 0.0;

  double y = 0.0;

  void _incrementEnter(PointerEvent details) {
    setState(() {
      _enterCounter++;
    });
  }

  void _incrementExit(PointerEvent details) {
    setState(() {
      _exitCounter++;
    });
  }

  void _updateLocation(PointerEvent details) {
    setState(() {
      x = details.position.dx;
      y = details.position.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ConstrainedBox(
        constraints: BoxConstraints.tight(const Size(300.0, 200.0)),
        child: MouseRegion(
          onEnter: _incrementEnter,
          onHover: _updateLocation,
          onExit: _incrementExit,
          child: Container(
            color: Colors.lightBlueAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('You have entered or exited this box this many times:'),
                Text(
                  '$_enterCounter Entries\n$_exitCounter Exits',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
