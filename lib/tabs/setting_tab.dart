import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/tabs/theme_bottom_sheet.dart';

import '../Providers/my_provider.dart';
import '../app_color.dart';
import 'language_bottom_sheet.dart';

class SettingTab extends StatelessWidget {
  const SettingTab({super.key});

  @override
  Widget build(BuildContext context) {
    var proText = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "setting".tr(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              "theme".tr(),
              style: proText.mode == ThemeMode.dark
                  ? Theme.of(context).textTheme.bodyLarge
                  : Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => ThemeBottomSheet(),
                );
              },
              child: Container(
                padding: EdgeInsets.all(14),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: proText.mode == ThemeMode.light
                        ? AppColor.whiteColor
                        : AppColor.contDarkColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColor.primaryColor)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      proText.mode == ThemeMode.light
                          ? "light".tr()
                          : "dark".tr(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: AppColor.primaryColor),
                    ),
                    Icon(
                      Icons.arrow_drop_down_outlined,
                      color: AppColor.primaryColor,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "language".tr(),
              style: proText.mode == ThemeMode.dark
                  ? Theme.of(context).textTheme.bodyLarge
                  : Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.black),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => LanguageBottomSheet(),
                );
              },
              child: Container(
                padding: EdgeInsets.all(14),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: proText.mode == ThemeMode.light
                        ? AppColor.whiteColor
                        : AppColor.contDarkColor,
                    border: Border.all(color: AppColor.primaryColor)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.locale == Locale("ar")
                          ? "arabic".tr()
                          : "english".tr(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: AppColor.primaryColor),
                    ),
                    Icon(
                      Icons.arrow_drop_down_outlined,
                      color: AppColor.primaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
