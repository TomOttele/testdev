import 'dart:io';
import 'dart:async';
import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:testdev/UI/widgets/separator.dart';
import 'package:testdev/UI/widgets/text_form.dart';
import 'package:testdev/application/theme_Service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as Path;

import '../widgets/checkbox_state.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  File? image;
  bool groupDisplay = true;
  bool groupLanguage = true;

// Checkbox

  final notifications = [
    CheckBoxState(
        title: 'Borussia Dortmund', subtitle: 'U19', icon: Icons.sports),
    CheckBoxState(
        title: 'Eintracht Trier', subtitle: 'U17', icon: Icons.directions_run),
  ];

//

  List<bool> displayRadio = [false, true, false];

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imagePermanent = await saveImagePermanently(image.path);
      setState(() => this.image = imagePermanent);
    } on PlatformException {}
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = Path.basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  TableRow buildRow(List<String> cells) => TableRow(
        children: cells.map((cell) {
          return Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyMedium,
                  cell));
        }).toList(),
      );
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return Scaffold(
        //
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                //
                // AppBar
                //
                SliverAppBar(
                  floating: true,
                  snap: true,
                  backgroundColor:
                      Theme.of(context).appBarTheme.backgroundColor,
                  elevation: 0,
                  centerTitle: true,
                  title: InkWell(
                    child: const Text('Account selection'),
                    onTap: () {
                      //
                      showModalBottomSheet(
                          backgroundColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(15)),
                          ),
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ListTile(
                                      title: Text('Choose your account',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge),
                                    ),
                                    ...notifications
                                        .map(buildSingleCheckbox)
                                        .toList(),
                                    const Separator()
                                  ]

                                  /*
                                  DataTable(
                                    columns: const <DataColumn>[
                                      DataColumn(
                                          label: Expanded(child: Text('Club'))),
                                      DataColumn(
                                          label: Expanded(child: Text(''))),
                                      DataColumn(
                                          label: Expanded(child: Text('Team'))),
                                      DataColumn(
                                        label: Expanded(child: Text('Function')),
                                      ),
                                    ],
                                    rows: const <DataRow>[
                                      DataRow(
                                        cells: <DataCell>[
                                          DataCell(CircleAvatar(
                                            maxRadius: 40,
                                            backgroundImage: AssetImage(
                                                'assets/images/Borussia_Dortmund.svg.png'),
                                          )),
                                          DataCell(Text('Borussia Dortmund')),
                                          DataCell(Text('U19')),
                                          DataCell(Text('Coach')),
                                        ],
                                      ),
                                      DataRow(
                                        cells: <DataCell>[
                                          DataCell(Text('')),
                                          DataCell(Text('Borussia Dortmund')),
                                          DataCell(Text('U23')),
                                          DataCell(Text('Physio')),
                                        ],
                                      ),
                                      DataRow(
                                        cells: <DataCell>[
                                          DataCell(Text('')),
                                          DataCell(Text('Eintracht Trier')),
                                          DataCell(Text('II')),
                                          DataCell(Text('Player')),
                                        ],
                                      ),
                                    ],
                                  ),*/

                                  ),
                            );
                          });
                    },
                  ),
                )
              ];
            },

            //
            // Body
            //
            body: SafeArea(
                child: ListView(padding: const EdgeInsets.all(12), children: [
              //
              // 1. ListTile (Username and profile picture)
              //

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //
                  Expanded(
                    child: Text('Cristiano Ronaldo',
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.displayLarge),
                  ),
                  CircleAvatar(
                    maxRadius: 30,
                    backgroundImage: image != null
                        ? FileImage(image!) as ImageProvider
                        : const AssetImage(
                            'assets/images/cristiano_ronaldo.webp'),
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(15))),
                          context: context,
                          builder: (context) {
                            return Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ListTile(
                                    title: Text(
                                      'Choose a picture',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge,
                                    ),
                                  ),
                                  const Separator(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            FaIcon(
                                              FontAwesomeIcons.image,
                                              size: 40,
                                            ),
                                            SizedBox(height: 10),
                                            Text('Gallery')
                                          ],
                                        ),
                                        onTap: () =>
                                            pickImage(ImageSource.gallery),
                                      ),
                                      const SizedBox(width: 80),
                                      InkWell(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            FaIcon(FontAwesomeIcons.camera,
                                                size: 40),
                                            SizedBox(height: 10),
                                            Text('Camera')
                                          ],
                                        ),
                                        onTap: () =>
                                            pickImage(ImageSource.camera),
                                      ),
                                    ],
                                  ),
                                  const Separator(),
                                ]);
                          },
                        );
                      },
                    ),
                  )
                ],
              ),

              //
              // Sizedbox
              //
              const Separator(),
              //
              // 2. ListTile (Personal information)
              //
              ListTile(
                tileColor: Theme.of(context).colorScheme.onPrimary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                leading: const Icon(
                  Icons.account_circle,
                  color: Color.fromARGB(255, 14, 193, 238),
                  size: 30,
                ),
                title: Text('Personal information',
                    style: Theme.of(context).textTheme.bodyLarge),
                onTap: () {
                  Navigator.of(context)
                      .pushNamed("/SettingsPersonalInformation");
                },
              ),

              //
              // SizedBox
              //
              const Separator(),
              //
              //  Email
              //
              ListTile(
                  tileColor: Theme.of(context).colorScheme.onPrimary,
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15))),
                  title: Text('Email',
                      style: Theme.of(context).textTheme.bodyLarge),
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor:
                          Theme.of(context).colorScheme.primaryContainer,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(15))),
                      context: context,
                      builder: (context) {
                        return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              ListTile(
                                title: Text('Change credentials',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge),
                              ),
                              const SizedBox(height: 10),
                              const Padding(
                                  padding: EdgeInsets.all(8),
                                  child: TextForm(
                                    labelText: 'Email',
                                    maxLenght: 30,
                                  )),
                              const SizedBox(height: 15),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextForm(
                                  labelText: 'Password',
                                  maxLenght: 100,
                                ),
                              ),
                            ]);
                      },
                    );
                  }),

              //
              //Password
              //
              ListTile(
                  tileColor: Theme.of(context).colorScheme.onPrimary,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15))),
                  title: Text('Password',
                      style: Theme.of(context).textTheme.bodyLarge),
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor:
                          Theme.of(context).colorScheme.primaryContainer,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(15))),
                      context: context,
                      builder: (context) {
                        return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              ListTile(
                                title: Text('Change credentials',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge),
                              ),
                              const SizedBox(height: 10),
                              const Padding(
                                  padding: EdgeInsets.all(8),
                                  child: TextForm(
                                    labelText: 'Email',
                                    maxLenght: 30,
                                  )),
                              const SizedBox(height: 15),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextForm(
                                  labelText: 'Password',
                                  maxLenght: 100,
                                ),
                              ),
                            ]);
                      },
                    );
                  }),
              //
              // SizedBox
              //
              const Separator(),

              //
              //Languages
              //
              ListTile(
                tileColor: Theme.of(context).colorScheme.onPrimary,
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15))),
                title: Text(
                  'Language',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(15))),
                    context: context,
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            title: Text('Choose language',
                                style:
                                    Theme.of(context).textTheme.displayLarge),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Flag.fromCode(
                                FlagsCode.GB,
                                height: 45,
                                width: 70,
                                borderRadius: 30,
                              ),
                              const SizedBox(height: 10),
                              const Text('English'),
                              Radio(
                                value: true,
                                groupValue: groupLanguage,
                                onChanged: (T) {
                                  setState(() {
                                    groupLanguage = !groupLanguage;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  );
                },
              ),

              //
              //Display
              //
              ListTile(
                  tileColor: Theme.of(context).colorScheme.onPrimary,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15))),
                  title: Text('Display',
                      style: Theme.of(context).textTheme.bodyLarge),
                  onTap: () {
                    showModalBottomSheet(
                        backgroundColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15))),
                        context: context,
                        builder: (context) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                title: Text('Display',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  /*InkWell(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Coming',
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const FaIcon(
                                          FontAwesomeIcons.mobile,
                                          size: 100,
                                          color: Color.fromARGB(
                                              255, 226, 226, 226),
                                        ),
                                        const SizedBox(height: 10),
                                        const Text('Light mode'),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Radio(
                                          value: displayRadio[0],
                                          groupValue: groupDisplay,
                                          onChanged: (T) {
                                            print(T);
                                            setState(() {
                                              displayRadio[0] =
                                                  !displayRadio[0];
                                            });
                                          },
                                        )
                                      ],
                                    ),
                                  ),*/
                                  InkWell(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          '',
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const FaIcon(
                                          FontAwesomeIcons.mobile,
                                          size: 100,
                                          color: Colors.black,
                                        ),
                                        const SizedBox(height: 10),
                                        const Text('Dark mode'),
                                        Radio(
                                          value: displayRadio[1],
                                          groupValue: groupDisplay,
                                          onChanged: (T) {
                                            setState(() {
                                              displayRadio[1] =
                                                  !displayRadio[1];
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  /*InkWell(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Coming',
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const FaIcon(
                                          FontAwesomeIcons.mobile,
                                          size: 100,
                                          color: Colors.grey,
                                        ),
                                        const SizedBox(height: 10),
                                        const Text('System'),
                                        Radio(
                                          value: displayRadio[2],
                                          groupValue: groupDisplay,
                                          onChanged: (T) {
                                            print(T);
                                            setState(() {
                                              displayRadio[2] =
                                                  !displayRadio[2];
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),*/
                                ],
                              ),
                              /*const Separator(),
                              Row(
                                children: [
                                  const SizedBox(width: 20),
                                  const Text("Dark Theme"),
                                  const SizedBox(width: 10),
                                  Switch(
                                      value: Provider.of<ThemeService>(context)
                                          .isDarkModeOn,
                                      onChanged: (value) {
                                        Provider.of<ThemeService>(context,
                                                listen: false)
                                            .toggleTheme();
                                      })
                                ],
                              ),*/
                              const SizedBox(height: 15),
                            ],
                          );
                        });
                  }),
              //
              // SizedBox
              //
              const Separator(),

              //
              // Follow us
              //

              ListTile(
                tileColor: Theme.of(context).colorScheme.onPrimary,
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15))),
                title: Text('Follow us',
                    style: Theme.of(context).textTheme.bodyLarge),
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(15))),
                    context: context,
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            title: Text('Follow us',
                                style:
                                    Theme.of(context).textTheme.displayLarge),
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            title: const Text('Querpass'),
                            onTap: () => launchUrl(
                              Uri.parse('http://querpass.com/'),
                              mode: LaunchMode.externalApplication,
                            ),
                          ),
                          ListTile(
                            leading: const Icon(Icons.facebook_rounded,
                                color: Colors.blue),
                            title: const Text('Facebook'),
                            onTap: () => launchUrl(
                              Uri.parse('https://www.facebook.com/tom.ottele'),
                              mode: LaunchMode.externalApplication,
                            ),
                          ),
                          ListTile(
                            leading: const Icon(FontAwesomeIcons.instagram,
                                color: Color.fromARGB(255, 219, 33, 243)),
                            title: const Text('Instagram'),
                            onTap: () => launchUrl(
                              Uri.parse(
                                  'https://www.instagram.com/tomottele/?hl=en'),
                              mode: LaunchMode.externalApplication,
                            ),
                          ),
                          ListTile(
                            leading: const Icon(FontAwesomeIcons.twitter,
                                color: Color.fromARGB(255, 105, 179, 239)),
                            title: const Text('Twitter'),
                            onTap: () => launchUrl(
                              Uri.parse('https://twitter.com/OtteleTom'),
                              mode: LaunchMode.externalApplication,
                            ),
                          ),
                          ListTile(
                            leading: const Icon(FontAwesomeIcons.linkedin,
                                color: Colors.blue),
                            title: const Text('LinkedIn'),
                            onTap: () => launchUrl(
                              Uri.parse(
                                  'https://www.linkedin.com/in/tomottel%C3%A9/'),
                              mode: LaunchMode.externalApplication,
                            ),
                          ),
                          ListTile(
                            leading: const Icon(FontAwesomeIcons.youtube,
                                color: Colors.red),
                            title: const Text('YouTube'),
                            onTap: () => launchUrl(
                              Uri.parse(
                                  'https://www.youtube.com/watch?v=zquHzDk7auE'),
                              mode: LaunchMode.externalApplication,
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),

              //
              //Feedback and Suggestions
              //
              ListTile(
                  tileColor: Theme.of(context).colorScheme.onPrimary,
                  title: Text('Idea box and feedback',
                      style: Theme.of(context).textTheme.bodyLarge),
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor:
                          Theme.of(context).colorScheme.primaryContainer,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(15))),
                      context: context,
                      builder: (context) {
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            ListTile(
                                leading: const Icon(
                                  Icons.lightbulb,
                                  size: 45,
                                  color: Colors.yellow,
                                ),
                                title: Text('Idea box',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge),
                                subtitle: const Text(
                                    'Help us to innovate by submitting your idea below')),
                            const Padding(
                                padding: EdgeInsets.all(10),
                                child: TextForm(labelText: '', maxLenght: 500)),

                            //
                            const Separator(),
                            //

                            ListTile(
                                leading: const Icon(Icons.bug_report,
                                    size: 45, color: Colors.red),
                                title: Text('Report a bug',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge),
                                subtitle: const Text(
                                    'Help us to innovate by submitting your idea below')),
                            const Padding(
                                padding: EdgeInsets.all(10),
                                child: TextForm(
                                  labelText: '',
                                  maxLenght: 500,
                                )),
                            //
                            const Separator(),
                            //
                          ],
                        );
                      },
                    );
                  }),

              //
              // Rate us
              //
              ListTile(
                  tileColor: Theme.of(context).colorScheme.onPrimary,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15))),
                  title: Text('Rate Querpass',
                      style: Theme.of(context).textTheme.bodyLarge),
                  onTap: () {
                    showModalBottomSheet(
                        backgroundColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15))),
                        context: context,
                        builder: (context) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                title: Text('Coming soon...',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge),
                              ),
                              const SizedBox(height: 15),
                              const SizedBox(height: 15),
                            ],
                          );
                        });
                  }),

              //
              //
              //
              const Separator(),

              //
              // Terms and conditions
              //

              ListTile(
                tileColor: Theme.of(context).colorScheme.onPrimary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                title: Text('Terms and Conditions',
                    style: Theme.of(context).textTheme.bodyLarge),
                onTap: () => launchUrl(
                  Uri.parse('https://www.clubee.com/terms-conditions'),
                  mode: LaunchMode.externalApplication,
                ),
              ),
              //
              // Separator
              //

              const Separator(),

              //
              // Log out
              //
              ListTile(
                tileColor: Theme.of(context).colorScheme.onPrimary,
                title: Text('Log out',
                    style: Theme.of(context).textTheme.bodyLarge),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                leading: const Icon(Icons.logout, color: Colors.red),
              ),
            ]))),
      );
    });
  }

  void takePhoto(ImageSource camera) {}

  Widget buildSingleCheckbox(CheckBoxState checkBox) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return CheckboxListTile(
            secondary: Icon(checkBox.icon),
            tileColor: Colors.transparent,
            checkboxShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            value: checkBox.value,
            onChanged: (value) => setState(() {
              for (var notification in notifications) {
                notification.value = !value!;
              }

              checkBox.value = value!;
            }),
            controlAffinity: ListTileControlAffinity.platform,
            title: Text(
              checkBox.title,
              textAlign: TextAlign.start,
              style: checkBox.value
                  ? const TextStyle(fontWeight: FontWeight.bold)
                  : const TextStyle(fontWeight: FontWeight.normal),
            ),
            subtitle: Text(
              checkBox.subtitle,
              textAlign: TextAlign.start,
            ),
          );
        },
      );
}
