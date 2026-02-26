import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isPrimary;

  const CustomButton({
    super.key, 
    required this.text, 
    required this.onTap, 
    this.isPrimary = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        decoration: BoxDecoration(
          color: isPrimary ? AppColors.white : Colors.transparent,
          border: Border.all(color: AppColors.white),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          text,
          style: AppStyles.body.copyWith(
            color: isPrimary ? AppColors.black : AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}