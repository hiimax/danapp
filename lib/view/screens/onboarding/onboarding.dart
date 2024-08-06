import 'package:danapp/res/import/import.dart';
import 'package:flutter/gestures.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: REdgeInsets.fromLTRB(24, 51, 24, 24),
            child: Column(
              children: [
                const LogoWidget(),
                const YMargin(99),
                Padding(
                  padding: REdgeInsets.fromLTRB(18, 0, 0, 18),
                  child: Column(
                    children: [
                      const IconsWidget(
                        image: 'assets/svg/Group 266.svg',
                      ),
                      const Row(
                        children: [
                          IconsWidget(
                            image: 'assets/svg/Group 267.svg',
                          ),
                          Spacer(),
                          IconsWidget(
                            image: 'assets/svg/Group 268.svg',
                          ),
                        ],
                      ),
                      Image.asset(
                          'assets/images/mobile/6748-removebg-preview 2.png',
                          width: 260.sp,
                          height: 184.44.sp),
                    ],
                  ),
                ),
                const YMargin(61),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Just ',
                      style: DanappTextStyle.size24.copyWith(
                        fontWeight: FontWeight.w600,
                        color: danappBlack,
                      ),
                    ),
                    TextSpan(
                      text: 'DO-IT',
                      style: DanappTextStyle.size24.copyWith(
                        fontWeight: FontWeight.w600,
                        color: danappPrimaryColor,
                      ),
                    ),
                  ]),
                ),
                const YMargin(17),
                CustomButton(
                  title: 'Create account',
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: const CreateAccountScreen(),
                            duration: const Duration(milliseconds: 150),
                            curve: Curves.decelerate,
                            ctx: context));
                  },
                ),
                const YMargin(7),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Already have an account? ',
                      style: DanappTextStyle.size14.copyWith(
                        fontSize: 13.sp,
                        color: danappColor2,
                      ),
                    ),
                    TextSpan(
                      text: 'Sign in',
                      style: DanappTextStyle.size14.copyWith(
                        fontWeight: FontWeight.w500,
                        color: danappPrimaryColor,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushReplacement(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: const WelcomeBackScreen(),
                                duration: const Duration(milliseconds: 150),
                                curve: Curves.decelerate,
                                ctx: context),
                          );
                        },
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconsWidget extends StatelessWidget {
  const IconsWidget({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 50.sp,
        height: 50.sp,
        decoration: BoxDecoration(
          color: danappWhite,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              offset: const Offset(5, 5),
              color: danappBlack.withOpacity(0.05),
            ),
            BoxShadow(
              blurRadius: 0,
              offset: const Offset(-5, -5),
              color: danappColor1.withOpacity(0.05),
            ),
          ],
        ),
        child: SvgPicture.asset(image));
  }
}
