// import 'package:flutter/material.dart';
// import 'package:movie_app/commond/commond.dart';
// import 'package:movie_app/commond/commond_appbar.dart';
// import 'package:movie_app/page/home_screeen_page/data_movie.dart';

// class ListMovie extends StatelessWidget {
//   const ListMovie({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final data = ModalRoute.of(context)!.settings.arguments as List<DataMovie>;
//     return SafeArea(
//       child: Scaffold(
//         appBar: const BuildAppBarBassic(titlle: "Chọn phim của bạn"),
//         body: ListView.builder(
//           itemBuilder: (context, index) => Card(
//               child: ListTile(
//             leading: Image.asset(data[index].linkImage),
//             title: Text(
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               data[index].movieName,
//               style: CommondText.textSize18W500Black,
//             ),
//             subtitle: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   data[index].date,
//                   style: CommondText.textSize16W500,
//                 ),
//                 Text(
//                   data[index].time,
//                   style: CommondText.textSize16W500,
//                 ),
//                 ListView.builder(
//                   shrinkWrap: true,
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (context, index) => _buildList2D3D4DX(
//                     type: listType[index],
//                   ),
//                 ),
//               ],
//             ),
//           )),
//         ),
//       ),
//     );
//   }
// }
