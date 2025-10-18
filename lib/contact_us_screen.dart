import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'about_screen.dart';
import 'home_page.dart';
import 'my_works_screen.dart';
import 'theme_provider.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  void _navigateToScreen(BuildContext context, String route) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        switch (route) {
          case 'home':
            return const HomePage();
          case 'about':
            return const AboutScreen();
          case 'works':
            return const MyWorksScreen();
          default:
            return const ContactUsScreen();
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
              key: const Key('contactScrollView'),
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
                                    value: 'works',
                                    child: ListTile(
                                      leading: Icon(MdiIcons.briefcase, color: Theme.of(context).iconTheme.color),
                                      title: Text('My Works', style: TextStyle(color: Theme.of(context).iconTheme.color)),
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

                      // Contact Introduction
                      Text(
                        "I'm ready to hear your idea",
                        key: const Key('contactIntro'),
                        style: Theme.of(context).textTheme.displayLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "I’m looking forward to connecting with you and exploring how my skills in UI/UX design can contribute to your business objectives. Don’t hesitate to reach out to me for a meeting today, October 18, 2025.",
                        key: const Key('contactText'),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),

                      const SizedBox(height: 40),

                      // Contact Form
                      Container(
                        key: const Key('contactFormContainer'),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Send me a message",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 20),
                            TextField(
                              key: const Key('nameField'),
                              decoration: InputDecoration(
                                labelText: 'Name',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                labelStyle: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color),
                              ),
                            ),
                            const SizedBox(height: 15),
                            TextField(
                              key: const Key('emailField'),
                              decoration: InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                labelStyle: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color),
                              ),
                            ),
                            const SizedBox(height: 15),
                            TextField(
                              key: const Key('messageField'),
                              maxLines: 4,
                              decoration: InputDecoration(
                                labelText: 'Message',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                labelStyle: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color),
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              key: const Key('submitButton'),
                              onPressed: () {},
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
                                'Send Message',
                                style: TextStyle(fontSize: isLargeScreen ? 16.0 : 14.0, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 40),

                      // Social Links
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            key: const Key('linkedinButton'),
                            icon: Icon(MdiIcons.linkedin, color: Theme.of(context).iconTheme.color),
                            onPressed: () {},
                          ),
                          const SizedBox(width: 15),
                          IconButton(
                            key: const Key('twitterButton'),
                            icon: Icon(MdiIcons.twitter, color: Theme.of(context).iconTheme.color),
                            onPressed: () {},
                          ),
                          const SizedBox(width: 15),
                          IconButton(
                            key: const Key('instagramButton'),
                            icon: Icon(MdiIcons.instagram, color: Theme.of(context).iconTheme.color),
                            onPressed: () {},
                          ),
                        ],
                      ),

                      const SizedBox(height: 40),

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
                              onPressed: () {},
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