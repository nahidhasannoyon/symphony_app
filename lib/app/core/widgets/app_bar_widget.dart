import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:symphony_app/app/core/constants/colors.dart';
import 'package:symphony_app/app/core/widgets/cus_text_widget.dart';

class AppBarWidget extends StatelessWidget {
  final bool? willPop;
  final String title;
  final IconButton? action;

  const AppBarWidget({
    super.key,
    this.willPop = true,
    required this.title,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          if (willPop!)
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.red,
              ),
              onPressed: () {
                if (willPop!) {
                  Navigator.of(context).pop();
                } else {
                  Scaffold.of(context).openDrawer();
                }
              },
            ),
          CustomTextWidget(
            text: title,
            color: AppColor.headingText,
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
          ),
          if (action != null) ...[
            const Spacer(),
            action!,
          ],
        ],
      ),
    );
  }
}
