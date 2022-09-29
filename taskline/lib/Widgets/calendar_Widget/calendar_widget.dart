// import 'package:calendarwidget/event_data_source.dart';
import 'package:flutter/material.dart';
import 'package:taskline/Widgets/calendar_Widget/event_provider.dart';
import '../../../../Widgets/calendar_Widget/tasks_widget.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:provider/provider.dart';
import 'event_data_source.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final events =Prov;

    return ChangeNotifierProvider(
      create: (_) => new EventProvider(),
      child: Consumer<EventProvider>(
        builder: (context, prov, _) {
          return SfCalendar(
            view: CalendarView.month,
            dataSource: EventDataSource(prov.events),
            initialSelectedDate: DateTime.now(),
            cellBorderColor: Colors.transparent,
            onLongPress: (details) {
              final provider =
                  Provider.of<EventProvider>(context, listen: false);
              provider.setDate(details.date!);

              showBottomSheet(
                context: context,
                builder: (context) => TaskWidget(),
              );
            },
          );
        },
      ),
    );
  }
}
