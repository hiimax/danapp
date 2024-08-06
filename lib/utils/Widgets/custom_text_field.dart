import '../../res/import/import.dart';

class CustomTextFormField extends StatelessWidget {
  final String? Function(String? val)? validator;
  final String? label;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final Function(String? val)? onchanged;
  final Function(String? val)? onfieldSubmitted;
  final Function(String? val)? onsaved;
  final Function()? onTap;
  final TextInputAction? textInputAction;
  final String? hintText;
  final String? titleText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final Color? fillColor;
  final Color? enabledBorderColor;
  final Color? errorBorderColor;
  final Color? focusedBorderColor;
  final double? height;
  final double? borderRadius;
  final List<TextInputFormatter>? textInputFormatter;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final bool? readonly;
  final bool? autofocus;
  final bool? autocorrect;
  const CustomTextFormField({
    Key? key,
    this.validator,
    this.autofocus,
    this.autocorrect,
    this.label,
    this.controller,
    this.onfieldSubmitted,
    this.labelStyle,
    this.textInputType,
    this.obscureText,
    this.onchanged,
    this.onsaved,
    this.textInputAction,
    this.hintText,
    this.minLines,
    this.titleText,
    this.textStyle,
    this.maxLength,
    this.maxLines,
    this.height,
    this.textInputFormatter,
    this.readonly,
    this.enabledBorderColor,
    this.errorBorderColor,
    this.focusedBorderColor,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.fillColor,
    this.hintStyle,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      controller: controller,
      keyboardType: textInputType,
      inputFormatters: textInputFormatter,
      textInputAction: textInputAction,
      validator: validator,
      onChanged: onchanged,
      onSaved: onsaved,
      maxLength: maxLength,
      maxLines: maxLines ?? 1,
      minLines: minLines,
      readOnly: readonly ?? false,
      onTap: onTap,
      autofocus: autofocus ?? false,
      autocorrect: autocorrect ?? false,
      onFieldSubmitted: onfieldSubmitted,
      style: textStyle ??
          DanappTextStyle.size16
              .copyWith(fontWeight: FontWeight.w400, color: danappBlack),
      decoration: InputDecoration(
        hintText: hintText,
        labelText: label,
        hintStyle: hintStyle ??
            DanappTextStyle.size12
                .copyWith(fontWeight: FontWeight.w400, color: danappGrey),
        fillColor: fillColor ?? danappFillColor,
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: enabledBorderColor ?? danappPrimaryColor.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(borderRadius ?? 8.r)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: errorBorderColor ?? Colors.red),
            borderRadius: BorderRadius.circular(borderRadius ?? 8.r)),
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: focusedBorderColor ?? danappPrimaryColor),
            borderRadius: BorderRadius.circular(borderRadius ?? 8.r)),
        labelStyle: labelStyle ??
            DanappTextStyle.size16.copyWith(
                color: danappPrimaryColor,
                fontWeight: FontWeight.w400,
                fontSize: 15.sp),
        counterStyle: DanappTextStyle.size12
            .copyWith(fontWeight: FontWeight.w400, color: danappGrey),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefixIconConstraints: BoxConstraints(
          minWidth: 13.sp,
        ),
      ),
    );
  }
}

Widget inputFieldTitle(title, {Color? color}) => Padding(
      padding: const EdgeInsets.only(bottom: 3.0),
      child: Text(title,
          style: DanappTextStyle.size16.copyWith(
              fontSize: 18,
              color: color ?? danappBlack,
              fontWeight: FontWeight.w600)),
    );

class CustomTextFormFieldDropDown extends StatelessWidget {
  final String? Function(String? val)? validator;
  final String? label;
  final Function(String? val)? onchanged;
  final Function(String? val)? onsaved;
  final Function()? onTap;
  final String? hintText;
  final String? titleText;
  final TextStyle? textStyle;
  final List<String> items;
  final Color? fillColor;
  final double? height;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CustomTextFormFieldDropDown({
    Key? key,
    required this.items,
    this.validator,
    this.label,
    this.onchanged,
    this.onsaved,
    this.hintText,
    this.titleText,
    this.textStyle,
    this.height,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.fillColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: DropdownButtonFormField(
        validator: validator,
        onChanged: onchanged,
        onSaved: onsaved,
        onTap: onTap,
        icon: SizedBox(
          width: (24),
          height: (24),
          child: Image.asset('down'.mobilepng),
        ),
        style: textStyle ??
            DanappTextStyle.size16.copyWith(
              fontWeight: FontWeight.w400,
              color: danappBlack,
            ),
        decoration: InputDecoration(
          hintText: hintText,
          labelText: label,
          hintStyle: DanappTextStyle.size12
              .copyWith(fontWeight: FontWeight.w400, color: danappGrey),
          fillColor: fillColor ?? danappFillColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: danappFillColor,
              ),
              borderRadius: BorderRadius.circular(4)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(4)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: danappPrimaryColor),
              borderRadius: BorderRadius.circular(4)),
          labelStyle: DanappTextStyle.size16
              .copyWith(color: danappPrimaryColor, fontWeight: FontWeight.w700),
          prefixIcon: prefixIcon,
          suffix: suffixIcon,
          prefixIconConstraints: const BoxConstraints(
            minWidth: 13,
          ),
        ),
        items: items.map((option) {
          return DropdownMenuItem<String>(
            value: option,
            child: Text(
              option,
              style: DanappTextStyle.size16.copyWith(
                  fontWeight: FontWeight.w400, color: danappTextColor),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class CustomRadio extends StatelessWidget {
  final String value;
  final String? groupValue;
  final Function(String?) onChanged;
  const CustomRadio({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.groupValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: danappBlack,
        border: Border.all(
          color: value == groupValue ? danappPrimaryColor : danappGrey,
          width: value == groupValue ? 1 : 0.5,
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          if (value == groupValue)
            BoxShadow(
              blurRadius: 8,
              color: danappPrimaryColor.withOpacity(0.24),
            ),
        ],
      ),
      child: RadioListTile(
        selected: value == groupValue,
        tileColor: danappBlack,
        selectedTileColor: danappBlack,
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        activeColor: danappPrimaryColor,
        visualDensity: VisualDensity.compact,
        title: Text(
          value,
          style: DanappTextStyle.size14.copyWith(
            fontWeight: FontWeight.w500,
            color: danappTextColor,
          ),
        ),
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: const EdgeInsets.symmetric(
            // horizontal: 20,
            // vertical: 16,
            ),
      ),
    );
  }
}