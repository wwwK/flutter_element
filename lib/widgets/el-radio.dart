import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_element/common/el_size.dart';
import 'package:flutter_element/example/el-radio-example.dart';

import 'el-button.dart';

class ElRadio extends StatefulWidget {
  ValueNotifier<String> value;
  final String label;
  final String text;
  bool border;
  ElSize size;
  bool disabled;

  ElRadio(
      {Key key,
      this.label,
      this.value,
      this.text,
      this.border = false,
      this.disabled = false,
      this.size = ElSize.none})
      : super(key: key);

  @override
  _ElRadioState createState() => _ElRadioState();
}

class _ElRadioState extends State<ElRadio> with TickerProviderStateMixin {
  bool isMouse = false;
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    openAnimation(widget.label, widget.value.value);
    widget.value.addListener(() {
      openAnimation(widget.label, widget.value.value);
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  void openAnimation(String lable, String value) {
    if (lable == value) {
      controller = AnimationController(
          duration: const Duration(milliseconds: 150), vsync: this);
      final Animation curve =
          new CurvedAnimation(parent: controller, curve: Curves.easeIn);
      animation = new Tween(begin: 0.0, end: 4.0).animate(curve)
        ..addListener(() {
          // print(animation.value);
          setState(() {});
        });
      controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: () {
        if (!widget.disabled) {
          widget.value.value = widget.label;
        }
      },
      child: ValueListenableBuilder(
        valueListenable: widget.value,
        builder: (BuildContext context, String value, Widget child) {
          return MouseRegion(
            cursor: getCursor(),
            child: Container(
              // height: 40,
              padding: widget.border
                  ? ElSizeUtil.getRadioSelectPadding(size: widget.size)
                  : EdgeInsets.zero,
              decoration: BoxDecoration(
                  borderRadius: widget.border ? BorderRadius.circular(3) : null,
                  border: widget.border
                      ? Border.all(color: getBorderColor())
                      : null),
              child: Container(
                child: Row(
                  children: [
                    MouseRegion(
                      cursor: getCursor(),
                      onEnter: (e) => _mouseEnter(true),
                      onExit: (e) => _mouseEnter(false),
                      child: Container(
                        width: widget.size == ElSize.small ||
                                widget.size == ElSize.mini
                            ? 12
                            : 14,
                        height: widget.size == ElSize.small ||
                                widget.size == ElSize.mini
                            ? 12
                            : 14,
                        decoration: BoxDecoration(
                          color: getRadioBackColor(),
                          shape: BoxShape.circle,
                          border: Border.all(color: getRadioBorderColor()),
                        ),
                        child: value != widget.label
                            ? null
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: animation?.value ?? 0,
                                    height: animation?.value ?? 0,
                                    decoration: BoxDecoration(
                                      color: getRadioSelectBack(),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: new Text("${widget.text}",
                          style: TextStyle(
                              fontSize:
                                  ElSizeUtil.getFontSize(size: widget.size),
                              color: getFontColor(),
                              fontWeight: FontWeight.w500,
                              height: 1)),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Color getBorderColor() {
    if (widget.disabled) {
      return Color(0xFFebeef5);
    }
    if (widget.label == widget.value.value) {
      return Color(0xFF409eff);
    }
    return Color(0xFFdcdfe6);
  }

  Color getFontColor() {
    if (widget.disabled) {
      return Color(0xFFc0c4cc);
    }
    if (widget.label == widget.value.value) {
      return Color(0xFF409eff);
    }
    return Color(0xFF606266);
  }

  Color getRadioSelectBack() {
    if (widget.disabled && widget.label == widget.value.value) {
      return Color(0xFFc0c4cc);
    }
    return Colors.white;
  }

  Color getRadioBackColor() {
    if (widget.disabled) {
      return Color(0xFFf5f7fa);
    }
    if (widget.label == widget.value.value) {
      return Color(0xFF409eff);
    }
    return Colors.transparent;
  }

  /**
   *  获取Radio边框颜色
   */
  Color getRadioBorderColor() {
    if (widget.disabled) {
      return Color(0xffdcdfe6);
    }
    if (widget.label == widget.value.value) {
      return Color(0xFF409eff);
    }
    if (isMouse) {
      return Color(0xFF409eff);
    }
    return Color(0xFFdcdfe6);
  }

  void _mouseEnter(bool hover) {
    setState(() {
      isMouse = hover;
    });
  }

  SystemMouseCursor getCursor() {
    if (widget.disabled) {
      return SystemMouseCursors.forbidden;
    }

    return SystemMouseCursors.click;
  }
}

class ElRadioButton extends StatefulWidget {
  ValueNotifier<String> value;
  final String label;
  ElSize size;
  bool disabled;

  ElRadioButton(
      {Key key,
      this.label,
      this.value,
      this.disabled = false,
      this.size = ElSize.none})
      : super(key: key);

  @override
  _ElRadioButtonState createState() => _ElRadioButtonState();
}

class _ElRadioButtonState extends State<ElRadioButton>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<Color> colorTweenBack;
  Animation<Color> colorTweenfont;
  Animation<Color> colorTweenBorder;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    final Animation curve = new CurvedAnimation(
        parent: controller, curve: Cubic(0.645, .045, 0.355, 1));

    colorTweenBack =
        new ColorTween(begin: Color(0xFFFFFFFF), end: Color(0xFF409eff))
            .animate(curve)
              ..addListener(() {
                setState(() {});
              });

    colorTweenfont =
        new ColorTween(begin: Color(0xFF606266), end: Color(0xFFFFFFFF))
            .animate(curve)
              ..addListener(() {
                setState(() {});
              });

    colorTweenBorder =
        new ColorTween(begin: Color(0xFFdcdfe6), end: Color(0xFF409eff))
            .animate(curve)
              ..addListener(() {
                setState(() {});
              });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isUseElButtonGroup = false;
    if (context.findAncestorWidgetOfExactType<ElRadioGroup>() != null) {
      isUseElButtonGroup = true;
    }
    return InkResponse(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: () {
        if (!widget.disabled) {
          widget.value.value = widget.label;
          controller.forward();
        }
      },
      child: ValueListenableBuilder(
        valueListenable: widget.value,
        builder: (BuildContext context, String value, Widget child) {
          return MouseRegion(
            cursor: getCursor(),
            child: Container(
              padding: ElSizeUtil.getRadioButtonPadding(size: widget.size),
              decoration: BoxDecoration(
                  color: getBackColor(),
                  border: getBoxBorder(),
                  borderRadius:
                      isUseElButtonGroup ? getBorderRadius() : BorderSide.none),
              child: new Text("${widget.label}",
                  style: TextStyle(
                      color: getFontColor(),
                      fontSize: ElSizeUtil.getFontSize(size: widget.size))),
            ),
          );
        },
      ),
    );
  }

  SystemMouseCursor getCursor() {
    if (widget.disabled) {
      return SystemMouseCursors.forbidden;
    }

    return SystemMouseCursors.click;
  }

  BorderRadiusGeometry getBorderRadius() {
    ElRadioGroup elRadioGroup =
        context.findAncestorWidgetOfExactType<ElRadioGroup>();
    List<Widget> list = elRadioGroup.children
        .where((element) => element is ElRadioButton)
        .toList();
    List<ElRadioButton> finalList = [];
    for (Widget item in list) {
      ElRadioButton button = item;
      finalList.add(button);
    }
    if (finalList[0].label == widget.label) {
      return BorderRadius.only(
        topLeft: Radius.circular(4),
        bottomLeft: Radius.circular(4),
      );
    }
    if (finalList[finalList.length - 1].label == widget.label) {
      return BorderRadius.only(
        topRight: Radius.circular(4),
        bottomRight: Radius.circular(4),
      );
    }

    return BorderRadius.zero;
  }

  BoxBorder getBoxBorder() {
    // print(widget.disabled);
    if (widget.disabled) {
      return Border.all(color: Color(0xFFebeef5), width: 0.5);
    }
    // if (widget.label == widget.value.value) {
    //   return Border.all(color: Color(0xFF409eff), width: 0.5);
    // }
    // color: Color(0xFFdcdfe6)
    return Border.all(color: colorTweenBorder.value, width: 0.5);
  }

  Color getBackColor() {
    if (widget.disabled && widget.label == widget.value.value) {
      return Color(0xFFf2f6fc);
    }

    if (widget.label != widget.value.value) {
      controller.reverse();
    }

    if (colorTweenBack.value == Color(0xFFFFFFFF) &&
        widget.label == widget.value.value) {
      // 第一次进入处理
      if (!controller.isAnimating) {
        return Color(0xFF409eff);
      }
    }

    return colorTweenBack.value;
    // if (widget.label == widget.value.value) {
    //   return Color(0xFF409eff);
    // }
    // return Colors.white;
  }

  Color getFontColor() {
    if (widget.disabled && widget.label == widget.value.value) {
      return Color(0xFFc0c4cc);
    }
    if (widget.disabled) {
      return Color(0xFFc0c4cc);
    }
    if (colorTweenfont.value == Color(0xFF606266) &&
        widget.label == widget.value.value) {
      // 第一次进入处理
      if (!controller.isAnimating) {
        return Color(0xFFFFFFFF);
      }
    }

    return colorTweenfont.value;

    // if (widget.label == widget.value.value && widget.disabled) {
    //   return Color(0xFFf2f6fc);
    // }
    // if (widget.disabled) {
    //   return Color(0xFFc0c4cc);
    // }
    // if (widget.label == widget.value.value) {
    //   return Colors.white;
    // }
    //
    // return Color(0xFF606266);
  }
}

/**
 * 单选按钮组
 */
class ElRadioGroup extends StatefulWidget {
  final ValueNotifier<String> value;
  final List<Widget> children;
  final bool border;
  final ElSize size;
  final bool disabled;

  const ElRadioGroup(
      {Key key,
      this.value,
      this.children,
      this.border = false,
      this.disabled = false,
      this.size = ElSize.none})
      : super(key: key);

  @override
  _ElRadioGroupState createState() => _ElRadioGroupState();
}

class _ElRadioGroupState extends State<ElRadioGroup> {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    for (int i = 0; i < widget.children.length; i++) {
      if (widget.children[i] is ElRadio) {
        ElRadio item = widget.children[i];
        item..value = widget.value;
        if (widget.disabled) {
          item..disabled = widget.disabled;
        }

        item..size = widget.size;
        item..border = widget.border;
        list.add(item);
        if (i != widget.children.length) {
          list.add(SizedBox(width: 30));
        }
      } else if (widget.children[i] is ElRadioButton) {
        ElRadioButton item = widget.children[i];
        item..value = widget.value;
        if (widget.disabled) {
          item..disabled = widget.disabled;
        }

        item..size = widget.size;
        list.add(item);
      } else {
        list.add(widget.children[i]);
      }
    }

    return Row(
      children: list,
    );
  }
}
