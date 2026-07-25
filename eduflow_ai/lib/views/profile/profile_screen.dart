import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../widgets/profile_stat_card.dart';

class ProfileScreen extends StatelessWidget {

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text(
          "Student Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            const CircleAvatar(

              radius: 55,

              backgroundColor: Color(0xff4F46E5),

              child: Icon(
                Icons.person,
                size:60,
                color: Colors.white,
              ),

            ),

            const SizedBox(height:15),

            const Text(

              "Tarkesh Gurav",

              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize:26,
              ),

            ),

            const SizedBox(height:5),

            Text(

              "B.Tech Information Technology",

              style: TextStyle(
                color: Colors.grey.shade700,
              ),

            ),

            const SizedBox(height:30),

            GridView.count(

              shrinkWrap:true,

              physics:
              const NeverScrollableScrollPhysics(),

              crossAxisCount:2,

              crossAxisSpacing:18,

              mainAxisSpacing:18,

              childAspectRatio:1.3,

              children: const [

                ProfileStatCard(

                  title:"Attendance",

                  value:"92%",

                  icon:Icons.check_circle,

                  color:Color(0xff22C55E),

                ),

                ProfileStatCard(

                  title:"Semester",

                  value:"8",

                  icon:Icons.school,

                  color:Color(0xff4F46E5),

                ),

                ProfileStatCard(

                  title:"CGPA",

                  value:"9.1",

                  icon:Icons.star,

                  color:Color(0xffF59E0B),

                ),

                ProfileStatCard(

                  title:"Rank",

                  value:"#3",

                  icon:Icons.emoji_events,

                  color:Color(0xff8B5CF6),

                ),

              ],

            ),

            const SizedBox(height:30),

            Container(

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(

                color: Colors.white,

                borderRadius: BorderRadius.circular(25),

              ),

              child: Column(

                children: [

                  ListTile(

                    leading: const Icon(Icons.workspace_premium),

                    title: const Text("Achievements"),

                    subtitle: const Text("15 Certificates Earned"),

                    trailing: const Icon(Icons.arrow_forward_ios),

                  ),

                  Divider(),

                  ListTile(

                    leading: const Icon(Icons.menu_book),

                    title: const Text("Subjects"),

                    subtitle: const Text("8 Active Subjects"),

                    trailing: const Icon(Icons.arrow_forward_ios),

                  ),

                  Divider(),

                  ListTile(

                    leading: const Icon(Icons.assignment),

                    title: const Text("Assignments"),

                    subtitle: const Text("18 Completed"),

                    trailing: const Icon(Icons.arrow_forward_ios),

                  ),

                ],

              ),

            ),

          ],

        ),

      ),

    );

  }

}