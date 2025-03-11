import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:testprovider/core/providers/theme_provider.dart';

import '../utils/app_colors.dart';
import 'types_tabs.dart';

class TabsBar extends StatefulWidget {
  const TabsBar(
      {required this.labelColor,
      required this.backgroundColor,
      required this.selectedlabelColor,
      required this.selectedbackgroundColor});

  final Color labelColor;
  final Color backgroundColor;
  final Color selectedlabelColor;
  final Color selectedbackgroundColor;
  @override
  State<TabsBar> createState() => _TabsBarState();
}

class _TabsBarState extends State<TabsBar> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);

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
              selectedindex = value;
            });
          },
          indicatorColor: Colors.transparent,
          dividerColor: Colors.transparent,
          isScrollable: true,
          labelPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          tabAlignment: TabAlignment.start,
          tabs: types.map((value) {
            return TypesTab(
              value,
              selectedindex == types.indexOf(value) ? true : false,
              backgroundColor: widget.backgroundColor,
              labelColor: widget.labelColor,
              selectedbackgroundColor: widget.selectedbackgroundColor,
              selectedlabelColor: widget.selectedlabelColor,
            );
          }).toList(),
        ));
  }
}
