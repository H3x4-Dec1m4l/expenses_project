
import 'package:flutter/cupertino.dart';

class EmptyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text(
          'Nenhuma transação cadastrada',
          style: TextStyle(fontSize: 20,
          fontFamily: 'SecularOne'
          ),
          
        ),
        const SizedBox(height: 20),
        Container(
          height: 250,
          width: 230,
          child: Image.asset(
            'Assets/Images/zzz.png',
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
