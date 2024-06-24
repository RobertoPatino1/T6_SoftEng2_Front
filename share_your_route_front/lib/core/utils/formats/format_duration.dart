import 'package:flutter/material.dart';

String formatDuration(TimeOfDay startTime, TimeOfDay endTime) {
  final int startMinutes = startTime.hour * 60 + startTime.minute;
  final int endMinutes = endTime.hour * 60 + endTime.minute;

  final int differenceInMinutes = endMinutes - startMinutes;

  final int hours = differenceInMinutes ~/ 60;
  final int minutes = differenceInMinutes % 60;

  final String formattedDuration =
      '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';

  return formattedDuration;
}
