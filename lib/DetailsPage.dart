import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final Map<String, dynamic> place;
  const DetailsPage({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(place['name']), backgroundColor: Colors.brown),
      body: Center(child: Text('تفاصيل المكان هنا')),
    );
  }
}
// 1. قاعدة البيانات الشاملة
final Map<String, List<Map<String, dynamic>>> allPlacesData = {
  "الأماكن العامة": [
    {"name": "سوق المجلس", "rating": 4.5, "img": "assets/mall.png"},
    {"name": "جبل غسلة", "rating": 4.9, "img": "assets/mountain.png"},
    {"name": "منتزه البحيرة", "rating": 4.7, "img": "assets/gate.png"},
  ],
  "الشاليهات والاستراحات": [
    {"name": "منتجع لافيدا", "rating": 4.8, "img": "assets/lafida.png"},
    {"name": "شاليهات رحاب", "rating": 4.3, "img": "assets/reehab.png"},
    {"name": "شاليهات الجوري", "rating": 4.4, "img": "assets/aljoori.png"},
    {"name": "منتجع فاميلي بارك", "rating": 4.6, "img": "assets/family park.png"},
    {"name": "استراحة ودان", "rating": 4.2, "img": "assets/widan.png"},
    {"name": "استراحة الديوانيه", "rating": 4.1, "img": "assets/aldiwaniah.png"},
    {"name": "الصالحيه", "rating": 4.0, "img": "assets/alslhiah.png"},
    {"name": "شاليه هابي لاند", "rating": 4.5, "img": "assets/happy land.png"},
  ],
  "الاماكن التراثية": [
    {"name": "مسجد الحسيني", "rating": 4.9, "img": "assets/mousqe alhosini.png"},
    {"name": "قصر السبيعي", "rating": 4.9, "img": "assets/castle.png"},
    {"name": "سوق حليوه", "rating": 4.8, "img": "assets/mall.png"},
    {"name": "متحف شقراء التراثي", "rating": 4.7, "img": "assets/museam.png"},
    {"name": "برج الحسين", "rating": 4.5, "img": "assets/alhosaeni.png"},
  ],
  "المطاعم": [
    {"name": "منفوشه", "rating": 4.5, "img": "assets/manfoshah.png"},
    {"name": "دوار السعاده", "rating": 4.9, "img": "assets/dawwar.png"},
    {"name": "شاورمر", "rating": 4.6, "img": "assets/shawermer.png"},
    {"name": "البيك", "rating": 4.3, "img": "assets/albik.png"},
    {"name": "هرفي", "rating": 4.7, "img": "assets/herfy.png"},
    {"name": "كودو", "rating": 4.4, "img": "assets/kudu.png"},
    {"name": "حاشيكم", "rating": 4.5, "img": "assets/hasikum.png"},
    {"name": " درة الوشم", "rating": 4.6, "img": "assets/dorrat alwshm.png"},
    {"name": "مطعم الشواية", "rating": 4.5, "img": "assets/shawayat shaqra.png"},
    {"name": " كنتاكي", "rating": 4.6, "img": "assets/kfc.jpeg"},
    {"name": " Krispig Burger", "rating": 4.7, "img": "assets/krispig.jpeg"},
    {"name": " Economy Bukhari", "rating": 4.8, "img": "assets/economy.jpeg"},
    {"name": " Daily & Delicious", "rating": 4.9, "img": "assets/d & d.jpeg"},
    {"name": "Kohinoor Restaurant ", "rating": 4.3, "img": "assets/kohi.jpeg"},
    {"name": " الريف البغدادي", "rating": 4.4, "img": "assets/alreef.jpeg"},
    {"name": " شواية شقراء", "rating": 4.5, "img": "assets/shawayat shaqra.png"},
    {"name": "مكرونيه ", "rating": 4.7, "img": "assets/makroniah.jpeg"},
    {"name": "شاورما سياخ", "rating": 4.8, "img": "assets/shawrma siyakh.jpg"},
    {"name": " ماكدونالدز", "rating": 4.9, "img": "assets/mac.jpeg"},
    {"name": "الريف ", "rating": 4.2, "img": "assets/alreef.jpeg"},
    {"name": "Line ", "rating": 4.3, "img": "assets/line.jpg"},
    {"name": "خلوف", "rating": 4.5, "img": "assets/khloof.jpg"},
    {"name": "مقلوبة الحاره", "rating": 4.5, "img": "assets/maqlobat.jpg"},
    {"name": "شاورما محروسه", "rating": 4.5, "img": "assets/mahrosah.jpg"},
    {"name": " الحمصاني", "rating": 4.5, "img": "assets/alhamasani.jpg"},
    {"name": "اليم", "rating": 4.5, "img": "assets/aleem.jpg"},
    {"name": "بوفتريا", "rating": 4.5, "img": "assets/boof.jpg"},
    {"name": "ريدي برجر", "rating": 4.5, "img": "assets/ready burger.jpg"},
    {"name": "البحر الابيض التركي", "rating": 4.5, "img": "assets/white sea.jpg"},
    {"name": "ون ارتست", "rating": 4.5, "img": "assets/one artist.png"},

    // ... أضيفي باقي الـ 32 هنا بنفس النمط
  ],
"كافيهات وشاهي": [
    {"name": "آيرس", "rating": 4.5, "img": "assets/iris.jpg"},
    {"name": "BC", "rating": 4.7, "img": "assets/BC.jpg"},
    {"name": "Bew Cafe & Lounge", "rating": 4.6, "img": "assets/Bew.jpg"},
    {"name": "Tiqer Cafe", "rating": 4.8, "img": "assets/tiqer.jpg"},
    {"name": "25oct", "rating": 4.9, "img": "assets/25oct.jpg"},
    {"name": "صفر", "rating": 4.4, "img": "assets/safar.png"},
    {"name": "وسم ", "rating": 4.3, "img": "assets/wassm.jpg"},
    {"name": " بن", "rating": 4.2, "img": "assets/bon.jpg"},
    {"name": "سلاله", "rating": 4.1, "img": "assets/solalh.png"},
    {"name": " K7", "rating": 4.0, "img": "assets/k7.jpg"},
    {"name": " تشيتزا كافيه", "rating": 4.5, "img": "assets/tchitza.png"},
    {"name": "عنوان القهوه", "rating": 4.6, "img": "assets/coffee address.jpg"},
    {"name": " دانكن", "rating": 4.7, "img": "assets/dunkin.jpg"},
    {"name": " Togo", "rating": 4.8, "img": "assets/togo.jpg"},
    {"name": " ماتيا", "rating": 4.9, "img": "assets/matia.jpg"},
    {"name": " نوره هانم", "rating": 4.3, "img": "assets/norah hanim.jpg"},
    {"name": " بارنز", "rating": 4.4, "img": "assets/barnz.jpg"},
    {"name": " كيان", "rating": 4.5, "img": "assets/kayan.jpg"},
    {"name": " نوامي", "rating": 4.6, "img": "assets/naoamie.jpg"},
    {"name": "توليفه ", "rating": 4.8, "img": "assets/taolefah.png"},
    {"name": "خادر ", "rating": 4.9, "img": "assets/khader.jpg"},
    {"name": "جمره", "rating": 4.5, "img": "assets/gamrah.jpg"},

  ],
  "الصالونات": [
    {"name": "كحله", "rating": 4.5, "img": "assets/khlah.png"},
    {"name": " سرمد", "rating": 4.7, "img": "assets/sarmad.jpg"},
    {"name": " الاخوات الاربع", "rating": 4.6, "img": "assets/4 sissters.jpg"},
    {"name": "لمسات نواعم", "rating": 4.9, "img": "assets/lamasat.png"},
    {"name": " برايت", "rating": 4.4, "img": "assets/bright nails.jpg"},
  ],
  "الاسواق": [
    {"name": " البساتين مول", "rating": 4.5, "img": "assets/basaatin.jpg"},
    {"name": " العثيم", "rating": 4.7, "img": "assets/alothaim.jpg"},
    {"name": " نستو", "rating": 4.6, "img": "assets/nisto.jpg"},
    {"name": " النخبه", "rating": 4.8, "img": "assets/prime market.jpg"},
    {"name": "سوق الصفراء", "rating": 4.4, "img": "assets/shaqra.jpg"},
  ],
  "البنوك": [
    {"name": "بنك الراجحي", "rating": 4.5, "img": "assets/al rajhi.jpg"},
    {"name": "بنك الرياض", "rating": 4.7, "img": "assets/al riydh.jpg"},
    {"name": "بنك الأهلي", "rating": 4.6, "img": "assets/al ahli.jpg"},
    {"name": "بنك الإنماء", "rating": 4.4, "img": "assets/al inma.jpg"},
  ],
  "الفنادق": [
    {"name": "Le Park Shaqra ", "rating": 4.5, "img": "assets/le park.jpg"},
    {"name": "Le BOSQUET HOTEL", "rating": 4.7, "img": "assets/le bos.jpg"},
    {"name": "Asfar Hotel Suites", "rating": 4.6, "img": "assets/asfar.jpg"},
    {"name": "Raoum inn", "rating": 4.8, "img": "assets/roum inn.jpg"},
    {"name": " Heritage Guesthouse", "rating": 4.9, "img": "assets/hertige.jpg"},
    {"name": "Amassi Alref Hotel", "rating": 4.4, "img": "assets/amassi alreef.jpg"},
    {"name": "شقراء VIP شقق فخمه", "rating": 4.3, "img": "assets/VIP.jpg"},
  ],
  "المحميات": [
    {"name": "حديقة رقيه", "rating": 4.6, "img": "assets/roqayah.jpg"},
  ],
  "الترفيهيه": [
    {"name": "اسطبل شقراء", "rating": 4.5, "img": "assets/stable shaqra.jpg"},
    {"name": "اسطبل الحمادي", "rating": 4.7, "img": "assets/stable alhamadi.jpg"},
    {"name": "مزرعة الشيخ عبدالرحمن الجلال", "rating": 4.8, "img": "assets/alshikh farm.jpg"},
    {"name": "مزرعة الحمادي", "rating": 4.9, "img": "assets/alhamadi farm.png"},
    {"name": " مربط دان للخيل", "rating": 4.4, "img": "assets/daan hose.jpg"},
  ],
  "المحطات والبقالات": [
    {"name": "آدريس ", "rating": 4.5, "img": "assets/adrees station.jpg"},
    {"name": " بترو زين", "rating": 4.7, "img": "assets/bitro zain station.jpg"},
    {"name": "طيبه", "rating": 4.6, "img": "assets/taibah.jpg"},
    {"name": "العنبري", "rating": 4.8, "img": "assets/al3nbari.jpg"},
    {"name": "العويني", "rating": 4.9, "img": "assets/al3oini.jpg"},
    {"name": "تموينات النهضه", "rating": 4.4, "img": "assets/alnahdah.jpg"},
  ],
  // أضيفي باقي الأقسام (بنوك، صالونات، فنادق...)
};

