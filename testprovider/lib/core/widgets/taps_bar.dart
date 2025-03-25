import 'package:flutter/material.dart';
import 'package:testprovider/l10n/app_localizations.dart';

import 'types_tabs.dart';

class TabsBar extends StatefulWidget {
  const TabsBar({
    super.key,
    required this.labelColor,
    required this.backgroundColor,
    required this.selectedlabelColor,
    required this.selectedbackgroundColor,
    required this.onTabChanged,
  });
  final Color labelColor;
  final Color backgroundColor;
  final Color selectedlabelColor;
  final Color selectedbackgroundColor;
  static int selectedindex = 0;
  final Function(int) onTabChanged;

  @override
  State<TabsBar> createState() => _TabsBarState();
}

class _TabsBarState extends State<TabsBar> {
  @override
  Widget build(BuildContext context) {
    List<String> types = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.meetings,
      AppLocalizations.of(context)!.bday
    ];
    return DefaultTabController(
        length: 4,
        child: TabBar(
          onTap: (value) {
            setState(() {
              TabsBar.selectedindex = value;
            });
            widget.onTabChanged(value);
          },
          indicatorColor: Colors.transparent,
          dividerColor: Colors.transparent,
          isScrollable: true,
          labelPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          tabAlignment: TabAlignment.start,
          tabs: types.map((value) {
            return TypesTab(
              value,
              TabsBar.selectedindex == types.indexOf(value) ? true : false,
              backgroundColor: widget.backgroundColor,
              labelColor: widget.labelColor,
              selectedbackgroundColor: widget.selectedbackgroundColor,
              selectedlabelColor: widget.selectedlabelColor,
            );
          }).toList(),
        ));
  }
}
