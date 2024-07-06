import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Event {
  final DateTime date;
  final String title;
  final String description;

  Event({required this.date, required this.title, required this.description});
}

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  List<Event> _events = [
    Event(
      date: DateTime(2024, 7, 15),
      title: "Environment Day",
      description: "Meet up at Jawalakhel, Lalitpur at 7:00 AM",
    ),
    Event(
      date: DateTime(2024, 7, 24),
      title: "Blood Donation",
      description: "Help someone by giving your blood",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Events"),
        backgroundColor: Color.fromRGBO(97, 124, 181, 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              setState(() {
                _focusedDay = focusedDay;
              });
            },
            eventLoader: (day) {
              return _getEventsForDay(day);
            },
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, day, events) {
                if (events.isNotEmpty) {
                  return Positioned(
                    bottom: 4,
                    child: Container(
                      height: 6,
                      width: 6,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ListView(
              children: _getEventWidgets(),
            ),
          ),
        ],
      ),
    );
  }

  List<Event> _getEventsForDay(DateTime day) {
    return _events.where((event) => isSameDay(event.date, day)).toList();
  }

  List<Widget> _getEventWidgets() {
    return [
      if (_selectedDay != null &&
          isSameDay(_selectedDay!, DateTime(2024, 7, 15)))
        Card(
          color: Color.fromRGBO(97, 124, 181, 1),
          child: ListTile(
            title: Text("Environment Day"),
            subtitle: Text("Meet up at Jawalakhel, Lalitpur at 7:00 AM"),
          ),
        ),
      if (_selectedDay != null &&
          isSameDay(_selectedDay!, DateTime(2024, 7, 24)))
        Card(
          color: Color.fromRGBO(97, 124, 181, 1),
          child: ListTile(
            title: Text("Blood Donation"),
            subtitle: Text("Help someone by giving your blood"),
          ),
        ),
    ];
  }
}
