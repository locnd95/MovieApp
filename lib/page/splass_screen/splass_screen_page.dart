import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/commond/commond_local_store.dart';

import 'package:movie_app/gen/assets.gen.dart';
import 'package:movie_app/network/models/movie_data_api.dart';
import 'package:movie_app/router/router.dart';

class SplassScren extends StatefulWidget {
  const SplassScren({super.key});

  @override
  State<SplassScren> createState() => _SplassScrenState();
}

class _SplassScrenState extends State<SplassScren> {
  // MovieDataApi movieDataApi = MovieDataApi();
  // @override
  // initState() {

  //   super.initState();
  // }

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        Navigator.pushNamed(context, RouterName.homeScreen);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Assets.images.imageSplassScreen.image(
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
    );
  }
}
