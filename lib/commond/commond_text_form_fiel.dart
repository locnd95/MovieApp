import 'package:flutter/material.dart';
import 'package:movie_app/commond/commond.dart';
import 'package:sizer/sizer.dart';

class BuildTextFormField extends StatefulWidget {
  BuildTextFormField(
      {Key? key,
      required this.textNormal,
      this.textRich,
      this.iconOff,
      this.iconShow,
      this.noActive = true,
      this.isObscure = false,
      required this.textController,
      this.radioFuncion,
      this.readOnly = false,
      this.prefixIcon})
      : super(key: key);
  final String textNormal;
  final String? textRich;
  final Widget? iconShow;
  final Widget? iconOff;
  final Widget? prefixIcon;
  final bool readOnly;
  final bool noActive;
  bool isObscure;
  final TextEditingController textController;
  void Function()? radioFuncion;
  @override
  State<BuildTextFormField> createState() => _BuildTextFormFieldState();
}

class _BuildTextFormFieldState extends State<BuildTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.noActive,
      readOnly: widget.readOnly,
      controller: widget.textController,
      obscureText: widget.isObscure,
      maxLines: 1,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        contentPadding: EdgeInsets.only(left: 5.s),
        suffixIcon: widget.iconOff != null
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    widget.isObscure = !widget.isObscure;
                  });
                },
                child: widget.isObscure ? widget.iconShow : widget.iconOff)
            : widget.iconShow != null
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        if (widget.radioFuncion != null) {
                          widget.radioFuncion!();
                        }
                      });
                    },
                    child: widget.iconShow!)
                : null,
        label: Text.rich(TextSpan(
            text: widget.textNormal,
            style: CommondText.textSize12W500,
            children: [
              TextSpan(
                  text: widget.textRich,
                  style: CommondText.textSize16W600
                      .copyWith(color: CommondColor.redCommond))
            ])),
        // labelText: widget.textNormal,
        labelStyle: CommondText.textSize16W500Black54
            .copyWith(fontWeight: FontWeight.w400),
      ),
    );
  }
}

// class _BuildGender extends StatelessWidget {
//   const _BuildGender({
//     Key? key,
//     required this.gender,
//     required this.onTapFuncion,
//     required this.isTap,
//   }) : super(key: key);
//   final String gender;
//   final void Function() onTapFuncion;
//   final bool isTap;
//   @override
//   Widget build(BuildContext context) {
//     print("$isTap");

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(gender,
//             style: CommondText.textTittleContents
//                 .copyWith(fontWeight: FontWeight.w500)),
//         GestureDetector(
//           onTap: () {
//             print("$isTap");
//             // print("change");
//             onTapFuncion();
//             print("$isTap");
//           },
//           child: Icon(
//             Icons.circle_outlined,
//             color: isTap ? CommondColor.black45Commond : Colors.red,
//             size: 18.s,
//           ),
//         )
//       ],
//     );
//   }
// }



                      