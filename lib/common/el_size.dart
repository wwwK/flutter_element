import 'package:flutter/cupertino.dart';

enum ElSize { none, medium, small, mini }

class ElSizeUtil {


  static EdgeInsetsGeometry getRadioButtonPadding({ElSize size,bool round}){
    if(size ==  ElSize.medium){
      // padding: 10px 20px 0 10px;
      return EdgeInsets.symmetric(vertical: 10,horizontal: 20);
    }else if(size == ElSize.small){
      return EdgeInsets.symmetric(vertical: 9,horizontal: 15);
    }else if(size == ElSize.mini){
      // padding: 6px 15px 0 10px;
      return EdgeInsets.symmetric(vertical: 7,horizontal: 15);
    }
    return EdgeInsets.symmetric(vertical: 12,horizontal: 20);
  }

  static EdgeInsetsGeometry getRadioSelectPadding({ElSize size,bool round}){
    if(size ==  ElSize.medium){
      // padding: 10px 20px 0 10px;
      return EdgeInsets.only(top: 10,right: 20,bottom:10,left: 10);
    }else if(size == ElSize.small){
      // padding: 8px 15px 0 10px;
      return EdgeInsets.only(top: 8,right: 15,bottom: 8,left: 10);
    }else if(size == ElSize.mini){
      // padding: 6px 15px 0 10px;
      return EdgeInsets.only(top: 6,right: 15,bottom: 6,left: 10);
    }
    return EdgeInsets.only(top: 12,right: 20,bottom: 12,left: 10);
  }

  static EdgeInsetsGeometry getButtonPadding({ElSize size,bool round}){
    if(size ==  ElSize.medium){
      return EdgeInsets.symmetric(
          vertical: 10, horizontal: 20);
    }else if(size == ElSize.small){
      return EdgeInsets.symmetric(
          vertical: 9, horizontal: 15);
    }else if(size == ElSize.mini){
      return EdgeInsets.symmetric(
          vertical: 7, horizontal: 15);
    }

    return EdgeInsets.symmetric(
        vertical: 12, horizontal: round ? 23 : 20);
  }


  static double getFontSize({ElSize size}){
    if(size ==  ElSize.medium){
      return 14;
    }else if(size == ElSize.small){
      return 12;
    }else if(size == ElSize.mini){
      return 12;
    }
    return 14;
  }
}