import 'package:flutter/material.dart';
import 'package:movie_app/commond/commond.dart';
import 'package:sizer/sizer.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int group = 0;
  List<String> listLinkHotNew = [
    'assets/images/list_image1.jpg',
    'assets/images/list_image2.jpg',
    'assets/images/list_image3.jpg',
    'assets/images/list_image4.jpg',
    'assets/images/list_image5.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
            title: const Text("Title test"),
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images2/image_background_singin.jpg",
                fit: BoxFit.cover,
              ),
            )),
        SliverToBoxAdapter(
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  RadioListTile(
                    title: const Text("Nam"),
                    value: 1,
                    groupValue: group,
                    onChanged: (value) {
                      setState(() {
                        group = value ?? 0;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text("Nữ"),
                    value: 2,
                    groupValue: group,
                    onChanged: (value) {
                      setState(() {
                        group = value ?? 0;
                      });
                    },
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => const Text("aaaaa"),
                      separatorBuilder: (context, index) {
                        return Divider(
                          thickness: 1.s,
                          color: CommondColor.grayCommond,
                        );
                      },
                      itemCount: 3),
                ],
              )),
        )
      ],
    ));
  }
}
