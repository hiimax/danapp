import '../../res/import/import.dart';

enum FadeInDirection { left, right, bottom, top }

class FadeInTranslate extends StatefulWidget {
  final Widget? child;
  final FadeInDirection? direction;
  final Duration? duration;
  const FadeInTranslate({
    Key? key,
    @required this.child,
    this.direction = FadeInDirection.left,
    this.duration = const Duration(milliseconds: 150),
  })  : assert(child != null),
        super(key: key);

  @override
  State<FadeInTranslate> createState() => _FadeInTranslateState();
}

class _FadeInTranslateState extends State<FadeInTranslate>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _opacityAnimation;
  Animation<Offset>? _translateAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _opacityAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller!);
    _translateAnimation = _getOffsetTween().animate(_controller!);
    _controller!.drive(
      CurveTween(curve: Curves.easeIn),
    );
    _controller!.forward();
  }

  @override
  dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller!,
      builder: (context, child) {
        return Transform.translate(
          offset: _translateAnimation!.value,
          child: Opacity(
            opacity: _opacityAnimation!.value,
            child: widget.child,
          ),
        );
      },
    );
  }

  Tween<Offset> _getOffsetTween() {
    switch (widget.direction) {
      case FadeInDirection.left:
        return Tween<Offset>(begin: const Offset(-130, 25), end: Offset.zero);
      case FadeInDirection.right:
        return Tween<Offset>(begin: const Offset(130, 0), end: Offset.zero);
      case FadeInDirection.top:
        return Tween<Offset>(begin: const Offset(0, -130), end: Offset.zero);
      default:
        return Tween<Offset>(begin: const Offset(0, 130), end: Offset.zero);
    }
  }
}
