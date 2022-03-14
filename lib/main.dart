import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pikerando',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'Pikerando'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget greetingsSection = Container(
        margin: const EdgeInsets.all(25),
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            color: Colors.indigo[50]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Hallo Patrick,\nLust auf Pizza?',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            Row(
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                          'Ergänze einfach eine Bestellung oder starte eine neue!',
                          style: TextStyle(fontSize: 20, height: 1.3)),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, top: 10),
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: SvgPicture.asset(
                      "images/pikerando.svg", //asset location
                      semanticsLabel: 'Pikerando Icon.', fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            )
          ],
        ));

    final orders = [
      'Sammelbestellung 5',
      'Sammelbestellung 4',
    ];

    final oldOrders = [
      'Sammelbestellung 3',
      'Sammelbestellung 2',
      'Sammelbestellung 1',
    ];

    Widget ordersSection = Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Offene Bestellungen',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ListView.builder(
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.only(top: 5),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    color: Colors.indigo,
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5.0),
                      title: Text(orders[index],
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white)),
                      subtitle: const Text('Bestellung von Patrick',
                          style:
                              TextStyle(fontSize: 15, color: Colors.white70)),
                      trailing: const Icon(Icons.keyboard_arrow_right,
                          color: Colors.white, size: 30.0),
                      onTap: () {},
                    ));
              }),
          const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text('Vergangene Bestellungen',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          ListView.builder(
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.only(top: 5),
              itemCount: oldOrders.length,
              itemBuilder: (context, index) {
                return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    color: Colors.indigo[50],
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5.0),
                      title: Text(oldOrders[index],
                          style: const TextStyle(fontSize: 20)),
                      subtitle: const Text('Bestellung von Patrick',
                          style: TextStyle(fontSize: 15, color: Colors.black)),
                      trailing:
                          const Icon(Icons.keyboard_arrow_right, size: 30.0),
                      onTap: () {},
                    ));
              })
        ]));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: false,
        children: [greetingsSection, ordersSection],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
