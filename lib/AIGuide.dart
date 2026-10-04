import 'package:flutter/material.dart';

class AIGuidePage extends StatefulWidget {
@override
AIGuidePageState createState() => AIGuidePageState();
}

class AIGuidePageState extends State<AIGuidePage> {
final TextEditingController _controller = TextEditingController();
final List<Map<String, String>> _messages = []; // لتخزين سجل المحادثة

// قاعدة بيانات مصغرة للمعلومات التاريخية (الرد التلقائي)
final Map<String, Map<String, String>> _shaqraData = {
"قصر السبيعي": {
"info": "هو بيت تاريخي بني عام 1358هـ، وكان مقراً لبيت المال ومسكناً لوكيل الملك عبدالعزيز.",
"events": "استضاف الملك عبدالعزيز في عدة زيارات لشقراء."
},
"سوق المجلس": {
"info": "يعد من أقدم الأسواق التجارية في منطقة الوشم ويتميز بطرازه المعماري الفريد.",
"events": "كان مركزاً تجارياً رئيسياً للقوافل القادمة من شمال وجنوب الجزيرة العربية."
},
"مرقب الحسيني": {
"info": "حي تاريخي قديم يضم بيوت طينية ومساجد أثرية.",
"events": "شهد الحي إعادة ترميم كاملة ليصبح واجهة سياحية تراثية."
},
"سوق حليوه": {
"info": "سوق تراثي يضم مجموعه من المتاجر والمقاهي",
"events": "يعتبر من اهم الاسواق في منطقة الوشم"
},
"متحف شقراء التراثي ":{
"info": "مرقب تاريخي يطل على مدينة شقراء ويستخدم كموقع مراقبه",
"events": "مكان يستخدم في الماضي لمراقبة الطرق التجاريه وحماية المدينه "
},
"مطار شقراء ": {
"info": "مطار قديم تم بناءه لنقل الملك عبدالعزيز من شقراء للرياض",
"events": "مطار تم بناءه في عام 1374ه"
}
};

void _handleSend() {
if (_controller.text.isEmpty) return;

String userQuery = _controller.text;
setState(() {
_messages.insert(0, {"sender": "user", "text": userQuery});
});

_controller.clear();

// محرك الرد التلقائي
String botResponse = "عذراً، لا أملك معلومات كافية عن هذا المكان حالياً. هل تقصد (بيت السبيعي) أو (سوق المجلس)؟";

_shaqraData.forEach((key, value) {
if (userQuery.contains(key)) {
botResponse = "عن ${key}:\n${value['info']}\n\nأحداث تاريخية:\n${value['events']}";
}
});

// تأخير بسيط لمحاكاة التفكير
Future.delayed(Duration(milliseconds: 500), () {
setState(() {
_messages.insert(0, {"sender": "bot", "text": botResponse});
});
});
}

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.grey[100],
appBar: AppBar(
title: Text('المرشد الذكي'),
centerTitle: true,
backgroundColor: const Color.fromARGB(255, 94, 51, 36),
),
body: Column(
children: [
// 2. أيقونة تغيير اللغة
TextButton.icon(
onPressed: () {
// وظيفة تغيير اللغة مستقبلاً
},
icon: Icon(Icons.language, color: Colors.brown),
label: Text('تغيير لغة المرشد', style: TextStyle(color: Colors.brown)),
),

Divider(),

// 3. منطقة الدردشة (الرد التلقائي)
Expanded(
child: ListView.builder(
reverse: true, // لتبدأ الدردشة من الأسفل
itemCount: _messages.length,
itemBuilder: (context, index) {
bool isUser = _messages[index]['sender'] == 'user';
return Align(
alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
child: Container(
margin: EdgeInsets.all(8),
padding: EdgeInsets.all(12),
decoration: BoxDecoration(
color: isUser ? Colors.brown[200] : Colors.white,
borderRadius: BorderRadius.circular(15),
boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2)],
),
constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
child: Text(
_messages[index]['text']!,
style: TextStyle(fontSize: 15),
textAlign: TextAlign.right,
),
),
);
},
),
),

// حقل إدخال النص
Container(
padding: EdgeInsets.all(10),
color: Colors.white,
child: Row(
children: [
IconButton(
icon: Icon(Icons.send, color: Colors.brown),
onPressed: _handleSend,
),
Expanded(
child: TextField(
controller: _controller,
textAlign: TextAlign.right,
decoration: InputDecoration(
hintText: 'اسأل عن مكان في شقراء...',
border: InputBorder.none,
),
),
),
],
),
),
],
),
);
}
}