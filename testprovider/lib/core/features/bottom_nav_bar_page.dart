import 'package:flutter/material.dart';
import 'package:testprovider/core/features/favorite_page.dart';
import 'package:testprovider/core/features/home_page.dart';
import 'package:testprovider/core/features/map_page.dart';
import 'package:testprovider/core/features/profile_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:testprovider/core/utils/app_colors.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  int index = 0;

  List<Widget> pages = [
    HomePage(),
    MapPage(),
    FavPage(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.greyColor,
        child: Icon(Icons.add),
        shape: StadiumBorder(side: BorderSide(width: 5,color: AppColors.whiteColor))
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: AppLocalizations.of(context)!.home,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: AppLocalizations.of(context)!.map,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: AppLocalizations.of(context)!.fav,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: AppLocalizations.of(context)!.profile,
            ),
          ]),
      body: pages[index],
    );
  }
}
