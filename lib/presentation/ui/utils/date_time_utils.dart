String getDayOfWeek(DateTime dt) {
  switch (dt.weekday) {
    case 1:
      return 'Monday';
    case 2:
      return 'Tuesday';
    case 3:
      return 'Wednesday';
    case 4:
      return 'Thursday';
    case 5:
      return 'Friday';
    case 6:
      return 'Saturday';
    case 7:
      return 'Sunday';
    default:
      return '';
  }
}

DateTime getYMD(DateTime dt) {
  return DateTime(dt.year, dt.month, dt.day);
}

DateTime getYMDhm(DateTime dt) {
  return DateTime(dt.year, dt.month, dt.day, dt.hour, dt.minute);
}

DateTime getDateHourMin(DateTime dt) {
  return DateTime(dt.year, dt.month, dt.day, dt.hour, dt.minute);
}

String getMonth(DateTime dt) {
  switch (dt.month) {
    case 1:
      return 'January';
    case 2:
      return 'February';
    case 3:
      return 'March';
    case 4:
      return 'April';
    case 5:
      return 'May';
    case 6:
      return 'June';
    case 7:
      return 'July';
    case 8:
      return 'August';
    case 9:
      return 'September';
    case 10:
      return 'October';
    case 11:
      return 'November';
    case 12:
      return 'December';
    default:
      return '';
  }
}
