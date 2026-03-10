import 'package:go_router/go_router.dart';
import '../../pages/home_page.dart';

final GoRouter appRouter = GoRouter(
  routes: [GoRoute(path: '/', builder: (context, state) => const HomePage())],
);
