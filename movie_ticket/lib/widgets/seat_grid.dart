import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/widgets/seat_widget.dart';
import '../viewmodels/booking_viewmodel.dart';

class SeatGrid extends StatelessWidget {
  const SeatGrid({super.key});

  @override
  Widget build(BuildContext context) {

    final vm = Provider.of<BookingViewModel>(context);

    return Column(
      children: [

        Container(
          width: 260,
          height: 8,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(30),
          ),
        ),

        const SizedBox(height: 8),

        const Text(
          "SCREEN",
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 30),

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: vm.seats.length,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 8,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {

            final seat = vm.seats[index];

            return SeatWidget(
              booked: seat.booked,
              selected: seat.selected,
              onTap: () {
                vm.selectSeat(index);
              },
            );
          },
        ),
      ],
    );
  }
}