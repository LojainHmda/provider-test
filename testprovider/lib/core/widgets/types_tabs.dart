import 'package:flutter/material.dart';

class TypesTab extends StatefulWidget {
  const TypesTab(this.type, this.isSelected,
      {super.key,
      required this.labelColor,
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
