import 'package:flutter/material.dart';
import 'package:mobile/gen/assets.gen.dart';
import 'package:mobile/utils/text_styles.dart';
import 'package:models/models.dart';

import 'widgets.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.user,
    required this.height,
  });

  final User user;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: MediaQuery.of(context).size.width * 0.97,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 2,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
            child: Stack(children: [
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: MyAssets.images.profileBackgroundLogo.svg(),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Avatar(
                            secondName: user.fio.split(' ').first,
                            avatarSize: 24,
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(user.fio.split(' ').first,
                                  style: TextStyles.blue16bold),
                              Text(
                                  '${user.fio.split(' ')[1]} ${user.fio.split(' ')[2]}',
                                  style: TextStyles.black16bold),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Row(
                          children: [
                            const SizedBox(width: 60),
                            Text(user.grade, style: TextStyles.blue14)
                          ],
                        ),
                      )
                    ],
                  ),
                  /*trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  ),*/
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
