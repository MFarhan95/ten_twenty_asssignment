import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ten_twenty_asssignment/resource/resource.dart';
import 'package:ten_twenty_asssignment/screens/screens.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({Key? key}) : super(key: key);
  static const String routeName = '/entryPoint';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const EntryPoint(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  final List _pages = const [
    DashBoard(),
    WatchPage(),
    MediaPage(),
    MorePage(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: _pages.elementAt(_currentIndex),
          ),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(27),
          topRight: Radius.circular(27),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            if (index != _currentIndex) {
              setState(() {
                _currentIndex = index;
              });
            }
          },
          backgroundColor: Theme.of(context).bottomAppBarColor,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          selectedItemColor: Theme.of(context).scaffoldBackgroundColor,
          unselectedItemColor: Theme.of(context).primaryColorLight,
          selectedLabelStyle: const TextStyle(color: Colors.white),
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(                  ImagesAssets.media,

                    color: Theme.of(context).primaryColorLight),
              ),
              label: "Dashboard",
              activeIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  ImagesAssets.dash,

                  color: const Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(                  ImagesAssets.media,

                    color: Theme.of(context).primaryColorLight),
              ),
              label: "Watch",
              activeIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  ImagesAssets.media,

                  color: const Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(                  ImagesAssets.watch,

                    color: Theme.of(context).primaryColorLight),
              ),
              label: "Media Library",
              activeIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  ImagesAssets.watch,

                  color: const Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(                  ImagesAssets.more,
                    color: Theme.of(context).primaryColorLight),
              ),
              label: "More",
              activeIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  ImagesAssets.more,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
