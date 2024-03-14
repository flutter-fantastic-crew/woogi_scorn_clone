import 'package:intl/intl.dart';

String thousandWon(int price) {
  var wonFormat = NumberFormat('###,###,###,###');
  return wonFormat.format(price);
}
