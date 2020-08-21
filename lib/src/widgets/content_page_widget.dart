import 'package:flutter/material.dart';

class ContenidoPagina extends StatelessWidget {
  final String titulo;
  final String urlImage;
  final Widget child;

  ContenidoPagina({
    @required this.child,
    @required this.urlImage,
    this.titulo = 'Mi titulo',
  });

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Theme.of(context).primaryColor,
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  this.titulo,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                background: Image.asset(
                  this.urlImage,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ];
        },
        body: this.child);
  }
}
