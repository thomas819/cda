import 'package:intl/intl.dart';

extension NumberFormatting on num {
  String formatWithCommas({String pattern = '#,##0'}) {
    return NumberFormat(pattern).format(this);
  }

  String formatCurrency({String locale = 'ko_KR', String symbol = '￦'}) {
    return NumberFormat.currency(locale: locale, symbol: symbol).format(this);
  }
}


// 콤마가 들어간 숫자 포맷
// print(largeNumber.formatWithCommas()); // 1,000,000,000,000

// 한국 원화로 포맷
// print(largeNumber.formatCurrency());   // ￦1,000,000,000,000