import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:testprovider/core/features/favorite_page.dart';
import 'package:testprovider/core/providers/loclization_provider.dart';
import 'package:testprovider/core/providers/theme_provider.dart';
import 'package:testprovider/core/utils/app_colors.dart';
import 'package:testprovider/core/widgets/types_tabs.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var language = Provider.of<LocalizationsProvider>(context);
    var theme = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 250,
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.welcome_back,
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "Lojain Hamda",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                  child: Icon(Icons.sunny)),
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
        ),
        body: Column(
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                  color: theme.theme == ThemeMode.dark
                      ? AppColors.primaryDark
                      : AppColors.primaryLight,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(50))),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 15),
                child: Column(children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: theme.theme == ThemeMode.dark
                            ? AppColors.greyColor
                            : AppColors.primaryDark,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Tulkarem, Palestine",
                        style: TextStyle(
                          color: theme.theme == ThemeMode.dark
                              ? AppColors.greyColor
                              : AppColors.primaryDark,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DefaultTabController(
                    length: 4,
                    child: TabBar(
                      tabAlignment: TabAlignment.start,
                      labelStyle: TextStyle(fontSize: 16),
                      isScrollable: true,
                      indicatorColor: Colors.transparent ,
                      dividerColor: Colors.transparent,
                      labelPadding: EdgeInsets.all(5),
                      tabs: <Widget>[
                        Tab(child: TypesTab("All"),),
                        Tab(child: TypesTab("Sport")),
                        Tab(child: TypesTab("Meetings")),
                        Tab(child: TypesTab("BirthDay")),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
