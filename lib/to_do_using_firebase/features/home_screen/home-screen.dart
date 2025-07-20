import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xo_game/to_do_using_firebase/features/home_screen/manager/provider/home_provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: Selector<HomeProvider, int>(
          selector: (context, provider) => provider.selectedIndex,
          builder: (context, selectedIndex, child) {
            var provider = Provider.of<HomeProvider>(context, listen: false);
            return Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: FloatingActionButton(
                tooltip: 'Add TODO',
                heroTag: 'addTodo',
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.white, width: 3.4),
                  borderRadius: BorderRadius.circular(360),
                ),
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
              bottomNavigationBar: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: BottomAppBar(
                  shape: const CircularNotchedRectangle(),
                  notchMargin: 6,
                  color: Colors.white,
                  child: BottomNavigationBar(
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    currentIndex: selectedIndex,
                    onTap: provider.setIndex,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.menu, size: 20),
                        label: 'Menu',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.settings, size: 20),
                        label: 'Settings',
                      ),
                    ],
                  ),
                ),
              ),
              body: provider.screens[selectedIndex],
            );
          }),
    );
  }
}
