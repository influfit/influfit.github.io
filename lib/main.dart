import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InfluFit',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Make sure this is at the top of your class
  final _formKey = GlobalKey<FormState>();

  // Controllers for the first form
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _socialMediaController = TextEditingController();
  final TextEditingController _secondSocialMediaController = TextEditingController();

  // Controller for the second form
  final TextEditingController _suggestedInfluencerController = TextEditingController();

  // Function to submit influencer registration
  Future<void> _submitInfluencerRegistration() async {
    try {
      // Show loading indicator
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(child: CircularProgressIndicator());
        },
      );

      await FirebaseFirestore.instance.collection('influencer_registrations').add({
        'fullName': _nameController.text,
        'email': _emailController.text,
        'socialMediaLink': _socialMediaController.text,
        'secondSocialMediaLink': _secondSocialMediaController.text,
        'timestamp': FieldValue.serverTimestamp(),
      });
      
      // Close loading indicator
      if (mounted) Navigator.of(context).pop();

      // Clear the form
      _nameController.clear();
      _emailController.clear();
      _socialMediaController.clear();
      _secondSocialMediaController.clear();
      
      // Show success message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registration submitted successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      // Close loading indicator
      if (mounted) Navigator.of(context).pop();
      
      print('Error submitting registration: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error submitting registration: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  // Function to submit influencer suggestion
  Future<void> _submitInfluencerSuggestion() async {
    try {
      await FirebaseFirestore.instance.collection('influencer_suggestions').add({
        'contact': _suggestedInfluencerController.text,
        'timestamp': FieldValue.serverTimestamp(),
      });
      
      // Clear the form
      _suggestedInfluencerController.clear();
      
      // Optional: Show success message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Suggestion submitted successfully!')),
        );
      }
      
    } catch (e) {
      print('Error submitting suggestion: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error submitting suggestion: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        key: const PageStorageKey('homepage-scroll'),
        child: Container(
          width: double.infinity,
          child: Stack(
            children: [
              // Background split colors
              Row(
                children: [
                  // Left half - Cream Pale
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 2.5, // Increased from 1.5 to 2.5
                      color: const Color(0xFFFAF7F2),
                    ),
                  ),
                  // Right half - Blue Gray
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 2.5, // Increased from 1.5 to 2.5
                      color: const Color(0xFF90A1A5),
                    ),
                  ),
                ],
              ),
              // New black banner at the top
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black,
                  height: 44, // Fixed height for the banner
                  alignment: Alignment.center, // Center alignment for the text
                  child: DefaultTextStyle(
                    style: GoogleFonts.bebasNeue(
                      fontSize: 20,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                    child: Center(
                      child: SizedBox( // Add SizedBox with fixed width
                        width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
                        child: AnimatedTextKit(
                          animatedTexts: [
                            FadeAnimatedText(
                              'Have early access to our app and be part of our community',
                              textAlign: TextAlign.center,
                              duration: const Duration(seconds: 3),
                              fadeOutBegin: 0.9,
                              fadeInEnd: 0.1,
                            ),
                            FadeAnimatedText(
                              'Have early access to our app and be part of our community',
                              textAlign: TextAlign.center,
                              duration: const Duration(seconds: 3),
                              fadeOutBegin: 0.9,
                              fadeInEnd: 0.1,
                            ),
                          ],
                          isRepeatingAnimation: true, // Set to true for infinite repetition
                          pause: const Duration(milliseconds: 100),
                          displayFullTextOnTap: true,
                          stopPauseOnTap: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Logo image and text
              Positioned(
                top: 44, // Start right after the banner
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/logo_black.png',
                      height: 90,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 8), // Spacing between logo and text
                    DefaultTextStyle(
                      style: GoogleFonts.bebasNeue(
                        fontSize: 44,
                        color: Colors.black,
                        letterSpacing: 0.1,
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'Train & diet',
                            speed: const Duration(milliseconds: 200),
                          ),
                        ],
                        isRepeatingAnimation: false,
                      ),
                    ),
                    const SizedBox(height: 4), // Spacing between texts
                    Text(
                      'LIKE YOUR FAVORITE INFLUENCER',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 24,
                        color: Colors.black,
                        letterSpacing: 0.1,
                      ),
                    ),
                    const SizedBox(height: 20), // Spacing before the new image
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image.asset(
                          'assets/influfit_ios.png',
                          fit: BoxFit.contain,
                          width: 300,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Text(
                            'For the first 2000 influencers\nWe give them free pass to the app\nJust pre-register',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.bebasNeue(
                              fontSize: 24,
                              color: Colors.white,
                              letterSpacing: 0.1,
                              height: 1.2, // Adjusts line spacing
                              shadows: [
                                Shadow(
                                  color: Colors.black.withOpacity(0.5),
                                  offset: const Offset(2, 2),
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30), // Space before form
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        width: 400,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Form(
                          key: _formKey,
                          onChanged: () {
                            Form.of(context)?.save();
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Pre-register now to become\nOne of our first users',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 28,
                                  color: Colors.black,
                                  letterSpacing: 0.1,
                                  height: 1.2,
                                ),
                              ),
                              const SizedBox(height: 24),
                              TextFormField(
                                controller: _nameController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xFFF5F5F5),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'Full Name',
                                  hintStyle: const TextStyle(color: Colors.grey),
                                ),
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xFFF5F5F5),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'Email',
                                  hintStyle: const TextStyle(color: Colors.grey),
                                ),
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                controller: _socialMediaController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xFFF5F5F5),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'Social media link',
                                  hintStyle: const TextStyle(color: Colors.grey),
                                ),
                              ),
                              const SizedBox(height: 16),
                              TextField( // This remains TextField as it's optional
                                controller: _secondSocialMediaController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xFFF5F5F5),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'Second social media link (optional)',
                                  hintStyle: const TextStyle(color: Colors.grey),
                                ),
                              ),
                              const SizedBox(height: 24),
                              ElevatedButton(
                                onPressed: () {
                                  print('Button pressed'); // Debug print
                                  print('Name: ${_nameController.text}'); // Debug print
                                  print('Email: ${_emailController.text}'); // Debug print
                                  print('Social: ${_socialMediaController.text}'); // Debug print
                                  _submitInfluencerRegistration();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                child: Text(
                                  'SEND',
                                  style: GoogleFonts.bebasNeue(
                                    fontSize: 20,
                                    color: Colors.white,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24), // Space after first form
                    Text(
                      'OR',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 28,
                        color: Colors.black,
                        letterSpacing: 0.1,
                      ),
                    ),
                    const SizedBox(height: 24), // Space before second form
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        width: 400,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Suggest us an influencer',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.bebasNeue(
                                fontSize: 28,
                                color: Colors.black,
                                letterSpacing: 0.1,
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(height: 24),
                            // Single text field
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: TextField(
                                controller: _suggestedInfluencerController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xFFF5F5F5),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'Email or social media link',
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: _submitInfluencerSuggestion,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              child: Text(
                                'SEND',
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 20,
                                  color: Colors.white,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40), // Space after second form
                    Text(
                      'Get in touch with us',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 28,
                        color: Colors.black,
                        letterSpacing: 0.1,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email:',
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 24,
                                  color: Colors.black,
                                  letterSpacing: 0.1,
                                ),
                              ),
                              Text(
                                'support@influfit.club',
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 20,
                                  color: Colors.black54,
                                  letterSpacing: 0.1,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 40), // Space between email and Instagram
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Instagram:',
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 24,
                                  color: Colors.black,
                                  letterSpacing: 0.1,
                                ),
                              ),
                              Text(
                                '@influfit.club',
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 20,
                                  color: Colors.black54,
                                  letterSpacing: 0.1,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        width: 400,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Soon available on:',
                              style: GoogleFonts.bebasNeue(
                                fontSize: 28,
                                color: Colors.black,
                                letterSpacing: 0.1,
                              ),
                            ),
                            const SizedBox(height: 24),
                            Image.asset(
                              'assets/bothlogo.jpeg',
                              height: 160,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40), // Bottom padding
                  ],
                ),
              ),
              // Existing home icon - update its position
              Positioned(
                top: 64, // Adjusted position
                left: 20,
                child: IconButton(
                  icon: const Icon(
                    Icons.home,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: () {
                    // Add navigation logic here if needed
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
