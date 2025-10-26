import 'package:flutter/material.dart';
import 'package:se7ety/core/utils/colors.dart';

class CustomeTextFormField extends StatefulWidget {
  const CustomeTextFormField({super.key, this.validator, this.controller, this.prefixIcon, this.hintText, this.suffixIcon, this.color, this.maxLines, this.fontSize, this.readOnly = false});

  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final String? hintText;
  final Widget? suffixIcon;
  final Color? color;
  final int? maxLines;
  final double? fontSize;
  final bool readOnly;

  @override
  State<CustomeTextFormField> createState() => _CustomeTextFormFieldState();
}

class _CustomeTextFormFieldState extends State<CustomeTextFormField> {
  String? errorMessage;

  String? validate(String? value) {
    String? result = widget.validator?.call(value);
    setState(() {
      errorMessage = result;
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      validator: validate,
      controller: widget.controller,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: widget.color, fontSize: widget.fontSize),
        fillColor: AppColors.inputColor,
        filled: true,
        prefixIcon: widget.prefixIcon,
        contentPadding: EdgeInsets.all(20),
        suffixIcon: (errorMessage != null && (widget.hintText == 'الاسم' || widget.hintText == 'ادخل البريد الالكتروني'))
            ? Tooltip(
                message: widget.hintText == 'الاسم'
                    ? "اسم المستخدم يجب أن يلتزم بالقواعد التالية:\n"
                          "- يُسمح فقط بالحروف والأرقام\n"
                          "- يمكن أن يحتوي على '.' أو '' لكن ليس في البداية أو النهاية\n"
                          "- لا يمكن أن يظهر '.' أو '' بجانب بعضهما البعض\n"
                          "- الطول يجب أن يكون بين 8 و20 حرفًا"
                    : "البريد الإلكتروني يجب أن يحتوي على:\n"
                          "- اسم مستخدم صالح (حروف، أرقام، أو الرموز المسموح بها)\n"
                          "- رمز '@'\n"
                          "- اسم نطاق (مثل: gmail، yahoo)\n"
                          "- امتداد صالح (مثل: .com، .org، .net)",
                child: Icon(Icons.info_outline, color: Colors.red),
              )
            : widget.suffixIcon,
      ),
    );
  }
}
