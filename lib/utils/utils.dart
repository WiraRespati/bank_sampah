class Helper {
  static String formatNumber(String number) {
    if (number.isEmpty) return number;
    final buffer = StringBuffer();
    for (int i = 0; i < number.length; i++) {
      if (i > 0 && (number.length - i) % 3 == 0) {
        buffer.write('.');
      }
      buffer.write(number[i]);
    }
    return buffer.toString();
  }
}
