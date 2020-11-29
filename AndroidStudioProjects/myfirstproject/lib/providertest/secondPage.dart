
import 'package:flutter/material.dart';
import 'package:myfirstproject/providertest/CouterModel.dart';
import 'package:myfirstproject/providertest/ProviderTestMain.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "SecondPage"
        ),
      ),
      body: Consumer2<CounterModel,int>(
        builder: (context, CounterModel counter, int textSize, _) => Center(
          child: Text(
            'Value: ${counter.count}',
            style: TextStyle(
              fontSize: textSize.toDouble(),
            ),
          ),
        ),
      ),
      floatingActionButton: Consumer<CounterModel>(
        builder: (context, model,child)=>FloatingActionButton(
          onPressed: model.increment,
          child: child,
        ),
        child: Icon(Icons.add),
      )
    );
  }
}
