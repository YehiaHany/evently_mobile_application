import 'package:evently/extensions/device_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/theme_provider.dart';

class PageViewItemSecondHalf extends StatelessWidget {
  String title;
  String body;

  PageViewItemSecondHalf({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      spacing: context.height * 0.012,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineLarge),
        Expanded(
          child: SingleChildScrollView(
            child: Text(body, style: Theme.of(context).textTheme.titleMedium),
          ),
        ),
      ],
    );
  }
}
