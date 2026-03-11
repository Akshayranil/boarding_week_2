import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white12,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Socials and Platforms Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSocialSection(),
              _buildPlatformSection(),
            ],
          ),
          const SizedBox(height: 32),

          // Sign Up Section
          _buildHeader("SIGN UP"),
          const SizedBox(height: 12),
          TextField(
            decoration: InputDecoration(
              hintText: 'Your email',
              hintStyle: const TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              contentPadding: const EdgeInsets.all(16),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1B2430), // Dark charcoal from UI
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
              child: const Text(
                "SUBSCRIBE",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Disclaimer
          const Text(
            "By clicking the SUBSCRIBE button, you are agreeing to our",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Privacy & Cookie Policy",
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(height: 32),

          // Copyright
          const Text(
            "©2010-2022 All Rights Reserved",
            style: TextStyle(color: Colors.blueGrey, fontSize: 16),
          ),
          const SizedBox(height: 40),

          // Bottom Links Grid/Wrap
          _buildFooterLinks(),
        ],
      ),
    );
  }

  Widget _buildHeader(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildSocialSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader("SOCIALS"),
        const SizedBox(height: 12),
        const Row(
          children: [
            Icon(Icons.facebook, size: 28),
            SizedBox(width: 12),
            Icon(FontAwesomeIcons.twitter, size: 24),
            SizedBox(width: 12),
            Icon(FontAwesomeIcons.instagram, size: 24),
            SizedBox(width: 12),
            Icon(FontAwesomeIcons.tiktok, size: 24),
            SizedBox(width: 12),
            Icon(FontAwesomeIcons.snapchat, size: 24),
          ],
        ),
      ],
    );
  }

  Widget _buildPlatformSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildHeader("PLATFORMS"),
        const SizedBox(height: 12),
        const Row(
          children: [
            Icon(Icons.android, size: 28),
            SizedBox(width: 12),
            Icon(Icons.apple, size: 28),
          ],
        ),
      ],
    );
  }

  Widget _buildFooterLinks() {
    // Helper to create the links with vertical dividers
    return Wrap(
      alignment: WrapAlignment.center,
      runSpacing: 12,
      children: [
        _linkText("Privacy Center"),
        _divider(),
        _linkText("Privacy & Cookie Policy"),
        _divider(),
        _linkText("Manage Cookies"),
        const SizedBox(width: double.infinity), // Forced break like in the UI
        _linkText("Terms & Conditions"),
        _divider(),
        _linkText("Copyright Notice"),
        _divider(),
        _linkText("Imprint"),
      ],
    );
  }

  Widget _linkText(String label) {
    return InkWell(
      onTap: () {},
      child: Text(
        label,
        style: const TextStyle(color: Colors.grey, fontSize: 13),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: 14,
      width: 1,
      color: Colors.grey.shade400,
    );
  }
}