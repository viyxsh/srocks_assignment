import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srocks_music_assignment/view/widgets/custom_search_bar.dart';
import 'package:srocks_music_assignment/view/widgets/nav_bar.dart';
import 'package:srocks_music_assignment/view/widgets/notifier_widget.dart';
import 'package:srocks_music_assignment/view/widgets/service_card.dart';
import 'package:srocks_music_assignment/viewmodel/home_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = HomeViewModel();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFA90140),
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    super.dispose();
  }

  void _handleProfileTap() {
    NotifierHelper.showNotifier(context, "You tapped on profile");
  }

  void _handleBookNowTap() {
    NotifierHelper.showNotifier(context, "You tapped on book now");
  }

  void _handleTabChanged(int index) {
    final tabNames = ['Home', 'News', 'TrackBox', 'Project'];
    if (index != 0) {
      NotifierHelper.showNotifier(context, "You tapped on ${tabNames[index]}");
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    final isTablet = screenWidth > 600;
    final isLargeScreen = screenWidth > 900;

    // Responsive padding
    final horizontalPadding = screenWidth * 0.04;
    final verticalPadding = screenHeight * 0.02;

    // Responsive font sizes
    final titleFontSize = isLargeScreen ? screenWidth * 0.035 : screenWidth * 0.12;
    final subtitleFontSize = screenWidth * 0.04;
    final bodyFontSize = screenWidth * 0.038;
    final buttonFontSize = screenWidth * 0.032;

    // Responsive sizes
    final profileSize = screenWidth * 0.1;
    final bannerHeight = screenHeight * 0.25;
    final buttonMinSize = Size(screenWidth * 0.24, screenHeight * 0.045);

    return Scaffold(
      body: Container(
        color: const Color(0xFF1E1E1E),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFA90140), Color(0xFF550120)],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.04),
                    Row(
                      children: [
                        const Expanded(child: CustomSearchBar()),
                        SizedBox(width: screenWidth * 0.03),
                        GestureDetector(
                          onTap: _handleProfileTap,
                          child: Container(
                            width: profileSize,
                            height: profileSize,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(profileSize / 2),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(profileSize * 0.025),
                              child: SvgPicture.asset(
                                'assets/icons/pfp.svg',
                                width: profileSize * 0.6,
                                height: profileSize * 0.6,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    AnimatedBuilder(
                      animation: _viewModel,
                      builder: (context, child) {
                        if (_viewModel.banner != null) {
                          return Container(
                            width: double.infinity,
                            height: bannerHeight,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned(
                                  left: -screenWidth * 0.1,
                                  bottom: -bannerHeight * 0.05,
                                  child: SvgPicture.asset(
                                    'assets/icons/dvd.svg',
                                    width: screenWidth * 0.3,
                                  ),
                                ),
                                Positioned(
                                  right: -screenWidth * 0.125,
                                  bottom: -bannerHeight * 0.05,
                                  child: Transform.rotate(
                                    angle: 0.3,
                                    child: SvgPicture.asset(
                                      'assets/icons/piano.svg',
                                      width: screenWidth * 0.34,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Transform.translate(
                                    offset: Offset(0, -screenHeight * 0.02),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          _viewModel.banner!['title'] ?? '',
                                          style: GoogleFonts.syne(
                                            fontSize: subtitleFontSize,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: _viewModel.banner!['highlight'] ?? '',
                                                style: GoogleFonts.lobster(
                                                  fontSize: titleFontSize,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  height: 1.2,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: screenHeight * 0.01),
                                        Text(
                                          _viewModel.banner!['subtitle'] ?? '',
                                          style: GoogleFonts.syne(
                                            fontSize: subtitleFontSize,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: screenHeight * 0.03),
                                        ElevatedButton(
                                          onPressed: _handleBookNowTap,
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            foregroundColor: Colors.black,
                                            minimumSize: buttonMinSize,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: screenWidth * 0.032,
                                              vertical: screenHeight * 0.008,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(50),
                                            ),
                                            elevation: 0,
                                          ),
                                          child: Text(
                                            'Book Now',
                                            style: GoogleFonts.syne(
                                              fontSize: buttonFontSize,
                                              fontWeight: FontWeight.w700,
                                              height: 22/13,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: const Color(0xFF1E1E1E),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: verticalPadding * 0.5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenHeight * 0.01),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: isTablet ? screenWidth * 0.1 : 0,
                          ),
                          child: Text(
                            'Hire hand-picked Pros for popular music services',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.syne(
                              fontSize: bodyFontSize,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.015),
                      Expanded(
                        child: AnimatedBuilder(
                          animation: _viewModel,
                          builder: (context, child) {
                            if (_viewModel.isLoading) {
                              return Center(
                                child: CircularProgressIndicator(
                                  valueColor: const AlwaysStoppedAnimation<Color>(
                                    Color(0xFFA90140),
                                  ),
                                  strokeWidth: screenWidth * 0.01,
                                ),
                              );
                            }
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: _viewModel.services.length,
                              itemBuilder: (context, index) {
                                final service = _viewModel.services[index];
                                return ServiceCard(
                                  service: service,
                                  onTap: () => _viewModel.navigateToDetails(
                                    context,
                                    service.title,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            CustomNavBar(
              onTabChanged: _handleTabChanged,
            ),
          ],
        ),
      ),
    );
  }
}