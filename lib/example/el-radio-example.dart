import 'package:flutter/material.dart';
import 'package:flutter_element/common/el_size.dart';
import 'package:flutter_element/widgets/el-radio.dart';

class ElRadioExample extends StatefulWidget {
  @override
  _ElRadioExampleState createState() => _ElRadioExampleState();
}

class _ElRadioExampleState extends State<ElRadioExample> {
  final ValueNotifier<String> value = ValueNotifier<String>("2");
  final ValueNotifier<String> value1 = ValueNotifier<String>("2");
  final ValueNotifier<String> value2 = ValueNotifier<String>("2");
  final ValueNotifier<String> value3 = ValueNotifier<String>("2");
  final ValueNotifier<String> value4 = ValueNotifier<String>("2");
  final ValueNotifier<String> value5 = ValueNotifier<String>("2");
  final ValueNotifier<String> value6 = ValueNotifier<String>("2");
  final ValueNotifier<String> value7 = ValueNotifier<String>("北京");
  final ValueNotifier<String> value8 = ValueNotifier<String>("北京");
  final ValueNotifier<String> value9 = ValueNotifier<String>("广州");
  final ValueNotifier<String> value10 = ValueNotifier<String>("北京");

  @override
  void initState() {
    super.initState();
    value.addListener(() {
      print(value.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Text("基础用法"
                "由于选项默认可见，不宜过多，若选项过多，建议使用 Select 选择器。"),
            SizedBox(height: 20),
            Row(
              children: [
                ElRadio(
                  label: "2",
                  value: value,
                  text: "备选项",
                ),
                SizedBox(width: 50),
                ElRadio(
                  label: "1",
                  value: value,
                  text: "备选项",
                ),
              ],
            ),
            SizedBox(height: 20),
            new Text("禁用状态\n"
                "单选框不可用的状态"),
            SizedBox(height: 20),
            Row(
              children: [
                ElRadio(
                  label: "2",
                  value: value1,
                  disabled: true,
                  text: "备选项",
                ),
                SizedBox(width: 50),
                ElRadio(
                  label: "1",
                  value: value1,
                  disabled: true,
                  text: "备选项",
                ),
              ],
            ),
            SizedBox(height: 20),
            new Text("单选框组\n"
                "适用于在多个互斥的选项中选择的场景"),
            SizedBox(height: 20),
            ElRadioGroup(
              value: value2,
              children: [
                ElRadio(
                  label: "2",
                  text: "备选项",
                ),
                ElRadio(
                  label: "1",
                  text: "备选项",
                ),
                ElRadio(
                  label: "4",
                  text: "备选项",
                ),
              ],
            ),
            SizedBox(height: 20),
            new Text("带有边框"),
            SizedBox(height: 20),
            Row(
              children: [
                ElRadio(
                  label: "1",
                  text: "备选项",
                  value: value3,
                  border: true,
                ),
                SizedBox(width: 30),
                ElRadio(
                  label: "4",
                  text: "备选项",
                  value: value3,
                  border: true,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                ElRadio(
                  label: "1",
                  text: "备选项",
                  size: ElSize.medium,
                  value: value4,
                  border: true,
                ),
                SizedBox(width: 30),
                ElRadio(
                  label: "4",
                  text: "备选项",
                  value: value4,
                  size: ElSize.medium,
                  border: true,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                ElRadio(
                  label: "1",
                  text: "备选项",
                  size: ElSize.small,
                  value: value5,
                  border: true,
                ),
                SizedBox(width: 30),
                ElRadio(
                  label: "4",
                  text: "备选项",
                  value: value5,
                  size: ElSize.small,
                  border: true,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            ElRadioGroup(
              value: value6,
              size: ElSize.mini,
              border: true,
              disabled: true,
              children: [
                ElRadio(
                  label: "4",
                  text: "备选项",
                  value: value6,

                ),
                ElRadio(
                  label: "4",
                  text: "备选项",
                  value: value6,
                ),
              ],
            ),

            SizedBox(height: 20),
            new Text("按钮样式\n"
                "按钮样式的单选组合。"),
            SizedBox(height: 20),
            ElRadioGroup(
              value: value7,
              children: [
                SizedBox(width:20),
                ElRadioButton(
                  label: "上海",
                ),
                ElRadioButton(
                  label: "北京",
                ),
                ElRadioButton(
                  label: "广州",
                ),
                ElRadioButton(
                  label: "深圳",
                )
              ],
            ),
            SizedBox(height: 20),
            ElRadioGroup(
              size: ElSize.medium,
              value: value8,
              children: [
                SizedBox(width:20),
                ElRadioButton(
                  label: "上海",
                ),
                ElRadioButton(
                  label: "北京",
                ),
                ElRadioButton(
                  label: "广州",
                ),
                ElRadioButton(
                  label: "深圳",
                )
              ],
            ),

            SizedBox(height: 20),
            ElRadioGroup(
              size: ElSize.small,
              value: value9,
              children: [
                SizedBox(width:20),
                ElRadioButton(
                  label: "上海1",
                ),
                ElRadioButton(
                  disabled: true,
                  label: "北京",
                ),
                ElRadioButton(
                  label: "广州",
                ),

                ElRadioButton(
                  label: "深圳",
                )
              ],
            ),

            SizedBox(height: 20),
            ElRadioGroup(
              disabled: true,
              size: ElSize.mini,
              value: value10,
              children: [
                SizedBox(width:20),
                ElRadioButton(
                  label: "上海",
                ),
                ElRadioButton(
                  label: "北京",
                ),
                ElRadioButton(
                  label: "广州",
                ),
                ElRadioButton(
                  label: "深圳",
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
