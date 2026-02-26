import 'models/project_model.dart';

final List<Project> allProjects = [
  Project(
    id: 'vash-lavash',
    title: 'Vash Lavash',
    date: 'травень 2024 - листопад 2024',
    description: 'SMM Strategy, content planning, and visual identity for a bakery chain.',
    imagePath: 'https://images.unsplash.com/photo-1509440159596-0249088772ff?q=80&w=500', // Replace with local asset
    tools: ['Instagram', 'CapCut', 'Canva'],
  ),
  Project(
    id: 'project-2',
    title: 'Beauty Studio',
    date: 'січень 2024 - квітень 2024',
    description: 'Full social media management and aesthetic content creation.',
    imagePath: 'https://images.unsplash.com/photo-1560066984-138dadb4c035?q=80&w=500',
    tools: ['Reels', 'Pinterest'],
  ),
  // Add more here...
];