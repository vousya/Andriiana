import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import '../../../data/models/project_model.dart';

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
              // The "File Icon" box
              Container(
                width: 100,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white.withOpacity(isHovered ? 0.5 : 0.1)),
                  image: DecorationImage(
                    image: NetworkImage(widget.project.imagePath),
                    fit: BoxFit.cover,
                    opacity: 0.6,
                  ),
                ),
                child: const Icon(Icons.insert_drive_file_outlined, color: Colors.white, size: 40),
              ),
              const SizedBox(height: 8),
              Text(
                widget.project.title,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    ).animate().fadeIn(delay: 200.ms).scale();
  }
}