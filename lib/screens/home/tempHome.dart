import 'package:bowfolios/screens/home/image_placement.dart';
import 'package:bowfolios/screens/home/text_section.dart';
import 'package:flutter/material.dart';

class TempHome extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      //insert a modular bar here
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextSection(
              "Start by making your profile...",
            ),
            ImagePlacement("assets/images/Profile.png"),
            TextSection(
              "The Profiles page shows all the current defined profiles and their associated Projects and Interests:",
            ),
            ImagePlacement("assets/images/Profiles.png"),
            TextSection(
              "The Projects page shows all of the currently defined Projects and their associated Profiles and Interests",
            ),
            ImagePlacement("assets/images/Projects.png"),
            TextSection(
              "Create your own project!",
            ),
            ImagePlacement("assets/images/YourProject.png"),
            TextSection(
              "Finally, the Interests page shows all the currently defined Interests, and their associated Profiles and Projects",
            ),
            ImagePlacement("assets/images/Interests.png"),
          ],
        ),
      ),
    );
  }
}