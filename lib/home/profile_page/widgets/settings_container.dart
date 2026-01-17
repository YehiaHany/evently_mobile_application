import 'package:flutter/material.dart';
import '../../../core/utils/app_colors.dart';

class SettingsContainer extends StatelessWidget {
  const SettingsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.white,
          border: Border.all(
            color: AppColors.offWhite,
            width: 1,
          )
      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Language",style: Theme.of(context).textTheme.headlineMedium,),
          Icon(Icons.arrow_forward_ios,color: AppColors.primaryBlue,),
        ],
      ) ,
    );
  }
}
