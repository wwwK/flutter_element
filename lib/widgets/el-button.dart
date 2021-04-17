import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_element/common/el_colors.dart';
import 'package:flutter_element/common/el_size.dart';

import 'icons.dart';

enum ElButtonType { none, primary, success, warning, danger, info, text }
enum ElButtonIconPositoin { left, right }


class ElButton extends StatefulWidget {
  final ElSize size;
  final String text;
  final ElButtonType type; //类型
  final bool plain; //是否朴素按钮
  final bool round; // 是否圆角按钮
  final bool circle; // 是否圆形
  final IconData iconData; // 按钮图标
  final bool disabled; // 是否隐藏
  final ElButtonIconPositoin iconPositoin;
  final bool loading;

  const ElButton(
      {Key key,
      this.text = "",
      this.type = ElButtonType.none,
      this.plain = false,
      this.round = false,
      this.circle = false,
      this.iconData,
      this.disabled = false,
      this.loading = false,
      this.iconPositoin = ElButtonIconPositoin.left,
      this.size = ElSize.none
      })
      : super(key: key);

  @override
  _ElButtonState createState() => _ElButtonState();
}

class _ElButtonState extends State<ElButton>
    with SingleTickerProviderStateMixin {
  bool isMouse = false;
  bool disabled = false;

  AnimationController controller;

  @override
  void initState() {
    super.initState();
    setState(() {
      disabled = widget.disabled;
    });
    if (widget.loading) {
      controller = AnimationController(
          duration: const Duration(seconds: 2), vsync: this);
      controller.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          //动画从 controller.forward() 正向执行 结束时会回调此方法
          // print("status is completed");
          //重置起点
          controller.reset();
          //开启
          controller.forward();
        } else if (status == AnimationStatus.dismissed) {
          //动画从 controller.reverse() 反向执行 结束时会回调此方法
          // print("status is dismissed");
        } else if (status == AnimationStatus.forward) {
          // print("status is forward");
          //执行 controller.forward() 会回调此状态
        } else if (status == AnimationStatus.reverse) {
          //执行 controller.reverse() 会回调此状态
          // print("status is reverse");
        }
      });
      controller.forward();
      setState(() {
        disabled = true;
      });
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    bool isUseElButtonGroup = false;
    if (context.findAncestorWidgetOfExactType<ElButtonGroup>() != null) {
      isUseElButtonGroup = true;
    }
    return Material(
      color: Colors.transparent,
      child: MouseRegion(
        cursor: getCursor(),
        onEnter: (e) => _mouseEnter(true),
        onExit: (e) => _mouseEnter(false),
        child: Container(
          decoration: BoxDecoration(
              shape: widget.circle ? BoxShape.circle : BoxShape.rectangle,
              color: _getBackColor(widget.type),
              border: Border.all(color: _getBorderColor(widget.type), width: 1),
              borderRadius: widget.circle
                  ? null
                  : isUseElButtonGroup
                      ? BorderRadius.zero
                      : BorderRadius.circular(widget.round ? 20 : 4) //默认
              ),
          padding: ElSizeUtil.getButtonPadding(size: widget.size,round: widget.round),
          child: Row(
            children: [
              getContentPosition(ElButtonIconPositoin.left),
              if (widget.iconData != null && widget.text != "" ||
                  widget.loading)
                SizedBox(width: 5),
              getContentPosition(ElButtonIconPositoin.right),
            ],
          ),
        ),
      ),
    );
  }

  /**
   * 定制大小
   */




  Widget getContentPosition(ElButtonIconPositoin positoin) {
    Widget icon = Icon(
      widget.iconData,
      size: widget.iconData == null ? 0 : ElSizeUtil.getFontSize(size: widget.size),
      color: _getFontColor(widget.type),
    );

    if (widget.loading) {
      icon = RotationTransition(
        alignment: Alignment.center,
        turns: controller,
        child: Icon(EleIcons.el_icon_loading,
            size: ElSizeUtil.getFontSize(size: widget.size), color: _getFontColor(widget.type)),
      );
    }

    var text = new Text(
      "${widget.text}",
      style: TextStyle(
          fontSize: ElSizeUtil.getFontSize(size: widget.size),
          height: 1.5,
          fontWeight: FontWeight.w500,
          color: _getFontColor(widget.type)),
    );
    if (positoin == ElButtonIconPositoin.left) {
      return widget.iconPositoin == ElButtonIconPositoin.left ? icon : text;
    } else {
      return widget.iconPositoin == ElButtonIconPositoin.left ? text : icon;
    }
  }



  void _mouseEnter(bool hover) {
    if (!disabled) {
      setState(() {
        isMouse = hover;
      });
    }
  }

  /**
   * 获取光标状态
   */
  SystemMouseCursor getCursor() {
    if (disabled && !widget.loading) {
      return SystemMouseCursors.forbidden;
    } else if (widget.loading) {
      return SystemMouseCursors.disappearing;
    }

    return SystemMouseCursors.click;
  }

  // 获取字体颜色
  Color _getFontColor(ElButtonType elButtonType) {
    switch (elButtonType) {
      case ElButtonType.none:
        if (disabled) {
          return Color(0xFFc0c4cc);
        }
        if (widget.plain && isMouse) {
          return Color(0xFF409EFF);
        }
        if (isMouse) {
          return Color(0xFF409eff);
        }
        return EleColor.routine;
        break;
      case ElButtonType.primary:
        if (disabled) {
          return widget.plain ? Color(0xFF8cc5ff) : EleColor.white;
        }

        if (isMouse) {
          return Colors.white;
        } else {
          return widget.plain ? Color(0xFF409eff) : EleColor.white;
        }
        break;
      case ElButtonType.success:
        if (disabled) {
          return widget.plain ? Color(0xFFa4da89) : EleColor.white;
        }
        if (isMouse) {
          return Colors.white;
        } else {
          return widget.plain ? Color(0xFF67c23a) : EleColor.white;
        }
        break;
      case ElButtonType.info:
        if (disabled) {
          return widget.plain ? Color(0xFFbcbec2) : EleColor.white;
        }
        if (isMouse) {
          return Colors.white;
        } else {
          return widget.plain ? Color(0xFF909399) : EleColor.white;
        }
        break;
      case ElButtonType.warning:
        if (disabled) {
          return widget.plain ? Color(0xFFf0c78a) : EleColor.white;
        }
        if (isMouse) {
          return Colors.white;
        } else {
          return widget.plain ? Color(0xFFe6a23c) : EleColor.white;
        }
        break;
      case ElButtonType.danger:
        if (disabled) {
          return widget.plain ? Color(0xFFf9a7a7) : EleColor.white;
        }
        if (isMouse) {
          return Colors.white;
        } else {
          return widget.plain ? Color(0xFFf56c6c) : EleColor.white;
        }
        break;
      case ElButtonType.text:
        if (disabled) {
          return Color(0xFFc0c4cc);
        }
        if (isMouse) {
          return Color(0xFF66b1ff);
        } else {
          return Color(0xFF409eff);
        }
        break;
      default:
        {
          return EleColor.white;
        }
    }
  }

  // 获取背景颜色
  Color _getBackColor(ElButtonType elButtonType) {
    switch (elButtonType) {
      case ElButtonType.none:
        if (disabled) {
          return widget.plain ? EleColor.white : EleColor.white;
        }
        if (widget.plain && isMouse) {
          return EleColor.white;
        }
        if (isMouse) {
          return Color(0xFFecf5ff);
        }
        return EleColor.white;
        break;
      case ElButtonType.primary:
        if (disabled) {
          return widget.plain ? Color(0xffecf5ff) : Color(0xFFa0cfff);
        }
        if (isMouse) {
          return widget.plain ? Color(0xFF409eff) : Color(0xFF66b1ff);
        } else {
          return widget.plain ? Color(0xFFecf5ff) : EleColor.primary;
        }
        break;
      case ElButtonType.success:
        if (disabled) {
          return widget.plain ? Color(0xFFf0f9eb) : Color(0xFFb3e19d);
        }
        if (isMouse) {
          return widget.plain ? Color(0xFF67c23a) : Color(0xFF85ce61);
        } else {
          return widget.plain ? Color(0xFFf0f9eb) : Color(0xFF67c23a);
        }
        break;
      case ElButtonType.info:
        if (disabled) {
          return widget.plain ? Color(0xFFf4f4f5) : Color(0xFFc8c9cc);
        }
        if (isMouse) {
          return widget.plain ? EleColor.info : Color(0xFFa6a9ad);
        } else {
          return widget.plain ? Color(0xFFf4f4f5) : Color(0xFF909399);
        }
        break;
      case ElButtonType.warning:
        if (disabled) {
          return widget.plain ? Color(0xFFfdf6ec) : Color(0xFFf3d19e);
        }
        if (isMouse) {
          return widget.plain ? Color(0xFFe6a23c) : Color(0xFFebb563);
        } else {
          return widget.plain ? Color(0xFFfdf6ec) : Color(0xFFe6a23c);
        }
        break;
      case ElButtonType.danger:
        if (disabled) {
          return widget.plain ? Color(0xFFfde2e2) : Color(0xFFfab6b6);
        }
        if (isMouse) {
          return widget.plain ? Color(0xFFf56c6c) : Color(0xFFf78989);
        } else {
          return widget.plain ? Color(0xFFfef0f0) : Color(0xFFf56c6c);
        }
        break;
      case ElButtonType.text:
        return Colors.transparent;
        break;
    }
  }

  // 获取边框颜色
  Color _getBorderColor(ElButtonType elButtonType) {
    switch (elButtonType) {
      case ElButtonType.none:
        if (disabled) {
          return widget.plain ? Color(0xFFebeef5) : Color(0xFFebeef5);
        }
        if (widget.plain && isMouse) {
          return Color(0xFF409EFF);
        }
        if (isMouse) {
          return Color(0xFFc6e2ff);
        }
        return Color(0xFFdcdfe6);
        break;
      case ElButtonType.primary:
        if (disabled) {
          return widget.plain ? Color(0xFFd9ecff) : Color(0xffa0cfff);
        }
        if (isMouse) {
          return widget.plain ? Color(0xFF409eff) : Color(0xFF66b1ff);
        } else {
          return widget.plain ? Color(0xFFb3d8ff) : EleColor.primary;
        }
        break;
      case ElButtonType.success:
        if (disabled) {
          return widget.plain ? Color(0xFFe1f3d8) : Color(0xFFb3e19d);
        }
        if (isMouse) {
          return widget.plain ? Color(0xFF67c23a) : Color(0xFF85ce61);
        } else {
          return widget.plain ? Color(0xFFc2e7b0) : Color(0xFF67c23a);
        }
        break;
      case ElButtonType.info:
        if (disabled) {
          return widget.plain ? Color(0xFFe9e9eb) : Color(0xFFc8c9cc);
        }
        if (isMouse) {
          return widget.plain ? EleColor.info : Color(0xFFa6a9ad);
        } else {
          return widget.plain ? Color(0xFFd3d4d6) : Color(0xFF909399);
        }
        break;
      case ElButtonType.warning:
        if (disabled) {
          return widget.plain ? Color(0xFFfaecd8) : Color(0xFFf3d19e);
        }
        if (isMouse) {
          return widget.plain ? Color(0xFFe6a23c) : Color(0xFFebb563);
        } else {
          return widget.plain ? Color(0xFFf5dab1) : Color(0xFFe6a23c);
        }
        break;
      case ElButtonType.danger:
        if (disabled) {
          return widget.plain ? Color(0xFFfde2e2) : Color(0xFFfab6b6);
        }
        if (isMouse) {
          return widget.plain ? Color(0xFFf56c6c) : Color(0xFFf78989);
        } else {
          return widget.plain ? Color(0xFFfbc4c4) : Color(0xFFf56c6c);
        }
        break;
      case ElButtonType.text:
        return Colors.transparent;
        break;
    }
  }
}

class ElButtonGroup extends StatelessWidget {
  var _widget = VerticalDivider(
    width: 1,
    color: Colors.black,
    thickness: 10,
  );
  final List<Widget> children;

  ElButtonGroup({Key key, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> newWidget = [];
    for (int i = 0; i < children.length; i++) {
      newWidget.add(children[i]);
      if (i != children.length) {
        newWidget.add(_widget);
      };
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Container(
        color: Colors.black.withOpacity(0.1),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: newWidget,
        ),
      ),
    );
  }
}
