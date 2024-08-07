import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/my_provider.dart';
import '../../app_color.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var proTxt = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              context.setLocale(Locale("ar"));
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("arabic".tr(),
                    style: context.locale == Locale("ar")
                        ? Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: AppColor.primaryColor)
                        : proTxt.mode == ThemeMode.dark
                            ? Theme.of(context).textTheme.bodyLarge
                            : Theme.of(context).textTheme.bodySmall),
                context.locale == Locale("ar")
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
            onTap: () {
              context.setLocale(Locale("en"));
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("english".tr(),
                    style: context.locale == Locale("en")
                        ? Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: AppColor.primaryColor)
                        : proTxt.mode == ThemeMode.dark
                            ? Theme.of(context).textTheme.bodyLarge
                            : Theme.of(context).textTheme.bodySmall),
                context.locale == Locale("en")
                    ? Icon(
                        Icons.done,
                        color: AppColor.primaryColor,
                      )
                    : SizedBox()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget nameFunction(String text) {
    return Text(text);
  }
}
