/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// Directory path: assets/fonts/rubik
  $AssetsFontsRubikGen get rubik => const $AssetsFontsRubikGen();
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/moderate_rain.png
  AssetGenImage get moderateRain =>
      const AssetGenImage('assets/icons/moderate_rain.png');

  /// File path: assets/icons/sunny.png
  AssetGenImage get sunny => const AssetGenImage('assets/icons/sunny.png');

  /// List of all assets
  List<AssetGenImage> get values => [moderateRain, sunny];
}

class $AssetsFontsRubikGen {
  const $AssetsFontsRubikGen();

  /// File path: assets/fonts/rubik/Rubik-Bold.ttf
  String get rubikBold => 'assets/fonts/rubik/Rubik-Bold.ttf';

  /// File path: assets/fonts/rubik/Rubik-Italic.ttf
  String get rubikItalic => 'assets/fonts/rubik/Rubik-Italic.ttf';

  /// File path: assets/fonts/rubik/Rubik-Medium.ttf
  String get rubikMedium => 'assets/fonts/rubik/Rubik-Medium.ttf';

  /// File path: assets/fonts/rubik/Rubik-Regular.ttf
  String get rubikRegular => 'assets/fonts/rubik/Rubik-Regular.ttf';

  /// File path: assets/fonts/rubik/Rubik-SemiBold.ttf
  String get rubikSemiBold => 'assets/fonts/rubik/Rubik-SemiBold.ttf';

  /// List of all assets
  List<String> get values => [
    rubikBold,
    rubikItalic,
    rubikMedium,
    rubikRegular,
    rubikSemiBold,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
