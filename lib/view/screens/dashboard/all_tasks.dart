import 'package:danapp/res/import/import.dart';
import 'package:danapp/view/screens/dashboard/dashboard.dart';
import 'package:danapp/view/screens/projects/add_task.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({super.key});

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
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
                  const CustomBackButton(),
                ],
              ),
              const YMargin(12),
              Text(
                'Add task',
                style: DanappTextStyle.size24.copyWith(
                  fontWeight: FontWeight.w600,
                  color: danappBlack,
                ),
              ),
              const YMargin(28),
              Expanded(
                child: ListView.separated(
                  itemCount: 5,
                  itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: const AddTask(
                                isEdit: true,
                              ),
                              duration: const Duration(milliseconds: 150),
                              curve: Curves.decelerate,
                              ctx: context),
                        );
                      },
                      child: const TaskWidget()),
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
