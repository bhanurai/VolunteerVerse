import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:volunteer_verse/features/global/discover_opportunities/event1.dart';
import 'package:volunteer_verse/features/global/discover_opportunities/event_page.dart';

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
      date: DateTime(2024, 7, 18),
      title: "Bagmati River Cleanup",
      description: "Meet up at Kumari Club, Kathmandu at 7:00 AM",
    ),
    Event(
      date: DateTime(2024, 7, 24),
      title: "Tudhikhel Cleanup",
      description: "Meet up at tudhikhel ground, Kathmandu at 6:00 AM",
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
    List<Event> eventsForSelectedDay =
        _selectedDay == null ? [] : _getEventsForDay(_selectedDay!);

    return eventsForSelectedDay.map((event) {
      return Card(
        color: Color.fromRGBO(97, 124, 181, 1),
        child: ListTile(
          title: Text(event.title),
          subtitle: Text(event.description),
          onTap: () {
            if (event.date == DateTime(2024, 7, 18)) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BagmatiCleanupApp(),
                ),
              );
            } else if (event.date == DateTime(2024, 7, 24)) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TudhikhelCleanupApp(),
                ),
              );
            }
          },
        ),
      );
    }).toList();
  }
}
