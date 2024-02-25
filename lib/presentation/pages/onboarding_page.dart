import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:teams/presentation/ui/components/submit_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              children: const [
                Center(
                  child: Text('First page'),
                ),
                Center(
                  child: Text('Second page'),
                ),
                Center(
                  child: Text('Third page'),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text('Take a coffee'),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text(
                          'Our coffee specialists lets you order a coffee just the way you like it'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DotsIndicator(dotsCount: 3),
                    const SizedBox(height: 20),
                    const SubmitButton(buttonText: 'Next'),
                    const SizedBox(height: 20),
                    const Text('Skip'),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
