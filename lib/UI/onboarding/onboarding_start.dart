import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({
    super.key,
  });

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: PageView.builder(
              controller: _pageController,
              itemBuilder: (context, index) => const OnboardingScreen1(
                description: 'Nice to have you onboard',
                image: 'assets/images/facebook.webp',
                title: 'Welcome to Querpass',
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class OnboardingScreen1 extends StatelessWidget {
  final String image, title, description;

  const OnboardingScreen1({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset(
            image,
            height: size.height * 0.3,
          ),
          const Spacer(),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontWeight: FontWeight.w300),
          ),
          SizedBox(height: size.height * 0.05),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: size.height * 0.07,
                width: size.width * 0.3,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: Colors.lightBlue),
                  onPressed: () {
                    /*_pageController.nextPage(
                      curve: Curves.ease,
                      duration: const Duration(milliseconds: 300),
                    );*/
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        'Start',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.arrow_forward_outlined,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
