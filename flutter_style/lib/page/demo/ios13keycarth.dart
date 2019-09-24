import 'package:flutter/material.dart';

class IoskeyCrach extends StatelessWidget {
  const IoskeyCrach({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Center(
        child: TextField(
          onSubmitted: null,
          onEditingComplete: null,
          keyboardType: TextInputType.url,
        ),
      ),
    );
  }
}