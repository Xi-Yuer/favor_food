import 'dart:ui';

import 'package:flutter/material.dart';

class SizeFit {
  static late double physicalWidth;
  static late double physicalHeight;
  static late double screenWidth;
  static late double screenHeight;
  static late double dpr;
  static late double statusHeight;

  static late double px;
  static late double rpx;

  static void initialize(){
    // 手机物理分辨率
     physicalWidth = window.physicalSize.width;
     physicalHeight = window.physicalSize.height;
     statusHeight = MediaQueryData.fromWindow(window).padding.top;

    // dpr
     dpr = window.devicePixelRatio;

    // 宽度高度
     screenWidth =  physicalWidth / dpr;
     screenHeight = physicalHeight / dpr;

    // rp-rpx
      px = screenWidth / 750;
      rpx = screenWidth / 750 * 2;

  }
   static double setPx(double size) => rpx * size;
   static double setRpx(double size) => px * size;
}

extension FixPx on double {
  double get px {
    return SizeFit.setPx(this);
  }

  double get rpx {
    return SizeFit.setRpx(this);
  }
}