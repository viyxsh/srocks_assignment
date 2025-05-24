import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFF2D2D2D),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          SvgPicture.asset(
            'assets/icons/find.svg',
            width: 20,
            height: 20,
            colorFilter: const ColorFilter.mode(
              Colors.white54,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search "Punjabi Lyrics"',
                hintStyle: TextStyle(
                  color: Color(0xFF9E9E9E),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                fillColor: Colors.transparent,
                filled: true,
              ),
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
          Container(
            width: 1,
            height: 20,
            color: const Color(0xFF4A4A4A),
            margin: const EdgeInsets.symmetric(horizontal: 12),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Image.asset(
              'assets/icons/mic_icon.png',
              width: 20,
              height: 20,
            ),
          ),
        ],
      ),
    );
  }
}
