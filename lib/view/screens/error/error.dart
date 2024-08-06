import 'package:danapp/res/import/import.dart';

class CustomError extends StatelessWidget {
  final FlutterErrorDetails errorDetails;

  const CustomError({
    Key? key,
    required this.errorDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: REdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/mobile/dummy.png',
              scale: 1.5,
            ),
            const YMargin(30),

            Text(
              'Oopse! ',
              textAlign: TextAlign.center,
              style: DanappTextStyle.size20.copyWith(
                color: danappPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const YMargin(10),
            Text(
              ' Something went wrong!',
              textAlign: TextAlign.center,
              style: DanappTextStyle.size20.copyWith(
                color: danappPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const YMargin(10),
            Text(
              kDebugMode
                  ? errorDetails.summary.toString()
                  : 'Oups! Something went wrong!',
              textAlign: TextAlign.center,
              style: DanappTextStyle.size20.copyWith(
                color: kDebugMode ? danappRed : danappBlack,
                fontWeight: FontWeight.bold,
              ),
            ),
            const YMargin(12),
            // const Text(
            //   kDebugMode
            //       ? 'https://docs.flutter.dev/testing/errors'
            //       : "We encountered an error and we've notified our engineering team about it. Sorry for the inconvenience caused.",
            //   textAlign: TextAlign.center,
            //   style: DanappTextStyle.small.copyWith(color: Colors.black, fontSize: 14),
            // ),
          ],
        ),
      ),
    );
  }
}
