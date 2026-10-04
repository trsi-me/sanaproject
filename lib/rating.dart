import 'package:flutter/material.dart';

class RatingsPage extends StatelessWidget {
  RatingsPage({super.key});

  // قائمة الأماكن في شقراء مع تقييماتها التفصيلية
  final List<Map<String, dynamic>> allPlaces = [
    {"name": " صالون الاخوات الاربعه ", "rating": 4.4, "reviews":65 , "image": "assets/4 sissters.jpg"},
    {"name": "25 اكتوبر", "rating": 4.4, "reviews": 87, "image": "assets/25oct.jpg"},
    {"name": "محطة ادريس ", "rating": 4.5 , "reviews": 15, "image": "assets/adrees station.jpg"},
    {"name": "بنك الاهلي ", "rating":4.8 , "reviews": 80, "image": "assets/al ahli.jpg"},
    {"name": "الدوانيه ", "rating":4.7 , "reviews": 33, "image": "assets/al diwniah.png"},
    {"name": "بنك الانماء", "rating":4.3 , "reviews":65 , "image": "assets/al inma.jpg"},
    {"name": " بنك الراجحي", "rating":3.6 , "reviews":84 , "image": "assets/al rajhi.jpg"},
    {"name": " بنك الرياض", "rating": 3.1, "reviews": 32, "image": "assets/al riydh.jpg"},
    {"name": " اسواق العنبري", "rating":4.2, "reviews": 50, "image": "assets/al3nbari.jpg"},
    {"name": "اسواق العويني ", "rating":4.0, "reviews":64 , "image": "assets/al3oini.jpg"},
    {"name": " مطعم البيك", "rating":3.9, "reviews": 80, "image": "assets/albik.png"},
    {"name": " اليم", "rating":4.0, "reviews":56,"image": "assets/aleem.jpg"},
    {"name": "مزرعة الحمادي ", "rating":4.6, "reviews":76 , "image": "assets/alhamadi farm.png"},
    {"name": " الحمصاني", "rating":3.9, "reviews": 85, "image": "assets/alhamasani.jpg"},
    {"name": " مرقب الحيني", "rating":4.0, "reviews": 70, "image": "assets/alhosaen.png"},
    {"name": "استراحة الجوري ", "rating":3.9, "reviews":65 , "image": "assets/aljoori.png"},
    {"name": " محمية الجرعاء", "rating":4.4, "reviews": 87, "image": "assets/aljr3a.jpg"},
    {"name": " سوق المجلس", "rating":2.0, "reviews": 40, "image": "assets/almajlis.png"},
    {"name": " مطعم المرشد", "rating":4.0, "reviews": 350, "image": "assets/almrshad.jpeg"},
    {"name": " اسواق النهضه", "rating":4.0, "reviews": 86, "image": "assets/alnahdah.jpg"},
    {"name": " العثيم", "rating":4.1, "reviews": 1157, "image": "assets/alothaim.jpg"},
    {"name": "  مطعم الريف البغدادي", "rating":4.1, "reviews": 1076, "image": "assets/alreef.jpeg"},
    {"name": " مزرعة الشيخ", "rating":5, "reviews":1 , "image": "assets/alshikh farm.jpg"},
    {"name": " مزرعة الصالحيه", "rating":2.0, "reviews": 1, "image": "assets/alslhiah.png"},
    {"name": " شقق اماسي الريف", "rating":4.2, "reviews": 360, "image": "assets/amassi alreef.jpg"},
    {"name": " شقق اسفار", "rating":4.2, "reviews": 521, "image": "assets/asfar.jpg"},
    {"name": " مقهى بارنز", "rating":3.2, "reviews": 45, "image": "assets/barnz.jpg"},
    {"name": " البساتين مول", "rating":4.1, "reviews": 875, "image": "assets/basaatin.jpg"},
    {"name": " BC", "rating":4.2, "reviews": 1182, "image": "assets/BC.jpg"},
    {"name": " Bew", "rating":4.3, "reviews": 725, "image": "assets/Bew.jpg"},
    {"name": " محطة بتروزين", "rating":3.8, "reviews": 136, "image": "assets/bitro zain station.jpg"},
    {"name": " بن", "rating":4.2, "reviews": 852, "image": "assets/bon.jpg"},
    {"name": "مطعم بوفتريا", "rating":4.4, "reviews": 197, "image": "assets/boof.jpg"},
    {"name": " صالون Bright nails", "rating":4.4, "reviews":130 , "image": "assets/bright nails.jpg"},
    {"name": " قصر السبيعي", "rating":4.5, "reviews":339 , "image": "assets/castle.png"},
    {"name": " عنوان القهوه", "rating":4.4, "reviews": 294, "image": "assets/coffee address.jpg"},
    {"name": " D & D", "rating":4.2, "reviews": 717, "image": "assets/d & d.jpeg"},
    {"name": " مزرعة دان", "rating":4.9, "reviews": 35, "image": "assets/daan hose.jpg"},
    {"name": " دوار السعاده", "rating":4.1, "reviews":206 , "image": "assets/dawwar.png"},
    {"name": " درة الوشم", "rating":4.3, "reviews": 147, "image": "assets/dorrat alwshm.png"},
    {"name": " دانكن","rating":4.4, "reviews": 367, "image": "assets/dunkin.jpg"},
    {"name": " مطعم الاقتصاد الاول","rating":4.0, "reviews": 739, "image": "assets/economy.jpeg"},
    {"name": " منتجع فاميلي بارك", "rating":4.8, "reviews": 42, "image": "assets/family park.png"},
    {"name": " مقهى جمره", "rating":5.0, "reviews": 21, "image": "assets/gamrah.jpg"},
    {"name": " منتجع لافندر ", "rating":4.9, "reviews":107 , "image": "assets/happy land.png"},
    {"name": " مطعم حاشيكم", "rating":4.5, "reviews":377 , "image": "assets/hasikum.png"},
    {"name": " مطعم هرفي", "rating":3.7, "reviews": 608, "image": "assets/herfy.png"},
    {"name": " نزل تراثي", "rating":4.9, "reviews": 295, "image": "assets/hertige.jpg"},
    {"name": " آيرس", "rating":4.1, "reviews": 17, "image": "assets/iris.jpg"},
    {"name":"مقهى K7","rating":4.0, "reviews": 246, "image": "assets/k7.jpg"},
    {"name":"مقهى كيان","rating":3.0, "reviews": 5, "image": "assets/kayan.jpg"},
    {"name":"كنتاكي", "rating":4.0, "reviews": 1036, "image": "assets/kfc.jpeg"},
    {"name": " مقهى خادر", "rating":4.6, "reviews": 98, "image": "assets/khadir.jpg"},
    {"name": " صالون كحله", "rating":4.4, "reviews":179 , "image": "assets/khlah.jpg"},
    {"name": " مطعم خلوف", "rating":4.4, "reviews":396 , "image": "assets/khloof.jpg"},
    {"name": "  مطعم كوهينور", "rating":4.2, "reviews":1150 , "image": "assets/kohi.jpeg"},
    {"name": " كرسبق برجر", "rating":4.3, "reviews":354 , "image": "assets/krispig.jpeg"},
    {"name": " كودو", "rating":3.8, "reviews": 870, "image": "assets/kudu.png"},
    {"name": " منتجع لافيدا", "rating":4.6, "reviews": 74, "image": "assets/lafida.png"},
    {"name": " صالون لمسات نواعم", "rating":3.9,"reviews": 290,"image": "assets/lamasat.jpg"},
    {"name":"فندق لابوسكيه","rating":4.0, "reviews": 181, "image": "assets/le bos.jpg"},
    {"name": "فندق لي بارك", "rating":4.2, "reviews": 150, "image": "assets/le park.jpg"},
    {"name": " مطعم لاين", "rating":3.8, "reviews": 117, "image": "assets/line.jpg"},
    {"name": " ماكدونالدز", "rating":3.9, "reviews":1468 , "image": "assets/mac.jpeg"},
    {"name": " مطعم محروسه", "rating":4.3, "reviews": 120, "image": "assets/mahrosah.jpg"},
    {"name": " مطعم مكرونيه", "rating":4.4, "reviews": 135, "image": "assets/makroniah.jpeg"},
    {"name": " سوق حليوه", "rating":4.5, "reviews": 1166, "image": "assets/mall.png"},
    {"name": " مطعم منفوشه", "rating":4.6, "reviews": 737, "image": "assets/manfoshah.png"},
    {"name": " مطعم مقلوبة الحاره", "rating":4.2, "reviews": 790, "image": "assets/maqlobat.jpg"},
    {"name": " مقهى ماتيا", "rating":4.6,"reviews": 102,"image": "assets/matia.jpg"},
    {"name": " مزرعة المهنا", "rating":5.0,"reviews": 3,"image": "assets/mohnad.jpg"},
    {"name": " منتزه البحيره ", "rating":4.3, "reviews": 150, "image": "assets/montazah lake.png"},
    {"name": " جبل غسله", "rating":4.4, "reviews": 235, "image": "assets/mountain.png"},
    {"name": " مسجد الحسيني", "rating":4.9, "reviews": 45, "image": "assets/mousqe alhosini.png"},
    {"name": " متحف شقراء", "rating":4.6, "reviews": 205, "image": "assets/museam.png"},
    {"name": " نوامي", "rating":4.3, "reviews":88 , "image": "assets/naoamie.jpg"},
    {"name": " نستو", "rating":4.2, "reviews":1816 , "image": "assets/ nisto.jpg"},
    {"name": " مقهى نوره هانم", "rating":4.3, "reviews": 22, "image": "assets/norah hanim.jpg"},
    {"name": " مطعم ون ارتست", "rating":3.9, "reviews": 415, "image": "assets/one artist.jpg"},
    {"name": " اسواق النخبه", "rating":4.0, "reviews": 91, "image": "assets/prime market.jpg"},
    {"name": " ريدي برجر", "rating":4.2,"reviews": 180,"image": "assets/ready burger.jpg"},
    {"name": " مقهى صفر", "rating":4.6, "reviews": 333, "image": "assets/ safar.png"},
    {"name": " صالون سرمد", "rating":4.5, "reviews":188 , "image": "assets/sarmad.jpg"},
    {"name": " شاورما سياخ", "rating":4.5, "reviews": 225, "image": "assets/ seeakh.jpg"},
    {"name": " سوق شقراء المركزي ", "rating":4.2, "reviews":100 , "image": "assets/shaqra.jpg"},
    {"name": " مطعم شواية شقراء", "rating":4.1, "reviews": 436, "image": "assets/ shawayat shaqra.png"},
    {"name": " شاورمر ", "rating":4.3, "reviews":100 , "image": "assets/shawarmer.png"},
    {"name": "مقهى سلاله", "rating":4.5, "reviews": 436, "image": "assets/ solalh.jpg"},
    {"name": " اسطبل الحمادي", "rating":4.2, "reviews":100 , "image": "assets/stable alhamadi.jpg"},
    {"name": "اسطبل شقراء ", "rating":4.4, "reviews": 436, "image": "assets/stable shaqra.jpg"},
    {"name": " اسواق طيبه", "rating":4.1, "reviews": 436, "image": "assets/taibah.jpg"},
    {"name": " مقهى توليفه", "rating":4.6, "reviews": 250, "image": "assets/ taolefah.jpg"},
    {"name": " مقهى تشيتزا", "rating":4.1, "reviews": 234, "image": "assets/ tchitza.jpg"},
    {"name": " مقهى تايقر", "rating":4.1, "reviews": 15, "image": "assets/tiqer.jpg"},
    {"name": " مقهى توقو", "rating":4.1, "reviews": 109, "image": "assets/togo.jpg"},
    {"name": " فندق الذيابي", "rating":3.3, "reviews": 330, "image": "assets/VIP.jpg"},
    {"name": " مقهى وسم", "rating":4.4,"reviews": 125,"image": "assets/wassm.jpg"},
    {"name": " مطعم البحر الابيض", "rating":4.0, "reviews": 319, "image": "assets/white sea.jpg"},
    {"name": "استراحة ودان","rating": 3.8,"reviews": 319,"image": "assets/widan.png"},


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text("تقييمات أماكن شقراء", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: const Color(0xFF8B4444),
        foregroundColor: Colors.white,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.builder(
          padding: const EdgeInsets.all(15),
          itemCount: allPlaces.length,
          itemBuilder: (context, index) {
            final place = allPlaces[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 15),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              elevation: 2,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  // هنا نضع كود الانتقال لصفحة تفاصيل التقييمات لاحقاً
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("عرض تقييمات ${place['name']}")),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      // صورة المكان
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          place['image'],
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 15),
                      // تفاصيل التقييم
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              place['name'],
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                // نجوم التقييم
                                ...List.generate(5, (starIndex) {
                                  return Icon(
                                    starIndex < place['rating'].floor() 
                                        ? Icons.star 
                                        : Icons.star_border,
                                    color: Colors.amber,
                                    size: 20,
                                  );
                                }),
                                const SizedBox(width: 8),
                                Text(
                                  "${place['rating']}",
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "بناءً على ${place['reviews']} تقييم",
                              style: const TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      // أيقونة إضافة تقييم
                      Column(
                        children: [
                          const Icon(Icons.add_comment_outlined, color: Color(0xFF8B4444)),
                          const Text("قيّم الآن", style: TextStyle(fontSize: 10, color: Color(0xFF8B4444))),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}