/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/image_4dx.png
  AssetGenImage get image4dx =>
      const AssetGenImage('assets/images/image_4dx.png');

  /// File path: assets/images/image_avatar_movie.jpg
  AssetGenImage get imageAvatarMovie =>
      const AssetGenImage('assets/images/image_avatar_movie.jpg');

  /// File path: assets/images/image_cimina.jpg
  AssetGenImage get imageCimina =>
      const AssetGenImage('assets/images/image_cimina.jpg');

  /// File path: assets/images/image_giaitri.jpg
  AssetGenImage get imageGiaitri =>
      const AssetGenImage('assets/images/image_giaitri.jpg');

  /// File path: assets/images/image_giaoducdienanh.jpg
  AssetGenImage get imageGiaoducdienanh =>
      const AssetGenImage('assets/images/image_giaoducdienanh.jpg');

  /// File path: assets/images/image_logo_tech.png
  AssetGenImage get imageLogoTech =>
      const AssetGenImage('assets/images/image_logo_tech.png');

  /// File path: assets/images/image_splass_screen.jpg
  AssetGenImage get imageSplassScreen =>
      const AssetGenImage('assets/images/image_splass_screen.jpg');

  /// File path: assets/images/image_sweetbox.jpg
  AssetGenImage get imageSweetbox =>
      const AssetGenImage('assets/images/image_sweetbox.jpg');

  /// File path: assets/images/image_tech.jpg
  AssetGenImage get imageTech =>
      const AssetGenImage('assets/images/image_tech.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [
        image4dx,
        imageAvatarMovie,
        imageCimina,
        imageGiaitri,
        imageGiaoducdienanh,
        imageLogoTech,
        imageSplassScreen,
        imageSweetbox,
        imageTech,
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
