import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:teams/app/di/di.dart';
import 'package:teams/presentation/flows/login_flow.dart';
import 'package:teams/presentation/ui/components/submit_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  final _numPages = 3;

  int _currentPageIndex = 0;

  void _navigateToLoginPage(BuildContext context) {
    context.go(getIt<LoginFlow>().loginRoutePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // PageView of images
          Expanded(
            child: PageView(
              // physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (value) {
                setState(() {
                  _currentPageIndex = value;
                });
              },
              controller: _pageController,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/basketball1.jpeg'),
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/soccer1.jpeg'),
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/golf1.jpeg'),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom card
          Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 75.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          'Find and build your team',
                          style: Theme.of(context).textTheme.headlineLarge!,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          'Join a league. Find a team. Build your team.',
                          style: Theme.of(context).textTheme.titleSmall!,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DotsIndicator(
                        dotsCount: _numPages,
                        position: _currentPageIndex,
                      ),
                      const SizedBox(height: 20),
                      SubmitButton(
                        buttonText: 'Next',
                        onPressed: () {
                          if (_currentPageIndex + 1 < _numPages) {
                            setState(() {
                              _currentPageIndex = _currentPageIndex + 1;
                            });
                            _pageController.animateToPage(
                              _currentPageIndex,
                              duration: const Duration(milliseconds: 100),
                              curve: Curves.easeIn,
                            );
                          } else {
                            _navigateToLoginPage(context);
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      RichText(
                        text: TextSpan(
                          text: 'Skip',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(color: Colors.orange),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.go(getIt<LoginFlow>().loginRoutePath);
                            },
                        ),
                      ),
                    ],
                  ),
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
