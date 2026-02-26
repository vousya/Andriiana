import 'package:flutter/material.dart';

import '../../data/projects_data.dart';

import '../../core/constants/app_colors.dart';

import 'widgets/projects/project_icon.dart';
import 'widgets/about/about_section.dart';
import 'widgets/services/services_section.dart';
import 'widgets/projects/projects_header.dart';
import 'widgets/contact/contact_footer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [

            const HeroSection(),

            const ProjectsHeader(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Wrap(
                spacing: 40,
                runSpacing: 40,
                alignment: WrapAlignment.center,
                children: allProjects.map((p) => ProjectFileIcon(project: p)).toList(),
              ),
            ),

            const SizedBox(height: 100),
            
            const ServicesSection(),
            
            const SizedBox(height: 100),

            const ContactFooter(),
          ],
        ),
      ),
    );
  }
}