import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'about_screen.dart';
import 'contact_us_screen.dart';
import 'my_works_screen.dart';
import 'theme_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void _navigateToScreen(BuildContext context, String route) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        switch (route) {
          case 'about':
            return const AboutScreen();
          case 'works':
            return const MyWorksScreen();
          case 'contact':
            return const ContactUsScreen();
          default:
            return const HomePage();
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
              key: const Key('homeScrollView'),
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
                                    value: 'about',
                                    child: ListTile(
                                      leading: Icon(MdiIcons.account, color: Theme.of(context).iconTheme.color),
                                      title: Text('About', style: TextStyle(color: Theme.of(context).iconTheme.color)),
                                    ),
                                  ),
                                  PopupMenuItem<String>(
                                    value: 'works',
                                    child: ListTile(
                                      leading: Icon(MdiIcons.briefcase, color: Theme.of(context).iconTheme.color),
                                      title: Text('My Works', style: TextStyle(color: Theme.of(context).iconTheme.color)),
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

                      // Hero Section
                      Text(
                        "I’m bringing ideas to life with lasting impact",
                        key: const Key('heroTitle'),
                        style: Theme.of(context).textTheme.displayLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "I create digital products that focus on the user’s needs and fit the product strategy",
                        key: const Key('heroText'),
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
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      // Selected Works Section
                      Text(
                        "Selected works",
                        key: const Key('worksTitle'),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "The work I’m proud of",
                        key: const Key('worksSubtitle'),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 20),
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
        final works = [
          _WorkCard(
            title: "E-Commerce App",
            imageAsset: 'assets/cover1.jpg',
          ),
          _WorkCard(
            title: "Portfolio Website",
            imageAsset: 'assets/cover2.jpg',
          ),
          _WorkCard(
            title: "UI Design Kit",
            imageAsset: 'assets/cover3.jpg',
          ),
          _WorkCard(
            title: "Web Dashboard",
            imageAsset: 'assets/cover4.jpg',
          ),
        ];
        return index < works.length ? works[index] : null;
      },
      childCount: 4,
    ),
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: isLargeScreen
          ? 300.0
          : (MediaQuery.of(context).size.width > 200.0
              ? 200.0
              : MediaQuery.of(context).size.width - 40.0), // Adjust for padding
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
                      // About Me Section
                      Text(
                        "About me",
                        key: const Key('aboutTitle'),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "A UI/UX Designer, Mobile and Web Developer based in Lagos",
                        key: const Key('aboutSubtitle'),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Passionate versatile digital designer and pixel-perfect expert",
                        key: const Key('aboutDescription'),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "I am a digital creative designer who loves to create stunning and flawless products. I have a passion for both design and development (especially no-code development). I always keep an eye for detail and strive to achieve pixel perfection in every project I work on.",
                        key: const Key('aboutText'),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 20),
                      // Profile Picture (Placeholder)
                      CircleAvatar(
                        key: const Key('profileAvatar'),
                        radius: isLargeScreen ? 80.0 : 60.0,
                        backgroundImage: const AssetImage('assets/my_picture.jpg'),
                        backgroundColor: Colors.grey[200],
                        onBackgroundImageError: (_, __) {
                          debugPrint('Failed to load image asset');
                        },
                      ),
                      const SizedBox(height: 20),
                      // Stats Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _StatCard(title: "YEARS OF EXPERIENCE", value: "3+"),
                          const SizedBox(width: 10),

                        ],
                      ),

                      const SizedBox(height: 40),
                    ]),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isLargeScreen ? 40.0 : 20.0,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      // My Expertise Section
                      Text(
                        "My expertise",
                        key: const Key('expertiseTitle'),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "The best of me to bring your products stand-out",
                        key: const Key('expertiseSubtitle'),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 20),
                    ]),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isLargeScreen ? 40.0 : 20.0,
                  ),
                  sliver: SliverGrid(
                    key: const Key('expertiseGrid'),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final expertise = [
                          _ExpertiseCard(
                            title: "UI/UX Design",
                            description: "Innovative interfaces that communicate with your audience and clients.",
                            icon: MdiIcons.brush,
                          ),
                          _ExpertiseCard(
                            title: "Branding",
                            description: "I craft unique and memorable identities that express your brand’s vision and values",
                            icon: MdiIcons.palette,
                          ),
                          _ExpertiseCard(
                            title: "Illustration",
                            description: "I draw captivating illustrations for various media, using diverse styles and techniques",
                            icon: MdiIcons.pencil,
                          ),
                          _ExpertiseCard(
                            title: "Framer Development",
                            description: "I use Framer to prototype and code dynamic interfaces that delight users",
                            icon: MdiIcons.codeBraces,
                          ),
                        ];
                        return index < expertise.length ? expertise[index] : null;
                      },
                      childCount: 4,
                    ),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: isLargeScreen ? 200.0 : 150.0,
                      mainAxisSpacing: isLargeScreen ? 30.0 : 20.0,
                      crossAxisSpacing: isLargeScreen ? 30.0 : 20.0,
                      childAspectRatio: 0.8,
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
                      // Ready to Collaborate Section
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

// Work Card Widget
class _WorkCard extends StatelessWidget {
  final String title;
  final String imageAsset;

  const _WorkCard({required this.title, required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;
    return Container(
      key: Key('workCard_$title'),
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
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              imageAsset,
              width: double.infinity,
              height: isLargeScreen ? 200.0 : 150.0,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                debugPrint('Failed to load image asset: $imageAsset');
                return Container(color: Colors.grey[300]);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(isLargeScreen ? 15.0 : 10.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}

// Stat Card Widget
class _StatCard extends StatelessWidget {
  final String title;
  final String value;

  const _StatCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;
    return Container(
      padding: EdgeInsets.all(isLargeScreen ? 15.0 : 10.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
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
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

// Expertise Card Widget
class _ExpertiseCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const _ExpertiseCard({required this.title, required this.description, required this.icon});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;
    return Container(
      key: Key('expertiseCard_$title'),
      padding: EdgeInsets.all(isLargeScreen ? 15.0 : 10.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
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
          Icon(icon, size: isLargeScreen ? 30.0 : 24.0, color: Theme.of(context).iconTheme.color),
          const SizedBox(height: 10),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}