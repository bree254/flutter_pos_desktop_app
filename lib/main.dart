import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:desktop_window/desktop_window.dart';
import 'homepage.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && (Platform.isMacOS || Platform.isLinux || Platform.isWindows)) {
    await DesktopWindow.setMinWindowSize(const Size(600, 800));
  }  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MainPage(),
    );
  }
}
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String pageActive = 'Home';

  _pageView() {
    switch (pageActive) {
      case 'All Time':
        return const HomePage();
      case 'Food':
        return Container();
      case 'Alcohol':
        return Container();
      case 'Cold Drinks':
        return Container();
      case 'Hot Drinks':
        return Container();

      default:
        return const HomePage();
    }
  }

  _setPage(String page) {
    setState(() {
      pageActive = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xff1f2029),
      body: Row(
        children: [
          Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Simon BBQ Team'),
                        Text('Location Id')
                      ],
                    ),


                  ],
                ),
              ),
              Container(
                width: 70,
                padding: const EdgeInsets.only(top: 24, right: 12, left: 12),
                height: MediaQuery.of(context).size.height,
                child: _sideMenu(),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 24, right: 12),
                  padding: const EdgeInsets.only(top: 12, right: 12, left: 12),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12)),
                    color: Color(0xff17181f),
                  ),
                  child: _pageView(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget _sideMenu() {
    return Column(children: [
      Expanded(
        child: ListView(
          children: [
            _itemMenu(
              menu: 'Home',

            ),
            _itemMenu(
              menu: 'Food',

            ),
            _itemMenu(
              menu: 'Alcohol',

            ),
            _itemMenu(
              menu: 'Cold Drinks',

            ),
            _itemMenu(
              menu: 'Hot Drinks',

            ),
          ],
        ),
      ),
    ]);
  }

  Widget _itemMenu({required String menu}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: GestureDetector(
        onTap: () => _setPage(menu),
        child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: AnimatedContainer(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: pageActive == menu
                    ? Colors.deepOrangeAccent
                    : Colors.transparent,
              ),
              duration: const Duration(milliseconds: 300),
              curve: Curves.slowMiddle,
              child: Column(
                children: [
                  Text(
                    menu,
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}




