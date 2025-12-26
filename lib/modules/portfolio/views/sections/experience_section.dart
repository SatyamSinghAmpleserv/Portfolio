

import '../../../../exports.dart';
import '../../controllers/portfolio_controller.dart';

class ExperienceSection extends StatelessWidget {
  ExperienceSection({super.key});

  final controller = Get.find<PortfolioController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: controller.experiences.map((e) {
        return ListTile(
          title: Text(e['title']!),
          subtitle: Text("${e['period']} • ${e['note']}"),
        ).animate().fadeIn().slideY();
      }).toList(),
    );
  }
}
