import 'package:flutter/material.dart';
import 'package:testdev/UI/home_player.dart';
import 'package:testdev/UI/widgets/elevatedbutton.dart';
import 'package:testdev/UI/widgets/telephone_form.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);
  final isDialOpen = ValueNotifier(false);

  Future showToast(String message) async {
    await Fluttertoast.cancel();
    Fluttertoast.showToast(msg: message, fontSize: 18);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isDialOpen.value) {
          isDialOpen.value = false;
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          overlayColor: Colors.black,
          overlayOpacity: 0.3,
          spacing: 12,
          elevation: 20,
          spaceBetweenChildren: 15,
          closeManually: false,
          openCloseDial: isDialOpen,
          children: [
            //
            SpeedDialChild(
              child: const Icon(Icons.mail),
              label: 'Mail',
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              onTap: () => HomePage(),
            ),

            //
            SpeedDialChild(
                child: const Icon(Icons.mail),
                label: 'Mail',
                backgroundColor: Theme.of(context).colorScheme.onPrimary),
            //
            SpeedDialChild(
                child: const Icon(Icons.mail),
                onTap: () => showToast('Selected Twitter...'),
                backgroundColor: Theme.of(context).colorScheme.onPrimary)
          ],
        ),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title: Text("Chats", style: Theme.of(context).textTheme.displayLarge),
        ),
        // ignore: unnecessary_new
        body: Column(
          children: [
            Elevated_Button(
              onPressed: null,
              text: '156555555',
            ),
            InkWell(
                child: const Text('Open Browser'),
                // ignore: deprecated_member_use
                onTap: () => launch(
                    'https://docs.flutter.io/flutter/services/UrlLauncher-class.html')),
            TelephoneNumber(labelText: 'labelText', maxLenght: 20)
          ],
        ),
      ),
    );
  }
}
