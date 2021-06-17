import 'package:flutter/material.dart';

import '../util/config.dart';

class DropDownTextHashWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 150,
          child: DropdownButtonFormField<TextHashMenuItems>(
            value: textHashMenuItem,
            isExpanded: true,
            menuMaxHeight: 350,
            isDense: false,
            icon: Icon(Icons.arrow_drop_down_rounded),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              filled: true,
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            ),
            items: TextHashMenuItems.values
                .map(
                  (TextHashMenuItems config) =>
                      DropdownMenuItem<TextHashMenuItems>(
                    value: config,
                    child: Text(
                      config.displayConfig,
                    ),
                  ),
                )
                .toList(),
            onChanged: (selected) {
              textHashMenuItem = selected;
            },
          ),
        )
      ],
    );
  }
}
