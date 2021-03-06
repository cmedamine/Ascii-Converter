import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

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
              filled: false,
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            ),
            items: TextHashMenuItems.values
                .map(
                  (TextHashMenuItems config) =>
                      DropdownMenuItem<TextHashMenuItems>(
                    value: config,
                    child: Text(
                      config.displayConfig,
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
                .toList(),
            onChanged: (selected) {
              textHashMenuItem = selected;

              switch (textHashMenuItem) {
                case TextHashMenuItems.SHA1:
                  
                  break;
                case TextHashMenuItems.SHA224:
                  
                  break;
                case TextHashMenuItems.SHA256:
                  
                  break;
                case TextHashMenuItems.SHA384:
                  
                  break; 
                case TextHashMenuItems.SHA512:
                  
                  break;
                case TextHashMenuItems.MD5:
                  
                  break;         
              }
            },
          ),
        )
      ],
    );
  }
}
