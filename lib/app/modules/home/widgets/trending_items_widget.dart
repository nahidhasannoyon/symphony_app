import 'package:flutter/material.dart';
import 'package:symphony_app/app/core/widgets/cus_text_wid.dart';

class TrendingItemsWidget extends StatelessWidget {
  const TrendingItemsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CusTextWid(
          text: 'Trending items',
          fontSize: 16,
          fontWeight: FontWeight.w700,
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
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CusTextWid(
                          text: 'Name',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: 100,
                        height: 80,
                        child: Image(
                          fit: BoxFit.scaleDown,
                          image: AssetImage(
                            'assets/images/image2.png',
                          ),
                        ),
                      ),
                    ],
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
