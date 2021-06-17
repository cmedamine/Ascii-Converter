import '../util/config.dart';
import 'package:flutter/material.dart';

class DropDownTextConversionWidget extends StatelessWidget {
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
                  sheetInfo = asciiInfo;
                  break;
                case TextConvertionMenuItems.Binary:
                  sheetInfo = binInfo;
                  break;
                case TextConvertionMenuItems.Hex:
                  sheetInfo = hexInfo;
                  break;
                case TextConvertionMenuItems.Octal:
                  sheetInfo = octalInfo;
                  break;
                case TextConvertionMenuItems.ReversedLetters:
                  sheetInfo = reverseLettersInfo;
                  break;

                case TextConvertionMenuItems.ReversedWords:
                  sheetInfo = reverseWordsInfo;
                  break;

                case TextConvertionMenuItems.CapitalizeSentense:
                  sheetInfo = capitalizeSentenceInfo;
                  break;
                case TextConvertionMenuItems.CapitalizeWords:
                  sheetInfo = capitalizeWordsInfo;
                  break;
                case TextConvertionMenuItems.UpperCase:
                  sheetInfo = upperCaseInfo;
                  break;
                case TextConvertionMenuItems.LowerCase:
                sheetInfo = lowerCaseInfo;
                break;
                case TextConvertionMenuItems.UpsideDown:
                sheetInfo = upsideDownInfo;
                break;
                case TextConvertionMenuItems.Morse:
                sheetInfo = morseInfo;
                break;
                case TextConvertionMenuItems.ZalgoMini:
                sheetInfo = zalgoInfo;
                break;
                case TextConvertionMenuItems.ZalgoNormal:
                sheetInfo = zalgoInfo;
                break;
                case TextConvertionMenuItems.ZalgoBig:
                sheetInfo = zalgoInfo;
                break;
                case TextConvertionMenuItems.Base64:
                sheetInfo = base64Info;
                break;
                case TextConvertionMenuItems.RandomCase:
                sheetInfo = randomCaseInfo;
                break;
                case TextConvertionMenuItems.Nato:
                sheetInfo = natoInfo;
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
