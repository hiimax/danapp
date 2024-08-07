import 'package:danapp/res/import/import.dart';
import 'package:danapp/view/screens/projects/add_task.dart';
import 'package:danapp/view/screens/projects/create_project.dart';

class Project extends StatefulWidget {
  const Project({super.key});

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: danappColor14,
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.fromLTRB(24, 24, 24, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const BackButton(),
                  const Spacer(),
                  SizedBox(
                    width: 98.29.sp,
                    height: 24.sp,
                    child: CustomButton2(
                      title: 'Create Project',
                      textSize: 9.sp,
                      radius: BorderRadius.circular(3),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: const CreateProject(),
                              duration: const Duration(milliseconds: 150),
                              curve: Curves.decelerate,
                              ctx: context),
                        );
                      },
                      textColor: danappPrimaryColor,
                      buttonColor: danappTransparent,
                      borderColor: danappPrimaryColor,
                    ),
                  )
                ],
              ),
              const YMargin(12),
              Text(
                'Projects',
                style: DanappTextStyle.size24.copyWith(
                  fontWeight: FontWeight.w600,
                  color: danappBlack,
                ),
              ),
              const YMargin(28),
              Expanded(
                child: ListView.separated(
                  itemCount: 5,
                  itemBuilder: (context, index) => const ProjectWidget(),
                  separatorBuilder: (context, index) => const YMargin(16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectWidget extends StatefulWidget {
  const ProjectWidget({super.key});

  @override
  State<ProjectWidget> createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
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
                CircleAvatar(
                  radius: 10.sp,
                  backgroundColor: danappTransparent,
                  backgroundImage:
                      AssetImage('assets/images/mobile/Ellipse 133.png'),
                ),
                const XMargin(10),
                Text(
                  'Liberty Pay ',
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
                    color: danappColor18,
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
            const YMargin(11),
            Row(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                const Spacer(),
                SizedBox(
                  width: 66.sp,
                  height: 21.sp,
                  child: CustomButton2(
                    title: 'Add Task',
                    textSize: 10.sp,
                    radius: BorderRadius.circular(3),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: const AddTask(
                              isEdit: false,
                            ),
                            duration: const Duration(milliseconds: 150),
                            curve: Curves.decelerate,
                            ctx: context),
                      );
                    },
                    textColor: danappPrimaryColor,
                    buttonColor: danappTransparent,
                    borderColor: danappPrimaryColor,
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
