import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/movie_rating.dart';
import '../../models/movie_model.dart';
import '../../viewmodels/booking_viewmodel.dart';
import '../../widgets/seat_grid.dart';

class BookingScreen extends StatelessWidget {

  final MovieModel movie;

  const BookingScreen({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {

    final vm = Provider.of<BookingViewModel>(context);

    return Scaffold(

      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [

          Hero(
            tag: movie.title,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                movie.poster,
                height: 260,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 20),

          Text(
            movie.title,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Row(
            children: [

              MovieRating(
                rating: movie.rating,
              ),

              const SizedBox(width: 10),

              Text(
                movie.duration,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),

              const SizedBox(width: 10),

              Text(
                movie.language,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          const Text(
            "Select Seats",
            style: TextStyle(
              fontSize: 22,
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          const SeatGrid(),

          const SizedBox(height: 25),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              _legend(
                Colors.white,
                "Available",
              ),

              _legend(
                Colors.red,
                "Selected",
              ),

              _legend(
                Colors.grey,
                "Booked",
              ),
            ],
          ),

          const SizedBox(height: 30),

          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xffF5F5F5),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Row(
              children: [

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [

                      const Text(
                        "Total",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),

                      Text(
                        "₹${vm.totalPrice}",
                        style: const TextStyle(
                          fontSize: 28,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () {

                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(20),
                          ),
                          title: const Text(
                              "Booking Successful"),
                          content: Text(
                            "Your ${movie.title} ticket has been booked successfully.",
                          ),
                          actions: [

                            FilledButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: const Text("Done"),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        "Book Ticket",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _legend(Color color, String text) {

    return Row(
      children: [

        Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: Colors.black12,
            ),
          ),
        ),

        const SizedBox(width: 6),

        Text(text),
      ],
    );
  }
}