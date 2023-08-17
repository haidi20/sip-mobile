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

    return Container(
      margin: EdgeInsets.only(
        left: paddingLeft,
        right: paddingRight,
      ),
      child: GestureDetector(
        onTap: () => showDialogSearch(
          context: context,
          paddingLeft: paddingLeft,
          paddingRight: paddingRight,
        ),
        child: Container(
          height: 40,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.search),
              SizedBox(width: 8.0),
              Text("Cari...")
            ],
          ),
        ),
      ),
    );
  }

  void showDialogSearch({
    required BuildContext context,
    required double paddingRight,
    required double paddingLeft,
  }) {
    showDialog(
      context: context,
      builder: (_) => Container(
        margin: EdgeInsets.only(
          left: paddingLeft,
          right: paddingRight,
        ),
        child: AlertDialog(
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          content: Builder(
            builder: (context) {
              // Get available height and width of the build area of this widget. Make a choice depending on the size.
              double height = MediaQuery.of(context).size.height;
              double width = MediaQuery.of(context).size.width;

              // Ensure dimensions do not go negative
              double desiredHeight = height > 400 ? height - 400 : height;
              double desiredWidth = width > 400 ? width - 400 : width;

              return SizedBox(
                height: desiredHeight,
                width: desiredWidth,
                child: const Text("content"),
              );
            },
          ),
        ),
      ),
    );
  }
}
