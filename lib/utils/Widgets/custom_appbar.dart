import 'package:danapp/res/import/import.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {Key? key,
      this.actions = const [],
      this.isTransparent = false,
      this.leading,
      this.title,
      this.callback,
      this.subtitle,
      this.bottom,
      this.bgcolor,
      this.appBarHeight,
      this.automaticallyImplyLeading = false})
      : super(key: key);

  final List<Widget> actions;
  final Widget? leading;
  final Widget? title;
  final VoidCallback? callback;
  final String? subtitle;
  final bool? isTransparent;
  final bool automaticallyImplyLeading;
  final PreferredSizeWidget? bottom;
  final Color? bgcolor;
  final double? appBarHeight;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
  @override
  Size get preferredSize => appBarHeight != null
      ? Size.fromHeight(appBarHeight!)
      : AppBar().preferredSize;
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: widget.bgcolor ?? danappTransparent,
        bottom: widget.bottom,
        // leadingWidth: 90,
        leading: widget.automaticallyImplyLeading
            ? Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0, top: 24),
                  child: GestureDetector(
                      onTap: widget.callback ??
                          () {
                            Navigator.pop(context);
                          },
                      child: widget.leading),
                ),
              )
            : null,
        automaticallyImplyLeading: widget.automaticallyImplyLeading,
        title: Padding(
          padding: const EdgeInsets.only(top: 28.0),
          child: widget.title,
        ),
        actions: [
          ...widget.actions,
        ]);
  }
}

class CustomAppBar1 extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar1(
      {Key? key,
      this.actions = const [],
      this.isTransparent = false,
      this.leading,
      this.title,
      this.callback,
      this.subtitle,
      this.bottom,
      this.leadingWidth,
      this.centerTitle,
      this.automaticallyImplyLeading = false,
      this.appBarHeight})
      : super(key: key);

  final List<Widget> actions;
  final Widget? leading;
  final Widget? title;
  final VoidCallback? callback;
  final String? subtitle;
  final bool? isTransparent;
  final bool automaticallyImplyLeading;
  final PreferredSizeWidget? bottom;
  final double? leadingWidth;
  final bool? centerTitle;
  final double? appBarHeight;

  @override
  State<CustomAppBar1> createState() => _CustomAppBar1State();
  @override
  Size get preferredSize => appBarHeight != null
      ? Size.fromHeight(appBarHeight!)
      : AppBar().preferredSize;
}

class _CustomAppBar1State extends State<CustomAppBar1> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        centerTitle: widget.centerTitle ?? false,
        backgroundColor: danappTransparent,
        bottom: widget.bottom,
        leadingWidth: widget.leadingWidth ?? 120,
        leading: widget.automaticallyImplyLeading
            ? GestureDetector(
                onTap: widget.callback ??
                    () {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: REdgeInsets.fromLTRB(24, 25, 0, 0),
                    child: widget.leading ??
                        SvgPicture.asset('assets/svg/arrow_back.svg'),
                  ),
                ),
              )
            : null,
        automaticallyImplyLeading: widget.automaticallyImplyLeading,
        title: widget.title,
        actions: [
          ...widget.actions,
        ]);
  }
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    this.onTap,
  });
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: 40.sp,
        height: 40.sp,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: danappColor3,
              width: 1.sp,
            )),
        child: Center(
          child: GestureDetector(
            onTap: onTap ??
                () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
            child: Image.asset(
              'assets/images/mobile/Chevron-left.png',
              width: 24.sp,
              height: 24.sp,
            ),
          ),
        ),
      ),
    );
  }
}
