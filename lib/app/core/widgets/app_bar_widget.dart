import 'package:symphony_app/imports.dart';

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
                color: AppColor.iconR,
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