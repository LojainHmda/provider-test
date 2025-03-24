import 'package:cloud_firestore/cloud_firestore.dart'
    show FirebaseFirestore, QuerySnapshot;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:testprovider/core/models/event_model.dart';

import '../utils/firebase.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/event.dart';

class FavPage extends StatefulWidget {
  FavPage({super.key});

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  TextEditingController searchController = TextEditingController();

  List eventsList = [];

  @override
  void initState() {
    super.initState();
    getFavEvents();
  }

  void getFavEvents() async {
    QuerySnapshot<EventModel> query = await FirebaseUtils.getEventCollection()
        .where("isFav", isEqualTo: true)
        .get();
    eventsList = query.docs.map((doc) {
      return doc.data();
    }).toList();
    setState(() {});
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          CustomTextField(
            prefixIcon: const Icon(Icons.search),
            controller: searchController,
            hintText: AppLocalizations.of(context)!.search_for_event,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: eventsList.length,
              itemBuilder: (context, index) {
                return EventWidget(event: eventsList[index]);
              },
            ),
          ),
        ]),
      ),
    );
  }
}
