import 'package:flutter/material.dart';
import 'package:symphony_app/app/core/widgets/cus_text_wid.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CusTextWid(
            text: 'My Symphony',
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu_rounded),
          ),
        ],
      ),
    );
  }
}
