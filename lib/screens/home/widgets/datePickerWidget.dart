import 'package:flutter/material.dart';
import 'package:nintyminutesflutter/config/palette.dart';

class DatePickerWidget extends StatefulWidget {
  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime date;

  String getText() {
    if (date == null) {
      return 'Select Date';
    } else {
      // return DateFormat('MM/dd/yyyy').format(date);
      print('${date.month}/${date.day}/${date.year}');
      return '${date.month}/${date.day}/${date.year}';
    }
  }

  @override
  Widget build(BuildContext context) => IconButton(
        icon: Icon(Icons.today),
        onPressed: () => pickDate(context),
      );

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: date ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(primary: Palette.primary),
          ),
          child: child,
        );
      },
    );

    if (newDate == null) return;

    setState(() => date = newDate);
  }
}
