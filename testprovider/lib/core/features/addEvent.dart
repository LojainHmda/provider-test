import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:testprovider/core/models/event_model.dart';
import 'package:testprovider/core/utils/app_colors.dart';
import 'package:testprovider/core/utils/firebase.dart' show FirebaseUtils;
import 'package:testprovider/core/widgets/taps_bar.dart';

import '../providers/loclization_provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/custom_textfield.dart';

class AddEvent extends StatelessWidget {
  AddEvent({super.key});
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController(
    text: DateFormat('dd/MM/yyyy').format(DateTime.now()),
  );
  TextEditingController locationController = TextEditingController();

  TextEditingController timeController = TextEditingController(
    text: DateFormat('hh:mm a').format(DateTime.now()),
  );

  var formKey = GlobalKey<FormState>();
  int selectedCtegory = 0;
  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);

    return Scaffold(
        appBar: AppBar(
            backgroundColor: theme.theme == ThemeMode.dark
                ? AppColors.blackColor
                : AppColors.whiteColor,
            title: Center(
                child: Text(
              AppLocalizations.of(context)!.addEvent,
              style: TextStyle(
                  color: theme.theme == ThemeMode.dark
                      ? AppColors.whiteColor
                      : AppColors.primaryLight),
            )),
            leading: IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/");
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: theme.theme == ThemeMode.dark
                      ? AppColors.whiteColor
                      : AppColors.primaryLight,
                ))),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: const Image(
                    image: AssetImage("lib/Assets/birthday.png"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TabsBar(
                  onTabChanged: (p) {},
                  backgroundColor: AppColors.whiteColor,
                  labelColor: theme.theme == ThemeMode.dark
                      ? AppColors.primaryDark
                      : AppColors.primaryLight,
                  selectedbackgroundColor: theme.theme == ThemeMode.dark
                      ? AppColors.primaryDark
                      : AppColors.primaryLight,
                  selectedlabelColor: AppColors.whiteColor,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Text(AppLocalizations.of(context)!.event_title,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                            hintText: AppLocalizations.of(context)!.event_title,
                            controller: titleController,
                            prefixIcon: const Icon(Icons.edit_square)),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextField(
                            hintText:
                                AppLocalizations.of(context)!.event_description,
                            controller: descriptionController,
                            maxline: 4),
                        Row(children: [
                          Expanded(
                            child: TextField(
                              controller: dateController,
                              decoration: InputDecoration(
                                  suffixIcon: TextButton(
                                    onPressed: () {
                                      showDatePicker(
                                              context: context,
                                              firstDate: DateTime.now(),
                                              lastDate: DateTime(2026),
                                              initialDate: DateTime.now())
                                          .then((value) {
                                        if (value != null) {
                                          dateController.text =
                                              DateFormat('dd/MM/yyyy')
                                                  .format(value);
                                        }
                                      });
                                    },
                                    child: Text(
                                      AppLocalizations.of(context)!.choose_date,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: theme.theme == ThemeMode.dark
                                            ? AppColors.primaryDark
                                            : AppColors.primaryLight,
                                      ),
                                    ),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.date_range,
                                    color: AppColors.blackColor,
                                  ),
                                  hintText:
                                      AppLocalizations.of(context)!.event_date,
                                  hintStyle: const TextStyle(
                                      color: AppColors.greyColor),
                                  border: InputBorder.none),
                            ),
                          ),
                        ]),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: timeController,
                                decoration: InputDecoration(
                                    suffixIcon: TextButton(
                                      onPressed: () {
                                        showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now())
                                            .then((value) {
                                          if (value != null) {
                                            timeController.text =
                                                value.format(context);
                                          }
                                        });
                                      },
                                      child: Text(
                                        AppLocalizations.of(context)!
                                            .choose_time,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: theme.theme == ThemeMode.dark
                                              ? AppColors.primaryDark
                                              : AppColors.primaryLight,
                                        ),
                                      ),
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.watch_later_outlined,
                                      color: AppColors.blackColor,
                                    ),
                                    hintText: AppLocalizations.of(context)!
                                        .event_time,
                                    hintStyle: const TextStyle(
                                        color: AppColors.greyColor),
                                    border: InputBorder.none),
                              ),
                            ),
                          ],
                        ),
                        CustomTextField(
                          controller: locationController,
                          prefixIcon: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: theme.theme == ThemeMode.dark
                                  ? AppColors.primaryDark
                                  : AppColors.primaryLight,
                            ),
                            margin: const EdgeInsets.all(5),
                            child: const Icon(
                              Icons.my_location,
                              color: AppColors.whiteColor,
                              size: 15,
                            ),
                          ),
                          suffixIcon: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: theme.theme == ThemeMode.dark
                                ? AppColors.primaryDark
                                : AppColors.primaryLight,
                          ),
                          hintText: AppLocalizations.of(context)!
                              .choose_event_location,
                          hintStyle: TextStyle(
                            color: theme.theme == ThemeMode.dark
                                ? AppColors.primaryDark
                                : AppColors.primaryLight,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: SizedBox(
                            height: 55,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                backgroundColor: theme.theme == ThemeMode.dark
                                    ? AppColors.primaryDark
                                    : AppColors.primaryLight,
                              ),
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  await addEvent(context);
                                  Navigator.pushNamed(context, "/");
                                }
                              },
                              child: Text(
                                AppLocalizations.of(context)!.add_event,
                                style: TextStyle(color: AppColors.whiteColor),
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              )
            ],
          ),
        ));
  }

  Future<void> addEvent(BuildContext context) async {
    List<String> types = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.meetings,
      AppLocalizations.of(context)!.bday
    ];
    var event = EventModel(
        category: types[TabsBar.selectedindex],
        title: titleController.text,
        date: dateController.text,
        location: locationController.text,
        description: descriptionController.text,
        time: timeController.text);
    try {
      await FirebaseUtils.addEventCollection(event);
    } catch (e) {
      log("$e");
    }
  }
}
