import 'package:flutter/material.dart';
import 'package:pia_disp_moviles/ui/utils/event.dart';
import 'package:pia_disp_moviles/ui/widgets/widget_menu.dart';
import 'package:pia_disp_moviles/ui/widgets/widgets_global.dart';
import 'package:pia_disp_moviles/ui/widgets/widgets_principal_ui.dart';
import 'package:table_calendar/table_calendar.dart';

class PrincipalUI extends StatefulWidget {
  const PrincipalUI({super.key});

  @override
  State<PrincipalUI> createState() => _PrincipalUIState();
}

class _PrincipalUIState extends State<PrincipalUI> {

  late CalendarFormat _calendarFormat = CalendarFormat.week;
  late DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<Event>> events = {};
  final TextEditingController _eventController = TextEditingController();
  late final ValueNotifier<List<Event>> _selectedEvents;



  @override
  void initState(){
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));

  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay){
    if(!isSameDay(_selectedDay, selectedDay)){
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _selectedEvents.value = _getEventsForDay(selectedDay);
      });
    }
  }

  List<Event> _getEventsForDay(DateTime day){
    return events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BodyTracking"),),
      drawer: const MenuLateral(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
              context: context,
              builder: (context){
                return AlertDialog(
                  scrollable: true,
                  title: const Text("Event Name"),
                  content: Padding(
                    padding: const EdgeInsets.all(8),
                    child: MyTextArea(inputController: _eventController, label: "Rutina")
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: (){
                          events.addAll({
                            _selectedDay!: [Event(_eventController.text)]
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
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: MyContainer(
            child: Column(
              children: [
                TableCalendar(
                  firstDay: DateTime.utc(2010, 3, 14),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: _focusedDay,
                  calendarFormat: _calendarFormat,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  onDaySelected: _onDaySelected,
                  calendarStyle: const CalendarStyle(outsideDaysVisible: false),
                  eventLoader: _getEventsForDay,
                  onFormatChanged: (format) {
                    if (_calendarFormat != format) {
                      // Call `setState()` when updating calendar format
                      setState(() {
                        _calendarFormat = format;
                      });
                    }
                  },
                  onPageChanged: (focusedDay) {
                    // No need to call `setState()` here
                    _focusedDay = focusedDay;
                  },
                ),
                Expanded(
                    child: ValueListenableBuilder<List<Event>>(
                        valueListenable: _selectedEvents,
                        builder: (context, value, _){
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: value.length,
                              itemBuilder: (context, index){
                                return Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                  decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(12),),
                                  child: ListTile(
                                    onTap: (){},
                                    title: Text('${value[index]}'),
                                  ),
                                );
                              });
                        }
                    )
                )
              ],
            ),
        ),
      ),
    );
  }
}
