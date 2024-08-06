import 'package:danapp/view/screens/onboarding/onboarding.dart';

import '../../../res/import/import.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _loading = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      callApi();
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> callApi() async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // FutureOr value = prefs.getBool('onboarding') ?? false;
    // FutureOr localAuth = prefs.getBool('local_auth') ?? false;
    setState(() {
      _loading = true;
    });
    Future.delayed(const Duration(seconds: 2)).then((value) {
      setState(() {
        _loading = false;
      });

      Navigator.pushReplacement(
          context,
          PageTransition(
              type: PageTransitionType.rightToLeft,
              child: const Onboarding(),
              duration: const Duration(milliseconds: 150),
              curve: Curves.decelerate,
              ctx: context));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        color: danappFillColor,
        child: const Center(
          child: FadeInTranslate(
              direction: FadeInDirection.top,
              duration: Duration(seconds: 2),
              child: LogoWidget()),
        ),
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/svg/logo.svg'),
        const XMargin(12),
        SizedBox(
          width: 101.sp,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'DO-IT',
                style: DanappTextStyle.size30.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 33.sp,
                  color: danappPrimaryColor,
                ),
              ),
              SizedBox(
                width: 45.sp,
                child: Divider(
                  thickness: 3.sp,
                  height: 0,
                  color: danappPrimaryColor,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
