import 'package:flutter/material.dart';

class WeekCalendar extends StatefulWidget {
  final DateTime selectedDay;
  final Function(DateTime) onDaySelected;

  const WeekCalendar({
    super.key,
    required this.selectedDay,
    required this.onDaySelected,
  });

  @override
  State<WeekCalendar> createState() => _WeekCalendarState();
}

class _WeekCalendarState extends State<WeekCalendar> {
  late DateTime startOfWeek;

  @override
  void initState() {
    super.initState();
    startOfWeek = _getStartOfWeek(widget.selectedDay);
  }

  @override
  void didUpdateWidget(covariant WeekCalendar oldWidget) {
    super.didUpdateWidget(oldWidget);
    startOfWeek = _getStartOfWeek(widget.selectedDay);
  }

  DateTime _getStartOfWeek(DateTime date) {
    return date.subtract(Duration(days: date.weekday - 1));
  }

  void _changeWeek(int offset) {
    setState(() {
      startOfWeek = startOfWeek.add(Duration(days: offset * 7));
    });
  }

  String _weekDayLabel(int index) {
    const days = ["Seg", "Ter", "Qua", "Qui", "Sex", "Sáb", "Dom"];
    return days[index];
  }

  // Retorna o nome do mês capitalizado com base na semana visível
  String _getMonthName(DateTime date) {
    const months = [
      "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho",
      "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"
    ];
    return months[date.month - 1];
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return _isSameDay(date, now);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Column(
        children: [
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left, color: Colors.black87),
                onPressed: () => _changeWeek(-1),
              ),
              
              Text(
                _getMonthName(startOfWeek),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              
              IconButton(
                icon: const Icon(Icons.chevron_right, color: Colors.black87),
                onPressed: () => _changeWeek(1),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            children: List.generate(7, (index) {
              final day = startOfWeek.add(Duration(days: index));
              final isSelected = _isSameDay(day, widget.selectedDay);
              final isToday = _isToday(day);

              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    widget.onDaySelected(day);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF6A1B9A).withOpacity(0.15)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Text(
                          _weekDayLabel(index),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: isSelected
                                ? const Color(0xFF6A1B9A)
                                : Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 6),

                        SizedBox(
                          width: 36,
                          height: 36,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isSelected
                                  ? const Color(0xFF6A1B9A)
                                  : Colors.transparent,
                              border: Border.all(
                                color: isToday
                                    ? Colors.blue
                                    : (isSelected
                                        ? const Color(0xFF6A1B9A)
                                        : Colors.grey.shade300),
                                width: isToday ? 2 : 1,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "${day.day}",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: isSelected
                                    ? Colors.white
                                    : Colors.black87,
                              ),
                            ),
                          ),
                        ),

                        if (isToday) const SizedBox(height: 4),
                        if (isToday)
                          Container(
                            height: 4,
                            width: 4,
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