// 2. صفحة عرض القائمة (مثلاً قائمة المطاعم)
class CategoryDetailsPage extends StatelessWidget {
  final String categoryName;
  const CategoryDetailsPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    // بحث في قاعدة البيانات عن الاسم المرسل
    final places = allPlacesData[categoryName] ?? [];

    return Scaffold(
      appBar: AppBar(title: Text(categoryName), backgroundColor: Colors.brown),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: places.isEmpty 
          ? const Center(child: Text('سيتم إضافة الأماكن قريباً'))
          : ListView.builder(
              itemCount: places.length,
              itemBuilder: (context, index) {
                final place = places[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Image.asset(place['img'], width: 50, height: 50, errorBuilder: (c,e,s) => Icon(Icons.store)),
                    title: Text(place['name']),
                    subtitle: Text('التقييم: ${place['rating']} ⭐'),
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => PlaceDetailPage(place: place))),
                  ),
                );
              },
            ),
      ),
    );
  }
}

// 3. صفحة تفاصيل المكان (الموقع، التعليقات، المشاركة)
class PlaceDetailPage extends StatefulWidget {
  final Map<String, dynamic> place;
  const PlaceDetailPage({super.key, required this.place});

  @override
  State<PlaceDetailPage> createState() => _PlaceDetailPageState();
}

