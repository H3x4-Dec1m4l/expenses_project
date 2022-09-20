import 'package:flutter/material.dart';


class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final textController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() { //função criada para usuario apertar a confirmação no teclado e já adicionar uma nova transação
    final title = textController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if(title.isEmpty || value <=0){
      return;
    }
    widget.onSubmit(title, value);
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
            Container(              
              //height: 70,
              child: Row(              
                children: <Widget> [
                 const Text('Nenhuma data Selecionada   ➤',
                 style: TextStyle(
                  fontFamily: 'SecularOne',
                  fontSize: 12.6,
                 ),
                 ),
                  Column(
                    children: [
                      FlatButton(
                        textColor: Color.fromARGB(255, 128, 0, 128),
                        child: const Text('Selecionar data',
                        style: TextStyle(
                          fontFamily: 'SecularOne',
                          fontSize: 12.6
                        ),
                        ),                        
                        onPressed: () { },
                      ),
                    ],
                  )
                ],
              ),
            ),
            RaisedButton(
              color: Colors.purple,
                child: Text('Nova transação',
                style: TextStyle(
                fontSize: 14.5,
                fontWeight: FontWeight.w700,
                ),
                ),
                textColor: Color.fromARGB(255, 238, 238, 238),
                onPressed: _submitForm,  
                )
          ],
        ),
      ),
    );
  }
}
