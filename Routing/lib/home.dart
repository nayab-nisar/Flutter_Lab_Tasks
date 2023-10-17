import 'package:flutter/material.dart';
import 'package:flutter_application_3/SecondPage.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Home")),
        body: Center(
            child: Column(
          children: [
            //1st child
            const Text("Welcome"),
            //2nd child
            ElevatedButton(
                //In every button there are two things
                //1.waht action to be done (ONPRESSED)
                //2.the text in the child that has to be displayed
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        const SecondPage(data: "nayab nisar memon"),
                  ));
                },
                child: const Text("Click")),
          ],
        )));
  }
}
