import 'package:flutter/material.dart';
import 'package:kdksdkskdxd/app/widgets/match_info.dart';

class MyInfoPartidoPage extends StatefulWidget {
  const MyInfoPartidoPage();

  @override
  _MyInfoPartidoPage createState() => _MyInfoPartidoPage();
}

class _MyInfoPartidoPage extends State<MyInfoPartidoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "InterCarrera",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMatchInfoRow(),
            _buildRecentResults(),
          ],
        ),
      ),
    );
  }

  Widget _buildMatchInfoRow() {
    return Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffcccccc)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MatchInfoRow(),
        ],
      ),
    );
  }

  Widget _buildRecentResults() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 24, 20, 34),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffcccccc)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 50),
            child: Text(
              'Resultados Recientes',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: Color(0xff000000),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 60,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TeamResults(),
                TeamResultsRight(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TeamResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 128, 0),
      width: 100,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 34, 10),
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 1, 10, 0),
                  child: Text(
                    'Vil',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                Container(
                  width: 29,
                  height: 29,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.5),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://upload.wikimedia.org/wikipedia/en/thumb/b/b9/Villarreal_CF_logo-en.svg/1200px-Villarreal_CF_logo-en.svg.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 21,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    children: List.generate(6, (index) {
                      return Positioned(
                        left: 16 *
                            index
                                .toDouble(), // Ajusta este valor para el espaciado horizontal
                        top: 0,
                        child: Container(
                          width: 21,
                          height: 21,
                          decoration: BoxDecoration(
                            color: index % 2 == 0
                                ? Color(0xffff0000)
                                : Color(0xff00d92f),
                            borderRadius: BorderRadius.circular(10.5),
                          ),
                          child: Center(
                            child: Text(
                              index % 2 == 0 ? 'P' : 'G',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 9,
                                fontWeight: FontWeight.w900,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Container(
                  width: 6,
                  height: 8,
                  child: Image.network(
                    'https://images.vexels.com/media/users/3/136721/isolated/preview/0a87638be517433b4846494d15db9126-punta-de-flecha-derecha.png',
                    width: 6,
                    height: 8,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TeamResultsRight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // frame80abq (117:375)
      width: 96,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(32, 0, 0, 10),
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 1, 10, 0),
                  child: Text(
                    'Gir',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                Container(
                  width: 29,
                  height: 29,
                  child: Image.network(
                    'https://static.wikia.nocookie.net/fifa/images/5/5d/Girona_FC.png/revision/latest?cb=20161228190707',
                    width: 29,
                    height: 29,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 21,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // arrowszF (117:439)
                  margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                  width: 6,
                  height: 8,
                  child: Image.network(
                    'https://images.vexels.com/media/users/3/136721/isolated/preview/0a87638be517433b4846494d15db9126-punta-de-flecha-derecha.png',
                    width: 6,
                    height: 8,
                  ),
                ),
                Container(
                  width: 85,
                  height: double.infinity,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 21,
                          height: 21,
                          decoration: BoxDecoration(
                            color: Color(0xffff0000),
                            borderRadius: BorderRadius.circular(10.5),
                          ),
                          child: Center(
                            child: Text(
                              'P',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 9,
                                fontWeight: FontWeight.w900,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 16,
                        top: 0,
                        child: Container(
                          width: 21,
                          height: 21,
                          decoration: BoxDecoration(
                            color: Color(0xff00d92f),
                            borderRadius: BorderRadius.circular(10.5),
                          ),
                          child: Center(
                            child: Text(
                              'G',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 9,
                                fontWeight: FontWeight.w900,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 32,
                        top: 0,
                        child: Container(
                          width: 21,
                          height: 21,
                          decoration: BoxDecoration(
                            color: Color(0xffff0000),
                            borderRadius: BorderRadius.circular(10.5),
                          ),
                          child: Center(
                            child: Text(
                              'P',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 9,
                                fontWeight: FontWeight.w900,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 48,
                        top: 0,
                        child: Container(
                          width: 21,
                          height: 21,
                          decoration: BoxDecoration(
                            color: Color(0xff00d92f),
                            borderRadius: BorderRadius.circular(10.5),
                          ),
                          child: Center(
                            child: Text(
                              'G',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 9,
                                fontWeight: FontWeight.w900,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 64,
                        top: 0,
                        child: Container(
                          width: 21,
                          height: 21,
                          decoration: BoxDecoration(
                            color: Color(0xffff0000),
                            borderRadius: BorderRadius.circular(10.5),
                          ),
                          child: Center(
                            child: Text(
                              'P',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 9,
                                fontWeight: FontWeight.w900,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
