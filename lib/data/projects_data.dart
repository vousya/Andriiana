import 'models/project_model.dart';

final List<Project> allProjects = [
  Project(
    id: 'vash-lavash',
    title: 'Vash Lavash',
    date: 'травень 2024 - листопад 2024',
    description: 'Комплексне ведення Instagram: стратегія, створення контенту та просування.',
    imagePath: 'assets/images/project_images/vash_lavash.jpg', 
    tools: ['Instagram', 'CapCut', 'Canva'],
  ),
  Project(
    id: 'vesna-care',
    title: 'Vesna Care',
    date: 'червень 2024 - грудень 2024',
    description: 'Естетичний візуал для бренду доглядової косметики. Фокус на натуральності.',
    imagePath: 'assets/images/project_images/vesna_care.png',
    tools: ['Pinterest', 'Lightroom'],
  ),
];