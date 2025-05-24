import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srocks_music_assignment/models/service_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final service = ModalRoute.of(context)!.settings.arguments as ServiceModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          service.title,
          style: GoogleFonts.lobster(fontSize: 24),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              service.backgroundImage,
              fit: BoxFit.cover,
              color: Colors.black.withValues(alpha: 0.3),
              colorBlendMode: BlendMode.darken,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: service.iconUrl.endsWith('.svg')
                      ? SvgPicture.asset(
                    service.iconUrl,
                    height: 100,
                    width: 100,
                  )
                      : Image.asset(
                    service.iconUrl,
                    height: 100,
                    width: 100,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  service.title,
                  style: GoogleFonts.lobster(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  service.description,
                  style: GoogleFonts.syne(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}