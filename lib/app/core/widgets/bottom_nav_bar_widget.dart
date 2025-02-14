import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r),
        topRight: Radius.circular(20.r),
      ),
      child: Container(
        height: 96.h,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 1,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.public,
                size: 24.w,
              ),
              label: 'Website',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 24.w,
                color: Colors.red,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.people,
                size: 24.w,
              ),
              label: 'Social',
            ),
          ],
          currentIndex: 1,
          onTap: (index) {
            // Add your navigation logic here.
          },
        ),
      ),
    );
  }
}
