import 'package:flutter/material.dart';

import '../screens/category.dart';

class CatBlock extends StatelessWidget {
   String categoryName;
  String categoryImgSrc;
  
     CatBlock({super.key,
  required this.categoryImgSrc,
  required this.categoryName
   });

   @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryScreen(
                    catImgUrl: categoryImgSrc, catName: categoryName)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 7),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                  height: 50, width: 100, fit: BoxFit.cover, categoryImgSrc),
            ),
            Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(12)),
            ),
            Positioned(
                left: 30,
                top: 15,
                child: Text(
                  categoryName,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ))
          ],
        ),
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 7),
//       child: Stack(children: [
//         ClipRRect(
//           borderRadius: BorderRadius.circular(12),
//           child: Image.network(
//             height: 50,
//             width: 100,
//            // imgSrc,
//           "https://images.pexels.com/photos/2127733/pexels-photo-2127733.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//             fit: BoxFit.cover,
//           ),
//         ),
//         Container(
//           height: 50,
//           width: 100,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12), color: Colors.black26),
//         ),
//         const Positioned(
//           left: 25,
//           child: Text(
//             "Cars",
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
//           ),
//         )
//       ]),
//     );
//   }
// }
