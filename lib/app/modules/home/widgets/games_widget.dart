import 'package:flutter/material.dart';
import 'package:symphony_app/app/core/widgets/cus_text_wid.dart';

class GamesWidget extends StatelessWidget {
  const GamesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CusTextWid(
              text: 'Games',
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            Row(
              children: [
                CusTextWid(
                  text: 'See More',
                  fontSize: 14,
                  color: Colors.red,
                  fontWeight: FontWeight.w700,
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.red,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 126,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  width: 100,
                  height: 125,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Image(
                    fit: BoxFit.scaleDown,
                    image: AssetImage(
                      'assets/images/image2.png',
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
