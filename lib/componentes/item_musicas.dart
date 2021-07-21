import 'package:flutter/material.dart';
import '../models/musicas.dart';
import '../providers/musicas_providers.dart';
import '../utils/rotas.dart';
import 'package:provider/provider.dart';

class ItemListaMusicas extends StatelessWidget {
  final Musicas musica;

  ItemListaMusicas(this.musica);

  void deleteMusica(context, Musicas musica) {
    Provider.of<MusicasProvider>(context, listen: false).deleteMusica(musica);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green.withAlpha(20),
        border: Border.all(width: 2, color: Colors.green),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(8),
        title: Container(
          child: Text(
            musica.nomeMusica,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
        subtitle: Text("Duração: ${musica.duracao}"),
        trailing: Container(
          width: 100,
          child: Row(
            children: [
              Flexible(
                child: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      Rotas.EDIT_MUSICAS,
                      arguments: musica,
                    );
                  },
                  color: Colors.black,
                ),
              ),
              Flexible(
                child: IconButton(
                  iconSize: 20,
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text("ATENÇÃO"),
                        content: Text("Está certo disso?"),
                        actions: [
                          FlatButton(
                              child: Text("Não"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                          FlatButton(
                              child: Text("Sim"),
                              onPressed: () {
                                deleteMusica(context, musica);
                                Navigator.of(context).pop();
                              })
                        ],
                      ),
                    );
                  },
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
