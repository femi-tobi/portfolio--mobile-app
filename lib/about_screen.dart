import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'my_works_screen.dart';
import 'contact_us_screen.dart';
import 'theme_provider.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  void _navigateToScreen(BuildContext context, String route) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        switch (route) {
          case 'home':
            return const HomePage();
          case 'works':
            return const MyWorksScreen();
          case 'contact':
            return const ContactUsScreen();
          default:
            return const AboutScreen();
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
              key: const Key('aboutScrollView'),
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isLargeScreen ? 40.0 : 20.0,
                    vertical: isLargeScreen ? 30.0 : 20.0,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      // Top header with dropdown menu and theme toggle
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

                      // Profile Picture
                      CircleAvatar(
                        key: const Key('profileAvatar'),
                        radius: isLargeScreen ? 100.0 : 80.0,
                        backgroundImage: const AssetImage('assets/my_picture.jpg'),
                        backgroundColor: Colors.grey[200],
                        onBackgroundImageError: (_, __) {
                          debugPrint('Failed to load image asset');
                        },
                      ),

                      const SizedBox(height: 20),

                      // Download CV Button
                      OutlinedButton(
                        key: const Key('cvButton'),
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Theme.of(context).primaryColor),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.symmetric(
                            horizontal: isLargeScreen ? 30.0 : 20.0,
                            vertical: isLargeScreen ? 12.0 : 10.0,
                          ),
                        ),
                        child: Text(
                          'DOWNLOAD MY CV',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: isLargeScreen ? 18.0 : 16.0,
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      // About Me Section
                      Text(
                        "I’m Adefemi Oluwatobi, UI/UX Designer, Mobile and Web Developer",
                        key: const Key('aboutTitle'),
                        style: Theme.of(context).textTheme.displaySmall,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "I am a creative and versatile professional with over five years of experience in UI/UX design, mobile development, and web development. I specialize in crafting intuitive interfaces using tools like Adobe Creative Suite, Flutter, and modern web technologies (HTML, CSS, JavaScript) to create responsive websites, mobile apps, and engaging digital solutions.",
                        key: const Key('aboutText1'),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "For each project, I strive to deliver elegant and functional solutions tailored to the end user. I thrive both independently and in team settings, and I currently collaborate with the talented team at Zenite Lab, a digital design studio.",
                        key: const Key('aboutText2'),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),

                      const SizedBox(height: 40),

                      // Years of Experience Section
                      Container(
                        key: const Key('experienceContainer'),
                        padding: const EdgeInsets.all(20.0),
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
                        child: SingleChildScrollView(
                          child: Column(
                            key: const Key('experienceColumn'),
                            children: [
                              Text(
                                "YEARS OF EXPERIENCE",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).textTheme.bodyMedium?.color,
                                  fontSize: 16.0,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("3", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.bodyMedium?.color)),
                                  Text("+", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.bodyMedium?.color)),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Text(
                                "PROJECT COMPLETED",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).textTheme.bodyMedium?.color,
                                  fontSize: 16.0,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("20", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.bodyMedium?.color)),
                                  Text("+", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.bodyMedium?.color)),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Text(
                                "SATISFIED CLIENTS",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).textTheme.bodyMedium?.color,
                                  fontSize: 16.0,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("15", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.bodyMedium?.color)),
                                  Text("+", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.bodyMedium?.color)),
                                ],
                              ),
                            ],
                          ),
                        ),
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
                    key: const Key('expertiseGrid'),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final items = [
                          _ExpertiseCard(
                            title: "UI/UX Design",
                            description: "Innovative interfaces that enhance user experience and client engagement.",
                          ),
                          _ExpertiseCard(
                            title: "Mobile Development",
                            description: "Building intuitive and efficient mobile apps with Flutter.",
                          ),
                          _ExpertiseCard(
                            title: "Web Development",
                            description: "Creating responsive and dynamic websites using modern web technologies.",
                          ),
                          _ExpertiseCard(
                            title: "Framer Development",
                            description: "Prototyping and coding dynamic interfaces with Framer.",
                          ),
                        ];
                        return index < items.length ? items[index] : null;
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
                              "Ready to collaborate?",
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Let’s drop your ideas here",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              key: const Key('touchButton'),
                              onPressed: () {
                                _navigateToScreen(context, 'contact');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                                padding: EdgeInsets.symmetric(
                                  horizontal: isLargeScreen ? 40.0 : 30.0,
                                  vertical: isLargeScreen ? 18.0 : 15.0,
                                ),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              ),
                              child: Text(
                                'GET IN TOUCH',
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: isLargeScreen ? 18.0 : 16.0),
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

// Expertise Card Widget
class _ExpertiseCard extends StatelessWidget {
  final String title;
  final String description;

  const _ExpertiseCard({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;
    return Container(
      key: Key('expertiseCard_$title'),
      padding: EdgeInsets.all(isLargeScreen ? 20.0 : 15.0),
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
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 10),
          Flexible(
            child: Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}