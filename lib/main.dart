import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitDown,
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.landscapeLeft,
  //   DeviceOrientation.landscapeRight
  // ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final myAppBar = AppBar(title: Text("Media Query"));

    final bodyHeight = mediaQueryHeight -
        myAppBar.preferredSize.height -
        MediaQuery.of(context)
            .padding
            .top; // MediaQuery.of(context).padding.top untuk mengambil UI bagian baterai, wifi, dll

    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
        appBar: myAppBar,
        body: Center(
          child: (isLandscape)
              ? Column(
                  children: [
                    Container(
                      height: bodyHeight * 0.5, // 50%
                      width: mediaQueryWidth,
                      color: Colors.amber,
                    ),
                    Container(
                      height: bodyHeight * 0.5, // 50%
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        //list view harus dibungkus dengan SizeBox atau Container, karena harus menggunakan height
                        itemCount: 100,
                        itemBuilder: (context, index) {
                          return GridTile(
                            child: Container(
                              color: Color.fromARGB(
                                255,
                                Random().nextInt(256),
                                Random().nextInt(256),
                                Random().nextInt(256),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                )
              : Column(
                  children: [
                    Container(
                      height: bodyHeight * 0.3, // 30%
                      width: mediaQueryWidth,
                      color: Colors.amber,
                    ),
                    Container(
                      height: bodyHeight * 0.7, // 70%
                      child: ListView.builder(
                        //list view harus dibungkus dengan SizeBox atau Container, karena harus menggunakan height
                        itemCount: 100,
                        itemBuilder: (context, index) {
                          return const ListTile(
                            leading: CircleAvatar(),
                            title: Text("Halo Semua"),
                          );
                        },
                      ),
                    )
                  ],
                ),
        ));
  }
}
