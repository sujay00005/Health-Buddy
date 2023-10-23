import 'package:flutter/material.dart';
import 'package:health_buddy/controller/booking-controller.dart';
import 'package:health_buddy/utility/booking-card.dart';

import '../model/booking-model.dart';

class Bookings extends StatefulWidget {
  const Bookings({super.key});

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  List<BookingModel> bookings = [];

  @override
  Widget build(BuildContext context) {
    bookings = [];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            toolbarHeight: 120,
            actions: [
              Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: CircleAvatar(
                    radius: 20,
                    child:
                        IconButton(icon: Icon(Icons.search), onPressed: () {}),
                  ))
            ],
            title: const Text(
              'My Bookings',
              maxLines: 2,
              softWrap: true,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 20,
              ),
            ),
            leading: const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: CircleAvatar(
                radius: 15,
                child: BackButton(),
              ),
            )),
        body: FutureBuilder(
            future: BookingController().getBookings(),
            builder: (BuildContext context,
                AsyncSnapshot<List<BookingModel>> snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  !snapshot.hasData) {
                return const Center(
                  child: SizedBox(
                    child: Text('Error while fetching data'),
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                bookings = snapshot.data!;

                return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ListView.builder(
                      itemCount: bookings.length,
                      itemBuilder: (context, index) {
                        return BookingCard(book: bookings[index]);
                      },
                    ));
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
