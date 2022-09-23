import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _textController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime? _selectedDate;

  _submitForm() {
    //função criada para usuario apertar a confirmação no teclado e já adicionar uma nova transação
    final title = _textController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }
    widget.onSubmit(title, value, _selectedDate!);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: <Widget>[
              TextField(
                //titulo do produto
                controller: _textController,
                onSubmitted: (_) => _submitForm(),
                decoration: const InputDecoration(labelText: 'Titulo'),
              ),
              TextField(
                //valor do produto
                controller: _valueController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitForm(),
                decoration: const InputDecoration(labelText: 'Valor'),
              ),
              Container(
                //height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'Nenhuma data Selecionada   ➤'
                            : 'Data Selecionada ${DateFormat('dd/MM/y').format(_selectedDate!)}',
                        style: TextStyle(
                          fontFamily: 'SecularOne',
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        FlatButton(
                          textColor: const Color.fromARGB(255, 128, 0, 128),
                          child: Text(
                            'Selecionar data',
                            style: TextStyle(
                              fontFamily: 'SecularOne',
                              fontSize: 18,
                            ),
                          ),
                          onPressed: _showDatePicker,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              RaisedButton(
                color: Colors.purple,
                child: Text(
                  'Nova transação',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                textColor: Color.fromARGB(255, 238, 238, 238),
                onPressed: _submitForm,
              )
            ],
          ),
        ),
      ),
    );
  }
}
