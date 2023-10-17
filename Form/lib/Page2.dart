import 'package:flutter/material.dart';
import 'DataModel.dart';

class Page2 extends StatelessWidget {
  final DataModel data;

  Page2({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 2')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Name: ${data.name}'),
            Text('Email: ${data.email}'),
          
            Text('You selected: ${data.selectedGender}'),

          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class SecondPage extends StatelessWidget {
 

//   const SecondPage({super.key });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: const Text("Second ")),
//         body: Center(
//             child: Column(
//           children: [
//             Text("Displaying your data:"),
//           ],
//         )));
//   }
// }
