import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // 새로운 값이 이전 값보다 짧으면 사용자가 백스페이스를 누른 것으로 판단
    if (newValue.text.length < oldValue.text.length) {
      return newValue;
    }

    // 숫자만 추출
    var phoneNumber = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // 최대 11자로 제한
    if (phoneNumber.length > 11) {
      phoneNumber = phoneNumber.substring(0, 11);
    }

    // 하이픈 추가
    if (phoneNumber.length > 3 && phoneNumber.length <= 7) {
      phoneNumber =
      '${phoneNumber.substring(0, 3)}-${phoneNumber.substring(3)}';
    } else if (phoneNumber.length > 7) {
      phoneNumber =
      '${phoneNumber.substring(0, 3)}-${phoneNumber.substring(3, 7)}-${phoneNumber.substring(7)}';
    }

    // 포맷된 전화번호로 TextEditingValue 업데이트
    return TextEditingValue(
      text: phoneNumber,
      selection: TextSelection.collapsed(offset: phoneNumber.length),
    );
  }
}