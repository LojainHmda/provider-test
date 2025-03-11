import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testprovider/core/utils/app_colors.dart';

import '../providers/theme_provider.dart';

class TypesTab extends StatefulWidget {
  TypesTab(this.type, this.isSelected,
      {required this.labelColor,
      required this.backgroundColor,
      required this.selectedlabelColor,
      required this.selectedbackgroundColor});
  final String type;
  final bool isSelected;
  final Color labelColor;
  final Color backgroundColor;
  final Color selectedlabelColor;
  final Color selectedbackgroundColor;
  @override
  State<TypesTab> createState() => _TypesTabState();
}

class _TypesTabState extends State<TypesTab> {
  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
            color: widget.isSelected
                ? widget.selectedbackgroundColor
                : widget.backgroundColor,
            border: Border.all(
                color: widget.isSelected
                    ? widget.selectedlabelColor
                    : widget.labelColor,
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        child: Center(
            child: Text(
          widget.type,
          style: TextStyle(
              color: widget.isSelected
                  ? widget.selectedlabelColor
                  : widget.labelColor),
        )));
  }
}
