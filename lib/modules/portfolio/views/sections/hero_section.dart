

import '../../../../exports.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../controllers/portfolio_controller.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PortfolioController>();
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      height: 700,
      padding: const EdgeInsets.symmetric(horizontal: 28),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:
        isMobile ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          /// NAME
          Text(
            "Satyam Singh",
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ).animate().fadeIn().slideY(),

          const SizedBox(height: 12),

          /// ROLE
          Text(
            "Flutter Developer • Full-Stack Mobile Engineer",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.white70,
            ),
          ).animate().fadeIn(delay: 200.ms),

          const SizedBox(height: 18),

          /// LIVE EXPERIENCE
          Obx(
                () => Text(
              "Experience: ${controller.experienceText.value}",
              style: const TextStyle(
                color: Colors.blueAccent,
                fontSize: 14.5,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.4,
              ),
            ),
          ).animate().fadeIn(delay: 400.ms),

          const SizedBox(height: 40),

          /// CTA BUTTONS
          Row(
            mainAxisAlignment:
            isMobile ? MainAxisAlignment.start : MainAxisAlignment.center,
            children: const [
              _HeroButton(text: "View Projects"),
              SizedBox(width: 18),
              _HeroButton(text: "Hire Me", outlined: true),
            ],
          ).animate().fadeIn(delay: 600.ms),
        ],
      ),
    );
  }
}



class _HeroButton extends StatefulWidget {
  final String text;
  final bool outlined;

  const _HeroButton({
    required this.text,
    this.outlined = false,
  });

  @override
  State<_HeroButton> createState() => _HeroButtonState();
}

class _HeroButtonState extends State<_HeroButton> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: AnimatedContainer(
        duration: 200.ms,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: widget.outlined
              ? Colors.transparent
              : (hover ? Colors.blueAccent : Colors.blue),
          border: Border.all(color: Colors.blue),
          boxShadow: hover && !widget.outlined
              ? [
            BoxShadow(
              color: Colors.blue.withOpacity(0.6),
              blurRadius: 30,
            )
          ]
              : [],
        ),
        transform:
        hover ? (Matrix4.identity()..scale(1.05) ): Matrix4.identity(),
        child: Text(
          widget.text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}


class _AnimatedButton extends StatefulWidget {
  final String text;
  final bool outlined;

  const _AnimatedButton({
    required this.text,
    this.outlined = false,
  });

  @override
  State<_AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<_AnimatedButton> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: AnimatedContainer(
        duration: 200.ms,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        decoration: BoxDecoration(
          color: widget.outlined
              ? Colors.transparent
              : hover
              ? Colors.blueAccent
              : Colors.blue,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blue),
        ),
        transform: hover ? (Matrix4.identity()..scale(1.05)) : Matrix4.identity(),
        child: Text(
          widget.text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
