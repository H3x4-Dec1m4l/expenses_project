import 'package:flutter/material.dart';


class TransactionForm extends StatelessWidget {
  final textController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  _submitForm() { //função criada para usuario apertar a confirmação no teclado e já adicionar uma nova transação
    final title = textController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if(title.isEmpty || value <=0){
      return;
    }
    onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              //titulo do produto
              controller: textController,
              onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(labelText: 'Titulo'),
            ),
            TextField(
              //valor do produto
              controller: valueController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(labelText: 'Valor'),
            ),
            FlatButton(
                child: Text('Nova transação'),
                textColor: Color.fromARGB(255, 124, 0, 68),
                onPressed: _submitForm,  
                )
          ],
        ),
      ),
    );
  }
}
