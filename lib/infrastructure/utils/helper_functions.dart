double calculateProgress(Map<String, dynamic> habitsList) {
  if (habitsList.isNotEmpty) {
    double progress = 0;
    double percentage = 1/habitsList.keys.length;
    for (var element in habitsList.keys) {
      progress += int.parse(habitsList[element]['current_value'])
                  *percentage
                  /int.parse(habitsList[element]['end_value'])
                  .ceil();
    }
    return progress;
  }
  return 0;
}

Map<String, dynamic> filterHabitsByStatus(
  Map<String, dynamic> habits,
  bool desideredStatus
) {
  return habits.entries
      .where((entry) => entry.value["status"] == desideredStatus)
      .map((entry) => MapEntry(entry.key, entry.value))
      .fold({}, (previous, entry) => previous..[entry.key] = entry.value);
}
