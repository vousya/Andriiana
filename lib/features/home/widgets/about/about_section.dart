import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/utils/responsive.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/widgets/custom_button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 60),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(),
            const SizedBox(width: 60),
            Expanded(child: _buildTextContent(context, isMobile: false)),
          ],
        ),
      ),
      
      mobile: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buildImage(),
            const SizedBox(height: 30),
            _buildTextContent(context, isMobile: true),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(
        'assets/images/profile_photo.jpg',
        width: 300,
        fit: BoxFit.cover,
      ),
    ).animate().fadeIn(duration: 800.ms).slideX(begin: -0.1);
  }

  Widget _buildTextContent(BuildContext context, {required bool isMobile}) {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          "Привіт",
          style: AppStyles.h1.copyWith(fontSize: isMobile ? 32 : 48),
        ),
        const SizedBox(height: 10),
        Text(
          "Мене звати Андріяна",
          style: AppStyles.h2.copyWith(fontSize: isMobile ? 20 : 32),
        ),
        const SizedBox(height: 20),
        Text(
          "Навчаюсь на другому курсі 'Маркетинг'. Захоплююсь творчістю у всіх її проявах. "
          "У світі СММ я вже 2 роки, і це стало моєю справжньою пристрастю.",
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: AppStyles.body,
        ),
        const SizedBox(height: 30),
        CustomButton(
          text: "ПРАЦЮВАТИ РАЗОМ", 
          onTap: () {}
        ),
      ],
    ).animate().fadeIn(delay: 300.ms);
  }
}