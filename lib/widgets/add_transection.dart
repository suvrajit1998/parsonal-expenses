import 'package:flutter/material.dart';

class AddTransection extends StatefulWidget {
  final Function addTransection;

  AddTransection(this.addTransection);

  @override
  State<AddTransection> createState() => _AddTransectionState();
}

class _AddTransectionState extends State<AddTransection> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void addTx() {
    final enteredTitleValue = titleController.text;
    final enteredAmountValue = double.parse(amountController.text);

    if (enteredTitleValue.isEmpty || enteredAmountValue <= 0) {
      return;
    }

    widget.addTransection(
      enteredTitleValue,
      enteredAmountValue,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => addTx(),
              // onChanged: (value) => inputTitle = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => addTx(),
              // onChanged: (value) => inputAmount = value,
            ),
            TextButton(
              onPressed: addTx,
              child: Text('Add transection'),
              style: TextButton.styleFrom(
                primary: Colors.purple,
              ),
            )
          ],
        ),
      ),
    );
  }
}
