
import '../../../../exports.dart';
import '../../controllers/portfolio_controller.dart';
import 'about_section.dart';
import 'contact_section.dart';
import 'experience_section.dart';
import 'hero_section.dart';
import 'projects_section.dart';



class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PortfolioController());

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: SingleChildScrollView(
        child: Column(
          children:  [
            HeroSection(),
            AboutSection(),
            ExperienceSection(),
            ProjectsSection(),
            ContactSection(),
          ],
        ),
      ).animate().fadeIn(duration: 800.ms),
    );
  }
}
