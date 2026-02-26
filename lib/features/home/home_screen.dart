import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/utils/responsive.dart';
import '../../data/projects_data.dart';
import 'widgets/project_file_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F), // Dark deep gray
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. HERO SECTION
            const HeroSection(),

            // 2. SEPARATOR (Game Style)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: Row(
                children: [
                  const Expanded(child: Divider(color: Colors.white24, thickness: 1)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "MY PROJECTS // МОЇ ПРОЄКТИ",
                      style: GoogleFonts.pressStart2p(color: Colors.white, fontSize: 14),
                    ).animate(onPlay: (controller) => controller.repeat()).shimmer(duration: 2.seconds),
                  ),
                  const Expanded(child: Divider(color: Colors.white24, thickness: 1)),
                ],
              ),
            ),

            // 3. PROJECTS GRID (MacBook Files)
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
            
            // 4. SERVICES / PRICING
            const ServicesSection(),
            
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: Padding(
        padding: const EdgeInsets.all(80.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Replace with your wife's photo asset
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset('assets/images/profile_photo.jpg', width: 350, fit: BoxFit.cover),
            ).animate().slideX(begin: -0.2, curve: Curves.easeOut),
            const SizedBox(width: 60),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("ПРИВІТ", style: GoogleFonts.montserrat(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  Text(
                    "Мене звати Андріяна. Навчаюсь на другому курсі 'Маркетинг'. У світі СММ я вже 2 роки...",
                    style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 18, height: 1.6),
                  ),
                ],
              ).animate().fadeIn(delay: 400.ms),
            ),
          ],
        ),
      ),
      mobile: Column( /* Simple Column layout for mobile */ ),
    );
  }
}

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("SERVICES", style: GoogleFonts.montserrat(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900)),
        const SizedBox(height: 40),
        // Add pricing cards here
      ],
    );
  }
}