import 'package:flutter/material.dart';
import 'package:mobile/gen/assets.gen.dart';
import 'package:mobile/gen/colors.gen.dart';
import 'package:mobile/home/children/widgets/my_appbar.dart';
import 'package:mobile/utils/text_styles.dart';
import 'package:models/models.dart';

class TaskInfoView extends StatelessWidget {
  const TaskInfoView({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    Color textColor = Colors.black;
    return Scaffold(
      appBar: myAppBar('Задача'),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: textColor,
                  width: 2,
                ))),
                child: Text(task.title,
                    style: TextStyles.black20bold.copyWith(
                      color: textColor,
                    )),
              ),
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Основная информация:',
                style: TextStyles.black16bold.copyWith(color: textColor),
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.pin_drop,
                  color: textColor,
                ),
                const SizedBox(width: 4),
                Text(task.point_address)
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  color: textColor,
                ),
                const SizedBox(width: 4),
                Text(task.getDateString())
              ],
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Комментарий:',
                style: TextStyles.black16bold.copyWith(color: textColor),
              ),
            ),
            const SizedBox(height: 8),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                  'Необходимо уточнить нужен ли пакет дополнительных опций для карты'),
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Приложенные файлы:',
                  style: TextStyles.black16bold.copyWith(color: textColor)),
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: MyAssets.images.file.svg(),
                ),
                Text('Нет приложенных файлов',
                    style: TextStyles.black14
                        .copyWith(color: MyColors.grayText.withAlpha(150))),
              ],
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
