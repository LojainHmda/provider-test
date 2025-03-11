import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:testprovider/core/providers/loclization_provider.dart';
import 'package:testprovider/core/providers/theme_provider.dart';
import 'package:testprovider/core/utils/app_colors.dart';
import 'package:testprovider/core/widgets/event.dart';
import 'package:testprovider/core/widgets/taps_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var language = Provider.of<LocalizationsProvider>(context);
    var theme = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                  color: theme.theme == ThemeMode.dark
                      ? AppColors.primaryDark
                      : AppColors.primaryLight,
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(50))),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 15),
                child: Column(children: [
                  Row(
                    children: [
                      const Icon(Icons.location_pin,
                          color: AppColors.whiteColor),
                      const SizedBox(width: 10),
                      Text(
                        AppLocalizations.of(context)!.location,
                        style: const TextStyle(color: AppColors.whiteColor),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TabsBar(
                    backgroundColor: theme.theme == ThemeMode.dark
                        ? AppColors.primaryDark
                        : AppColors.primaryLight,
                    labelColor: AppColors.whiteColor,
                    selectedbackgroundColor: AppColors.whiteColor,
                    selectedlabelColor: theme.theme == ThemeMode.dark
                        ? AppColors.primaryDark
                        : AppColors.primaryLight,
                  ),
                ]),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return const EventWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
