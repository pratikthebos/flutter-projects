import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../widgets/timetable_day_chip.dart';
import '../../widgets/timetable_card.dart';

class TimetableScreen extends StatefulWidget {
  const TimetableScreen({super.key});

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {

  final List<String> days=[
    "Mon","Tue","Wed","Thu","Fri","Sat"
  ];

  int selected=0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text(
          "Class Timetable",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: Column(

        children: [

          const SizedBox(height:10),

          SizedBox(
            height:55,

            child: ListView.builder(

              scrollDirection: Axis.horizontal,

              padding: const EdgeInsets.symmetric(horizontal:20),

              itemCount: days.length,

              itemBuilder:(context,index){

                return Padding(

                  padding: const EdgeInsets.only(right:12),

                  child: TimetableDayChip(

                    day: days[index],

                    selected: selected==index,

                    onTap:(){

                      setState(() {

                        selected=index;

                      });

                    },

                  ),

                );

              },

            ),
          ),

          const SizedBox(height:20),

          Expanded(

            child: ListView(

              padding: const EdgeInsets.all(20),

              children: const [

                TimetableCard(

                  color: Color(0xff4F46E5),

                  subject:"Flutter Development",

                  teacher:"Prof. Sharma",

                  room:"Room 205",

                  start:"09:00",

                  end:"10:30",

                  live:true,

                ),

                SizedBox(height:20),

                TimetableCard(

                  color: Color(0xff06B6D4),

                  subject:"Database Management",

                  teacher:"Prof. Joshi",

                  room:"Room 302",

                  start:"11:00",

                  end:"12:30",

                ),

                SizedBox(height:20),

                TimetableCard(

                  color: Color(0xff8B5CF6),

                  subject:"Artificial Intelligence",

                  teacher:"Prof. Patil",

                  room:"AI Lab",

                  start:"02:00",

                  end:"03:30",

                ),

                SizedBox(height:20),

                TimetableCard(

                  color: Color(0xffF59E0B),

                  subject:"Operating System",

                  teacher:"Prof. Kulkarni",

                  room:"Room 410",

                  start:"04:00",

                  end:"05:00",

                ),

              ],

            ),

          )

        ],

      ),

    );

  }

}