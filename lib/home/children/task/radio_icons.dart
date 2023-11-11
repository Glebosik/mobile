import 'package:flutter/material.dart';
import 'package:mobile/gen/colors.gen.dart';
import 'package:mobile/utils/text_styles.dart';

// ignore: must_be_immutable
class RadioIcons extends StatefulWidget {
  RadioIcons({super.key, required this.callback});

  Function callback;

  @override
  RadioIconsState createState() => RadioIconsState();
}

class RadioIconsState extends State<RadioIcons> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _icon(0,
            text: "Выполнена", icon: Icons.check, callback: widget.callback),
        _icon(1,
            text: "Не выполнена", icon: Icons.clear, callback: widget.callback),
        _icon(2,
            text: "Перенесена",
            icon: Icons.access_time,
            callback: widget.callback),
      ],
    );
  }

  Widget _icon(int index,
      {required String text,
      required IconData icon,
      required Function callback}) {
    return InkResponse(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: selected == index ? MyColors.blue : MyColors.black)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                icon,
                color: selected == index ? MyColors.blue : MyColors.black,
              ),
            ),
          ),
          Text(text,
              style: TextStyles.black12.copyWith(
                  color: selected == index ? MyColors.blue : MyColors.black)),
        ],
      ),
      onTap: () => setState(
        () {
          selected = index;
          callback(index);
        },
      ),
    );
  }
}
