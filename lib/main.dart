import 'package:flutter/material.dart';
import 'package:scroll_bottom_navibar/bottomNaviBar/bottomNaviBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _controller = PageController();
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
      ),
      home: Scaffold(
        key: _globalKey,
        appBar: AppBar(
          title: Text("Scrolling Bottom Navi Bar"),
          centerTitle: true,
          actions: [Container()],
        ),
        endDrawer: Drawer(
          elevation: 5,
          child: Center(
            child: Text("Miktat Centooooooooo"),
          ),
        ),
        backgroundColor: Colors.blueGrey.shade100,
        body: PageView(
          controller: _controller,
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            ColoredBox(
              color: Colors.blueGrey.shade100,
              child: Center(
                child: RaisedButton(
                  child: Text("End Drawer AÇ"),
                  onPressed: () {
                    _globalKey.currentState.openEndDrawer();
                  },
                ),
              ),
            ),
            ColoredBox(
              color: Colors.blueGrey.shade100,
              child: Center(
                child: Text("Bildirimler"),
              ),
            ),
            ColoredBox(
              color: Colors.blueGrey.shade100,
              child: Center(
                child: Text("Mesajlar"),
              ),
            ),
          ],
        ),
        extendBody: true,
        bottomNavigationBar: FloatingBottomBar(
          controller: _controller,
          items: [
            FloatingBottomBarItem(Icons.home, label: 'Anasafya'),
            FloatingBottomBarItem(Icons.notifications, label: 'Bildirimler'),
            FloatingBottomBarItem(Icons.message, label: 'Mesajlar'),
          ],
          activeItemColor: Colors.green.shade700,
          enableIconRotation: true,
          onTap: (index) {
            _controller.animateToPage(
              index,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOut,
            );
          },
        ),
      ),
    );
  }
}
