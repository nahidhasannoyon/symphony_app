import 'package:flutter/material.dart';
import 'package:symphony_app/app/core/widgets/cus_text_wid.dart';

class EntertainmentWidget extends StatelessWidget {
  const EntertainmentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CusTextWid(
          text: 'Entertainment',
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: const Image(
            image: AssetImage('assets/images/image3.png'),
          ),
        ),
      ],
    );
  }
}
