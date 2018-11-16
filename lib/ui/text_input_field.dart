import 'dart:async';

import 'package:flutter/material.dart';
import 'package:translate/types.dart';
import 'package:translate/models/translation.dart';
import 'package:translate/ui/circle_icon_button.dart';

class TextInputField extends StatefulWidget {
  TextInputField({@required this.onTextChange, this.onTextClear});

  final TextInputFieldChangeCallback onTextChange;
  final VoidCallback onTextClear;

  @override
  _TextInputFieldState createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  final _textFieldController = TextEditingController();
  Timer _debounce;

  @override
  void initState() {
    super.initState();

    _textFieldController.addListener(handleTextChange);
  }

  @override
  void dispose() {
    super.dispose();
    _textFieldController.dispose();
  }

  void handleTextChange() {
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 800), () async {
      String text = _textFieldController.text;
      if (text != "") {
        widget.onTextChange(_textFieldController.text);
      } else {
        if (widget.onTextClear != null) {
          widget.onTextClear();
        }
      }
    });
  }

  void clearInput() {
    setState(() => _textFieldController.clear());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Stack(
              alignment: Alignment(1.0, 0.0),
              children: <Widget>[
                TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    controller: _textFieldController,
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.blue,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Add some text here",
                      hintStyle: new TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 22.0,
                      ),
                      suffixIcon: CircleIconButton(
                        onPressed: clearInput,
                      ),
                      contentPadding: EdgeInsets.only(
                          top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
                    )),
              ],
            )
          ],
        ));
  }
}
