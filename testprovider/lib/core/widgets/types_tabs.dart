import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testprovider/core/utils/app_colors.dart';

import '../providers/theme_provider.dart';

class TypesTab extends StatefulWidget {
  TypesTab(this.type);
  final String type;
  @override
  State<TypesTab> createState() => _TypesTabState();
}

class _TypesTabState extends State<TypesTab> {
  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    return Container(
        width: 80,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.whiteColor),
            borderRadius: BorderRadius.circular(30)),
        child: Center(
            child: Text(
          widget.type,
          style: TextStyle(
              color: theme.theme == ThemeMode.dark
                  ? AppColors.greyColor
                  : AppColors.blackColor),
        )));
  }
}
