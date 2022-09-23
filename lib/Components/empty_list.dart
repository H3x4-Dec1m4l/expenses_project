/* import 'package:flutter/cupertino.dart';

class EmptyList extends StatefulWidget {
  @override
  State<EmptyList> createState() => _EmptyListState();
}

class _EmptyListState extends State<EmptyList> {
  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
     return  Column(          
          children: <Widget>[
            const Text(
              'Nenhuma transação cadastrada',
              style: TextStyle(fontSize: 20,
              fontFamily: 'SecularOne'
              ),
              
            ),
           // const SizedBox(height: 2),
            Container(
               height: 200,
                  width: 200,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                 
                 
                ),]
              ),
            )
          ],
        );
    
    }

  }
 */
  /* OBS:  Layout Builder não funcioa direito mais, sempre que vou usa-lo
  a imagem que era para aparecer some */
//     return LayoutBuilder(builder: (context, constraints) {
//       return Column(
//         children: <Widget>[
//           const Text(
//             'Nenhuma transação cadastrada',
//             style: TextStyle(fontSize: 20, fontFamily: 'SecularOne'),
//           ),
//           const SizedBox(height: 2),
//           Container(
//             height: isLandscape ? MediaQuery.of(context).size.height * 0.44 : 200 ,
//             child: Image.asset(
//               'assets/images/waiting.png',
//               fit: BoxFit.cover,
//             ),
//           )
//         ],
//       );
//     });
//   }
// }
        