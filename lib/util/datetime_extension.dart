// datetime -> dd월 mm일 # 요일
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get convertKoreaDate {
    return "${DateFormat("MM월 dd일").format(this)} ${DateFormat('E', 'ko_KR').format(this)}";
  }
}
