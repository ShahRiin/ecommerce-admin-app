import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showMsg(BuildContext context , String msg){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
}
showSingleTextInputDialog({
  required BuildContext context,
  required String title ,
  String positiveButtonText ='save',
  String negativeButtonText =' cancel',
  required Function (String) onSave,
}){
  final controller = TextEditingController();
  showDialog(context: context, builder: (context)=>AlertDialog(
    title: Text(title),
    content: Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter $title'
        ),
      ),
    ),
    actions: [
      OutlinedButton(
          onPressed: (){
            if (controller.text.isEmpty)return;
            onSave(controller.text);
            Navigator.pop(context);
          },
          child: Text(positiveButtonText)
      ),
      OutlinedButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text(negativeButtonText),
      )
    ],
  ));
}