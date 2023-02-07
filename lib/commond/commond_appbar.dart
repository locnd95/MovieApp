import 'package:flutter/material.dart';
import 'package:movie_app/commond/commond.dart';
import 'package:sizer/sizer.dart';

// class BuildAppBarCommond extends StatelessWidget
//     implements PreferredSizeWidget {
//   const BuildAppBarCommond({
//     Key? key,
//     required this.titlle,
//     this.isLeading = true,
//     this.actionWidget,
//   }) : super(key: key);
//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
//   final String titlle;
//   final bool isLeading;
//   final List<Widget>? actionWidget;

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       actions: actionWidget != null ? actionWidget! : null,
//       backgroundColor: Colors.white,
//       elevation: 0,
//       leading: !isLeading
//           ? GestureDetector(
//               onTap: () => Navigator.pop(context),
//               child: Icon(
//                 Icons.arrow_back,
//                 size: 30.s,
//                 color: CommondColor.redCommond,
//               ),
//             )
//           : null,
//       title: Text(titlle,
//           style: CommondText.textSize18W600White
//               .copyWith(color: CommondColor.blackCommond)),
//     );
//   }
// }

class AppBarCommond extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCommond({
    Key? key,
    required this.titlle,
    this.isLeading = false,
    this.actionWidget,
    this.isBackgroundColor = false,
  }) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  final String titlle;
  final bool isLeading;
  final List<Widget>? actionWidget;
  final bool isBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        actions: actionWidget,
        leading: isLeading
            ? GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back,
                  size: 30.s,
                  color: CommondColor.blackCommond,
                ),
              )
            : null,
        backgroundColor:
            isBackgroundColor ? Colors.red[600] : Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          titlle,
          style: CommondText.textSize18W500Black,
        ));
  }
}
