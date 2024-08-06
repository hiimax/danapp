import '../../../../res/import/import.dart';

class BottomNavWidgets extends StatelessWidget {
  const BottomNavWidgets({
    super.key,
    required this.icon,
  });

  final String icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      
      children: [
        SvgPicture.asset(
          icon,
          // color: color,
        ),
      ],
    );
  }
}
