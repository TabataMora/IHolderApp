import 'package:flutter/material.dart';
import 'package:iholder_app/models/ativo-em-carteira-view-model.dart';
import 'package:iholder_app/ui/android/screens/cadastro-ativo-em-carteira.screen.dart';
import 'package:iholder_app/ui/shared/widgets/descricao-e-valor.widget.dart';
import 'package:iholder_app/ui/shared/widgets/variacao-badge.widget.dart';
import 'package:iholder_app/validators/Formatters.dart';
import 'package:iholder_app/validators/widget-selector.dart';

class AtivoEmCarteiraCard extends StatefulWidget {
  final AtivoEmCarteiraViewModel ativoEmCarteira;
  AtivoEmCarteiraCard(this.ativoEmCarteira);
  @override
  _AtivoEmCarteiraCardState createState() => _AtivoEmCarteiraCardState();
}

class _AtivoEmCarteiraCardState extends State<AtivoEmCarteiraCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => CadastroAtivoEmCarteiraScreen(
                    ativoEmCarteiraViewModel: widget.ativoEmCarteira),
              ),
            );
          },
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                            "${widget.ativoEmCarteira.ativoTicker} (${widget.ativoEmCarteira.produtoDescricao})",
                            style: TextStyle(fontSize: 15)),
                        Row(
                          children: <Widget>[
                            Text(
                              "R\$ ${Parser.toStringCurrency(widget.ativoEmCarteira.ultimaCotacao)} ",
                              style: TextStyle(fontSize: 15),
                            ),
                            VariacaoBadge(
                                percentual: widget
                                    .ativoEmCarteira.ultimaVariacaoPercentual),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Divider(color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            DescricaoEValor(
                                "Médio", widget.ativoEmCarteira.precoMedio),
                            DescricaoEValor(
                              "Quantidade",
                              widget.ativoEmCarteira.quantidade,
                              prefixo: "",
                            ),
                            DescricaoEValor("Aplicado",
                                widget.ativoEmCarteira.valorAplicado),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            DescricaoEValor(
                                "Atual", widget.ativoEmCarteira.valorAtual),
                            DescricaoEValor(
                              "Variação",
                              widget.ativoEmCarteira.percentual,
                              prefixo: "",
                              sufixo: " %",
                              style: TextStyle(
                                  color: Selector.corPorValor(
                                      widget.ativoEmCarteira.saldo)),
                            ),
                            DescricaoEValor(
                              "Saldo",
                              widget.ativoEmCarteira.saldo,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Selector.corPorValor(
                                      widget.ativoEmCarteira.saldo)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}