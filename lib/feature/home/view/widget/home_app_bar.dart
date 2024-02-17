import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

/// HomeAppBar class
final class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// HomeAppBar const
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text(
        'Boycott List',
        style: context.general.textTheme.titleMedium?.copyWith(
          color: ColorName.white,
        ),
      ),
      actions: [
        SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: const IconThemeData(color: ColorName.white),
          backgroundColor: Colors.transparent,
          direction: SpeedDialDirection.down,
          elevation: 0,
          children: [
            SpeedDialChild(
              label: 'Dil Değiştir',
              child: const Icon(
                Icons.language,
                color: ColorName.green,
              ),
              onTap: () {},
            ),
            SpeedDialChild(
              label: 'Boykot önerisinde bulun',
              child: const Icon(
                Icons.back_hand_outlined,
                color: ColorName.red,
              ),
              onTap: () {},
            ),
            SpeedDialChild(
              label: 'Destek ol',
              child: const Icon(
                Icons.handshake,
                color: ColorName.green,
              ),
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
