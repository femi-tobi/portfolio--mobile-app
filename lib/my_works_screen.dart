import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'about_screen.dart';
import 'contact_us_screen.dart';
import 'home_page.dart';
import 'theme_provider.dart';

class MyWorksScreen extends StatelessWidget {
  const MyWorksScreen({Key? key}) : super(key: key);

  void _navigateToScreen(BuildContext context, String route) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        switch (route) {
          case 'home':
            return const HomePage();
          case 'about':
            return const AboutScreen();
          case 'contact':
            return const ContactUsScreen();
          default:
            return const MyWorksScreen();
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;

    return MaterialApp(
      theme: themeProvider.themeData,
      home: Builder(
        builder: (context) => Scaffold(
          body: SafeArea(
            child: CustomScrollView(
              key: const Key('worksScrollView'),
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isLargeScreen ? 40.0 : 20.0,
                    vertical: isLargeScreen ? 30.0 : 20.0,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      // Header with dropdown menu and theme toggle
                      Container(
                        key: const Key('headerContainer'),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(28),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              PopupMenuButton<String>(
                                key: const Key('menuButton'),
                                icon: Icon(Icons.menu_rounded, color: Theme.of(context).iconTheme.color),
                                onSelected: (String value) {
                                  _navigateToScreen(context, value);
                                },
                                color: Theme.of(context).cardColor,
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                                  PopupMenuItem<String>(
                                    value: 'home',
                                    child: ListTile(
                                      leading: Icon(MdiIcons.home, color: Theme.of(context).iconTheme.color),
                                      title: Text('Home', style: TextStyle(color: Theme.of(context).iconTheme.color)),
                                    ),
                                  ),
                                  PopupMenuItem<String>(
                                    value: 'about',
                                    child: ListTile(
                                      leading: Icon(MdiIcons.account, color: Theme.of(context).iconTheme.color),
                                      title: Text('About', style: TextStyle(color: Theme.of(context).iconTheme.color)),
                                    ),
                                  ),
                                  PopupMenuItem<String>(
                                    value: 'contact',
                                    child: ListTile(
                                      leading: Icon(MdiIcons.email, color: Theme.of(context).iconTheme.color),
                                      title: Text('Contact Us', style: TextStyle(color: Theme.of(context).iconTheme.color)),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 4),
                              Text('MENU', style: TextStyle(letterSpacing: 1.0, fontWeight: FontWeight.w600, color: Theme.of(context).textTheme.bodyMedium?.color)),
                            ]),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode, color: Theme.of(context).iconTheme.color),
                                  onPressed: () {
                                    themeProvider.toggleTheme();
                                  },
                                ),
                                Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text('OLUWATOBI', style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 0.6, color: Theme.of(context).textTheme.bodyMedium?.color)),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 40),

                      // Works Introduction
                      Text(
                        "The work I do",
                        key: const Key('worksIntro'),
                        style: Theme.of(context).textTheme.displayLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "I create digital projects that focus on the user’s needs and fit the product strategy",
                        key: const Key('worksText'),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),

                      const SizedBox(height: 40),
                    ]),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isLargeScreen ? 40.0 : 20.0,
                  ),
                  sliver: SliverGrid(
                    key: const Key('worksGrid'),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final projects = [
                          _ProjectCard(
                            title: "E-Commerce App",
                            description: "A responsive mobile app for online shopping.",
                            imageAsset: 'assets/project1.jpg',
                          ),
                          _ProjectCard(
                            title: "Portfolio Website",
                            description: "A dynamic personal portfolio site.",
                            imageAsset: 'assets/project2.jpg',
                          ),
                          _ProjectCard(
                            title: "UI Design Kit",
                            description: "A reusable UI component library.",
                            imageAsset: 'assets/project3.jpg',
                          ),
                          _ProjectCard(
                            title: "Web Dashboard",
                            description: "An interactive admin dashboard.",
                            imageAsset: 'assets/project4.jpg',
                          ),
                        ];
                        return index < projects.length ? projects[index] : null;
                      },
                      childCount: 4,
                    ),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: isLargeScreen ? 300.0 : 200.0,
                      mainAxisSpacing: isLargeScreen ? 30.0 : 20.0,
                      crossAxisSpacing: isLargeScreen ? 30.0 : 20.0,
                      childAspectRatio: 0.75,
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isLargeScreen ? 40.0 : 20.0,
                    vertical: isLargeScreen ? 30.0 : 20.0,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      // Enhanced Ready to Collaborate Section
                      Container(
                        key: const Key('collaborateContainer'),
                        padding: EdgeInsets.all(isLargeScreen ? 30.0 : 20.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Let’s Collaborate on Your Next Project!",
                              style: Theme.of(context).textTheme.displayLarge,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "As Adefemi Oluwatobi, I’m excited to bring my expertise in UI/UX design, mobile, and web development to create tailored digital solutions for your business. Share your vision with me today!",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              key: const Key('contactButton'),
                              onPressed: () {
                                _navigateToScreen(context, 'contact');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                                padding: EdgeInsets.symmetric(
                                  horizontal: isLargeScreen ? 40.0 : 30.0,
                                  vertical: isLargeScreen ? 15.0 : 12.0,
                                ),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                              child: Text(
                                'Get in Touch',
                                style: TextStyle(fontSize: isLargeScreen ? 16.0 : 14.0, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Footer
                      Text(
                        "©2025 - All rights reserved",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          Scrollable.ensureVisible(context, alignment: 0.0, duration: const Duration(milliseconds: 500));
                        },
                        child: Text(
                          "Back to Top",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w600,
                            fontSize: isLargeScreen ? 14.0 : 12.0,
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Project Card Widget
class _ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageAsset;

  const _ProjectCard({required this.title, required this.description, required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;

    return Container(
      key: Key('projectCard_$title'),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with constrained height
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              imageAsset,
              width: double.infinity,
              height: isLargeScreen ? 150.0 : 120.0, // Fixed height, adjust if needed
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                debugPrint('Failed to load image asset: $imageAsset');
                return Container(
                  width: double.infinity,
                  height: isLargeScreen ? 150.0 : 120.0,
                  color: Colors.grey[300],
                  child: const Center(child: Text('Image unavailable')),
                );
              },
            ),
          ),
          // Flexible text section to prevent overflow
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(isLargeScreen ? 15.0 : 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min, // Use minimum space
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 1, // Limit to 1 line to prevent excessive height
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Flexible(
                    child: Text(
                      description,
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 3, // Limit to 3 lines
                      overflow: TextOverflow.ellipsis,
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
}