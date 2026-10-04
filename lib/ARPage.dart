import 'package:flutter/material.dart';
// ملاحظة: ستحتاج لإضافة حزمة camera و flutter_tts في ملف pubspec.yaml للتشغيل الفعلي
// import 'package:camera/camera.dart'; 
import 'package:flutter_tts/flutter_tts.dart';
class ARPage extends StatefulWidget {
  const ARPage({Key? key}) : super(key: key);

  @override
  ARPageState createState() => ARPageState();
}

class ARPageState extends State<ARPage> {
  String selectedLanguage = "العربية";
  FlutterTts flutterTts = FlutterTts();
  // دالة افتراضية لمحاكاة تغيير لغة التحدث
  void _changeLanguage() {
    setState(() {
      selectedLanguage = (selectedLanguage == "العربية") ? "English" : "العربية";
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("تم تغيير لغة التحدث إلى: $selectedLanguage")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // خلفية سوداء لتناسب وضع الكاميرا
      appBar: AppBar(
        title: Text('تقنية الواقع المعزز'),
        backgroundColor: Colors.brown[700],
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // 1. خلفية الكاميرا (هنا نضع حاوية تمثل الكاميرا)
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.grey[900],
            child: Icon(Icons.camera_alt, color: Colors.white54, size: 100), // مكان عرض الكاميرا
          ),

          // 2. العناصر العلوية (المربع الصغير وتغيير اللغة)
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Column(
              children: [
                // مربع صغير مكتوب فيه الواقع المعزز
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.brown[600]!.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'الواقع المعزز',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                // زر تغيير لغة الواقع المعزز
                GestureDetector(
                  onTap: _changeLanguage,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.translate, color: Colors.white),
                  ),
                ),
                Text("لغة التحدث: $selectedLanguage", style: TextStyle(color: Colors.white70, fontSize: 12)),
              ],
            ),
          ),

          // 3. منطقة المعلومات التفاعلية (تظهر عند توجيه الكاميرا)
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Icon(Icons.record_voice_over, color: Colors.brown),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "يتم الآن شرح تاريخ: سوق المجلس التاريخي",
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.brown[900]),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "بني هذا السوق قبل مئات السنين ويُعد القلب التجاري لشقراء القديمة...",
                    style: TextStyle(fontSize: 14),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(Icons.volume_up, color: Colors.brown),
                      onPressed: () {
                        // هنا يتم تشغيل الصوت (Text-to-Speech)
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}