import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class InputWidgets extends StatefulWidget {
  const InputWidgets({Key? key}) : super(key: key);

  @override
  State<InputWidgets> createState() => _InputWidgetsState();
}

class _InputWidgetsState extends State<InputWidgets>
    with WidgetsBindingObserver {
  double _bottom = 0;
  String? _selectedValue;
  final List<String> _items = ['男', ' 女'];

  final FocusNode _userAgeInputFocusNode = FocusNode();

  late TextEditingController _deviceNameTextEditingController;
  late TextEditingController _userNameTextEditingController;
  late TextEditingController _userAgeTextEditingController;

  static const List<String> _kOptions = <String>[
    'aardvark',
    'bobcat',
    'chameleon',
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    _userAgeTextEditingController = TextEditingController();
    _userNameTextEditingController = TextEditingController();
    _deviceNameTextEditingController = TextEditingController();
  }

  @override
  void didChangeMetrics() {
    // TODO: implement didChangeMetrics
    super.didChangeMetrics();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          if (_userAgeInputFocusNode.hasFocus &&
              MediaQuery.of(context).viewInsets.bottom > 0) {
            _bottom = MediaQuery.of(context).viewInsets.bottom;
          } else {
            _bottom = 0;
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SingleChildScrollView(
          reverse: true,
          child: Container(
            padding:
                EdgeInsets.only(left: 20, right: 20, top: 10, bottom: _bottom),
            child: Column(
              children: [
                _buildDeviceName(),
                _buildUserName(),
                _buildUserSex(context),
                _buildUserAge(),
                const SizedBox(
                  height: 30,
                ),
                _buildConfirmButton(),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  OutlinedButton _buildConfirmButton() => OutlinedButton(
        style: OutlinedButton.styleFrom(
            fixedSize: const Size(130, 44),
            shape: const StadiumBorder(),
            backgroundColor: const Color(0xffFF6F00)),
        onPressed: () {},
        child: const Text(
          '确认',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      );

  Container _buildUserAge() => Container(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '使用者年龄',
              style: TextStyle(fontSize: 17),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: const BorderRadius.all(Radius.circular(50))),
              child: TextField(
                maxLines: 1,
                focusNode: _userAgeInputFocusNode,
                keyboardType: TextInputType.number,
                controller: _userAgeTextEditingController,
                maxLengthEnforcement:
                    MaxLengthEnforcement.truncateAfterCompositionEnds,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(8) //限制长度
                ],
                decoration: const InputDecoration(
                    prefix: SizedBox(width: 20),
                    border: InputBorder.none,
                    hintText: '輸入使用者年龄'),
                onChanged: (value) {},
              ),
            )
          ],
        ),
      );

  Container _buildUserSex(BuildContext context) => Container(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '选择使用者性别',
              style: TextStyle(fontSize: 17),
            ),
            Container(
                width: double.maxFinite,
                margin: const EdgeInsets.only(top: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: const BorderRadius.all(Radius.circular(50))),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                  isExpanded: true,
                  icon: const Icon(
                    Icons.expand_more_sharp,
                  ),
                  hint: Text(
                    '使用者性别',
                    style: TextStyle(
                      fontSize: 17,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: _items
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          ))
                      .toList(),
                  value: _selectedValue,
                  onChanged: (value) {},
                  buttonHeight: 40,
                  buttonWidth: 140,
                  itemHeight: 40,
                )))
          ],
        ),
      );

  Container _buildUserName() => Container(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '使用者姓名',
              style: TextStyle(fontSize: 17),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: const BorderRadius.all(Radius.circular(50))),
              child: TextField(
                controller: _userNameTextEditingController,
                maxLines: 1,
                maxLengthEnforcement:
                    MaxLengthEnforcement.truncateAfterCompositionEnds,
                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(8) //限制长度
                ],
                decoration: const InputDecoration(
                    prefix: SizedBox(width: 20),
                    border: InputBorder.none,
                    hintText: '输入使用者姓名'),
                onChanged: (value) {},
              ),
            )
          ],
        ),
      );

  Container _buildDeviceName() => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text.rich(TextSpan(
                text: '水杯名称',
                style: TextStyle(fontSize: 17),
                children: [
                  TextSpan(text: '※', style: TextStyle(color: Colors.red))
                ])),
            Container(
                margin: const EdgeInsets.only(top: 10),
                // decoration: BoxDecoration(
                //     border: Border.all(),
                //     borderRadius: const BorderRadius.all(Radius.circular(50))),
                child: Autocomplete(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text == '') {
                      return const Iterable<String>.empty();
                    }

                    return _kOptions.where((String option) {
                      return option
                          .contains(textEditingValue.text.toLowerCase());
                    });
                  },
                )

                // TextField(
                //   controller: _deviceNameTextEditingController,
                //   autofocus: true,
                //   maxLines: 1,
                //   maxLengthEnforcement:
                //       MaxLengthEnforcement.truncateAfterCompositionEnds,
                //   inputFormatters: <TextInputFormatter>[
                //     LengthLimitingTextInputFormatter(8) //限制长度
                //   ],
                //   decoration: const InputDecoration(
                //       prefix: SizedBox(width: 20),
                //       border: InputBorder.none,
                //       hintText: '输入水杯名称'),
                //   onChanged: (value) {},
                // ),
                )
          ],
        ),
      );
}
