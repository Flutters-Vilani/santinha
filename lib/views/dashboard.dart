import 'package:santinha/views/pix_1.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool cardAberto = false;
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  final List<String> stringList = [
    '1',
    '2',
    '3',
  ];

  final List<dynamic> cardsTransf = [
    {"titulo": "Pix", "icon": Icons.pix_outlined, "route": Pix1()},
    {"titulo": "ID Santander", "icon": Icons.lock_open, "route": Pix1()},
    {"titulo": "Pix", "icon": Icons.pix, "route": Pix1()}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: cardAberto
                  ? MediaQuery.of(context).size.height * 0.52
                  : MediaQuery.of(context).size.height * 0.36,
              child: Stack(
                children: [
                  Image.asset("assets/fundo_dashboard.png"),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/teste3.png",
                          width: 150,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.search_outlined,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.message_outlined,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.notifications_outlined,
                              color: Colors.white,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 145,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Olá, Guilherme",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                          Text(
                            "Ag 4317 Cc 014578-9",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.26,
                    child: Padding(
                      padding: EdgeInsets.only(left: 12, right: 12),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        elevation: 10,
                        color: Colors.white,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          width: MediaQuery.of(context).size.width * 0.93,
                          height: cardAberto ? null : null,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/icone_cifrao.png",
                                        width: 35,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Saldo disponível",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        cardAberto = !cardAberto;
                                      });
                                    },
                                    icon: cardAberto
                                        ? Icon(
                                            Icons.keyboard_arrow_up,
                                            size: 30,
                                          )
                                        : Icon(
                                            Icons.keyboard_arrow_down,
                                            size: 30,
                                          ),
                                  )
                                ],
                              ),
                              cardAberto
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                          top: 10, left: 6, right: 6),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "R\$ 10.000.000,00",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                          Text(
                                            "Saldo + Limite: 143,00",
                                            style: TextStyle(fontSize: 15),
                                          ),
                                          Text(
                                            "Entenda seu limite",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 236, 9, 0),
                                                fontSize: 15,
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor: Colors.red),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Divider(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Ver extrato",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Color.fromARGB(
                                                      255, 236, 9, 0),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          )
                                        ],
                                      ),
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            // container para determinar a largura e altura da lista horizontal
            // para a lista nao explodir a tela
            Container(
              width: MediaQuery.of(context).size.width * 1,
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cardsTransf.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => cardsTransf[index]['route'],
                          ),
                        );
                      },
                      child: Card(
                        color: Colors.white,
                        child: Container(
                          width: 130,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(cardsTransf[index]['icon']),
                              SizedBox(
                                height: 10,
                              ),
                              Text(cardsTransf[index]['titulo']),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // column dos cards vermelhos
            Column(
              children: [
                CarouselSlider(
                  items: [
                    Text('1'),
                    Text('2'),
                    Text('3'),
                  ],
                  carouselController: _controller,
                  options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      height: 80,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: stringList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                (Theme.of(context).brightness == Brightness.dark
                                        ? Colors.white
                                        : Colors.black)
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 12.0, top: 12.0, bottom: 12.0),
              child: Text(
                "Cartões",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                color: Color.fromARGB(255, 147, 145, 146),
                child: Container(
                  height: 180,
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.credit_card,
                                color: Colors.white,
                              ),
                              SizedBox(width: 12),
                              Text(
                                "Cartão final",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "2244",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          )
                        ],
                      ),
                      Text(
                        "Santander Elite Master",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Limite disponível",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "R\$ 5.000,00",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Text(
                        "Ver fatura",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.only(left: 12, right: 12, top: 8),
              alignment: Alignment.center,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 236, 9, 0),
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                "Cartão Online",
                style: TextStyle(
                  color: Color.fromARGB(255, 236, 9, 0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
