import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:danapp/res/import/import.dart';
import 'package:danapp/view/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/multi_dropdown.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key, required this.isEdit});
  final bool isEdit;

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final controller = MultiSelectController<Tags>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  int imageList = 3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    super.dispose();
  }

  var items = [
    DropdownItem(
        label: 'Design',
        value: Tags(
            name: 'Design', bgColor: danappColor24, textColor: danappColor18)),
    DropdownItem(
        label: 'Front end',
        value: Tags(
            name: 'Front end',
            bgColor: danappColor22,
            textColor: danappColor8)),
    DropdownItem(
        label: 'Backend',
        value: Tags(
            name: 'Backend',
            bgColor: danappColor23,
            textColor: danappPrimaryColor)),
  ];
  List<DateTime?> _dates = [
    DateTime.now().add(const Duration(days: 1)),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: danappColor14,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: REdgeInsets.fromLTRB(24, 24, 24, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackButton(),
                const YMargin(12),
                Text(
                 widget.isEdit ? 'Edit task' : 'Add task',
                  style: DanappTextStyle.size24.copyWith(
                    fontWeight: FontWeight.w600,
                    color: danappBlack,
                  ),
                ),
                const YMargin(28),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Task Name',
                      style: DanappTextStyle.size12.copyWith(
                        color: danappColor1,
                      ),
                    ),
                    const YMargin(8),
                    SizedBox(
                      height: 34.sp,
                      child: CustomTextFormField(
                        hintText: 'Task Name',
                        fillColor: danappTransparent,
                        textStyle: DanappTextStyle.size14.copyWith(),
                        enabledBorderColor: danappTransparent,
                        focusedBorderColor: danappTransparent,
                        errorBorderColor: danappTransparent,
                        borderRadius: 10.sp,
                        textInputType: TextInputType.name,
                        textInputFormatter: [
                          FilteringTextInputFormatter.singleLineFormatter
                        ],
                      ),
                    ),
                    const Divider(
                      color: danappColor5,
                    ),
                  ],
                ),
                const YMargin(46),
                Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Created (from)',
                            style: DanappTextStyle.size12.copyWith(
                              color: danappColor1,
                            ),
                          ),
                          const YMargin(8),
                          SizedBox(
                            height: 34.sp,
                            child: CustomTextFormField(
                              hintText: 'select date',
                              fillColor: danappTransparent,
                              controller: startDateController,
                              textStyle: DanappTextStyle.size14.copyWith(),
                              enabledBorderColor: danappTransparent,
                              focusedBorderColor: danappTransparent,
                              errorBorderColor: danappTransparent,
                              readonly: true,
                              onTap: () async {
                                final values =
                                    await showCalendarDatePicker2Dialog(
                                  context: context,
                                  config:
                                      CalendarDatePicker2WithActionButtonsConfig(),
                                  dialogSize: const Size(325, 370),
                                  borderRadius: BorderRadius.circular(15),
                                  value: _dates,
                                  dialogBackgroundColor: Colors.white,
                                );
                                if (values != null) {
                                  startDateController.text = values.first!
                                      .toLocal()
                                      .toString()
                                      .split(' ')[0];
                                }
                              },
                              prefixIcon: Padding(
                                padding: REdgeInsets.only(right: 5),
                                child: SizedBox(
                                  width: 24.sp,
                                  child: const Icon(
                                      Icons.calendar_today_outlined,
                                      color: danappColor21),
                                ),
                              ),
                            ),
                          ),
                          const Divider(
                            color: danappColor5,
                          ),
                        ],
                      ),
                    ),
                    const XMargin(35),
                    Expanded(
                      flex: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'End (to)',
                            style: DanappTextStyle.size12.copyWith(
                              color: danappColor1,
                            ),
                          ),
                          const YMargin(8),
                          SizedBox(
                            height: 34.sp,
                            child: CustomTextFormField(
                              hintText: 'select date',
                              fillColor: danappTransparent,
                              textStyle: DanappTextStyle.size14.copyWith(),
                              enabledBorderColor: danappTransparent,
                              focusedBorderColor: danappTransparent,
                              errorBorderColor: danappTransparent,
                              controller: endDateController,
                              readonly: true,
                              onTap: () async {
                                final values =
                                    await showCalendarDatePicker2Dialog(
                                  context: context,
                                  config:
                                      CalendarDatePicker2WithActionButtonsConfig(),
                                  dialogSize: const Size(325, 370),
                                  borderRadius: BorderRadius.circular(15),
                                  value: _dates,
                                  dialogBackgroundColor: Colors.white,
                                );
                                if (values != null) {
                                  endDateController.text = values.first!
                                      .toLocal()
                                      .toString()
                                      .split(' ')[0];
                                }
                              },
                              prefixIcon: Padding(
                                padding: REdgeInsets.only(right: 5),
                                child: SizedBox(
                                  width: 24.sp,
                                  child: const Icon(
                                      Icons.calendar_today_outlined,
                                      color: danappColor21),
                                ),
                              ),
                            ),
                          ),
                          const Divider(
                            color: danappColor5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const YMargin(24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add Staffs:',
                      style: DanappTextStyle.size12.copyWith(
                        color: danappColor1,
                      ),
                    ),
                    const YMargin(9),
                    Row(
                      children: [
                        Stack(
                          children: List.generate(
                            imageList,
                            (index) => Padding(
                              padding: REdgeInsets.only(
                                  left: index == 0 ? 0 : (index * 20)),
                              child: Container(
                                width: 24.sp,
                                height: 24.sp,
                                decoration: const BoxDecoration(
                                    color: danappColor25,
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: CircleAvatar(
                                    radius: 11.sp,
                                    backgroundColor: danappWhite,
                                    backgroundImage: const AssetImage(
                                      'assets/images/mobile/Ellipse 131.png',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              imageList += 1;
                            });
                          },
                          child: Container(
                            width: 20.sp,
                            height: 20.sp,
                            decoration: const BoxDecoration(
                              color: danappPrimaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: danappWhite,
                                size: 14.sp,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const Divider(
                      color: danappColor5,
                    ),
                  ],
                ),
                const YMargin(24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tags:',
                      style: DanappTextStyle.size12.copyWith(
                        color: danappColor1,
                      ),
                    ),
                    const YMargin(9),
                    MultiDropdown<Tags>(
                      items: items,
                      controller: controller,
                      enabled: true,
                      searchEnabled: false,
                      closeOnBackButton: true,
                      selectedItemBuilder: (item) {
                        return Container(
                          width: 68.sp,
                          height: 18.sp,
                          decoration: BoxDecoration(
                            color: item.value.bgColor,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              item.value.name,
                              style: DanappTextStyle.size10.copyWith(
                                color: item.value.textColor,
                              ),
                            ),
                          ),
                        );
                      },
                      fieldDecoration: FieldDecoration(
                        hintText: 'Select a tag',
                        hintStyle: const TextStyle(color: danappGrey),
                        // prefixIcon: const Icon(CupertinoIcons.flag),
                        showClearIcon: false,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(color: danappTransparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: danappTransparent,
                          ),
                        ),
                      ),
                      dropdownDecoration: const DropdownDecoration(
                        marginTop: 2,
                        maxHeight: 500,
                      ),
                      dropdownItemDecoration: DropdownItemDecoration(
                        selectedIcon:
                            const Icon(Icons.check_box, color: Colors.green),
                        disabledIcon:
                            Icon(Icons.lock, color: Colors.grey.shade300),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a tasks';
                        }
                        return null;
                      },
                      onSelectionChange: (selectedItems) {},
                    ),
                    const Divider(
                      color: danappColor5,
                    ),
                  ],
                ),
                const YMargin(24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Comment::',
                      style: DanappTextStyle.size12.copyWith(
                        color: danappColor1,
                      ),
                    ),
                    const YMargin(7),
                    CustomTextFormField(
                      hintText: '',
                      fillColor: danappTransparent,
                      textStyle: DanappTextStyle.size14.copyWith(),
                      enabledBorderColor: danappColor5,
                      focusedBorderColor: danappColor5,
                      errorBorderColor: danappColor5,
                      maxLines: 3,
                      borderRadius: 10.sp,
                      textInputType: TextInputType.name,
                      textInputFormatter: [
                        FilteringTextInputFormatter.singleLineFormatter
                      ],
                    ),
                    const YMargin(19),
                    CustomButton(
                      title: 'Add task',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Tags {
  final String name;
  final Color bgColor, textColor;

  Tags({required this.name, required this.bgColor, required this.textColor});

  @override
  String toString() {
    return name;
  }
}
