import '../util/config.dart';
import 'package:flutter/material.dart';

class DropDownTextConversionWidget extends StatefulWidget {
  @override
  _DropDownTextConversionWidgetState createState() => _DropDownTextConversionWidgetState();
}

class _DropDownTextConversionWidgetState extends State<DropDownTextConversionWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 150,
          child: DropdownButtonFormField<TextConvertionMenuItems>(
            value: textConvertionMenuItem,
            isExpanded: true,
            menuMaxHeight: 350,
            isDense: false,
            icon: Icon(Icons.arrow_drop_down_rounded),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              filled: true,
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            ),
            items: TextConvertionMenuItems.values
                .map(
                  (TextConvertionMenuItems config) =>
                      DropdownMenuItem<TextConvertionMenuItems>(
                    value: config,
                    child: Text(
                      config.displayConfig,
                    ),
                  ),
                )
                .toList(),
            onChanged: (selected) {              
              textConvertionMenuItem = selected;
              switch (textConvertionMenuItem) {
                case TextConvertionMenuItems.Ascii:
                  sheetInfoText = asciiInfo;
                  break;
                case TextConvertionMenuItems.Binary:
                  sheetInfoText = binInfo;
                  break;
                case TextConvertionMenuItems.Hex:
                  sheetInfoText = hexInfo;
                  break;
                case TextConvertionMenuItems.Octal:
                  sheetInfoText = octalInfo;
                  break;
                case TextConvertionMenuItems.ReversedLetters:
                  sheetInfoText = reverseLettersInfo;
                  break;

                case TextConvertionMenuItems.ReversedWords:
                  sheetInfoText = reverseWordsInfo;
                  break;

                case TextConvertionMenuItems.CapitalizeSentense:
                  sheetInfoText = capitalizeSentenceInfo;
                  break;
                case TextConvertionMenuItems.CapitalizeWords:
                  sheetInfoText = capitalizeWordsInfo;
                  break;
                case TextConvertionMenuItems.UpperCase:
                  sheetInfoText = upperCaseInfo;
                  break;
                case TextConvertionMenuItems.LowerCase:
                  sheetInfoText = lowerCaseInfo;
                  break;
                case TextConvertionMenuItems.UpsideDown:
                  sheetInfoText = upsideDownInfo;
                  break;
                case TextConvertionMenuItems.Morse:
                  sheetInfoText = morseInfo;
                  break;
                case TextConvertionMenuItems.ZalgoMini:
                  sheetInfoText = zalgoInfo;
                  break;
                case TextConvertionMenuItems.ZalgoNormal:
                  sheetInfoText = zalgoInfo;
                  break;
                case TextConvertionMenuItems.ZalgoBig:
                  sheetInfoText = zalgoInfo;
                  break;
                case TextConvertionMenuItems.Base64:
                  sheetInfoText = base64Info;
                  break;
                case TextConvertionMenuItems.RandomCase:
                  sheetInfoText = randomCaseInfo;
                  break;
                case TextConvertionMenuItems.Nato:
                  sheetInfoText = natoInfo;
                  break;
                default:
              }
            },
          ),
        ),
      ],
    );
  }
}
