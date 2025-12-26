import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isMobile = w < 900;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 24),
      child: Center(
        child: AnimatedContainer(
          duration: 600.ms,
          constraints: const BoxConstraints(maxWidth: 1100),
          padding: const EdgeInsets.all(36),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.08),
                Colors.white.withOpacity(0.02),
              ],
            ),
            border: Border.all(color: Colors.white.withOpacity(0.15)),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.25),
                blurRadius: 40,
                offset: const Offset(0, 20),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment:
            isMobile ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              Text(
                "About Me",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(color: Colors.white),
              ).animate().fadeIn().slideY(),

              const SizedBox(height: 28),

              Text(
                "I’m a Flutter Developer crafting premium mobile & web "
                    "applications with clean architecture, offline-first "
                    "capabilities, and scalable backend systems.\n\n"
                    "I work confidently across Flutter Web, Android, iOS "
                    "with Node.js (TypeScript) and Python FastAPI backends.",
                textAlign: isMobile ? TextAlign.start : TextAlign.center,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 17,
                  height: 1.8,
                ),
              ).animate().fadeIn(delay: 300.ms),
            ],
          ),
        ).animate().fadeIn().scale(begin: const Offset(0.95, 0.95)),
      ),
    );
  }
}

