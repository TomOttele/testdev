import 'package:flutter/material.dart';
import 'package:testdev/UI/widgets/listtile_custom.dart';
import 'package:testdev/UI/widgets/separator.dart';
import '../widgets/divider.dart';

class SettingsPersonalInformation extends StatefulWidget {
  const SettingsPersonalInformation({Key? key}) : super(key: key);

  @override
  State<SettingsPersonalInformation> createState() =>
      _SettingsPersonalInformationState();
}

//
// Multiselect START
//
class MultiSelect extends StatefulWidget {
  final List<String> items;
  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  final List<String> _selectedItems = [];

  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  void _cancel() {
    Navigator.pop(context);
  }

  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      content: SingleChildScrollView(
        child: ListBody(
            reverse: true,
            children: widget.items
                .map((item) => CheckboxListTile(
                    title: Text(
                      item,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    controlAffinity: ListTileControlAffinity.platform,
                    value: _selectedItems.contains(item),
                    onChanged: (isChecked) => _itemChange(item, isChecked!)))
                .toList()),
      ),
      actions: [
        TextButton(
          onPressed: _cancel,
          child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
        ),
        TextButton(
            onPressed: _submit,
            style: const ButtonStyle(
                shape: MaterialStatePropertyAll(StadiumBorder()),
                backgroundColor: MaterialStatePropertyAll(Colors.grey)),
            child: const Text('Submit', style: TextStyle(color: Colors.white)))
      ],
    );
  }
}

