import 'package:evently/extensions/device_dimensions.dart';
import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.height * 0.005,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.welcome_back,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(
          AppLocalizations.of(context)!.john_safwat,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}
