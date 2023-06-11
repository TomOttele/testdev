import 'package:flutter/material.dart';

/*class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  Future showToast(String message) async {}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text("Chats", style: Theme.of(context).textTheme.displayLarge),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DropDownMenu(
              items: const ['Present', 'Late', 'Absent'],
              labelText: 'Availability',
              width: size.width * 0.4,
              color: Colors.teal,
            ),
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed("/OnboardingScreenStart"),
              child: const Text('Press'),
            ),
            const Separator(),
            const Separator(),
            const MyFormApp()
          ],
        ),
      ),
    );
  }
}
*/
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textController1 = TextEditingController();
  final TextEditingController _textController2 = TextEditingController();
  final TextEditingController _textController3 = TextEditingController();

  List<String> containerData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _textController1,
              decoration: const InputDecoration(labelText: 'Info 1'),
            ),
            TextFormField(
              controller: _textController2,
              decoration: const InputDecoration(labelText: 'Info 2'),
            ),
            TextFormField(
              controller: _textController3,
              decoration: const InputDecoration(labelText: 'Info 3'),
            ),
            ElevatedButton(
              onPressed: () {
                String info1 = _textController1.text;
                String info2 = _textController2.text;
                String info3 = _textController3.text;

                String containerText =
                    'Info 1: $info1, Info 2: $info2, Info 3: $info3';

                setState(() {
                  containerData.add(containerText);
                });
              },
              child: const Text('Create Container'),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: containerData.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    padding: const EdgeInsets.all(16.0),
                    color: Colors.grey[200],
                    child: Text(containerData[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
