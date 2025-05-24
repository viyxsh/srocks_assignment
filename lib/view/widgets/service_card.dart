import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srocks_music_assignment/models/service_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ServiceCard extends StatelessWidget {
  final ServiceModel service;
  final VoidCallback onTap;

  const ServiceCard({super.key, required this.service, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    final isTablet = screenWidth > 600;

    final cardHeight = screenHeight * 0.08;
    final horizontalPadding = screenWidth * 0.04;
    final verticalPadding = screenHeight * 0.012;
    final iconSize = screenWidth * 0.08;
    final arrowIconSize = screenWidth * 0.05;
    final spacingBetweenElements = screenWidth * 0.03;
    final verticalMargin = screenHeight * 0.006;
    final borderRadius = screenWidth * 0.04;
    // Rounded corners

    final titleFontSize = isTablet ? screenWidth * 0.035 : screenWidth * 0.042;
    final descriptionFontSize = isTablet ? screenWidth * 0.025 : screenWidth * 0.032;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: verticalMargin),
        height: cardHeight,
        decoration: BoxDecoration(
          color: const Color(0xFF2C2C2E),
          borderRadius: BorderRadius.circular(borderRadius),
          image: service.backgroundImage.isNotEmpty ? DecorationImage(
            image: AssetImage(service.backgroundImage),
            fit: BoxFit.cover,
            opacity: 0.1,
          ) : null,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Row(
            children: [
              Container(
                width: iconSize,
                height: iconSize,
                child: service.iconUrl.endsWith('.svg')
                    ? SvgPicture.asset(
                  service.iconUrl,
                  width: iconSize,
                  height: iconSize,
                  fit: BoxFit.contain,
                )
                    : Image.asset(
                  service.iconUrl,
                  width: iconSize,
                  height: iconSize,
                  fit: BoxFit.contain,
                ),
              ),

              SizedBox(width: spacingBetweenElements),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      service.title,
                      style: GoogleFonts.syne(
                        fontSize: titleFontSize,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        height: 1.1,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: screenHeight * 0.002),
                    Text(
                      service.description,
                      style: GoogleFonts.syne(
                        fontSize: descriptionFontSize,
                        color: Colors.white.withValues(alpha: 0.7),
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

              SizedBox(width: spacingBetweenElements * 0.5),

              Container(
                width: arrowIconSize,
                height: arrowIconSize,
                child: service.iconUrl.endsWith('arrow_right.svg')
                    ? SvgPicture.asset(
                  'assets/icons/arrow_right.svg',
                  width: arrowIconSize,
                  height: arrowIconSize,
                  colorFilter: const ColorFilter.mode(
                    Colors.white54,
                    BlendMode.srcIn,
                  ),
                )
                    : Image.asset(
                  'assets/icons/arrow_right.png',
                  width: arrowIconSize,
                  height: arrowIconSize,
                  color: Colors.white54,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}