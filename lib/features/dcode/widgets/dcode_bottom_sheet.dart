import 'package:flutter/material.dart';

class DcodeBottomSheet extends StatelessWidget {
  final String title;
  final String text;

  const DcodeBottomSheet({Key key, this.title, this.text}) : super(key: key);

  Widget makeDismissable({
    @required Widget child,
    @required BuildContext context,
  }) =>
      GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.of(context).pop(),
          child: GestureDetector(onTap: () {}, child: child));

  @override
  Widget build(BuildContext context) {
    return makeDismissable(
      child: DraggableScrollableSheet(
        initialChildSize: 1,
        maxChildSize: 1,
        minChildSize: 0.7,
        builder: (_, controller) => Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: ListView(
            controller: controller,
            children: [
              SizedBox(
                height: 8,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Colors.blue,
                      fontFamily: 'DMSans',
                    ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                text,
                style: TextStyle(fontFamily: 'DMSans'),
              ),
            ],
          ),
        ),
      ),
      context: context,
    );
  }
}
