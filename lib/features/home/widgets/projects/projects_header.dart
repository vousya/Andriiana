import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/constants/app_colors.dart';


class ProjectsHeader extends StatelessWidget {
  const ProjectsHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 60),
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              color: AppColors.white24,
              thickness: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "MY PROJECTS",
              style: AppStyles.gameHeader,
            )
                .animate(onPlay: (controller) => controller.repeat())
                .shimmer(duration: 2.seconds),
          ),
          const Expanded(
            child: Divider(
              color: AppColors.white24,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}