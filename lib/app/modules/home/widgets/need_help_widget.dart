import 'package:flutter/material.dart';
import 'package:symphony_app/app/core/widgets/cus_text_wid.dart';

class NeedHelpWidget extends StatelessWidget {
  const NeedHelpWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      height: 128,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.headset_mic_outlined,
            color: Colors.white,
            size: 40,
          ),
          const CusTextWid(
            text: 'Need Help?',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            onPressed: () {},
            child: const CusTextWid(
              text: 'Check Support',
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
