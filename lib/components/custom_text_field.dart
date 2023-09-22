import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_calendar_scheduler/const/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.isTime,
    required this.onSaved,
  });

  final String label;

  // true - 시간, false - 내용
  final bool isTime;
  final FormFieldSetter<String> onSaved;

  @override
  Widget build(BuildContext context) {
    var textField = TextFormField(
      onSaved: onSaved,
      // Form
      // null 이 return 되면 에러가 없다.
      // 에러가 있으면 에러를 String 값으로 리턴.
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return '값을 입력해주세요';
        }

        if (isTime) {
          int time = int.parse(value);
          if (time < 0) {
            return '0 이상의 숫자를 입력해주세요';
          }
          if (time > 24) {
            return '24 이하의 숫자를 입력해주세요';
          }
        } else {
          if (value.length > 500) {
            return '500자 이하의 글자를 입력해주세요';
          }
        }

        return null;
      },
      cursorColor: Colors.grey,
      maxLines: isTime ? 1 : null,
      expands: !isTime,
      maxLength: 500,
      keyboardType: isTime ? TextInputType.number : TextInputType.multiline,
      inputFormatters: isTime
          ? [
              FilteringTextInputFormatter.digitsOnly,
            ]
          : [],
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.grey[300],
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (isTime) textField,
        if (!isTime) Expanded(child: textField),
      ],
    );
  }
}
