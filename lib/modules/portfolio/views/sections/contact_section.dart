import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final cols = w < 600 ? 2 : w < 1000 ? 3 : 5;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 140, horizontal: 24),
      child: Column(
        children: [
          Text(
            "Get In Touch",
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(color: Colors.white),
          ).animate().fadeIn(),

          const SizedBox(height: 16),

          Text(
            "Let’s connect for opportunities or collaborations",
            style: const TextStyle(color: Colors.white70),
          ).animate().fadeIn(delay: 200.ms),

          const SizedBox(height: 60),

          GridView.count(
            crossAxisCount: cols,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 28,
            crossAxisSpacing: 28,
            children: const [
              _ContactIconCard(
                icon: FontAwesomeIcons.github,
                label: "GitHub",
                color: Color(0xFF181717),
                url: "https://github.com/yourusername",
              ),
              _ContactIconCard(
                icon: FontAwesomeIcons.linkedin,
                label: "LinkedIn",
                color: Color(0xFF0A66C2),
                url: "https://linkedin.com/in/yourprofile",
              ),
              _ContactIconCard(
                icon: FontAwesomeIcons.whatsapp,
                label: "WhatsApp",
                color: Color(0xFF25D366),
                url: "https://wa.me/91XXXXXXXXXX",
              ),
              _ContactIconCard(
                icon: FontAwesomeIcons.envelope,
                label: "Email",
                color: Color(0xFFEA4335),
                url: "mailto:your@email.com",
              ),
              _ContactIconCard(
                icon: FontAwesomeIcons.phone,
                label: "Call",
                color: Color(0xFF34A853),
                url: "tel:+91XXXXXXXXXX",
              ),
            ],
          ).animate().fadeIn(delay: 400.ms).slideY(),
        ],
      ),
    );
  }
}




class _ContactIconCard extends StatefulWidget {
  final IconData icon;
  final String label;
  final Color color;
  final String url;

  const _ContactIconCard({
    required this.icon,
    required this.label,
    required this.color,
    required this.url,
  });

  @override
  State<_ContactIconCard> createState() => _ContactIconCardState();
}

class _ContactIconCardState extends State<_ContactIconCard> {
  bool hover = false;

  Future<void> _open() async {
    final uri = Uri.parse(widget.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: GestureDetector(
        onTap: _open,
        child: AnimatedContainer(
          duration: 220.ms,
          transform:
          hover ? (Matrix4.identity()..translate(0.0, -10.0) ): Matrix4.identity(),
          padding: const EdgeInsets.all(26),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: const Color(0xFF020617),
            border: Border.all(color: Colors.white.withOpacity(0.12)),
            boxShadow: hover
                ? [
              BoxShadow(
                color: widget.color.withOpacity(0.55),
                blurRadius: 40,
              )
            ]
                : [],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                widget.icon,
                color: widget.color,
                size: 34,
              ),
              const SizedBox(height: 14),
              Text(
                widget.label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactCard extends StatefulWidget {
  final IconData icon;
  final String label;
  final String url;

  const _ContactCard({
    required this.icon,
    required this.label,
    required this.url,
  });

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
  bool hover = false;

  Future<void> _open() async {
    final uri = Uri.parse(widget.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _open,
        child: AnimatedContainer(
          duration: 250.ms,
          transform:
          hover ? (Matrix4.identity()..translate(0.0, -8.0)) : Matrix4.identity(),
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: LinearGradient(
              colors: hover
                  ? [
                Colors.blueAccent.withOpacity(0.25),
                Colors.purpleAccent.withOpacity(0.25),
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
                blurRadius: 40,
              )
            ]
                : [],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon,
                  color: Colors.white, size: 32),
              const SizedBox(height: 14),
              Text(
                widget.label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
