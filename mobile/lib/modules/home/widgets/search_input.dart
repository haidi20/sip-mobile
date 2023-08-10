import 'package:flutter/material.dart';
import 'package:sip/utils/constants.dart';

class SearchInput extends StatefulWidget {
  SearchInput({Key? key}) : super(key: key);

  @override
  _SearchInputState createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final FocusNode textFieldFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    textFieldFocusNode.addListener(
      () {
        if (textFieldFocusNode.hasFocus) {
          // TextField is now active
          debugPrint('TextField is active');
          // You can perform any actions or display UI changes here

          // showDialogSearch();
        } else {
          // TextField lost focus
          debugPrint('TextField lost focus');
          // You can perform cleanup or reset UI changes here
        }
      },
    );
  }

  @override
  void dispose() {
    textFieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double paddingRight = size.width * paddingRightLeftGenerale;
    double paddingLeft = size.width * paddingRightLeftGenerale;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            left: paddingLeft,
            right: paddingRight,
          ),
          child: TextField(
            focusNode: textFieldFocusNode,
            readOnly: true,
            decoration: const InputDecoration(
              labelText: "cari...",
              prefixIcon: Icon(Icons.search),
              contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              floatingLabelBehavior: FloatingLabelBehavior
                  .never, // Keep the labelText always visible
            ),
            onChanged: (text) {
              // debugPrint(text);
            },
            onSubmitted: (value) {
              // Called when the user presses the return key
              debugPrint('Submitted: $value');
              // You can perform any actions or validations here
            },
          ),
        ),
        // ElevatedButton(
        //   onPressed: () {
        //     // This function will be executed when the button is pressed
        //     showDialogSearch();
        //   },
        //   child: const Text('show modal'), // Text displayed on the button
        // ),
      ],
    );
  }

  void showDialogSearch() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
            // Empty onTap handler to prevent interactions with the background
          },
          child: AlertDialog(
            content: const Text("Show modal"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false), // passing false
                child: const Text('Tutup'),
              ),
            ],
          ),
        );
      },
    );
  }
}
