import 'package:aneen/controllers/dashboard_controller.dart';
import 'package:aneen/utils/vertical_spacer.dart';
import 'package:flutter/material.dart';
import 'package:aneen/widgets/DashboardPage/single_video_card.dart';
import 'package:aneen/widgets/DashboardPage/search_bar_section.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FooterBarSection extends StatelessWidget {
  const FooterBarSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VerticalSpacer(20),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ABOUT US",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  VerticalSpacer(10),
                  TextButton(
                    onPressed: () {
                      // Handle "Frequently Asked Questions" button press
                    },
                    child: Text("Frequently Asked Questions"),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle "Terms and Conditions" button press
                    },
                    child: Text("Terms and Conditions"),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CONTACT & SITEMAP",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  VerticalSpacer(10),
                  TextButton(
                    onPressed: () {
                      // Handle "Contact Us" button press
                    },
                    child: Text("Contact Us"),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle "Sitemap" button press
                    },
                    child: Text("Sitemap"),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "MY ACCOUNT",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  VerticalSpacer(10),
                  TextButton(
                    onPressed: () {
                      // Handle "Log In" button press
                    },
                    child: Text("Log In"),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle "Register" button press
                    },
                    child: Text("Register"),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "FOLLOW US ON",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  VerticalSpacer(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Handle Facebook icon press
                        },
                        icon: FaIcon(
                          FontAwesomeIcons.facebook,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Handle Twitter icon press
                        },
                        icon: FaIcon(
                          FontAwesomeIcons.twitter,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Handle Instagram icon press
                        },
                        icon: FaIcon(
                          FontAwesomeIcons.instagram,
                        ),
                      ),
                      // Add more social media icons as needed
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Get it on App Store button with icon
              TextButton.icon(
                onPressed: () {
                  // Handle App Store button press
                },
                icon: FaIcon(
                  FontAwesomeIcons.apple,
                  color: Colors.blue,
                  size: 30,
                ),
                label: Text("Get it on App Store"),
                style: TextButton.styleFrom(
                  primary: Colors.blue,
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(width: 10),
              // Get it on Play Store button with icon
              TextButton.icon(
                onPressed: () {
                  // Handle Play Store button press
                },
                icon: FaIcon(
                  FontAwesomeIcons.googlePlay,
                  color: Colors.red,
                  size: 30,
                ),
                label: Text("Get it on Play Store"),
                style: TextButton.styleFrom(
                  primary: Colors.red,
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          VerticalSpacer(20)
        ],
      ),
    );
  }
}
