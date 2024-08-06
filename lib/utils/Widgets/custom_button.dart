import '../../res/import/import.dart';

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({
    Key? key,
    this.onPressed,
    required this.icon,
  }) : super(key: key);

  final IconData icon;

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          decoration: BoxDecoration(
              color: danappPrimaryColor,
              border: Border.all(color: danappPrimaryColor),
              shape: BoxShape.circle),
          child: Padding(
            padding: REdgeInsets.all(8),
            child: Icon(
              icon,
              color: danappWhite,
            ),
          )),
    );
  }
}

class CustomButtonWithIconRight extends StatelessWidget {
  const CustomButtonWithIconRight({
    Key? key,
    this.title,
    this.buttonColor,
    this.textColor,
    this.onPressed,
    this.borderColor,
    this.loadingStateColor,
    this.textSize,
    this.showIcon = false,
    this.icon,
    this.loadingState = false,
    this.radius,
  }) : super(key: key);
  final bool loadingState;
  final String? title;
  final Color? buttonColor;
  final Color? textColor;
  final bool? showIcon;
  final double? textSize;
  final BorderRadius? radius;
  final Color? borderColor;
  final Color? loadingStateColor;
  final Widget? icon;

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: (56.sp),
        decoration: BoxDecoration(
            color: buttonColor,
            border: Border.all(color: borderColor ?? danappPrimaryColor),
            borderRadius: radius ?? BorderRadius.circular(8)),
        child: loadingState
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      loadingStateColor ?? danappPrimaryColor),
                ),
              )
            : Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title ?? '',
                      style: DanappTextStyle.size16.copyWith(
                          fontSize: textSize ?? 18,
                          fontWeight: FontWeight.bold,
                          color: textColor),
                    ),
                    icon ?? const SizedBox(),
                  ],
                ),
              ),
      ),
    );
  }
}

class CustomButton2 extends StatelessWidget {
  const CustomButton2({
    Key? key,
    this.title,
    this.buttonColor,
    this.textColor,
    this.onPressed,
    this.borderColor,
    this.textSize,
    this.radius,
  }) : super(key: key);

  final String? title;
  final Color? buttonColor;
  final Color? textColor;
  final double? textSize;
  final Color? borderColor;
  final BorderRadius? radius;

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: (56.sp),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: buttonColor ?? danappPrimaryColor,
            border: Border.all(color: borderColor ?? danappPrimaryColor),
            borderRadius: radius ?? BorderRadius.circular(8)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  title ?? '',
                  style: DanappTextStyle.size16.copyWith(
                      fontSize: textSize ?? 16.sp,
                      fontWeight: FontWeight.w700,
                      color: textColor ?? danappWhite),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      this.onPressed,
      this.title,
      this.loadingState = false,
      this.buttonColor,
      this.textColor,
      this.buttonTextSize,
      this.buttonRadius,
      this.height,
      this.textSize,
      this.enabled = true})
      : super(key: key);

  final VoidCallback? onPressed;
  final double? textSize;
  final double? height;
  final String? title;
  final bool enabled;
  final bool loadingState;
  final Color? buttonColor;
  final Color? textColor;
  final double? buttonTextSize;
  final BorderRadius? buttonRadius;

  @override
  Widget build(BuildContext context) {
    final textWidget = Text(
      "$title",
      textAlign: TextAlign.center,
      maxLines: 1,
      // overflow: TextOverflow.ellipsis,
      style: DanappTextStyle.size16.copyWith(
          fontSize: textSize ?? 16.sp,
          fontWeight: FontWeight.w700,
          color: textColor ?? danappWhite),
    );
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: height ?? (56.sp),
      child: loadingState
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(danappPrimaryColor),
              ),
            )
          : TextButton(
              onPressed: enabled ? onPressed : null,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      enabled ? buttonColor ?? danappPrimaryColor : danappGrey),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: buttonRadius ?? BorderRadius.circular(8)))),
              child: textWidget,
            ),
    );
  }
}

class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon({
    Key? key,
    this.title,
    this.borderradius,
    this.buttonColor,
    this.textColor,
    this.onPressed,
    this.borderColor,
    this.textSize,
    this.showIcon = false,
    this.icon,
  }) : super(key: key);

  final String? title;
  final Color? buttonColor;
  final Color? textColor;
  final bool? showIcon;
  final double? textSize;
  final Color? borderColor;
  final Widget? icon;
  final double? borderradius;

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: (56.sp),
        decoration: BoxDecoration(
            color: buttonColor ?? danappPrimaryColor,
            border: Border.all(color: borderColor ?? danappPrimaryColor),
            borderRadius: borderradius == null
                ? BorderRadius.circular(8)
                : BorderRadius.circular(borderradius!)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon ?? const SizedBox.shrink(),
              if (icon != null) const XMargin(5),
              Text(
                title ?? '',
                style: DanappTextStyle.size16.copyWith(
                  fontSize: textSize ?? 16.sp,
                  fontWeight: FontWeight.w700,
                  color: textColor ?? danappWhite,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
