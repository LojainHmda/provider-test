import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testprovider/core/models/event_model.dart';
import 'package:testprovider/core/providers/theme_provider.dart';
import 'package:testprovider/core/utils/app_colors.dart';
import 'package:testprovider/core/utils/firebase.dart';
import 'package:testprovider/core/widgets/event.dart';
import 'package:testprovider/core/widgets/taps_bar.dart';
import 'package:testprovider/l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List eventsList = [];
  @override
  void initState() {
    super.initState();
    getAllEvents();
  }

  void getFilteredEvents(String filterdCategory) async {
    Query<EventModel> query = FirebaseUtils.getEventCollection();
    if (filterdCategory != "All") {
      query = query.where('category', isEqualTo: filterdCategory);
      var events = await query.get();

      setState(() {
        eventsList = events.docs.map((doc) {
          return doc.data();
        }).toList();
      });
    } else {
      getAllEvents();
    }
  }

  void getAllEvents() async {
    QuerySnapshot<EventModel> query = await FirebaseUtils.getEventCollection()
        .orderBy("date", descending: true)
        .get();
    print(query.toString());

    setState(() {
      eventsList = query.docs.map((doc) {
        return doc.data();
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> types = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.meetings,
      AppLocalizations.of(context)!.bday
    ];
    var theme = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                  color: theme.theme == ThemeMode.dark
                      ? AppColors.primaryDark
                      : AppColors.primaryLight,
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(50))),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 15),
                child: Column(children: [
                  Row(
                    children: [
                      const Icon(Icons.location_pin,
                          color: AppColors.whiteColor),
                      const SizedBox(width: 10),
                      Text(
                        AppLocalizations.of(context)!.location,
                        style: const TextStyle(color: AppColors.whiteColor),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TabsBar(
                    onTabChanged: (p0) {
                      setState(() {
                        TabsBar.selectedindex = p0;
                        getFilteredEvents(types[p0]);
                      });
                    },
                    backgroundColor: theme.theme == ThemeMode.dark
                        ? AppColors.primaryDark
                        : AppColors.primaryLight,
                    labelColor: AppColors.whiteColor,
                    selectedbackgroundColor: AppColors.whiteColor,
                    selectedlabelColor: theme.theme == ThemeMode.dark
                        ? AppColors.primaryDark
                        : AppColors.primaryLight,
                  ),
                ]),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: eventsList.length,
                itemBuilder: (context, index) {
                  return EventWidget(
                      event: eventsList[index], update: getAllEvents);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
