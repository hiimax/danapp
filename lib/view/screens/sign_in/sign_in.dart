import 'package:danapp/view/screens/main_screen/main_screen.dart';
import 'package:flutter/gestures.dart';

import '../../../res/import/import.dart';

class WelcomeBackScreen extends StatefulWidget {
  const WelcomeBackScreen({super.key});

  @override
  State<WelcomeBackScreen> createState() => _WelcomeBackScreenState();
}

class _WelcomeBackScreenState extends State<WelcomeBackScreen> with Validators {
  bool password = true;
  final _auth = LocalAuthentication();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  Future<bool> hasBiometrics() async {
    final isAvailable = await _auth.canCheckBiometrics;
    final isDeviceSupported = await _auth.isDeviceSupported();
    return isAvailable && isDeviceSupported;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: REdgeInsets.fromLTRB(25, 133, 25, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const LogoWidget(),
                const YMargin(24),
                Text(
                  'Welcome Back !',
                  style: DanappTextStyle.size24.copyWith(
                    fontWeight: FontWeight.w700,
                    color: danappBlack,
                  ),
                ),
                const YMargin(36),
                CustomTextFormField(
                  hintText: 'Email',
                  label: 'Email',
                  controller: _emailController,
                  labelStyle: _emailController.text.isEmpty
                      ? DanappTextStyle.size12.copyWith(
                          fontWeight: FontWeight.w400, color: danappGrey)
                      : null,
                  fillColor: danappTransparent,
                  enabledBorderColor: danappColor4,
                  focusedBorderColor: danappColor4,
                  errorBorderColor: danappColor4,
                  borderRadius: 10.sp,
                  textInputType: TextInputType.emailAddress,
                  textInputFormatter: [
                    FilteringTextInputFormatter.singleLineFormatter
                  ],
                  validator: (val) => validateEmail(val),
                ),
                const YMargin(24),
                CustomTextFormField(
                  hintText: 'Password',
                  label: 'Password',
                  controller: _passwordController,
                  labelStyle: _passwordController.text.isEmpty
                      ? DanappTextStyle.size12.copyWith(
                          fontWeight: FontWeight.w400, color: danappGrey)
                      : null,
                  fillColor: danappTransparent,
                  enabledBorderColor: danappColor4,
                  focusedBorderColor: danappColor4,
                  errorBorderColor: danappColor4,
                  obscureText: password,
                  borderRadius: 10.sp,
                  validator: (val) => validatePassword(val),
                  textInputType: TextInputType.visiblePassword,
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        password = !password;
                      });
                    },
                    child: password
                        ? const Icon(Icons.visibility_off_outlined,
                            color: danappColor1)
                        : const Icon(
                            Icons.visibility,
                            color: danappColor1,
                          ),
                  ),
                ),
                const YMargin(8),
                Row(
                  children: [
                    Text(
                      'Forgot Password?',
                      style: DanappTextStyle.size12.copyWith(
                        color: danappColor1,
                      ),
                    ),
                  ],
                ),
                const YMargin(100),
                Row(
                  children: [
                    SizedBox(
                      width: 257.sp,
                      child: CustomButton(
                        title: 'Sign In',
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: const MainScreen(),
                                duration: const Duration(milliseconds: 150),
                                curve: Curves.decelerate,
                                ctx: context),
                          );
                        },
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () async {
                        final isAuthAvailable = await hasBiometrics();
                        if (!isAuthAvailable) {
                          if (mounted) {
                            showErrorToast(
                                message:
                                    'Biometric authentication not supported in this device',
                                // ignore: use_build_context_synchronously
                                context: context);
                          }
                        }
                        try {
                          final bool didAuthenticate = await _auth.authenticate(
                            localizedReason: Platform.isIOS
                                ? 'Use face ID  to login'
                                : 'Touch your finger on the sensor to login',
                            options: const AuthenticationOptions(
                              stickyAuth: true,
                              // biometricOnly: true,
                            ),
                          );
                          if (didAuthenticate) {
                            Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: const MainScreen(),
                                  duration: const Duration(milliseconds: 150),
                                  curve: Curves.decelerate,
                                  ctx: context),
                            );
                          } else {
                            if (mounted) {
                              showErrorToast(
                                  message:
                                      'BUnable to login, please try again later',
                                  // ignore: use_build_context_synchronously
                                  context: context);
                            }
                          }
                        } on PlatformException catch (e) {
                          if (mounted) {
                            showErrorToast(
                                message: e.message ?? 'Please try again later',
                                // ignore: use_build_context_synchronously
                                context: context);
                          }
                        }
                      },
                      child: Container(
                          width: 54.sp,
                          height: 56.sp,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: danappPrimaryColor,
                                width: 1.sp,
                              )),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/svg/ion_finger-print-outline.svg',
                              width: 32.sp,
                              height: 32.sp,
                            ),
                          )),
                    ),
                  ],
                ),
                const YMargin(12),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: 'Don’t have an account? ',
                    style: DanappTextStyle.size12.copyWith(
                      color: danappColor5,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: 'Create Account',
                    style: DanappTextStyle.size14.copyWith(
                        fontWeight: FontWeight.w400, color: danappPrimaryColor),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: const CreateAccountScreen(),
                              duration: const Duration(milliseconds: 150),
                              curve: Curves.decelerate,
                              ctx: context),
                        );
                      },
                  ),
                ])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
