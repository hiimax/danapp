import 'package:danapp/view/screens/dashboard/all_tasks.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';

import '../../../res/import/import.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: REdgeInsets.fromLTRB(0, 24, 0, 0),
        child: Column(
          children: [
            Padding(
              padding: REdgeInsets.fromLTRB(24, 0, 24, 0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Hi Dexter ',
                            style: DanappTextStyle.size24.copyWith(
                              fontWeight: FontWeight.w600,
                              color: danappBlack,
                            ),
                          ),
                          Text(
                            'Welcome onboard ',
                            style: DanappTextStyle.size12.copyWith(
                              color: danappPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      SvgPicture.asset('assets/svg/Group 9571.svg')
                    ],
                  ),
                  const YMargin(16),
                  const Row(
                    children: [
                      DashboardCardWidget(
                        bgColor: danappColor7,
                        iconColor: danappColor8,
                        icon: 'assets/svg/arcticons_zoho-projects copy.svg',
                        value: '14',
                        title: 'Projects',
                      ),
                      XMargin(20),
                      DashboardCardWidget(
                        bgColor: danappColor9,
                        iconColor: danappPrimaryColor,
                        icon:
                            'assets/svg/fluent_clipboard-task-list-rtl-24-regular.svg',
                        value: '24',
                        title: 'Tasks',
                      ),
                    ],
                  ),
                  const YMargin(20),
                  const Row(
                    children: [
                      DashboardCardWidget(
                        bgColor: danappColor10,
                        iconColor: danappColor11,
                        icon: 'assets/svg/Vector copy.svg',
                        value: '12',
                        title: 'Completed Task',
                      ),
                      XMargin(20),
                      DashboardCardWidget(
                        bgColor: danappColor12,
                        iconColor: danappColor13,
                        icon: 'assets/svg/carbon_task-remove.svg',
                        value: '2',
                        title: 'Overdue Task',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const YMargin(28),
            Expanded(
                child: Container(
              width: MediaQuery.of(context).size.width,
              color: danappColor14,
              child: Padding(
                padding: REdgeInsets.fromLTRB(24, 16, 24, 0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Task in Progress',
                          style: DanappTextStyle.size16.copyWith(
                            fontWeight: FontWeight.w600,
                            color: danappBlack,
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: const AllTasks(),
                                  duration: const Duration(milliseconds: 150),
                                  curve: Curves.decelerate,
                                  ctx: context),
                            );
                          },
                          child: Text(
                            'See all',
                            style: DanappTextStyle.size14.copyWith(
                              fontWeight: FontWeight.w600,
                              color: danappPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const YMargin(16),
                    Expanded(
                      child: ListView.separated(
                        itemCount: 5,
                        itemBuilder: (context, index) => const TaskWidget(),
                        separatorBuilder: (context, index) => const YMargin(16),
                      ),
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    ));
  }
}

class DashboardCardWidget extends StatelessWidget {
  const DashboardCardWidget({
    super.key,
    required this.bgColor,
    required this.iconColor,
    required this.icon,
    required this.value,
    required this.title,
  });

  final Color bgColor, iconColor;
  final String icon, value, title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 10,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 128.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: bgColor,
        ),
        child: Padding(
          padding: REdgeInsets.fromLTRB(16, 16, 16, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 33.sp,
                    width: 33.sp,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: iconColor,
                    ),
                    child: Center(
                        child: SvgPicture.asset(
                      icon,
                    )),
                  ),
                  const Spacer(),
                  Text(
                    value,
                    style: DanappTextStyle.size20.copyWith(
                      fontWeight: FontWeight.w600,
                      color: danappBlack,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                title,
                style: DanappTextStyle.size14.copyWith(
                  fontWeight: FontWeight.w400,
                  color: danappBlack,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskWidget extends StatefulWidget {
  const TaskWidget({super.key});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: danappWhite,
      ),
      child: Padding(
        padding: REdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Liberty Pay Loan App',
                  style: DanappTextStyle.size14.copyWith(
                    fontWeight: FontWeight.w600,
                    color: danappBlack,
                  ),
                ),
                const Spacer(),
                Container(
                  height: 16.sp,
                  width: 34.sp,
                  decoration: BoxDecoration(
                    color: danappColor15,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text(
                      '4d',
                      style: DanappTextStyle.size10.copyWith(
                        fontWeight: FontWeight.w600,
                        color: danappWhite,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const YMargin(6),
            Text(
              'Team members',
              style: DanappTextStyle.size10.copyWith(
                fontWeight: FontWeight.w400,
                color: danappColor16,
              ),
            ),
            const YMargin(6),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: List.generate(3, (index) {
                        List<String> imageList = [
                          'assets/images/mobile/Ellipse 131.png',
                          'assets/images/mobile/Ellipse 132.png',
                          'assets/images/mobile/Ellipse 133.png',
                        ];
                        return Padding(
                          padding: REdgeInsets.only(right: 6),
                          child: CircleAvatar(
                            radius: 10.sp,
                            backgroundColor: danappTransparent,
                            backgroundImage: AssetImage(imageList[index]),
                          ),
                        );
                      }),
                    ),
                    const YMargin(9),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SvgPicture.asset('assets/svg/Group 7371.svg'),
                        const XMargin(8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Start',
                              style: DanappTextStyle.size10.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 5.sp,
                                color: danappColor17,
                              ),
                            ),
                            const YMargin(3),
                            Text(
                              '27-3-2022',
                              style: DanappTextStyle.size10.copyWith(
                                fontWeight: FontWeight.w400,
                                color: danappColor16,
                              ),
                            ),
                          ],
                        ),
                        const XMargin(14),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'End',
                              style: DanappTextStyle.size10.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 5.sp,
                                color: danappColor18,
                              ),
                            ),
                            const YMargin(3),
                            Text(
                              '27-3-2022',
                              style: DanappTextStyle.size10.copyWith(
                                fontWeight: FontWeight.w400,
                                color: danappColor16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  width: 46.sp,
                  height: 46.sp,
                  child: DashedCircularProgressBar.aspectRatio(
                    aspectRatio: 2, // width ÷ height
                    valueNotifier: _valueNotifier,
                    progress: 40,
                    maxProgress: 100,
                    corners: StrokeCap.butt,
                    foregroundColor: danappColor19,
                    backgroundColor: danappColor20,
                    foregroundStrokeWidth: 5.sp,
                    backgroundStrokeWidth: 5.sp,
                    animation: true,
                    child: Center(
                      child: Text(
                        '${40}%',
                        style: DanappTextStyle.size10.copyWith(
                          fontWeight: FontWeight.w400,
                          color: danappColor16,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
