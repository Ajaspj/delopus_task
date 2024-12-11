// import 'package:flutter/material.dart';

// class CustomSearchBar extends StatelessWidget {
//   final TextEditingController controller;
//   final Function(String) onSearch;

//   const CustomSearchBar(
//       {super.key, required this.controller, required this.onSearch});

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: 5,
//       borderRadius: BorderRadius.circular(15),
//       child: Container(
//         width: MediaQuery.of(context).size.width * 10,
//         height: 60,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10), color: Colors.grey[300]),
//         child: Center(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 width: MediaQuery.of(context).size.width * 0.75,
//                 margin: const EdgeInsets.symmetric(vertical: 5),
//                 child: TextField(
//                   controller: controller,
//                   onChanged: onSearch,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(6),
//                       borderSide:
//                           const BorderSide(color: Colors.black, width: 1),
//                     ),
//                     contentPadding: const EdgeInsets.symmetric(vertical: 8),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: GestureDetector(
//                   onTap: () => onSearch(controller.text),
//                   child: Container(
//                     height: 50,
//                     width: 50,
//                     color: Colors.orange,
//                     child: const Center(
//                       child: Icon(
//                         Icons.search,
//                         color: Colors.white,
//                       ),
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
// }

import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSearch;

  const CustomSearchBar(
      {super.key, required this.controller, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: MediaQuery.of(context).size.width * 10,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[300],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: TextField(
                  controller: controller,
                  onChanged: onSearch,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 12, // Adjusts vertical padding for cursor
                      horizontal: 12, // Adds space around the cursor
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: GestureDetector(
                  onTap: () => onSearch(controller.text),
                  child: Container(
                    height: 50,
                    width: 50,
                    color: Colors.orange,
                    child: const Center(
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
