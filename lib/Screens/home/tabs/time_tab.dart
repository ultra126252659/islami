import 'package:flutter/material.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme
        .of(context)
        .brightness == Brightness.light ? Colors.white : Colors.black;
    final secondaryColor = Theme
        .of(context)
        .brightness == Brightness.light ? Colors.black : Colors.white;

    const goldColor = Color(0xFFD5B37B);

    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Stack(
          children: [

            Container(
              decoration:  BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/Background.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 50,),

            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 140),


                        _buildPrayerTimesCard(),

                        const SizedBox(height: 60),


                        Text(
                          'Azkar',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: secondaryColor,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(child: _buildAzkarCard(
                                'Evening Azkar', "assets/images/Evening Azkar.png")),
                            const SizedBox(width: 15),
                            Expanded(child: _buildAzkarCard(
                                'Morning Azkar', "assets/images/Morning Azkar.png")),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildPrayerTimesCard() {
    const goldColor = Color(0xFFD5B37B);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: goldColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('16 Jul,\n2024', style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              Column(
                children: const [
                  Text('Pray Time', style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600)),
                  Text('Tuesday', style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
              const Text('09 Muh,\n1446', style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
            ],
          ),
          const SizedBox(height: 25),

          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildTimeItem('Dhuhr', '01:01', 'PM', false),
                _buildTimeItem('ASR', '04:38', 'PM', true),
                _buildTimeItem('Maghrib', '07:57', 'PM', false),
                _buildTimeItem('Isha', '09:15', 'PM', false),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Expanded(
                child: Center(
                  child: Text(
                    'Next Pray - 02:32',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Icon(Icons.volume_off, color: Colors.black87),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimeItem(String name, String time, String amPm, bool isActive) {
    return Container(
      width: isActive ? 75 : 65,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        gradient: isActive
            ? const LinearGradient(
            colors: [Color(0xFF5C5245), Color(0xFF847562)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter)
            : const LinearGradient(
            colors: [Color(0xFF4A4135), Color(0xFF6C5D4B)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(name, style: const TextStyle(color: Colors.white, fontSize: 12)),
          const SizedBox(height: 5),
          Text(time, style: TextStyle(color: Colors.white,
              fontSize: isActive ? 22 : 18,
              fontWeight: FontWeight.bold)),
          Text(amPm,
              style: const TextStyle(color: Colors.white70, fontSize: 10)),
        ],
      ),
    );
  }

  Widget _buildAzkarCard(String title, String imagePath) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFD5B37B), width: 1.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(
                imagePath,

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Text(
              title,
              style: const TextStyle(color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }


}
