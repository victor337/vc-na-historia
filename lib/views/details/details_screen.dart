import 'package:flutter/material.dart';
import 'package:vcnahistoria/models/tile_facts.dart';


class DetailsScreen extends StatelessWidget {

  final TileFacts tileFacts;
  const DetailsScreen(this.tileFacts);

  @override
  Widget build(BuildContext context) {

    final TextStyle style = TextStyle(
      color: Colors.white
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Detalhes: ${tileFacts.fact}'
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
        children: [
          Card(
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('Fato: ${tileFacts.fact}', style: style,),
                  Text('Data: ${tileFacts.date}', style: style,),
                  Text('Personagem: ${tileFacts.character}', style: style,),
                  Text('Local: ${tileFacts.local}', style: style,),
                ],
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: tileFacts.images.length,
            itemBuilder: (ctx, index){
              return Container(
                height: 100,
                width: 100,
                child: Image.file(
                  tileFacts.images[index],
                  fit: BoxFit.contain,
                ),
              );
            }
          ),
          Text(
            'Você salvou esse fato em: ${tileFacts.saveData}',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}