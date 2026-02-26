import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../../../data/models/project_model.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_styles.dart';


class ProjectFileIcon extends StatefulWidget {
  final Project project;
  const ProjectFileIcon({super.key, required this.project});

  @override
  State<ProjectFileIcon> createState() => _ProjectFileIconState();
}

class _ProjectFileIconState extends State<ProjectFileIcon> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: () => context.go('/project/${widget.project.id}'),
        child: AnimatedContainer(
          duration: 200.ms,
          curve: Curves.easeInOut,
          transform: isHovered ? (Matrix4.identity()..scale(1.05)) : Matrix4.identity(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 220,
                height: 120,
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.white.withOpacity(isHovered ? 0.5 : 0.1)),
                  image: DecorationImage(
                    image: NetworkImage(widget.project.imagePath),
                    fit: BoxFit.cover,
                    opacity: 1,
                  ),
                )
              ),
              const SizedBox(height: 8),
              Text(
                widget.project.title,
                textAlign: TextAlign.center,
                style: AppStyles.body,
              ),
            ],
          ),
        ),
      ),
    ).animate().fadeIn(delay: 200.ms).scale();
  }
}