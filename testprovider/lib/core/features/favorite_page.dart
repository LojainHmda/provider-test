import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testprovider/core/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../providers/loclization_provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/event.dart';

class FavPage extends StatelessWidget {
  FavPage({super.key});
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    var language = Provider.of<LocalizationsProvider>(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          CustomTextField(
            prefixIcon: const Icon(Icons.search),
            controller: searchController,
            hintText: AppLocalizations.of(context)!.search_for_event,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return const EventWidget();
              },
            ),
          ),
        ]),
      ),
    );
  }
}
