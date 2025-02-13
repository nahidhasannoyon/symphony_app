import 'package:flutter/material.dart';
import 'package:symphony_app/app/core/widgets/cus_text_wid.dart';

class EWarrantyCardWidget extends StatelessWidget {
  const EWarrantyCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CusTextWid(
          text: 'E-warranty card',
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
          ),
          height: 100,
          width: double.infinity,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Image(
                  height: 80,
                  width: 60,
                  fit: BoxFit.contain,
                  image: AssetImage(
                    'assets/images/image2.png',
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CusTextWid(
                        text: 'Helio 50',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      SizedBox(height: 6),
                      CusTextWid(
                        text: 'Valid for 406 Days',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                      CusTextWid(
                        text: 'Expiry Date: December 10, 2024',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.red,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
