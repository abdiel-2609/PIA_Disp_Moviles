
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../utils/event.dart';

DateTime? _selectedDay;
Map<DateTime, List<Event>> events = {};
late final ValueNotifier<List<Event>> _selectedEvents;


List<Event> _getEventsForDay(DateTime day){
  return events[day] ?? [];
}

class MyTextArea extends StatelessWidget {
  const MyTextArea(
      {super.key, required this.inputController, required this.label});

  final TextEditingController inputController;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: TextFormField(
          controller: inputController,
          maxLines: null,
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelStyle: const TextStyle(color: Colors.black38),
              labelText: label),
        ),
      ),
    );
  }
}



class MyFloatingButton extends StatelessWidget {
  const MyFloatingButton({super.key, required this.inputController});

  final TextEditingController inputController;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed:(){
        showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                scrollable: true,
                title: const Text("Event Name"),
                content: Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: inputController,
                  ),
                ),
                actions: [
                  ElevatedButton(
                      onPressed: (){
                        events.addAll({
                          _selectedDay!: [Event(inputController.text)]
                        });
                        Navigator.of(context).pop();
                        _selectedEvents.value = _getEventsForDay(_selectedDay!);
                      },
                      child: const Text("Guardar")
                  )
                ],
              );
            }
        );
      },
      child:const Icon(Icons.add),
    );
  }
}


class MyCalendar extends StatefulWidget {
  const MyCalendar({super.key});

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {

  late CalendarFormat _calendarFormat = CalendarFormat.week;
  late DateTime _focusedDay = DateTime.now();
  final DateTime kFirstDay = DateTime.utc(2010, 10, 16);
  final DateTime kLastDay = DateTime.utc(2030, 3, 14);

  @override
  void initState(){
    super.initState();
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: _focusedDay,
      firstDay: kFirstDay,
      lastDay: kLastDay,
      calendarFormat: _calendarFormat,
      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
      onDaySelected: (selectedDay, focusedDay){
        if(!isSameDay(_selectedDay, selectedDay)){
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        }
      },
      eventLoader: _getEventsForDay,
      onFormatChanged: (format){
        if(_calendarFormat != format){
          setState(() {
            _calendarFormat = format;
          });
        }
      },
      onPageChanged: (focusedDay){
        _focusedDay = focusedDay;
      },
    );
  }
}

class MyExpanded extends StatelessWidget {
  const MyExpanded({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ValueListenableBuilder<List<Event>>(
            valueListenable: _selectedEvents,
            builder: (context, value, _){
              return ListView.builder(itemBuilder: (context, index){
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    onTap: () => /*print("")*/{},
                    title: Text('${value[index]}'),
                  ),
                );
              });
            }
        )
    );
  }
}


/*
class MyCalendar2 extends StatefulWidget {
  const MyCalendar2({super.key});

  @override
  State<MyCalendar2> createState() => _MyCalendar2State();
}

class _MyCalendar2State extends State<MyCalendar2> {

  late CalendarFormat _calendarFormat = CalendarFormat.week;
  late DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  final DateTime kFirstDay = DateTime.utc(2010, 3, 14);
  final DateTime kLastDay = DateTime.utc(2030, 3, 14);


  void _onDaySelected(DateTime selectedDay, DateTime focusedDay){
    if(!isSameDay(_selectedDay, selectedDay)){
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: _focusedDay,
      firstDay: kFirstDay,
      lastDay: kLastDay,
      calendarFormat: _calendarFormat,
      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
      onDaySelected: _onDaySelected,
      onFormatChanged: (format){
        if(_calendarFormat != format){
          setState(() {
            _calendarFormat = format;
          });
        }
      },
      onPageChanged: (focusedDay){
        _focusedDay = focusedDay;
      },
    );
  }
}
*/
