import 'package:flutter/material.dart';

import 'month_view.dart';

class DatePicker extends StatefulWidget {
  final ValueChanged onDateRangeSelected;

  const DatePicker({Key? key, required this.onDateRangeSelected})
      : super(key: key);
  @override
  _DatePickerPageState createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePicker> {
  late DateTime _selectedStartDate,
      _selectedEndDate,
      _currentMonth,
      _lastSelectedDate;

  _DatePickerPageState() {
    _currentMonth =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    _selectedStartDate = _currentMonth; //默认当天
    _selectedEndDate = _selectedStartDate; // 默认当天日期
    _lastSelectedDate = _selectedStartDate; //记录最后一次选中的日期
  }

  void _onDateSelected(DateTime selectedDate) {
    setState(() {
      // 如果没有选中的结束日期，或者选中的开始日期晚于当前选中的日期
      if (selectedDate.isBefore(_selectedStartDate)) {
        //比最左区间日期还小
        _selectedStartDate = selectedDate;
      } else if (selectedDate.isAfter(_selectedEndDate)) {
        //比有区间日期还大
        _selectedEndDate = selectedDate;
      } else {
        // 处在了区间内，将 selectedDate 与 _lastSelectedDate 比较，小的给到 _selectedStartDate，大的给到 _selectedEndDate
        if (selectedDate.isAfter(_lastSelectedDate)) {
          _selectedEndDate = selectedDate;
          _selectedStartDate = _lastSelectedDate;
        } else {
          _selectedStartDate = selectedDate;
          _selectedEndDate = _lastSelectedDate;
        }
      }
      widget.onDateRangeSelected([_selectedStartDate, _selectedEndDate]);
      _lastSelectedDate = selectedDate;
    });
  }

  void _changeMonth(bool next) {
    setState(() {
      if (next) {
        _currentMonth =
            DateTime(_currentMonth.year, _currentMonth.month + 1, 1);
      } else {
        _currentMonth =
            DateTime(_currentMonth.year, _currentMonth.month - 1, 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () => _changeMonth(false),
                ),
                Text(
                  '${_currentMonth.month}/${_currentMonth.year}',
                  style: const TextStyle(fontSize: 24.0),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () => _changeMonth(true),
                ),
              ],
            ),
          ),
          MonthView(
            month: _currentMonth,
            selectedStartDate: _selectedStartDate,
            selectedEndDate: _selectedEndDate,
            onDateSelected: _onDateSelected,
          ),
        ],
      ),
    );
  }
}
