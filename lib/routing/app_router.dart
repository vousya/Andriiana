import 'package:go_router/go_router.dart';
import '../features/home/home_screen.dart';
import '../features/project_details/project_detail_screen.dart';

final AppRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    
    GoRoute(
      path: '/project/:id',
      builder: (context, state) {
        final projectId = state.pathParameters['id'];
        return ProjectDetailScreen(projectId: projectId ?? '');
      },
    ),
  ],
);