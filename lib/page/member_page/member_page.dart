import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_app/commond/commond.dart';
import 'package:movie_app/commond/commond_appbar.dart';
import 'package:movie_app/commond/commond_local_store.dart';
import 'package:movie_app/router/router.dart';
import 'package:sizer/sizer.dart';

class MemberPage extends StatefulWidget {
  const MemberPage({super.key});

  @override
  State<MemberPage> createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  File? imageFile;
  String name = "User";
  String id = "000xxxx00000";
  String image = "";

  @override
  initState() {
    getUserInfor();
    super.initState();
  }

  void getUserInfor() async {
    name = await LocalUserCommond.getUserName();
    id = await LocalUserCommond.getId();
    image = await LocalUserCommond.getImage();
    setState(() {
      name;
      id;
      image;
      // isLogin = true;
    });
  }

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      // maxWidth: 1800,
      // maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      // maxWidth: 1800,
      // maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  List<InforUser> listInforUser = [
    InforUser(content: "Thông tin người dùng", iconData: Icons.contact_mail),
    InforUser(content: "Thay đổi mật khẩu", iconData: Icons.lock_open),
    InforUser(
        content: "Cài đặt mật mã thanh toán", iconData: Icons.credit_card),
    InforUser(content: "Thẻ thành viên", iconData: Icons.card_membership),
    InforUser(content: "Điểm CGV", iconData: Icons.savings),
    InforUser(
        content: "Thẻ qùa tặng | Voucher ", iconData: Icons.card_giftcard),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarCommond(titlle: "Thành viên CGV"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  child: CircleAvatar(
                radius: 40.0,
                backgroundColor: Colors.white,
                child: image != ""
                    ? CircleAvatar(
                        radius: 38.s,
                        backgroundImage: NetworkImage(
                          image,
                        ),
                      )
                    : imageFile == null
                        ? GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return FractionallySizedBox(
                                    widthFactor: 0.9,
                                    child: Material(
                                      type: MaterialType.transparency,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                TextButton(
                                                  onPressed: () {
                                                    _getFromGallery();
                                                  },
                                                  child: const Text(
                                                      "Chọn từ thư viện"),
                                                ),
                                                Divider(
                                                  height: 2.s,
                                                  color:
                                                      CommondColor.blackCommond,
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    _getFromCamera();
                                                  },
                                                  child: const Text(
                                                      "Chụp từ máy ảnh"),
                                                ),
                                                Divider(
                                                  height: 2.s,
                                                  color:
                                                      CommondColor.blackCommond,
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: double.infinity,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                            ),
                                            child: TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                "Hủy bỏ",
                                                style: TextStyle(
                                                    color: CommondColor
                                                        .blackCommond),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 40,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: const CircleAvatar(
                              radius: 38,
                              backgroundImage: AssetImage(
                                  'assets/images2/image_avatar_defaul.png'),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 12.0,
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: 15.0,
                                    color: Color(0xFF404040),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return FractionallySizedBox(
                                    widthFactor: 0.9,
                                    child: Material(
                                      type: MaterialType.transparency,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                TextButton(
                                                  onPressed: () {
                                                    _getFromGallery();
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text(
                                                      "Chọn từ thư viện"),
                                                ),
                                                Divider(
                                                  height: 2.s,
                                                  color:
                                                      CommondColor.blackCommond,
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    _getFromCamera();
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text(
                                                      "Chụp từ máy ảnh"),
                                                ),
                                                Divider(
                                                  height: 2.s,
                                                  color:
                                                      CommondColor.blackCommond,
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: double.infinity,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                            ),
                                            child: TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                "Hủy bỏ",
                                                style: TextStyle(
                                                    color: CommondColor
                                                        .blackCommond),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 40,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: ClipOval(
                              child: Image.file(
                                width: 80.s,
                                height: 80.s,
                                imageFile!,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
              )),
              Text(
                name,
                style: CommondText.textSize20W500Black,
              ),
              _buildNumberCard(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildSpending(),
                  _buildRewardPoints(),
                ],
              ),
              _buildRewardAchievements(),
              Gap(10.s),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.s),
                child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => _BuildInforUser(
                          content: listInforUser[index].content,
                          iconData: listInforUser[index].iconData,
                          function: () {
                            // print(index);

                            index == 0
                                ? Navigator.pushNamed(context,
                                    RouterName.confirmPasswordToShowUser)
                                : index == 1
                                    ? Navigator.pushNamed(
                                        context, RouterName.changePasswordPage)
                                    : index == 2
                                        ? Navigator.pushNamed(context,
                                            RouterName.settingPasswordPayment)
                                        : Navigator.pushNamed(
                                            context, RouterName.cardMember);
                          },
                        ),
                    separatorBuilder: (context, index) => Divider(
                          thickness: 1.s,
                          color: CommondColor.black54Commond,
                        ),
                    itemCount: 4),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.s),
                child: Container(color: CommondColor.grayCommond, height: 30.s),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.s),
                child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => _BuildInforUser(
                        function: () {
                          // print(index);
                          index == 0
                              ? Navigator.pushNamed(
                                  context, RouterName.poitnCGVPage)
                              : Navigator.pushNamed(
                                  context, RouterName.giftVoucherCoupon);
                        },
                        content: listInforUser[index + 4].content,
                        iconData: listInforUser[index + 4].iconData),
                    separatorBuilder: (context, index) => Divider(
                          thickness: 1.s,
                          color: CommondColor.black54Commond,
                        ),
                    itemCount: 2),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.s),
                child: Container(color: CommondColor.grayCommond, height: 30.s),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.s),
                child: _BuildInforUser(
                  content: "Lịch sử giao dịch",
                  function: () {
                    Navigator.pushNamed(context, RouterName.historyDeal);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildRewardAchievements() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.s),
      child: Column(
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Expanded(
                child: _BuildMemberType(
                  textAlign: TextAlign.start,
                  type: "Member",
                  colors: Colors.grey,
                ),
              ),
              Expanded(
                child: _BuildMemberType(
                  textAlign: TextAlign.center,
                  type: "Silver Member",
                  colors: Colors.purpleAccent,
                ),
              ),
              Expanded(
                child: _BuildMemberType(
                  textAlign: TextAlign.end,
                  type: "Gold Member",
                  colors: Colors.redAccent,
                ),
              ),
            ],
          ),
          Container(
            height: 20.s,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.s),
                color: CommondColor.grayCommond),
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Expanded(
                child: _BuildMemberType(
                  textAlign: TextAlign.start,
                  type: "0",
                  colors: Colors.grey,
                ),
              ),
              Expanded(
                child: _BuildMemberType(
                  textAlign: TextAlign.center,
                  type: "4.000.000",
                  colors: Colors.grey,
                ),
              ),
              Expanded(
                child: _BuildMemberType(
                  textAlign: TextAlign.end,
                  type: "8.000.000",
                  colors: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column _buildRewardPoints() {
    return Column(
      children: [
        Text(
          "Điểm thưởng",
          style: CommondText.textSize16W500.copyWith(color: Colors.pinkAccent),
        ),
        Text("0 ", style: CommondText.textSize25W500Black),
      ],
    );
  }

  Column _buildSpending() {
    return Column(
      children: [
        Text(
          "Tổng chi tiêu",
          style: CommondText.textSize16W500.copyWith(color: Colors.pinkAccent),
        ),
        Text("0 đ", style: CommondText.textSize25W500Black),
      ],
    );
  }

  Padding _buildNumberCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Mã số thẻ CGV : ",
            style:
                CommondText.textSize16W500.copyWith(color: Colors.pinkAccent),
          ),
          Expanded(
            child: Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              id,
              style: CommondText.textSize25W500Black,
            ),
          ),
        ],
      ),
    );
  }
}

class _BuildInforUser extends StatelessWidget {
  const _BuildInforUser({
    Key? key,
    required this.content,
    this.iconData,
    required this.function,
  }) : super(key: key);
  final String content;
  final IconData? iconData;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          iconData != null
              ? Row(
                  children: [
                    Icon(
                      iconData,
                      color: CommondColor.redCommond,
                      size: 30.s,
                    ),
                    Gap(10.s),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      content,
                      style: CommondText.textSize18W400Black,
                    )
                  ],
                )
              : Text(
                  textAlign: TextAlign.center,
                  content,
                  style: CommondText.textSize18W400Black,
                ),
          Icon(
            Icons.arrow_forward_ios,
            size: 20.s,
          ),
        ],
      ),
    );
  }
}

class _BuildMemberType extends StatelessWidget {
  const _BuildMemberType({
    Key? key,
    required this.type,
    required this.colors,
    required this.textAlign,
  }) : super(key: key);
  final String type;
  final Color colors;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      type,
      style: CommondText.textSize16W400.copyWith(color: colors),
    );
  }
}

class InforUser {
  final String content;
  final IconData iconData;
  InforUser({required this.content, required this.iconData});
}
