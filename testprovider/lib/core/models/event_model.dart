class EventModel {
  static const String collectionName = 'Events';
  String id;
  String title;
  String date;
  String location;
  String description;
  String time;
  String category;

  bool isFav;

  EventModel({
    this.id = '',
    required this.title,
    required this.category,
    required this.date,
    required this.location,
    required this.description,
    required this.time,
    this.isFav = false,
  });

  Map<String, dynamic> tofireStore() {
    return {
      'id': id,
      'title': title,
      'date': date,
      'location': location,
      'description': description,
      'time': time,
      'category': category,
      'isFav': isFav,
    };
  }

  EventModel.fromfireStore(Map<String, dynamic> data)
      : this(
          id: data['id'],
          title: data['title'],
          date: data['date'],
          location: data['location'],
          description: data['description'],
          time: data['time'],
          category: data['category'],
          isFav: data['isFav'],
        );
}
