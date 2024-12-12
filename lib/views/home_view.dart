import 'package:delopus_task/widgets/search_bar.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(172, 172, 182, 1),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  const Text(
                    "Search for Architects near you!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 2),
                  CustomSearchBar(
                    onSearch: (query) {},
                  ),
                  const SizedBox(height: 80),
                  SizedBox(
                    height: 230,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildCourseCard(
                          title: "BIM Revit",
                          duration: "6 Month Course",
                          imagePath:
                              "assets/images/Screenshot 2024-12-11 133816.png",
                          url: "https://www.delopus.com",
                        ),
                        _buildCourseCard(
                          title: "Journalism",
                          duration: "2 Month Course",
                          imagePath:
                              "assets/images/Screenshot 2024-12-11 133832.png",
                          url: "https://www.delopus.com",
                        ),
                        _buildCourseCard(
                          title: "BIM Revit",
                          duration: "6 Month Course",
                          imagePath:
                              "assets/images/Screenshot 2024-12-11 133816.png",
                          url: "https://www.delopus.com",
                        ),
                        _buildCourseCard(
                          title: "BIM Revit",
                          duration: "6 Month Course",
                          imagePath:
                              "assets/images/Screenshot 2024-12-11 133816.png",
                          url: "https://www.delopus.com",
                        ),
                        _buildCourseCard(
                          title: "Journalism",
                          duration: "2 Month Course",
                          imagePath:
                              "assets/images/Screenshot 2024-12-11 133832.png",
                          url: "https://www.delopus.com",
                        ),
                        _buildCourseCard(
                          title: "BIM Revit",
                          duration: "6 Month Course",
                          imagePath:
                              "assets/images/Screenshot 2024-12-11 133816.png",
                          url: "https://www.delopus.com",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Courses Slider",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCourseCard({
    required String title,
    required String duration,
    required String imagePath,
    required String url,
  }) {
    return GestureDetector(
      onTap: () => _launchUrl(url),
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromRGBO(217, 217, 217, 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color.fromARGB(255, 1, 36, 65),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                duration,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 16,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.card_membership,
                    size: 16,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.workspace_premium,
                    size: 16,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: SizedBox(
                  height: 120,
                  width: 160,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
