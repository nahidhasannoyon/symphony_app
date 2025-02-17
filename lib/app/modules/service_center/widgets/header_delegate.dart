import 'package:symphony_app/app/core/constants/imports.dart';

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  HeaderDelegate({required this.child, required this.height});

  @override
  double get minExtent => height;

  @override
  double get maxExtent => minExtent;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(
      height: height,
      child: child,
    );
  }

  @override
  bool shouldRebuild(covariant HeaderDelegate oldDelegate) =>
      oldDelegate.child != child || oldDelegate.height != height;
}