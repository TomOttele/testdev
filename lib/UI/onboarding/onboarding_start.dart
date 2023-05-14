import 'package:flutter/material.dart';
import 'package:testdev/UI/widgets/birthday_form.dart';
import 'package:testdev/UI/widgets/number_form.dart';
import 'package:testdev/UI/widgets/separator.dart';
import 'package:testdev/UI/widgets/telephone_form.dart';
import 'package:testdev/UI/widgets/text_form.dart';
import '../settings/settings_personal_information.dart';
import '../widgets/dropdown_button.dart';
import '../widgets/toggle_button.dart';

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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: const [
                    OnboardingScreenStart(
                        image: 'assets/images/facebook.webp',
                        title: 'Welcome to Querpass',
                        description:
                            'Nice to have you onboard and we are delighted to support you through your journey'),
                    OnboardingScreenName(),
                    OnboardingScreenTelephone(),
                    OnboardingScreenBD(),
                    OnboardingScreenNationality(),
                    OnboardingScreenPhysicalInfo(),
                    OnboardingScreenFootInfo(),
                    OnboardingScreenContactPerson(),
                    OnboardingScreenChangePassword(),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: size.height * 0.07,
                    width: size.width * 0.3,
                    child: /*_pageController.page?.toInt() == 0
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                backgroundColor: Colors.transparent),
                            onPressed: null,
                            child: const Text(''),
                          )
                        : */
                        ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: Colors.transparent),
                      onPressed: () {
                        _pageController.previousPage(
                          curve: Curves.ease,
                          duration: const Duration(milliseconds: 300),
                        );
                      },
                      child: Text(
                        'Back',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.07,
                    width: size.width * 0.3,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: Colors.lightBlue),
                      onPressed: () {
                        _pageController.nextPage(
                          curve: Curves.ease,
                          duration: const Duration(milliseconds: 300),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text(
                            'Next',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingScreenStart extends StatelessWidget {
  final String image, title, description;

  const OnboardingScreenStart({
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
      child: ListView(
        children: [
          const Spacer(),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              image,
              height: size.height * 0.3,
            ),
          ),
          const Spacer(),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          SizedBox(height: size.height * 0.02),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.start,
          ),
          const Spacer()
        ],
      ),
    );
  }
}

class OnboardingScreenName extends StatelessWidget {
  const OnboardingScreenName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Let us begin!',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const Separator(),
          const TextForm(labelText: 'First name', maxLenght: 20),
          const Separator(),
          const TextForm(labelText: 'Surname', maxLenght: 20)
        ],
      ),
    );
  }
}

class OnboardingScreenTelephone extends StatelessWidget {
  const OnboardingScreenTelephone({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Telephone number',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Text('Please enter your telephone number',
              style: Theme.of(context).textTheme.bodyMedium),
          const Separator(),
          const TelephoneNumber(labelText: 'Telephone number', maxLenght: 15)
        ],
      ),
    );
  }
}

class OnboardingScreenBD extends StatelessWidget {
  const OnboardingScreenBD({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Birthday',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Text('Please enter your telephone number',
              style: Theme.of(context).textTheme.bodyMedium),
          const Separator(),
          const BirthdayInputWidget(),
        ],
      ),
    );
  }
}

class OnboardingScreenNationality extends StatelessWidget {
  const OnboardingScreenNationality({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Nationality',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Text('Please enter your nationality',
              style: Theme.of(context).textTheme.bodyMedium),
          const Separator(),
          const TextForm(
            maxLenght: 30,
            labelText: 'Nationality',
          )
        ],
      ),
    );
  }
}

class OnboardingScreenPhysicalInfo extends StatelessWidget {
  const OnboardingScreenPhysicalInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Text(
            'Physical information',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Text('Please give us information about your physics',
              style: Theme.of(context).textTheme.bodyMedium),
          const Separator(),
          const NumberForm(
            labelText: 'Height',
            maxLenght: 3,
            hintText: 'cm',
          ),
          const Separator(),
          const NumberForm(
            labelText: 'Weight',
            maxLenght: 3,
            hintText: 'kg',
          ),
          const Separator(),
          const DropDownMenu(
              items: ['XXS', 'XS', 'S', 'M', 'L', 'XL', 'XXL'],
              labelText: 'Cloth size'),
          const Separator(),
          const NumberForm(labelText: 'Shoe size', maxLenght: 3, hintText: ''),
          const Separator(),
          Text(
            'Preferred foot',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const ToggleButton(
            text1: 'Left',
            text2: 'Right',
          ),
        ],
      ),
    );
  }
}

class OnboardingScreenFootInfo extends StatefulWidget {
  const OnboardingScreenFootInfo({
    super.key,
  });

  @override
  State<OnboardingScreenFootInfo> createState() =>
      _OnboardingScreenFootInfoState();
}

class _OnboardingScreenFootInfoState extends State<OnboardingScreenFootInfo> {
  List<String> _selectedItems = [];

  void _showMultiSelect() async {
    final List<String> items = [
      'GK',
      'RB',
      'CB',
      'LB',
      'CDM',
      'CM',
      'COM',
      'LW',
      'RW',
      'ST'
    ];

    final List<String>? results = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return MultiSelect(items: items);
        });
    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Football',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Text('Please give us information about your football',
              style: Theme.of(context).textTheme.bodyMedium),
          const Separator(),
          const NumberForm(labelText: 'Shirt number', maxLenght: 2),
          const Separator(),
          //
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: InkWell(
              onTap: _showMultiSelect,
              child: Container(
                height: size.height * 0.073,
                width: size.width * 1,
                color: Theme.of(context).colorScheme.onPrimary,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Position',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Wrap(
                          children: _selectedItems
                              .map((e) => Chip(
                                    backgroundColor:
                                        Theme.of(context).colorScheme.onPrimary,
                                    label: Text(
                                      e,
                                      selectionColor: Colors.blue,
                                    ),
                                  ))
                              .toList()),
                    ]),
                  ),
                ),
              ),
            ),
          ),
          const Separator(),
          Text(
            'Nationalteam',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const ToggleButton(
            text1: 'Yes',
            text2: 'No',
          ),
        ],
      ),
    );
  }
}

class OnboardingScreenContactPerson extends StatelessWidget {
  const OnboardingScreenContactPerson({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Contact person',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Text(
              'Please give us information about a person that we can contact in case of an emergency',
              style: Theme.of(context).textTheme.bodyMedium),
          const Separator(),
          const TextForm(labelText: 'Name', maxLenght: 30),
          const Separator(),
          const TelephoneNumber(labelText: 'Telephone', maxLenght: 15),
          const Separator(),
          const DropDownMenu(items: [
            'Father',
            'Mother',
            'Sibling',
            'Partner',
            'Friend',
            'Other'
          ], labelText: 'Relation'),
        ],
      ),
    );
  }
}

class OnboardingScreenChangePassword extends StatelessWidget {
  const OnboardingScreenChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Change your password',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Text('Please change your password',
              style: Theme.of(context).textTheme.bodyMedium),
          const Separator(),
          const TextForm(labelText: 'New password', maxLenght: 100),
          const Separator(),
          const TextForm(labelText: 'Confirm new password', maxLenght: 100),
          const Separator(),
        ],
      ),
    );
  }
}
