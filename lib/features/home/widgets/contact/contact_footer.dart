import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_styles.dart';

class ContactFooter extends StatelessWidget {
  const ContactFooter({super.key});

  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $urlString');
    }
  }

  Future<void> _sendEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'ilchykandriana1974@gmail.com',
      queryParameters: {'subject': 'SMM Project Inquiry'},
    );
    if (!await launchUrl(emailLaunchUri)) {
      throw Exception('Could not launch email');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      decoration: const BoxDecoration(
        color: AppColors.black,
        border: Border(top: BorderSide(color: AppColors.white10)),
      ),
      child: Column(
        children: [
          Text(
            "LET'S WORK TOGETHER",
            style: AppStyles.h2.copyWith(letterSpacing: 4),
          ).animate().fadeIn().slideY(begin: 0.5),
          
          const SizedBox(height: 40),

          Wrap(
            spacing: 30,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _ContactLink(
                icon: Icons.camera_alt_outlined,
                label: "INSTAGRAM",
                onTap: () => _launchURL("https://www.instagram.com/ilchukandriiana"),
              ),
              _ContactLink(
                icon: Icons.send_rounded,
                label: "TELEGRAM",
                onTap: () => _launchURL("https://t.me/andriiana_il"),
              ),
              _ContactLink(
                icon: Icons.email_outlined,
                label: "EMAIL",
                onTap: _sendEmail,
              ),
            ],
          ),

          const SizedBox(height: 60),

          Text(
            "© 2026 ANDRIIANA ILCHUK • SMM PORTFOLIO",
            style: AppStyles.body.copyWith(fontSize: 10, color: AppColors.grey),
          ),
        ],
      ),
    );
  }
}

class _ContactLink extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ContactLink({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  State<_ContactLink> createState() => _ContactLinkState();
}

class _ContactLinkState extends State<_ContactLink> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: 200.ms,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(
              color: isHovered ? AppColors.white : AppColors.darkGrey,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                color: isHovered ? AppColors.white : AppColors.grey,
                size: 18,
              ),
              const SizedBox(width: 10),
              Text(
                widget.label,
                style: AppStyles.body.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: isHovered ? AppColors.white : AppColors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}