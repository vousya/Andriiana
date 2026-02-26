import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/utils/responsive.dart';
import '../../data/projects_data.dart';
import 'widgets/project_file_icon.dart';
import '../../core/constants/app_styles.dart';
import '../../core/widgets/custom_button.dart';

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
      // DESKTOP LAYOUT (Side by side)
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
      
      // MOBILE LAYOUT (Stacked)
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
          onTap: () { /* Scroll to contact */ }
        ),
      ],
    ).animate().fadeIn(delay: 300.ms);
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