import 'package:flutter/material.dart';
import 'package:testprovider/core/utils/app_colors.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(color: AppColors.primaryLight, child: Text("data")),
          ],
        ),
      ),
    );
  }
}