class _SettingsPersonalInformationState
    extends State<SettingsPersonalInformation> {
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
  //
  // Multiselect END
  //

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final themeData = Theme.of(context);
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: themeData.appBarTheme.backgroundColor,
          title: const Text(
            "Personal information",
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.01,
                  left: size.width * 0.01,
                  right: size.width * 0.01,
                  bottom: size.height * 0.01),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * 0.01),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            CustomListTile(
                                title: 'Name', trailing: 'Cristiano Ronaldo'),
                            DividerLine(),
                            CustomListTile(
                                title: 'Mobile number',
                                trailing: '+352 661282822'),
                            DividerLine(),
                            CustomListTile(
                                title: 'Adress',
                                trailing: '8, route d Arlon L-4977 Niederkorn'),
                          ]),
                    ),
                  ),

                  const Separator(),
                  const Separator(),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * 0.01),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            CustomListTile(
                                title: 'Birthday', trailing: '22.11.1997'),
                            DividerLine(),
                            CustomListTile(
                                title: 'Nationality',
                                trailing: 'Luxembourgish'),
                          ]),
                    ),
                  ),
                  const Separator(),
                  const Separator(),

                  // Physical Information
                  Text('  Physical information',
                      style: Theme.of(context).textTheme.displayMedium),
                  const Separator(),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * 0.01),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            CustomListTile(title: 'Height', trailing: '189 cm'),
                            DividerLine(),
                            CustomListTile(title: 'Weight', trailing: '86 kg'),
                            DividerLine(),
                            CustomListTile(title: 'Cloth size', trailing: 'L'),
                            DividerLine(),
                            CustomListTile(title: 'Shoe size', trailing: '45'),
                            DividerLine(),
                            CustomListTile(
                                title: 'Preferred foot', trailing: 'Right'),
                          ]),
                    ),
                  ),
                  const Separator(),
                  const Separator(),

                  // Football
                  Text('  Football',
                      style: Theme.of(context).textTheme.displayMedium),
                  const Separator(),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * 0.01),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            CustomListTile(
                                title: 'Shirt number', trailing: '7'),
                            DividerLine(),
                            CustomListTile(title: 'Position', trailing: 'ST'),
                            DividerLine(),
                            CustomListTile(
                                title: 'Nationalteam', trailing: 'Yes'),
                          ]),
                    ),
                  ),
                  const Separator(),
                  const Separator(),

                  // Conatct person
                  Text('  Contact person',
                      style: Theme.of(context).textTheme.displayMedium),
                  const Separator(),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * 0.01),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            CustomListTile(title: 'Name', trailing: 'Georgina'),
                            DividerLine(),
                            CustomListTile(
                                title: 'Mobile number',
                                trailing: '+352 621811881'),
                            DividerLine(),
                            CustomListTile(
                                title: 'Relation', trailing: 'Partner'),
                          ]),
                    ),
                  ),
                  const Separator(), const Separator(),
                  /*// Section 1
                  Text('Information',
                      style: Theme.of(context).textTheme.displayMedium),
                  const Separator(),
                  const TextForm(labelText: 'Name', maxLenght: 30),
                  const Separator(),
                  const TextForm(labelText: 'Address', maxLenght: 50),
                  const Separator(),
                  const TelephoneNumber(labelText: 'Telephone', maxLenght: 20),
                  const Separator(),
                  const Separator(),

                  // Section 2

                  Text('Section 2',
                      style: Theme.of(context).textTheme.displayMedium),
                  const Separator(),
                  const Text('Birthday'),
                  const BirthdayInputWidget(),

                  const Separator(),
                  const TextForm(labelText: 'Nationality', maxLenght: 20),
                  const Separator(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NumberForm(
                          width: size.width * 0.4,
                          labelText: 'Height',
                          maxLenght: 3,
                          hintText: 'cm'),
                      NumberForm(
                          width: size.width * 0.4,
                          labelText: 'Weight',
                          maxLenght: 3,
                          hintText: 'kg'),
                    ],
                  ),
                  const Separator(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropDownMenu(
                          width: size.width * 0.4,
                          items: const [
                            'XXS',
                            'XS',
                            'S',
                            'M',
                            'L',
                            'XL',
                            'XXL'
                          ],
                          labelText: 'Cloth size'),
                      NumberForm(
                          width: size.width * 0.4,
                          labelText: 'Shoe size',
                          maxLenght: 3,
                          hintText: ''),
                    ],
                  ),

                  const Separator(),
                  Text(
                    'Preferred foot',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const ToggleButton(
                    text1: 'Left',
                    text2: 'Right',
                  ),
                  const Separator(),
                  const Separator(),

                  // Section 3
                  Text('Football',
                      style: Theme.of(context).textTheme.displayMedium),
                  const Separator(),
                  NumberForm(
                    width: size.width * 0.4,
                    labelText: 'Shirt number',
                    maxLenght: 3,
                  ),
                  const Separator(),
                  const DropDownMenu(items: [
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
                  ], labelText: 'Position'),
                  const Separator(),

                  const ChoiceChipsMS(),
                  const Separator(),
                  ListTile(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      tileColor: Theme.of(context).colorScheme.onPrimary,
                      title: Text(
                        'Position',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      trailing: const Icon(Icons.keyboard_arrow_down),
                      onTap: _showMultiSelect),
                  //

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
                  const Separator(),
                  //
                  //
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
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
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
                  const Separator(),
                  const Separator(),

                  // Section 3

                  Text('Contact person',
                      style: Theme.of(context).textTheme.displayMedium),
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

                  const Separator(),
                  const Separator(),
                  // Section 4

                  Text('Medical information',
                      style: Theme.of(context).textTheme.displayMedium),
                  const Separator(),
                  const ListTileSetting(
                    title: 'Adress',
                    trailing: '12,rue Jean Schmit L-4844 Olm',
                    maxLines: 3,
                  ),
                  const Separator(),

                  const ListTileSetting(
                      title: 'Telephone', trailing: '+352 621 373 383'),
                  const Separator(),
                  const ListTileSetting(title: 'Birthday', trailing: '24'),
                  const Separator(),

                  const ListTileSetting(
                      title: 'Nationality', trailing: 'Luxembourgish'),
                  const Separator(),
                  const ListTileSetting(title: 'Height', trailing: '178 cm'),
                  const Separator(),
                  const ListTileSetting(title: 'Weight', trailing: '83 kg'),
                  const Separator(),
                  const ListTileSetting(title: 'Cloth size', trailing: 'L'),
                  const Separator(),
                  const ListTileSetting(title: 'Shoe size', trailing: '46'),
                  const Separator(),
                  const ListTileSetting(
                      title: 'Preferred foot', trailing: 'Left'),
                  const Separator(),
                  const ListTileSetting(title: 'Shirt number', trailing: '8'),
                  const Separator(),
                  /*Column(
                    children: const [
                      SwipeToDeleteListView(
                        itemsTrailing: ['1', '2', '3'],
                        itemsTitle: ['1', '2', '3'],
                      ),
                    ],
                  )*/*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
