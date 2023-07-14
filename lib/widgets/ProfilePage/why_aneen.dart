import 'package:aneen/widgets/DashboardPage/footer_bar_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aneen/controllers/auth_controller.dart';
import 'package:aneen/pages/register_page.dart';
import 'package:aneen/utils/vertical_spacer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WhyAneen extends StatelessWidget {
  const WhyAneen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200, // Set the desired background color
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              // height: 100,
              child: Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    // Handle button press
                  },
                  style: TextButton.styleFrom(primary: Colors.black),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.dollarSign,
                        size: 55, // Adjust the icon size as desired
                      ),
                      Text(
                        "Aneen.com",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Create an account to sell your content",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              // height: 100,
              child: Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    // Handle button press
                  },
                  style: TextButton.styleFrom(primary: Colors.black),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.video,
                        size: 55, // Adjust the icon size as desired
                      ),
                      Text(
                        "Aneen.com",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Post free Video, It's easy to use.",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              // height: 100,
              child: Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    // Handle button press
                  },
                  style: TextButton.styleFrom(primary: Colors.black),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.shoppingBag,
                        size: 55, // Adjust the icon size as desired
                      ),
                      Text(
                        "Aneen.com",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Market your business with us",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
