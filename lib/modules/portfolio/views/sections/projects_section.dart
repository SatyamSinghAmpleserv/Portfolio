import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  static const projects = [
    {
      "title": "Sales Force Automation",
      "desc": "Offline-first enterprise app with sync engine",
      "tech": "Flutter • SQLite • REST"
    },
    {
      "title": "OCR Document Platform",
      "desc": "Invoice & BOL OCR with structured extraction",
      "tech": "Flutter • AWS Textract"
    },
    {
      "title": "Face Authentication",
      "desc": "Liveness + face verification system",
      "tech": "Flutter • ML • APIs"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final cols = w < 800 ? 1 : w < 1200 ? 2 : 3;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Selected Projects",
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(color: Colors.white),
          ).animate().fadeIn(),

          const SizedBox(height: 48),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: projects.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: cols,
              mainAxisSpacing: 32,
              crossAxisSpacing: 32,
              childAspectRatio: 1.2,
            ),
            itemBuilder: (_, i) {
              final p = projects[i];
              return _TiltCard(
                title: p['title']!,
                desc: p['desc']!,
                tech: p['tech']!,
              ).animate().fadeIn(delay: (i * 200).ms).slideY();
            },
          ),
        ],
      ),
    );
  }
}

class _TiltCard extends StatefulWidget {
  final String title, desc, tech;
  const _TiltCard({
    required this.title,
    required this.desc,
    required this.tech,
  });

  @override
  State<_TiltCard> createState() => _TiltCardState();
}

class _TiltCardState extends State<_TiltCard> {
  double dx = 0, dy = 0;
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (e) {
        setState(() {
          hover = true;
          dx = (e.localPosition.dx - 150) / 60;
          dy = (e.localPosition.dy - 150) / 60;
        });
      },
      onExit: (_) => setState(() {
        hover = false;
        dx = dy = 0;
      }),
      child: AnimatedContainer(
        duration: 300.ms,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(-dy)
          ..rotateY(dx),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            colors: hover
                ? [
              Colors.blue.withOpacity(0.25),
              Colors.purple.withOpacity(0.25),
            ]
                : [
              Colors.white.withOpacity(0.08),
              Colors.white.withOpacity(0.02),
            ],
          ),
          border: Border.all(color: Colors.white.withOpacity(0.15)),
          boxShadow: hover
              ? [
            BoxShadow(
              color: Colors.blue.withOpacity(0.6),
              blurRadius: 50,
            )
          ]
              : [],
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            Text(widget.desc,
                style: const TextStyle(color: Colors.white70, height: 1.6)),
            const Spacer(),
            Text(widget.tech,
                style: const TextStyle(color: Colors.blueAccent)),
          ],
        ),
      ),
    );
  }
}


class _ProjectCard extends StatefulWidget {
  final String title;
  final String desc;
  final String tech;

  const _ProjectCard({
    required this.title,
    required this.desc,
    required this.tech,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: AnimatedContainer(
        duration: 250.ms,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF020617),
          borderRadius: BorderRadius.circular(16),
          boxShadow: hover
              ? [
            BoxShadow(
              color: Colors.blue.withOpacity(0.4),
              blurRadius: 20,
            )
          ]
              : [],
        ),
        transform: hover
            ? (Matrix4.identity()..translate(0.0, -6.0))
            : Matrix4.identity(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            Text(widget.desc,
                style:
                const TextStyle(color: Colors.white70, height: 1.5)),
            const Spacer(),
            Text(widget.tech,
                style:
                const TextStyle(color: Colors.blueAccent, fontSize: 13)),
          ],
        ),
      ),
    );
  }
}
