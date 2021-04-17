import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_element/common/el_size.dart';
import 'package:flutter_element/widgets/el-button.dart';
import 'package:flutter_element/widgets/icons.dart';

class ElButtonExample extends StatefulWidget {
  @override
  _ElButtonExampleState createState() => _ElButtonExampleState();
}

class _ElButtonExampleState extends State<ElButtonExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      // body: Column(
      //   children: [],
      // ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElButton(
                      text: "默认按钮",
                    ),
                    ElButton(
                      type: ElButtonType.primary,
                      text: "主要按钮",
                    ),
                    ElButton(
                      type: ElButtonType.success,
                      text: "成功按钮",
                    ),
                    ElButton(
                      type: ElButtonType.info,
                      text: "信息按钮",
                    ),
                    ElButton(
                      type: ElButtonType.warning,
                      text: "警告按钮",
                    ),
                    ElButton(
                      type: ElButtonType.danger,
                      text: "危险按钮",
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElButton(
                      text: "朴素按钮",
                      plain: true,
                    ),
                    ElButton(
                      type: ElButtonType.primary,
                      text: "主要按钮",
                      plain: true,
                    ),
                    ElButton(
                      type: ElButtonType.success,
                      text: "成功按钮",
                      plain: true,
                    ),
                    ElButton(
                      type: ElButtonType.info,
                      text: "信息按钮",
                      plain: true,
                    ),
                    ElButton(
                      type: ElButtonType.warning,
                      text: "警告按钮",
                      plain: true,
                    ),
                    ElButton(
                      type: ElButtonType.danger,
                      text: "危险按钮",
                      plain: true,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElButton(
                      text: "圆角按钮",
                      round: true,
                    ),
                    ElButton(
                      type: ElButtonType.primary,
                      text: "主要按钮",
                      round: true,
                    ),
                    ElButton(
                        type: ElButtonType.success, text: "成功按钮", round: true),
                    ElButton(
                      type: ElButtonType.info,
                      text: "信息按钮",
                      round: true,
                    ),
                    ElButton(
                      type: ElButtonType.warning,
                      text: "警告按钮",
                      round: true,
                    ),
                    ElButton(
                      type: ElButtonType.danger,
                      text: "危险按钮",
                      round: true,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElButton(
                      circle: true,
                      plain: true,
                      iconData: EleIcons.el_icon_search,
                    ),
                    ElButton(
                      type: ElButtonType.primary,
                      circle: true,
                      plain: true,
                      iconData: EleIcons.el_icon_edit,
                    ),
                    ElButton(
                      type: ElButtonType.success,
                      circle: true,
                      iconData: EleIcons.el_icon_check,
                    ),
                    ElButton(
                      type: ElButtonType.info,
                      circle: true,
                      plain: true,
                      iconData: EleIcons.el_icon_message,
                    ),
                    ElButton(
                      type: ElButtonType.warning,
                      circle: true,
                      iconData: EleIcons.el_icon_star_off,
                    ),
                    ElButton(
                      type: ElButtonType.danger,
                      circle: true,
                      iconData: EleIcons.el_icon_delete,
                    ),
                  ],
                ),
                new Text("被禁止的"),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElButton(
                      text: "默认按钮",
                      disabled: true,
                    ),
                    ElButton(
                      type: ElButtonType.primary,
                      text: "主要按钮",
                      disabled: true,
                    ),
                    ElButton(
                      type: ElButtonType.success,
                      text: "成功按钮",
                      disabled: true,
                    ),
                    ElButton(
                      type: ElButtonType.info,
                      text: "信息按钮",
                      disabled: true,
                    ),
                    ElButton(
                      type: ElButtonType.warning,
                      text: "警告按钮",
                      disabled: true,
                    ),
                    ElButton(
                      type: ElButtonType.danger,
                      text: "危险按钮",
                      disabled: true,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElButton(
                      text: "朴素按钮",
                      plain: true,
                      disabled: true,
                    ),
                    ElButton(
                      type: ElButtonType.primary,
                      text: "主要按钮",
                      plain: true,
                      disabled: true,
                    ),
                    ElButton(
                      type: ElButtonType.success,
                      text: "成功按钮",
                      disabled: true,
                      plain: true,
                    ),
                    ElButton(
                      type: ElButtonType.info,
                      text: "信息按钮",
                      plain: true,
                      disabled: true,
                    ),
                    ElButton(
                      type: ElButtonType.warning,
                      text: "警告按钮",
                      plain: true,
                      disabled: true,
                    ),
                    ElButton(
                      type: ElButtonType.danger,
                      text: "危险按钮",
                      plain: true,
                      disabled: true,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                new Text("文字按钮"),
                SizedBox(height: 20),
                Row(
                  children: [
                    ElButton(
                      type: ElButtonType.text,
                      text: "文字按钮",
                    ),
                    ElButton(
                      type: ElButtonType.text,
                      text: "文字按钮",
                      plain: true,
                      disabled: true,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                new Text("图标按钮"),
                SizedBox(height: 20),
                Row(
                  children: [
                    ElButton(
                      type: ElButtonType.primary,
                      // text: "文字按钮",
                      iconData: EleIcons.el_icon_edit,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElButton(
                      type: ElButtonType.primary,
                      iconData: EleIcons.el_icon_share,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElButton(
                      type: ElButtonType.primary,
                      iconData: EleIcons.el_icon_delete,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElButton(
                      type: ElButtonType.primary,
                      iconData: EleIcons.el_icon_search,
                      text: "搜索",
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElButton(
                      type: ElButtonType.primary,
                      iconData: EleIcons.el_icon_upload,
                      iconPositoin: ElButtonIconPositoin.right,
                      text: "上传",
                    ),
                  ],
                ),
                SizedBox(height: 20),
                new Text("按钮组"),
                SizedBox(height: 20),
                Row(
                  children: [
                    ElButtonGroup(
                      children: [
                        ElButton(
                          type: ElButtonType.primary,
                          iconData: EleIcons.el_icon_arrow_left,
                          text: "上一页",
                        ),
                        ElButton(
                          type: ElButtonType.primary,
                          iconData: EleIcons.el_icon_arrow_right,
                          iconPositoin: ElButtonIconPositoin.right,
                          text: "下一页",
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    ElButtonGroup(
                      children: [
                        ElButton(
                          type: ElButtonType.primary,
                          iconData: EleIcons.el_icon_edit,
                        ),
                        ElButton(
                          type: ElButtonType.primary,
                          iconData: EleIcons.el_icon_share,
                        ),
                        ElButton(
                          type: ElButtonType.primary,
                          iconData: EleIcons.el_icon_delete,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                new Text("加载中"),
                SizedBox(height: 20),
                Row(
                  children: [
                    ElButton(
                      type: ElButtonType.primary,
                      text: "加载中",
                      loading: true,
                      disabled: true,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                new Text("不同尺寸"),
                SizedBox(height: 20),
                Row(
                  children: [
                    ElButton(
                      text: "默认按钮",
                    ),
                    SizedBox(width: 10),
                    ElButton(
                      text: "中等按钮",
                      size: ElSize.medium,
                    ),
                    SizedBox(width: 10),
                    ElButton(
                      text: "小型按钮",
                      size: ElSize.small,
                    ),
                    SizedBox(width: 10),
                    ElButton(
                      size: ElSize.mini,
                      text: "超小按钮",
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    ElButton(
                      text: "默认按钮",
                      round: true,
                    ),
                    SizedBox(width: 10),
                    ElButton(
                      text: "中等按钮",
                      round: true,
                      size: ElSize.medium,
                    ),
                    SizedBox(width: 10),
                    ElButton(
                      text: "小型按钮",
                      round: true,
                      size: ElSize.small,
                    ),
                    SizedBox(width: 10),
                    ElButton(
                      size: ElSize.mini,
                      round: true,
                      text: "超小按钮",
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
