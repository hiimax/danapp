import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import '../../../res/import/import.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen>
    with Validators {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool password = true;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  FlCountryCodePicker countryPicker = const FlCountryCodePicker(
    localize: true,
    showDialCode: true,
    showSearchBar: true,
    countryTextStyle: TextStyle(
      color: danappBlack,
    ),
    dialCodeTextStyle: TextStyle(
      color: danappBlack,
    ),
  );
  CountryCode? selectedCountry;

  @override
  void initState() {
    setDefaultCountry();
    _nameController.addListener(() {
      setState(() {});
    });

    _emailController.addListener(() {
      setState(() {});
    });

    _mobileController.addListener(() {
      setState(() {});
    });

    _passwordController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void setDefaultCountry() {
    if (mounted) {
      selectedCountry = CountryCode.fromDialCode('+234')!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: danappSubColor,
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: Padding(
          padding: REdgeInsets.fromLTRB(24, 0, 24, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackButton(),
                const YMargin(16),
                Text(
                  'Create \nAccount',
                  style: DanappTextStyle.size24.copyWith(
                    fontWeight: FontWeight.w600,
                    color: danappBlack,
                  ),
                ),
                const YMargin(16),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: 'Please fill the details below\nto create a  ',
                    style: DanappTextStyle.size14
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                  TextSpan(
                    text: 'DO-IT ',
                    style: DanappTextStyle.size14.copyWith(
                        fontWeight: FontWeight.w400, color: danappPrimaryColor),
                  ),
                  TextSpan(
                    text: 'account',
                    style: DanappTextStyle.size16.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ])),
                const YMargin(24),
                CustomTextFormField(
                  controller: _nameController,
                  hintText: 'Name',
                  label: 'Name',
                  labelStyle: _nameController.text.isEmpty
                      ? DanappTextStyle.size12.copyWith(
                          fontWeight: FontWeight.w400, color: danappGrey)
                      : null,
                  fillColor: danappTransparent,
                  enabledBorderColor: danappColor4,
                  focusedBorderColor: danappPrimaryColor,
                  errorBorderColor: danappColor4,
                  borderRadius: 10.sp,
                  textInputType: TextInputType.name,
                  textInputFormatter: [
                    FilteringTextInputFormatter.singleLineFormatter
                  ],
                  validator: (val) => validateName(val),
                ),
                const YMargin(24),
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
                  hintText: 'Mobile Number',
                  label: 'Mobile Number',
                  controller: _mobileController,
                  labelStyle: _mobileController.text.isEmpty
                      ? DanappTextStyle.size12.copyWith(
                          fontWeight: FontWeight.w400, color: danappGrey)
                      : null,
                  fillColor: danappTransparent,
                  enabledBorderColor: danappColor4,
                  focusedBorderColor: danappColor4,
                  errorBorderColor: danappColor4,
                  borderRadius: 10.sp,
                  validator: (val) => validatePhoneNumber(val),
                  textInputType: TextInputType.number,
                  textInputFormatter: [FilteringTextInputFormatter.digitsOnly],
                  suffixIcon: GestureDetector(
                    onTap: () async {
                      // Show the country code picker when tapped.
                      selectedCountry =
                          await countryPicker.showPicker(context: context);
                      setState(() {});
                    },
                    child: Padding(
                      padding: REdgeInsets.only(right: 16),
                      child: SizedBox(
                        width: 50.sp,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.asset(
                                //  fit: fit,
                                width: 24.sp,
                                height: 24.sp,
                                selectedCountry?.flagUri ?? '',
                                fit: BoxFit.cover,
                                package: selectedCountry?.flagImagePackage,
                              ),
                            ),
                            const XMargin(8),
                            Image.asset(
                              //  fit: fit,
                              width: 14.sp,
                              height: 14.sp,
                              'assets/images/mobile/Polygon 2.png',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
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
                          : const Icon(Icons.visibility, color: danappColor1)),
                ),
                const YMargin(8),
                Text(
                  'Password must be atleast 8 characters',
                  style: DanappTextStyle.size12.copyWith(
                      fontWeight: FontWeight.w400, color: danappColor1),
                ),
                const YMargin(68),
                CustomButtonWithIcon(
                  title: 'Create account',
                  onPressed: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    _formKey.currentState!.save();
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: const WelcomeBackScreen(),
                            duration: const Duration(milliseconds: 150),
                            curve: Curves.decelerate,
                            ctx: context),
                      );
                    }
                  },
                ),
                const YMargin(4),
                Center(
                  child: Text(
                    'Privacy policy',
                    style: DanappTextStyle.size12.copyWith(
                      fontWeight: FontWeight.w400,
                      color: danappColor1,
                      decoration: TextDecoration.underline,
                      decorationColor: danappColor1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
