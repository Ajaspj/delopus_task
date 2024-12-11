// import 'package:delopus_task/widgets/search_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../controllers/search_provider.dart';
// import '../widgets/user_card.dart';
// import 'package:url_launcher/url_launcher.dart';

// class HomeView extends StatelessWidget {
//   final TextEditingController _searchController = TextEditingController();

//   HomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey,
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const SizedBox(height: 40),
//                 const Text(
//                   "Search for Architects near you!",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 CustomSearchBar(
//                   controller: _searchController,
//                   onSearch: (query) {
//                     Provider.of<SearchProvider>(context, listen: false)
//                         .searchUsers(query);
//                   },
//                 ),
//                 const SizedBox(height: 60),
//                 SizedBox(
//                   height: 300,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: [
//                       _buildCourseCard(
//                         title: "BIM Revit",
//                         duration: "6 Month Course",
//                         imagePath:
//                             "assets/images/Screenshot 2024-12-11 133816.png",
//                         url: "https://www.delopus.com",
//                       ),
//                       _buildCourseCard(
//                         title: "Journalism",
//                         duration: "2 Month Course",
//                         imagePath:
//                             "assets/images/Screenshot 2024-12-11 133832.png",
//                         url: "https://www.delopus.com",
//                       ),
//                       _buildCourseCard(
//                         title: "BIM Revit",
//                         duration: "6 Month Course",
//                         imagePath:
//                             "assets/images/Screenshot 2024-12-11 133816.png",
//                         url: "https://www.delopus.com",
//                       ),
//                       _buildCourseCard(
//                         title: "BIM Revit",
//                         duration: "6 Month Course",
//                         imagePath:
//                             "assets/images/Screenshot 2024-12-11 133816.png",
//                         url: "https://www.delopus.com",
//                       ),
//                       _buildCourseCard(
//                         title: "Journalism",
//                         duration: "2 Month Course",
//                         imagePath:
//                             "assets/images/Screenshot 2024-12-11 133832.png",
//                         url: "https://www.delopus.com",
//                       ),
//                       _buildCourseCard(
//                         title: "BIM Revit",
//                         duration: "6 Month Course",
//                         imagePath:
//                             "assets/images/Screenshot 2024-12-11 133816.png",
//                         url: "https://www.delopus.com",
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 const Text(
//                   "Courses Slider",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 Consumer<SearchProvider>(
//                   builder: (context, searchProvider, child) {
//                     if (searchProvider.isLoading) {
//                       return const Center(child: CircularProgressIndicator());
//                     }

//                     if (searchProvider.errorMessage.isNotEmpty) {
//                       return Center(child: Text(searchProvider.errorMessage));
//                     }

//                     return SizedBox(
//                       height: 400,
//                       child: ListView.builder(
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         itemCount: searchProvider.users.length,
//                         itemBuilder: (context, index) {
//                           return UserCard(user: searchProvider.users[index]);
//                         },
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCourseCard({
//     required String title,
//     required String duration,
//     required String imagePath,
//     required String url,
//   }) {
//     return GestureDetector(
//       onTap: () => _launchUrl(url), // Use the refactored URL launch function
//       child: SingleChildScrollView(
//         child: Container(
//           width: 130,
//           margin: const EdgeInsets.only(right: 16),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(16),
//             color: Colors.white,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   title,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                     color: Color.fromARGB(255, 1, 36, 65),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: Text(
//                   duration,
//                   style: const TextStyle(
//                     fontSize: 10,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 8),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 8.0),
//                 child: Icon(
//                   Icons.calendar_today,
//                   size: 16,
//                   color: Colors.grey,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ClipRRect(
//                   borderRadius: const BorderRadius.all(Radius.circular(10)),
//                   child: Container(
//                     alignment: Alignment.center,
//                     height: 120,
//                     width: 120,
//                     child: Image.asset(
//                       imagePath,
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Refactored URL launch function
//   Future<void> _launchUrl(String url) async {
//     final Uri uri = Uri.parse(url);
//     if (!await launchUrl(
//       uri,
//       mode: LaunchMode.externalApplication,
//     )) {
//       throw Exception('Could not launch $url');
//     }
//   }
// }

import 'package:delopus_task/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/search_provider.dart';
import '../widgets/user_card.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ConstrainedBox(
            constraints:
                const BoxConstraints(maxWidth: 500), // Center and limit width
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  const Text(
                    "Search for Architects near you!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  CustomSearchBar(
                    controller: _searchController,
                    onSearch: (query) {
                      Provider.of<SearchProvider>(context, listen: false)
                          .searchUsers(query);
                    },
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    height: 220,
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
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Consumer<SearchProvider>(
                    builder: (context, searchProvider, child) {
                      if (searchProvider.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (searchProvider.errorMessage.isNotEmpty) {
                        return Center(child: Text(searchProvider.errorMessage));
                      }

                      return ListView.builder(
                        shrinkWrap:
                            true, // Allows ListView to adjust its height
                        physics:
                            const BouncingScrollPhysics(), // Smooth scrolling
                        itemCount: searchProvider.users.length,
                        itemBuilder: (context, index) {
                          return UserCard(user: searchProvider.users[index]);
                        },
                      );
                    },
                  ),
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
        width: 130,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
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
                  fontSize: 18,
                  color: Color.fromARGB(255, 1, 36, 65),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                duration,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.calendar_today,
                size: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Container(
                  alignment: Alignment.center,
                  height: 120,
                  width: 120,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
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
