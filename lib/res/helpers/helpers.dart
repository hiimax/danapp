import 'package:intl/intl.dart';
import '../import/import.dart';

_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

formatCurrency(dynamic value) {
  NumberFormat("#,##0.00", "en_US").format(value);
}

String convertToAgo(DateTime input) {
  Duration diff = DateTime.now().difference(input);
  return '${diff.inDays}';
}

void showErrorToast({required String message, required context}) {
  final snackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.fixed,
    backgroundColor: Colors.transparent,
    content: Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: danappFillColor,
          border: Border.all(
            color: danappFillColor,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              SvgPicture.asset('assets/svg/check-circle.svg'),
              const XMargin(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Error!',
                      style: DanappTextStyle.size16.copyWith(
                        color: danappRed,
                        fontWeight: FontWeight.w600,
                      )),
                  const YMargin(4),
                  Text(message,
                      style: DanappTextStyle.size14.copyWith(
                        fontWeight: FontWeight.w400,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}

void showSuccessToast({required String message, required context}) {
  final materialBanner = SnackBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    behavior: SnackBarBehavior.fixed,
    content: Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: danappFillColor,
          border: Border.all(
            color: danappFillColor,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              SvgPicture.asset('assets/svg/check-circle.svg'),
              const XMargin(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Success!',
                      style: DanappTextStyle.size16.copyWith(
                        color: danappGreen,
                        fontWeight: FontWeight.w600,
                      )),
                  const YMargin(4),
                  Text(message,
                      style: DanappTextStyle.size14.copyWith(
                        fontWeight: FontWeight.w400,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(materialBanner);
}

String formatCurrencyValue(num value) {
  String formattedValue = value.toStringAsFixed(2);
  List<String> parts = formattedValue.split('.');

  final RegExp regex = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  parts[0] = parts[0].replaceAllMapped(regex, (Match match) => '${match[1]},');

  return '${parts[0]}.${parts[1]}';
}

String formatSystemDate(String value) {
  // Parse the input date string
  DateTime dateTime = DateTime.parse(value);

  // Format the date
  String formattedDate = DateFormat("MMMM d, y").format(dateTime);

  return formattedDate;
}

String formatTimeOfDay(TimeOfDay timeOfDay, context) {
  final now = DateTime.now();
  final dateTime =
      DateTime(now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
  return TimeOfDay.fromDateTime(dateTime).format(context);
}

class ParserService {
  static num parseMoneyToNum(String money) {
    return num.tryParse(money.replaceAll(',', '')) ?? 0;
  }

// static String formatToMoney(num amount,
//     {String? currency,
//     required BuildContext context,
//     compact = true,
//     bool getSymbolFromCurrency = false}) {
//   String? currencyTo = context
//       .read(authProvider)
//       .fetchUserResponse
//       .data
//       .wallet
//       ?.balance
//       ?.currency;
//   MoneyFormatter fmf = MoneyFormatter(
//       amount: amount.toDouble(),
//       settings: MoneyFormatterSettings(
//           thousandSeparator: ',', decimalSeparator: '.'));
//   return '${currencyTo ?? currency}${compact ? fmf.output.compactNonSymbol : fmf.output.nonSymbol}';
// }
}
