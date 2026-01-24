class EventModel {
  final String title;
  final String category;
  final String date;
  final String time;
  final String description;

  EventModel({
    required this.title,
    required this.category,
    required this.date,
    required this.time,
    required this.description,
  });

  static List<EventModel> events = [
    EventModel(
      title: 'Annual Football Tournament',
      category: 'sport',
      date: '21 Jan',
      time: '',
      description: '',
    ),
    EventModel(
      title: 'Modern Art Showcase',
      category: 'exhibition',
      date: '25 Jan',
      time: '',
      description: '',
    ),
    EventModel(
      title: 'Discussion: The Alchemist',
      category: 'book_club',
      date: '28 Jan',
      time: '',
      description: '',
    ),
    EventModel(
      title: 'Sarah\'s 25th Birthday',
      category: 'birthday',
      date: '02 Feb',
      time: '',
      description: '',
    ),
    // EventModel(
    //   title: 'Project Kick-off Meeting',
    //   category: 'meeting',
    //   date: '05 Feb',
    // ),
    EventModel(
      title: 'Basketball Finals',
      category: 'sport',
      date: '10 Feb',
      time: '',
      description: '',
    ),
    EventModel(
      title: 'Tech Expo 2024',
      category: 'exhibition',
      date: '15 Feb',
      time: '',
      description: '',
    ),
  ];
}
