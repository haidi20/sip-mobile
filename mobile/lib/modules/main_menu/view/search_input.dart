import 'package:flutter/material.dart';
import 'package:sip/constants.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            left: paddingLeftGenerale,
            right: paddingRightGenerale,
          ),
          child: TextField(
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
              debugPrint(text);
            },
          ),
        ),
      ],
    );
  }
}
