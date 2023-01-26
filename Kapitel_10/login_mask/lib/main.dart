import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(CupertinoApp(home: LoginMask()));
}

class LoginMask extends StatefulWidget {
  @override
  _LoginMaskState createState() => _LoginMaskState();
}

class _LoginMaskState extends State<LoginMask> {
  late TextEditingController _userTextController;
  late TextEditingController _feedbackTextController;

  late FocusNode _passwordFocusNode;
  late FocusNode _commentFocusNode;

  bool _doubleTapped = false;
  bool _longPressed = false;

  bool _commentEnabled = false;

  @override
  void initState() {
    _userTextController = TextEditingController();
    _feedbackTextController = TextEditingController();

    _passwordFocusNode = FocusNode();
    _commentFocusNode = FocusNode();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: CupertinoPageScaffold(
        backgroundColor: CupertinoColors.secondarySystemBackground,
        child: Center(
          child: FractionallySizedBox(
            widthFactor: 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: const Text('Login'),
                  onDoubleTap: () => _doubleTapped = true,
                  onLongPress: () => _longPressed = true,
                  onHorizontalDragEnd: (details) async {
                    if (_doubleTapped && _longPressed) {
                      await Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => HiddenPage(),
                        ),
                      );

                      _doubleTapped = false;
                      _longPressed = false;
                    }
                  },
                ),
                const SizedBox(height: 8),
                // Nutzername
                CupertinoTextField(
                  autofocus: true,
                  placeholder: 'Nutzername',
                  clearButtonMode: OverlayVisibilityMode.editing,
                  controller: _userTextController,
                  onChanged: (text) => print(text),
                  onEditingComplete: () => print('Bearbeitung beendet'),
                  onSubmitted: (text) {
                    _passwordFocusNode.requestFocus();
                  },
                ),
                const SizedBox(height: 8),
                // Passwort
                CupertinoTextField(
                  focusNode: _passwordFocusNode,
                  placeholder: 'Passwort',
                  clearButtonMode: OverlayVisibilityMode.editing,
                  obscureText: true,
                  obscuringCharacter: 'X',
                  keyboardType: TextInputType.number,
                  onChanged: (text) {
                    if (text.length >= 6) {
                      _commentFocusNode.requestFocus();
                    }
                  },
                ),
                const SizedBox(height: 8),
                StatefulBuilder(
                  builder: (context, builderSetState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Kommentar abgeben'),
                            CupertinoSwitch(
                              value: _commentEnabled,
                              onChanged: (value) {
                                builderSetState(
                                      () {
                                    _commentEnabled = value;
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        Visibility(
                          visible: _commentEnabled,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CupertinoTextField(
                                focusNode: _commentFocusNode,
                                placeholder: 'Wie finden Sie den Login?',
                                maxLines: 3,
                                maxLength: 140,
                                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                                controller: _feedbackTextController,
                                onChanged: (text) => builderSetState(() {}),
                              ),
                              Text(
                                '${_feedbackTextController.text.length}/140',
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 16),
                CupertinoButton(
                  onPressed: () {
                    _userTextController.selection = TextSelection(
                      baseOffset: 0,
                      extentOffset: _userTextController.text.length,
                    );
                  },
                  child: Text('Einloggen'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HiddenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          color: CupertinoColors.systemGreen,
          height: 100,
          width: 100,
          child: Center(
            child: Text('Zurück'),
          ),
        ),
      ),
    );
  }
}
