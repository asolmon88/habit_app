double calculateProgress(Map<String, dynamic> habitsList) {
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