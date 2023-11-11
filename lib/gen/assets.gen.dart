/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/biometry.svg
  SvgGenImage get biometry => const SvgGenImage('assets/images/biometry.svg');

  /// File path: assets/images/community.svg
  SvgGenImage get community => const SvgGenImage('assets/images/community.svg');

  /// File path: assets/images/communityArrows.svg
  SvgGenImage get communityArrows =>
      const SvgGenImage('assets/images/communityArrows.svg');

  /// File path: assets/images/communityClock.svg
  SvgGenImage get communityClock =>
      const SvgGenImage('assets/images/communityClock.svg');

  /// File path: assets/images/communityLevel.svg
  SvgGenImage get communityLevel =>
      const SvgGenImage('assets/images/communityLevel.svg');

  /// File path: assets/images/communityOn.svg
  SvgGenImage get communityOn =>
      const SvgGenImage('assets/images/communityOn.svg');

  /// File path: assets/images/cup.svg
  SvgGenImage get cup => const SvgGenImage('assets/images/cup.svg');

  /// File path: assets/images/file.svg
  SvgGenImage get file => const SvgGenImage('assets/images/file.svg');

  /// File path: assets/images/loginHeader.svg
  SvgGenImage get loginHeader =>
      const SvgGenImage('assets/images/loginHeader.svg');

  /// File path: assets/images/logo.png
  AssetGenImage get logoPng => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/logo.svg
  SvgGenImage get logoSvg => const SvgGenImage('assets/images/logo.svg');

  /// File path: assets/images/map_point.png
  AssetGenImage get mapPoint =>
      const AssetGenImage('assets/images/map_point.png');

  /// File path: assets/images/notification.svg
  SvgGenImage get notification =>
      const SvgGenImage('assets/images/notification.svg');

  /// File path: assets/images/profile.svg
  SvgGenImage get profile => const SvgGenImage('assets/images/profile.svg');

  /// File path: assets/images/profileBackgroundLogo.svg
  SvgGenImage get profileBackgroundLogo =>
      const SvgGenImage('assets/images/profileBackgroundLogo.svg');

  /// File path: assets/images/profileOn.svg
  SvgGenImage get profileOn => const SvgGenImage('assets/images/profileOn.svg');

  /// File path: assets/images/schedule.svg
  SvgGenImage get schedule => const SvgGenImage('assets/images/schedule.svg');

  /// File path: assets/images/scheduleOn.svg
  SvgGenImage get scheduleOn =>
      const SvgGenImage('assets/images/scheduleOn.svg');

  /// File path: assets/images/security.svg
  SvgGenImage get security => const SvgGenImage('assets/images/security.svg');

  /// File path: assets/images/support.svg
  SvgGenImage get support => const SvgGenImage('assets/images/support.svg');

  /// File path: assets/images/task.svg
  SvgGenImage get task => const SvgGenImage('assets/images/task.svg');

  /// File path: assets/images/taskOn.svg
  SvgGenImage get taskOn => const SvgGenImage('assets/images/taskOn.svg');

  /// File path: assets/images/yourData.svg
  SvgGenImage get yourData => const SvgGenImage('assets/images/yourData.svg');

  /// List of all assets
  List<dynamic> get values => [
        biometry,
        community,
        communityArrows,
        communityClock,
        communityLevel,
        communityOn,
        cup,
        file,
        loginHeader,
        logoPng,
        logoSvg,
        mapPoint,
        notification,
        profile,
        profileBackgroundLogo,
        profileOn,
        schedule,
        scheduleOn,
        security,
        support,
        task,
        taskOn,
        yourData
      ];
}

class MyAssets {
  MyAssets._();

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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
