import 'package:flutter/material.dart';
import 'package:projet1/DetailsPage.dart';


class PlacesPage extends StatefulWidget {
  const PlacesPage({Key? key}) : super(key: key);
  @override
  _PlacesPageState createState() => _PlacesPageState();
}

class _PlacesPageState extends State<PlacesPage> {
  // التصنيف المختار حالياً
  String selectedCategory = "الأماكن العامة";

  // قائمة التصنيفات مع عدد الأماكن (كما طلبت)
  final List<Map<String, dynamic>> categories = [
    {"name": "الأماكن العامة", "count": 3, "icon": Icons.park},
    {"name": "الشاليهات والاستراحات", "count": 10, "icon": Icons.pool},
    {"name": "الأماكن التراثية", "count": 6, "icon": Icons.fort},
    {"name": "المطاعم", "count": 30, "icon": Icons.restaurant},
    {"name": "الكافيهات والشاهي", "count": 23, "icon": Icons.coffee},
    {"name": "الصالونات", "count": 7, "icon": Icons.content_cut},
    {"name": "الأسواق", "count": 5, "icon": Icons.shopping_bag},
    {"name": "البنوك", "count": 4, "icon": Icons.money},
    {"name": "الفنادق", "count": 7, "icon": Icons.hotel},
    {"name": "المحميات", "count": 1, "icon": Icons.nature_people},
    {"name": "الترفيهية", "count": 7, "icon": Icons.celebration},
    {"name": "المحطات والبقالات", "count": 6, "icon": Icons.local_gas_station},
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredPlaces = List.generate(
      categories.firstWhere((c) => c['name'] == selectedCategory)['count'],
          (index) => {
        'name': "$selectedCategory - مكان رقم ${index + 1}",
        'image': "assets/images/${selectedCategory.toLowerCase().replaceAll(' ', '_')}_${index + 1}.jpg",
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("أماكن شقراء"),
        backgroundColor: Color(0xFF8B4513), // لون بني تراثي
        centerTitle: true,
      ),
      body: Column(
        children: [
          // 1. قسم التصنيفات (عرضي)
          Container(
            height: 120,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                bool isSelected = selectedCategory == categories[index]['name'];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = categories[index]['name'];
                    });
                  },
                  child: Container(
                    width: 100,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? Color(0xFF8B4513) : Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Color(0xFF8B4513)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          categories[index]['icon'],
                          color: isSelected ? Colors.white : Color(0xFF8B4513),
                        ),
                        SizedBox(height: 5),
                        Text(
                          categories[index]['name'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                        Text(
                          "(${categories[index]['count']})",
                          style: TextStyle(
                            fontSize: 10,
                            color: isSelected ? Colors.white70 : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          Divider(),

          // 2. قائمة الأماكن التابعة للتصنيف المختار
          Expanded(
            child: ListView.builder(
              itemCount: categories.firstWhere((c) => c['name'] == selectedCategory)['count'],
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.brown[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(Icons.image, color: Colors.brown),
                    ),
                    title: Text("$selectedCategory - مكان رقم ${index + 1}"),
                    subtitle: Text("وصف قصير عن هذا المكان في منطقة شقراء"),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage (
                            place: {
                              'name' : filteredPlaces[index]['name']!,
                              'image' : filteredPlaces[index]['image']!,
                              'info' : "هذا المكان يقع في منطقة شقراءالتاريخيه"
                            },
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}