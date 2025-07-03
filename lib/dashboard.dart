import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:santinha/botoes_login.dart';

class Dashboard extends StatefulWidget {
  dynamic userContent;
  Dashboard({this.userContent, super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool cardExtratoAberto = false;
  bool cardCartoesAberto = false;
  int _current = 0;
  dynamic userContent;
  final CarouselSliderController _controller = CarouselSliderController();

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 249, 252),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: cardExtratoAberto
                  ? MediaQuery.of(context).size.height * 0.49
                  : MediaQuery.of(context).size.height * 0.36,
              child: Stack(
                children: [
                  Image.asset("assets/fundo_dashboard.png"),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/teste3.png",
                          width: 150,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 16.0, left: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.search_outlined, color: Colors.white),
                              Icon(Icons.message_rounded, color: Colors.white),
                              Icon(Icons.notifications_outlined,
                                  color: Colors.white)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 145,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12.0, left: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Olá, ${widget.userContent['nome']}",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Ag 4317 Cc ${widget.userContent["numeroConta"]}",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.26,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 12.0),
                      child: Card(
                        color: Colors.white,
                        child: Container(
                          padding: EdgeInsets.all(12),
                          width: MediaQuery.of(context).size.width * 0.93,
                          height: cardExtratoAberto ? null : null,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.money,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Saldo disponível"),
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          cardExtratoAberto =
                                              !cardExtratoAberto;
                                        });
                                      },
                                      icon: Icon(Icons.arrow_downward))
                                ],
                              ),
                              cardExtratoAberto
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "R\$ ${widget.userContent["saldo"]}",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "Saldo + Limite: R\$ ${widget.userContent["saldo"]}",
                                        ),
                                        Text(
                                          "Entenda seu limite",
                                          style: TextStyle(color: Colors.red),
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text("Ver extrato"),
                                          ],
                                        )
                                      ],
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 350,
              height: 110,
              child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return BotoesLogin();
                },
              ),
            ),
            Column(children: [
              CarouselSlider(
                options: CarouselOptions(height: 150.0),
                items: [1, 2, 3, 4, 5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(color: Colors.amber),
                          child: Text(
                            'text $i',
                            style: TextStyle(fontSize: 16.0),
                          ));
                    },
                  );
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Cartões",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              height: cardCartoesAberto ? 170 : null,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(5)),
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/mastercard.png",
                            height: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Cartão final"),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "2244",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      // IconButton(
                      //   onPressed: () {
                      //     setState(() {
                      //       cardCartoesAberto = !cardCartoesAberto;
                      //     });
                      //   },
                      //   icon: Icon(Icons.keyboard_arrow_down),
                      // )
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              cardCartoesAberto = !cardCartoesAberto;
                            });
                          },
                          child: Icon(Icons.keyboard_arrow_down))
                    ],
                  ),
                  cardCartoesAberto
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Santander Elite Master"),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Limite disponível"),
                                Text("R\$ 76,10"),
                              ],
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text("Ver fatura")],
                            )
                          ],
                        )
                      : Container(),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Cartão Online",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
