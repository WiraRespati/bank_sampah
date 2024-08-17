import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

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

  static String capitalizeEachWord(String text) {
    if (text.isEmpty) return text;
    List<String> words = text.split(' ');
    for (int i = 0; i < words.length; i++) {
      words[i] =
          words[i][0].toUpperCase() + words[i].substring(1).toLowerCase();
    }
    return words.join(' ');
  }

  static String formatTimestamp(Timestamp? createdAt) {
    if (createdAt == null) return '';
    DateTime dateTime = createdAt.toDate();

    // Daftar nama bulan dalam bahasa Indonesia
    List<String> months = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember'
    ];

    int day = dateTime.day;
    String month = months[dateTime.month - 1];
    int year = dateTime.year;

    return '$day $month $year';
  }
}
