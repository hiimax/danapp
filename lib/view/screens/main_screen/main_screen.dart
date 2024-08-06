import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:danapp/view/screens/dashboard/dashboard.dart';
import 'package:danapp/view/screens/profile/profile.dart';
import 'package:danapp/view/screens/projects/projects.dart';

import '../../../res/import/import.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController? _pageController;
  int _currentIndex = 0;
  bool showSheet = false;

  final List<Widget> _pages = [
    const Dashboard(),
    const Project(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    _pageController = PageController(
      keepPage: true,
      initialPage: 0,
    );
    super.initState();
  }

  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
    showSheet = false;
    setState(() {});
    _pageController!.jumpToPage(index);
  }

  List<String> inactiveIcons = [
    'assets/svg/Vector.svg',
    'assets/svg/Group 9572.svg',
    'assets/svg/Group 452.svg',
  ];
  List<String> activeIcons = [
    'assets/svg/Group 450.svg',
    'assets/svg/arcticons_zoho-projects.svg',
    'assets/svg/Group 452.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => Future<bool>.value(false),
        child: Scaffold(
          body: PageView(
            onPageChanged: onPageChanged,
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: _pages,
          ),
          bottomNavigationBar: AnimatedBottomNavigationBar.builder(
              height: 74,
              itemCount: 3,
              gapLocation: GapLocation.end,
              notchSmoothness: NotchSmoothness.verySmoothEdge,
              backgroundColor: danappColor6,
              // leftCornerRadius: 10,
              // rightCornerRadius: 32,
              gapWidth:0,
              tabBuilder: (int index, bool isActive) {
                return BottomNavWidgets(
                  icon: isActive ? activeIcons[index] : inactiveIcons[index],
                );
              },
              activeIndex: _currentIndex,

              onTap: onPageChanged),
          // floatingActionButton: GestureDetector(
          //     onTap: () {},
          //     child: SvgPicture.asset('assets/svg/Group 463.svg')),
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.miniCenterFloat,
          // floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        ));
  }
}
