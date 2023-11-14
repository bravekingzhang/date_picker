import 'package:flutter/material.dart';

class MonthView extends StatelessWidget {
  final DateTime month;
  final DateTime selectedStartDate;
  final DateTime selectedEndDate;
  final Function(DateTime) onDateSelected;

  const MonthView({
    Key? key,
    required this.month,
    required this.selectedStartDate,
    required this.selectedEndDate,
    required this.onDateSelected,
  }) : super(key: key);

  List<Widget> _buildDayTiles(BuildContext context) {
    final daysInMonth = DateUtils.getDaysInMonth(month.year, month.month);
    final firstDayOfMonth = DateTime(month.year, month.month, 1);
    final firstWeekdayOfMonth = firstDayOfMonth.weekday;

    List<Widget> dayTiles = [];
    for (int i = 0; i < firstWeekdayOfMonth - 1; i++) {
      dayTiles.add(Container()); // empty days to align the first day
    }

    for (int i = 1; i <= daysInMonth; i++) {
      final day = DateTime(month.year, month.month, i);
      final isSelected =
          (day.isAfter(selectedStartDate.subtract(const Duration(days: 1))) &&
                  day.isBefore(selectedEndDate.add(const Duration(days: 1)))) ||
              day == selectedStartDate ||
              day == selectedEndDate;

      BoxDecoration decoration;
      if (isSelected) {
        decoration = BoxDecoration(
          color: Theme.of(context).primaryColor,
          shape: BoxShape.circle,
        );
      } else {
        decoration = const BoxDecoration();
      }

      dayTiles.add(
        GestureDetector(
          onTap: () => onDateSelected(day),
          child: Container(
            decoration: decoration,
            child: Center(
              child: Text(
                '$i',
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return dayTiles;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 7,
      children: _buildDayTiles(context),
    );
  }
}
