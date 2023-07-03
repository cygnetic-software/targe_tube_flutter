import 'package:flutter/material.dart';

class CategoryWithBackground extends StatelessWidget {
  final String buttonName;

  const CategoryWithBackground(this.buttonName);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Container(
              width: 150, // Set the desired width
              height: 160, // Set the desired height
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 0, 0, 0),
                    Color.fromARGB(255, 50, 52, 53)
                  ], // Set the gradient colors
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                image: DecorationImage(
                  scale: 2.0,
                  image: AssetImage(
                    'assets/images/aneenLogo.png',
                  ), // Set the path to your background image
                  fit: BoxFit.cover,
                ),
              ),
              child: ElevatedButton(
                onPressed: () {
                  // Handle button press
                  print('Button pressed');
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.all(15),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    buttonName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
