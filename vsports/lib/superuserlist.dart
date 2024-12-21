import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/io_client.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:vsports/link.dart';

final List<Widget> entries = [];
String r = 'reg_no';

class Needed extends ChangeNotifier {
  void backend(regno, gametype) async {
    print(regno);
    print(gametype);
    r = regno;
    try {
      // Create an HttpClient that ignores SSL certificate errors
      var httpClient = HttpClient()
        ..badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      var ioClient = IOClient(httpClient);

      var response = await ioClient.get(
        Uri.parse(
          'https://${ngrok_link}/api/get_all_data/?reg_no=${regno.toString()}&data_type=${gametype.toString()}',
        ),
      );

      var data = jsonDecode(response.body);
      if (data['status'] == 'success') {
        int n = data['data'].length;
        for (int i = 0; i < n; i++) {
          entries.add(Superlist(
            reg: data['data'][i]['student__reg_no'],
            ball: data['data'][i]['no_of_balls'],
            tt: data['data'][i]['date'],
            bat: data['data'][i]['no_of_bats'],
            raquets: data['data'][i]['no_of_raquets'],
            index: i,
            dtype: data['data_type'],
            ids: data['data'][i]['id'],
          ));
        }
      } else {
        print('Unexpected response: $data');
      }
    } catch (e) {
      print('Error during API call: $e');
    }
    notifyListeners();
  }

  void clearr() {
    entries.clear();
    notifyListeners();
  }

  void removee(ind) {
    entries.removeAt(ind);
    notifyListeners();
  }

  Future<void> done(sregno, btype, atype, bid, inde) async {
    print(sregno);
    print(btype);
    print(bid);
    print(atype);
    print(inde);
    if (btype == 'volleyball_booking') {
      btype = 'volleyball';
    }

    try {
      // Create an HttpClient that ignores SSL certificate errors
      var httpClient = HttpClient()
        ..badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      var ioClient = IOClient(httpClient);

      var response = await ioClient.post(
        Uri.parse('https://${ngrok_link}/api/handle_return_request/'),
        body: {
          'reg_no': sregno.toString(),
          'booking_id': bid.toString(),
          'booking_type': btype.toString(),
          'approve_return': atype.toString()
        },
      );

      var data = jsonDecode(response.body);
      if (data['message'] == '${btype} return approved successfully') {
      } else {
        print('Unexpected response: $data');
      }
    } catch (e) {
      print('Error during API call: $e');
    }
  }
}

class Superuserlistpage extends StatefulWidget {
  Superuserlistpage({super.key});

  @override
  State<Superuserlistpage> createState() => _SuperuserlistpageState();
}

class _SuperuserlistpageState extends State<Superuserlistpage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 300,
            child: entries[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}

class Superlist extends StatefulWidget {
  var reg;
  var ball;
  var bat;
  var tt;
  var boards;
  var raquets;
  var index;
  var dtype;
  var ids;

  Superlist(
      {super.key,
      this.reg,
      this.ball,
      this.bat,
      this.tt,
      this.boards,
      this.raquets,
      this.index,
      this.dtype,
      this.ids});

  @override
  State<Superlist> createState() => _SuperlistState();
}

class _SuperlistState extends State<Superlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          height: 370,
          width: 500,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: Colors.grey.shade800)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                          height: 80,
                          width: 80,
                          child: Lottie.network(
                              'https://lottie.host/de9c4693-fe9d-48df-9174-cb716a457dd8/ZkRBgiAt2C.json')),
                      SizedBox(
                        width: 7,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Players",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w900),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            '${widget.reg}',
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 70,
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<Needed>().done(r, widget.dtype, 'true',
                              widget.ids, widget.index);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: const Text(
                          'Done',
                          style: TextStyle(color: Colors.red, fontSize: 18),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                      height: 80,
                      width: 80,
                      child: Lottie.network(
                          'https://lottie.host/9793c778-95d2-4e1e-871e-2cb7fa5c09d5/b4wk6aYyMY.json')),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Equipment",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        '${widget.ball} balls ${widget.bat ?? "0"} bats ${widget.boards ?? "0"} boards ${widget.raquets ?? "0"} raquets',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                      height: 80,
                      width: 80,
                      child: Lottie.network(
                          'https://lottie.host/8d57bec2-6a59-44b3-9e29-26aa94c0fd37/pDFwMZlTH3.json')),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        '${widget.tt}',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
