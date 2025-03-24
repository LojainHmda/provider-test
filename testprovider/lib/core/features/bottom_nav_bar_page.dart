import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testprovider/core/features/favorite_page.dart';
import 'package:testprovider/core/features/home_page.dart';
import 'package:testprovider/core/features/map_page.dart';
import 'package:testprovider/core/features/profile_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:testprovider/core/utils/app_colors.dart';

import '../providers/loclization_provider.dart';
import '../providers/theme_provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  int index = 0;

  List<Widget> pages = [
    HomePage(
      key: HomePage.homeKey,
    ),
    MapPage(),
    FavPage(),
    ProfileScreen(),
  ];
  AppBar? selectAppBar(int index) {
    List<Widget> titles = [
      Text(AppLocalizations.of(context)!.home),
      Text(AppLocalizations.of(context)!.map),
      Text(AppLocalizations.of(context)!.fav),
      Text(""),
    ];
    var language = Provider.of<LocalizationsProvider>(context);
    var theme = Provider.of<ThemeProvider>(context);
    if (index == 0) {
      return AppBar(
        leadingWidth: 250,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              AppLocalizations.of(context)!.welcome_back,
              style: TextStyle(fontSize: 12, color: AppColors.whiteColor),
            ),
            Text(
              "Lojain Hamda",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor),
            )
          ]),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  theme.theme == ThemeMode.dark
                      ? theme.changeTheme(ThemeMode.light)
                      : theme.changeTheme(ThemeMode.dark);
                },
                child: Icon(
                  Icons.sunny,
                  color: AppColors.whiteColor,
                )),
          ),
          GestureDetector(
            onTap: () {
              if (language.language == "ar") {
                language.changeLanguage("en");
              } else {
                language.changeLanguage("ar");
              }
            },
            child: CircleAvatar(
              child: Text(
                AppLocalizations.of(context)!.le,
                style: TextStyle(fontSize: 15),
              ),
            ),
          )
        ],
      );
    } else if (index == 1) {
      return AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: titles[index]),
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: selectAppBar(index),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "/addEvent");
          },
          backgroundColor: theme.theme == ThemeMode.dark
              ? AppColors.primaryDark
              : AppColors.primaryLight,
          shape: StadiumBorder(
              side: BorderSide(width: 5, color: AppColors.whiteColor)),
          child: Icon(Icons.add, color: AppColors.whiteColor)),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          selectedItemColor: theme.theme == ThemeMode.dark
              ? AppColors.whiteColor
              : AppColors.blackColor,
          unselectedItemColor: theme.theme == ThemeMode.dark
              ? AppColors.greyColor
              : AppColors.whiteColor,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: AppLocalizations.of(context)!.home),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.map,
              ),
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
