String? validateName(String? value) {
  if (value == null) return 'Name cannot be empty';
  if (value.length > 20) return 'Name has to be 20 characters or less';
  return null;
}

String? validateCurrentValue(String? value) {
  if (value!.length > 7) return 'Name has to be 7 characters or less';
  return null;
}

String? validateMetric(String? value) {
  if (value == null) return 'Name cannot be empty';
  if (value.length > 6) return 'Name has to be 6 characters or less';
  return null;
}