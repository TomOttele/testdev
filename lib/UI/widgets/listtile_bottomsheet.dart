import 'package:flutter/material.dart';

class ListTileBottomSheet extends StatefulWidget {
  const ListTileBottomSheet({super.key});

  @override
  State<ListTileBottomSheet> createState() => _ListTileBottomSheetState();
}

class _ListTileBottomSheetState extends State<ListTileBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return  ListTile(
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
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                title: Text('Change credentials',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.blue),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      labelText: 'Email',
                                      border: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue))),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.blue),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      labelText: 'Password',
                                      border: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue))),
                                ),
                              ),
                            ]);
                      },
                    );
                  })
  ;
  }
}