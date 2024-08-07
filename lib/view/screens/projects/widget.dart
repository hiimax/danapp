import 'package:flutter/material.dart';
import 'package:multi_dropdown/multi_dropdown.dart';

import '../../../res/import/import.dart';

var items = [
  DropdownItem(
      label: 'Design',
      value: Tags(
          name: 'Design', bgColor: danappColor24, textColor: danappColor18)),
  DropdownItem(
      label: 'Front end',
      value: Tags(
          name: 'Front end', bgColor: danappColor22, textColor: danappColor8)),
  DropdownItem(
      label: 'Backend',
      value: Tags(
          name: 'Backend',
          bgColor: danappColor23,
          textColor: danappPrimaryColor)),
];

class Tags {
  final String name;
  final Color bgColor, textColor;

  Tags({required this.name, required this.bgColor, required this.textColor});

  @override
  String toString() {
    return name;
  }
}

class OverlayPercentageWidget extends StatelessWidget {
  const OverlayPercentageWidget({Key? key, this.onTap}) : super(key: key);
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: 225.sp,
        height: 503.sp,
        decoration: BoxDecoration(
            color: danappWhite,
            borderRadius: BorderRadius.circular(10),
            // border: Border.all(
            //   color: danappColor5,
            // ),
            boxShadow: [
              BoxShadow(
                blurRadius: 12,
                offset: const Offset(0, 8),
                color: danappBlack.withOpacity(0.1),
              ),
              BoxShadow(
                blurRadius: 12,
                offset: const Offset(0, -8),
                color: danappColor1.withOpacity(0.05),
              ),
            ]),
        child: Column(
          children: [
            Padding(
              padding: REdgeInsets.fromLTRB(20, 25, 20, 0),
              child: Row(
                children: [
                  Text(
                    'Progress %',
                    style: DanappTextStyle.size12.copyWith(
                        color: danappColor26.withOpacity(0.8), fontSize: 13.sp),
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/images/mobile/fluent_clipboard-more-20-regular.png',
                    width: 24.sp,
                    height: 24.sp,
                  )
                ],
              ),
            ),
            const YMargin(20),
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (ctx, index) {
                    return GestureDetector(
                      onTap: onTap,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(32, 0, 0, 0),
                        child: Text(
                          '${index + 1}0%',
                          style: DanappTextStyle.size12.copyWith(
                              color: danappColor26.withOpacity(0.8),
                              fontSize: 13.sp),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return Padding(
                      padding: REdgeInsets.fromLTRB(0, 6, 0, 6),
                      child: Divider(
                        color: danappColor5,
                        thickness: 0.5.sp,
                      ),
                    );
                  },
                  itemCount: 10),
            )
          ],
        ),
      ),
    );
  }
}
