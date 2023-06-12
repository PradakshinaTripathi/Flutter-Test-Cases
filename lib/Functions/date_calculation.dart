class Date {
  int noOfDaysInMonth(String monthText) {
    final validMonths = {
      "JANUARY", "FEBRUARY", "MARCH", "APRIL", "MAY", "JUNE",
      "JULY", "AUGUST", "SEPTEMBER", "OCTOBER", "NOVEMBER", "DECEMBER"
    };

    final monthIndex = validMonths.map((m) => m.toUpperCase()).toList().indexOf(monthText.toUpperCase());
    if (monthIndex == -1) {
      // Invalid month entered
      return -1;
    }

    final now = DateTime.now();
    final month = monthIndex + 1; // Add 1 to match DateTime's month representation

    if (month == DateTime.february) {
      final isLeapYear =
          (now.year % 4 == 0) && (now.year % 100 != 0 || now.year % 400 == 0);
      return isLeapYear ? 29 : 28;
    } else {
      final lastDayOfMonth = DateTime(now.year, month + 1, 0);
      return lastDayOfMonth.day;
    }
  }

  bool validationCheck(String text) {
    final validMonths = {
      "JANUARY", "FEBRUARY", "MARCH", "APRIL", "MAY", "JUNE",
      "JULY", "AUGUST", "SEPTEMBER", "OCTOBER", "NOVEMBER", "DECEMBER"
    };

    return validMonths.contains(text.toUpperCase());
  }
}
