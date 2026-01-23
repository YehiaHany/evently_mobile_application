class EventModel {
  final String title;
  final String category;
  final String date;

  EventModel({required this.title, required this.category, required this.date});

  static List<EventModel> events = [
    EventModel(
      title: 'Annual Football Tournament',
      category: 'sport',
      date: '21 Jan',
    ),
    EventModel(
      title: 'Modern Art Showcase',
      category: 'exhibition',
      date: '25 Jan',
    ),
    EventModel(
      title: 'Discussion: The Alchemist',
      category: 'book_club',
      date: '28 Jan',
    ),
    EventModel(
      title: 'Sarah\'s 25th Birthday',
      category: 'birthday',
      date: '02 Feb',
    ),
    // EventModel(
    //   title: 'Project Kick-off Meeting',
    //   category: 'meeting',
    //   date: '05 Feb',
    // ),
    EventModel(title: 'Basketball Finals', category: 'sport', date: '10 Feb'),
    EventModel(title: 'Tech Expo 2024', category: 'exhibition', date: '15 Feb'),
  ];
}