class _PlaceDetailPageState extends State<PlaceDetailPage> {
  bool isFavorite = false;
  List<String> comments = ["مكان ممتاز!", "أنصح بزيارته"];
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.place['name']),
        actions: [
          IconButton(icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color: Colors.red), onPressed: () => setState(() => isFavorite = !isFavorite)),
          IconButton(icon: const Icon(Icons.share), onPressed: () {}),
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(widget.place['img'], width: double.infinity, height: 250, fit: BoxFit.cover, errorBuilder: (c,e,s) => Container(height: 250, color: Colors.grey)),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('الموقع: ${widget.place['location'] ?? "شقراء، السعودية"}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text(widget.place['info'] ?? "مكان مميز في مدينة شقراء يوفر خدمات راقية للزوار."),
                    const Divider(height: 30),
                    const Text('التعليقات:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ...comments.map((c) => ListTile(title: Text(c), leading: const Icon(Icons.person_pin))),
                    TextField(
                      controller: _commentController,
                      decoration: InputDecoration(
                        hintText: 'أضف تعليقك...',
                        suffixIcon: IconButton(icon: const Icon(Icons.send), onPressed: () {
                          if(_commentController.text.isNotEmpty) {
                            setState(() => comments.add(_commentController.text));
                            _commentController.clear();
                          }
                        }),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}