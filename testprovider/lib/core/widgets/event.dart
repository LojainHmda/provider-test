import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:testprovider/core/models/event_model.dart';
import 'package:testprovider/core/utils/app_colors.dart';
import 'package:testprovider/core/utils/firebase.dart';

class EventWidget extends StatefulWidget {
  EventWidget(
      {super.key,
      required this.event,
      void Function(EventModel event)? fav,
      void Function(EventModel event)? delete,
      required this.update});
  final EventModel event;
  void Function(EventModel event)? fav;
  void Function(EventModel event)? delete;
  final VoidCallback update;
  @override
  State<EventWidget> createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  void deleteEvent(EventModel event) async {
    CollectionReference<EventModel> query = FirebaseUtils.getEventCollection();
    return query.doc(event.id).delete().then((value) {
      print("event Deleted");
      widget.update();
      setState(() {});
    }).catchError((error) => print("Failed to delete event: $error"));
  }

  void updateIsFav(EventModel event) async {
    CollectionReference<EventModel> query = FirebaseUtils.getEventCollection();
    return query.doc(event.id).update({"isFav": event.isFav}).then((value) {
      print("isFav Updated");
      setState(() {});
    }).catchError((error) => print("Failed to update isFav: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              image: AssetImage("lib/Assets/birthday.png"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    DateFormat('d').format(
                        DateFormat('dd/MM/yyyy').parse(widget.event.date)),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    DateFormat('MMM').format(
                        DateFormat('dd/MM/yyyy').parse(widget.event.date)),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                )
              ]),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Positioned.directional(
            bottom: 10,
            end: 10,
            start: 10,
            textDirection: TextDirection.ltr,
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Text(
                      widget.event.title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          deleteEvent(widget.event);
                          widget.update();
                        });
                      },
                      icon: Icon(
                        Icons.delete,
                        color: AppColors.greyColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          widget.event.isFav = !widget.event.isFav;
                          updateIsFav(widget.event);
                          widget.update();
                        });
                      },
                      icon: Icon(
                        widget.event.isFav
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: widget.event.isFav ? AppColors.redColor : null,
                      ),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
