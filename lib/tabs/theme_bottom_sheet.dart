import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Providers/my_provider.dart';
import '../app_color.dart';


class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var proTheme = Provider.of<MyProvider>(context);
    return Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              overlayColor: WidgetStateColor.transparent,
              onTap: () {
                proTheme.ChangeTheme(ThemeMode.light);
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("light".tr(),
                      style: proTheme.mode == ThemeMode.light
                          ? Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: AppColor.primaryColor)
                          : Theme.of(context).textTheme.bodyLarge),
                  proTheme.mode == ThemeMode.light
                      ? Icon(
                    Icons.done,
                    color: AppColor.primaryColor,
                  )
                      : SizedBox()
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            InkWell(
              overlayColor: WidgetStateColor.transparent,
              onTap: () {
                proTheme.ChangeTheme(ThemeMode.dark);
                Navigator.pop(context);

              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("dark".tr(),
                      style: proTheme.mode == ThemeMode.dark
                          ? Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: AppColor.primaryColor)
                          : Theme.of(context).textTheme.bodySmall),
                  proTheme.mode == ThemeMode.dark
                      ? Icon(Icons.done,color:AppColor.primaryColor,)
                      : SizedBox()
                ],
              ),
            ),
          ],
        ));
  }
}
