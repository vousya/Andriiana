import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/widgets/glass_container.dart';
import '../../../../core/utils/responsive.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      _ServiceData(
        title: "ВІЗУАЛЬНА СТРАТЕГІЯ",
        description: "Розробка унікального стилю, мудборди, підбір шрифтів та кольорової палітри для вашого бренду.",
        price: "від \$200",
      ),
      _ServiceData(
        title: "ПОВНЕ ВЕДЕННЯ",
        description: "Контент-план, сторіз, пости, монтаж Reels та повна комунікація з аудиторією.",
        price: "від \$500/міс",
      ),
      _ServiceData(
        title: "КОНСУЛЬТАЦІЯ",
        description: "Годинний розбір вашого профілю, відповіді на питання та покроковий план просування.",
        price: "\$50",
      ),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: Column(
        children: [
          Text(
            "SERVICES",
            style: AppStyles.h2.copyWith(letterSpacing: 2),
          ).animate().fadeIn().slideY(begin: 0.3),
          
          const SizedBox(height: 60),

          Responsive(
            desktop: Wrap(
              spacing: 30,
              runSpacing: 30,
              alignment: WrapAlignment.center,
              children: services.map((s) => _ServiceCard(data: s)).toList(),
            ),
            mobile: Column(
              children: services.map((s) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: _ServiceCard(data: s),
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatefulWidget {
  final _ServiceData data;
  const _ServiceCard({required this.data});

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: 300.ms,
        width: Responsive.isMobile(context) ? double.infinity : 350,
        height: 280,
        transform: isHovered ? (Matrix4.identity()..translate(0, -10)) : Matrix4.identity(),
        child: GlassContainer(
          opacity: isHovered ? 0.12 : 0.05,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 2,
                      width: isHovered ? 60 : 30,
                      color: AppColors.white,
                    ).animate(target: isHovered ? 1 : 0).tint(color: Colors.white),
                    const SizedBox(height: 20),
                    Text(
                      widget.data.title,
                      style: AppStyles.h2.copyWith(fontSize: 18, letterSpacing: 1),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      widget.data.description,
                      style: AppStyles.body.copyWith(fontSize: 14, color: Colors.white70),
                    ),
                  ],
                ),
                Text(
                  widget.data.price,
                  style: AppStyles.body.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ServiceData {
  final String title;
  final String description;
  final String price;
  _ServiceData({required this.title, required this.description, required this.price});
}