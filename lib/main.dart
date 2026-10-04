import 'package:flutter/material.dart';
import 'package:projet1/Place.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:projet1/rating.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'AIGuide.dart';
import 'ARPage.dart';
import 'Place.dart';

void main() {
  runApp(const SanaNajdApp());
}

class SanaNajdApp extends StatelessWidget {
  const SanaNajdApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'سنا نجد',
      theme: ThemeData(primarySwatch: Colors.brown, fontFamily: 'Tajawal'),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  Locale _locale = const Locale('ar');

  // قائمة الأماكن مع البيانات والروابط الحقيقية
  final List<Map<String, dynamic>> places = [
    {
      "name": "جبل غسلة",
      "rate": "4.9",
      "img": "assets/mountain.png", // تأكد من وجود هذه الصورة في مجلد assets
      "url": "https://maps.app.goo.gl/GWqT8MCE8bqVc4mcA",
      "comments": "منظر خلاب وقت الغروب، مكان هادئ جداً.",
    },
    {
      "name": "سوق حليوه التراثي",
      "rate": "4.8",
      "img": "assets/mall.png",
      "url": "https://maps.app.goo.gl/YxiNQjZt59dPkaG56",
      "comments": "سوق يجمع بين عبق الماضي وجمال التراث.",
    },
    {
      "name": " قصر السبيعي",
      "rate": "4.7",
      "img": "assets/castle.png",
      "url": "https://maps.app.goo.gl/jcgb92N9hbGq4wyS7",
      "comments": "معلم تاريخي مميز في مدينة شقراء.",
    },
    {
      "name": "مطعم البيك",
      "rate": "4.5",
      "img": "assets/albik.png",
      "url": "https://maps.app.goo.gl/F8cFUP8unzqzaRo79",
      "comments": "خدمة سريعة وطعم لا يعلى عليه.",
    },
    {
      "name": "صَفَر",
      "rate": "4.6",
      "img": "assets/safar.png",
      "url": "https://maps.app.goo.gl/JKfcsBthYbpr1hXW8",
      "comments": "إطلالة بانورامية رائعة على المدينة.",
    },
  ];

  // دالة لفتح الخريطة
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) throw 'Could not launch $uri';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar:AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: TextButton(
        onPressed: () {
          setState(() {
            if (_locale.languageCode =='ar') {_locale = const Locale ('en');
            } else {_locale = const Locale('ar');
            }
            });
          },
          child: Text(
            _locale.languageCode == 'ar' ? "EN" : "عربي",
            style: const TextStyle(color: Colors.blue, fontWeight:FontWeight.bold),
      ),
      ),
      ),

      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // مستطيل سنا نجد والكلام الترحيبي
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 128, 70, 16),
                      Color.fromARGB(255, 151, 97, 26),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    const Text(
                      "سنا نجد",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "مرحباً بك في قلب شقراء، رحلتك تبدأ من هنا",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
              const Text(
                "اكتشف الوجهات",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              // قائمة الأماكن التفاعلية
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: places.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // إظهار تنبيه يحتوي على التعليقات وزر للذهاب للموقع
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25),
                          ),
                        ),
                        builder: (context) => Padding(
                          padding: const EdgeInsets.all(25),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                places[index]['name'],
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                "تعليقات الزوار: \n ${places[index]['comments']}",
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.white,
                                ),
                                onPressed: () =>
                                    _launchUrl(places[index]['url']),
                                icon: const Icon(Icons.map),
                                label: const Text("فتح في خرائط جوجل"),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(color: Colors.black, blurRadius: 10),
                        ],
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              places[index]['img'],
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  places[index]['name'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "${places[index]['rate']} ★",
                                  style: const TextStyle(
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),

      // شريط التنقل السفلي (Bottom Navigation Bar)
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF8B4513),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });

          if (index == 0) {
            // لا حاجة للتنقل لأننا بالفعل في صفحة الأماكن
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ARPage()),
            );
            // الانتقال إلى صفحة الواقع المعزز (يمكنك استبدالها بصفحتك الخاصة)
          } else if (index == 2) {
            // الانتقال إلى صفحة المرشد الذكي (يمكنك استبدالها بصفحتك الخاصة)
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AIGuidePage()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RatingsPage()),
            );
          
          } else if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PlacesPage()),
            ); // لا حاجة للتنقل لأننا بالفعل في صفحة الأماكن
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "الرئيسيه"),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_in_ar),
            label: " الواقع المعزز",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support_agent),
            label: "المرشد الذكي",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "التقييمات"),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "الاماكن"),
        ],
      ),
    );
  }
}
