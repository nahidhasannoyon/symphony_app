import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:symphony_app/app/modules/home/widgets/app_bar_widget.dart';
import 'package:symphony_app/app/modules/home/widgets/e_warranty_card_widget.dart';
import 'package:symphony_app/app/modules/home/widgets/entertainment_widget.dart';
import 'package:symphony_app/app/modules/home/widgets/games_widget.dart';
import 'package:symphony_app/app/modules/home/widgets/need_help_widget.dart';
import 'package:symphony_app/app/modules/home/widgets/trending_items_widget.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF1F7FF),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Column(
              children: [
                const AppBarWidget(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: const Image(
                    width: double.infinity,
                    fit: BoxFit.cover,
                    height: 160,
                    image: AssetImage('assets/images/image1.png'),
                  ),
                ),
                const SizedBox(height: 20),
                const NeedHelpWidget(),
                const SizedBox(height: 20),
                const TrendingItemsWidget(),
                const SizedBox(height: 20),
                const EntertainmentWidget(),
                const SizedBox(height: 20),
                const EWarrantyCardWidget(),
                const SizedBox(height: 20),
                const GamesWidget(),
                const SizedBox(height: 20),
                SizedBox(
                  height: 128,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: const Image(
                          width: double.infinity,
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/image4.jpg'),
                        ),
                      ),
                      const Center(
                        child: Text(
                          'JOIN SOCIAL COMMUNITY',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
