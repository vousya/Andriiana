import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../data/projects_data.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_styles.dart';

class ProjectDetailScreen extends StatelessWidget {
  final String projectId;

  const ProjectDetailScreen({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    final project = allProjects.firstWhere(
      (p) => p.id == projectId,
      orElse: () => allProjects.first,
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.white),
          onPressed: () => context.go('/'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.title.toUpperCase(),
                    style: AppStyles.h1.copyWith(fontSize: 40),
                  ).animate().fadeIn().slideX(),
                  Text(
                    project.date,
                    style: AppStyles.body.copyWith(color: AppColors.grey),
                  ),
                  
                  const SizedBox(height: 40),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: double.infinity,
                      height: 500,
                      color: AppColors.darkGrey,
                      child: Image.network(
                        project.imagePath,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => 
                          const Icon(Icons.broken_image, size: 100),
                      ),
                    ),
                  ).animate().scale(delay: 200.ms),

                  const SizedBox(height: 40),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("ПРО ПРОЄКТ", style: AppStyles.h2.copyWith(fontSize: 18)),
                            const SizedBox(height: 10),
                            Text(project.description, style: AppStyles.body),
                          ],
                        ),
                      ),
                      const SizedBox(width: 40),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("ІНСТРУМЕНТИ", style: AppStyles.h2.copyWith(fontSize: 18)),
                            const SizedBox(height: 10),
                            Wrap(
                              spacing: 10,
                              children: project.tools.map((tool) => Chip(
                                label: Text(tool, style: const TextStyle(fontSize: 12)),
                                backgroundColor: AppColors.darkGrey,
                                side: BorderSide.none,
                              )).toList(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}