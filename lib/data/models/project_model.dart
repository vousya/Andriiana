class Project {
  final String id;
  final String title;
  final String date;
  final String description;
  final String imagePath;
  final List<String> tools;

  Project({
    required this.id,
    required this.title,
    required this.date,
    required this.description,
    required this.imagePath,
    required this.tools,
  });
}