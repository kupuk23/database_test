// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dotted_line/dotted_line.dart';
// import 'package:flutter/material.dart';

// import 'classes/class.dart';

// class ResultsPage extends StatefulWidget {
//   final String resultId;
//   const ResultsPage({Key? key, required this.resultId}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   @override
//   State<ResultsPage> createState() => _ResultsPageState();
// }

// class _ResultsPageState extends State<ResultsPage> {
//   Color greenTheme = Color.fromARGB(255, 33, 217, 128);
//   String name = "";
//   int values = 10;
//   int dom1 = 1;
//   int dom2 = 3;
//   int dom3 = 6;
//   int dom4 = 9;
//   int dom5 = 9;
//   List<int> stdScore = [];
//   List<int> dom = [];
//   List<int> faset2 = [];
//   final db = FirebaseFirestore.instance;
//   GlobalKey _tableKey = GlobalKey();
//   late double tableWidth;
//   late double tableHeight;

//   void _incrementfasetScore() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // faset1Score without calling setState(), then the build method would not be
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Color greenTheme = Color.fromARGB(255, 33, 217, 128);
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementfasetScore method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Title(
//       title: "asd",
//       color: Colors.black,
//       child: Scaffold(
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           // Here we take the value from the ResultsPage object that was created by
//           // the App.build method, and use it to set our appbar title.
//           title: Center(
//             child: SelectableText(
//               "NIK : " + widget.resultId,
//               style: TextStyle(color: Colors.black),
//             ),
//           ),
//         ),
//         body: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Container(
//               margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
//               //color: Color.fromARGB(255, 220, 189, 189),
//               height: MediaQuery.of(context).size.height * 3, // - 500,
//               width: MediaQuery.of(context).size.width * 0.95, //1920 - 500,
//               child: StreamBuilder<QuerySnapshot>(
//                   stream: db.collection('userCSV').snapshots(),
//                   builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                     if (!snapshot.hasData) {
//                       return Center(
//                           child: Center(child: CircularProgressIndicator()));
//                     }
//                     for (var doc in snapshot.data!.docs) {
//                       if (doc['nik'] == widget.resultId) {
//                         // faset.add(int.parse(doc['id']));
//                         try {
//                           name = "George W."; //doc['name'];
//                           stdScore.add(doc['facet1']);
//                           stdScore.add(doc['facet2']);
//                           stdScore.add(doc['facet3']);
//                           stdScore.add(doc['facet4']);
//                           stdScore.add(doc['facet5']);
//                           stdScore.add(doc['facet6']);
//                           stdScore.add(doc['facet7']);
//                           stdScore.add(doc['facet8']);
//                           stdScore.add(doc['facet9']);
//                           stdScore.add(doc['facet9']);
//                           stdScore.add(doc['facet10']);
//                           stdScore.add(doc['facet11']);
//                           stdScore.add(doc['facet12']);
//                           stdScore.add(doc['facet13']);
//                           stdScore.add(doc['facet14']);
//                           stdScore.add(doc['facet15']);
//                           dom.add(doc['dom1']);
//                           dom.add(doc['dom2']);
//                           dom.add(doc['dom3']);
//                           dom.add(doc['dom4']);
//                           dom.add(doc['dom5']);
//                           print('faset is : $stdScore');
//                           break;
//                         } catch (err) {
//                           print("faset err is $err");
//                           stdScore.clear();
//                         }
//                       } else {
//                         stdScore.clear();
//                       }
//                     }
//                     if (stdScore.isEmpty) {
//                       return Container(
//                         child: SelectableText("no Data"),
//                       );
//                     }
//                     return Container(
//                       margin: EdgeInsets.all(10),

//                       height:
//                           MediaQuery.of(context).size.height * 0.9, // - 500,
//                       width:
//                           MediaQuery.of(context).size.width * 0.9, //1920 - 500,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Center(child: SelectableText('Name :  $name')),
//                           FasetChart(fasetScore: stdScore),
//                           SizedBox(
//                             height: 100,
//                           ),
//                           BarChart(dom: dom),
//                           SizedBox(
//                             height: 80,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
//                             child: SelectableText(
//                               "Deskripsi Hasil:",
//                               style: TextStyle(fontWeight: FontWeight.w800),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 25,
//                           ),
//                           DescriptionDomain(
//                             dom: dom[0],
//                             name: name,
//                             number: 1,
//                           ),
//                           DescriptionDomain(
//                             dom: dom[1],
//                             name: name,
//                             number: 2,
//                           ),
//                           DescriptionDomain(
//                             dom: dom[2],
//                             name: name,
//                             number: 3,
//                           ),
//                           DescriptionDomain(
//                             dom: dom[3],
//                             name: name,
//                             number: 4,
//                           ),
//                           DescriptionDomain(
//                             dom: dom[4],
//                             name: name,
//                             number: 5,
//                           )
//                         ],
//                       ),
//                     );
//                   })),
//         ),
//       ),
//     );
//   }
// }

// class FasetChart extends StatelessWidget {
//   const FasetChart({
//     Key? key,
//     required this.fasetScore,
//   }) : super(key: key);

//   final List<int> fasetScore;

//   @override
//   Widget build(BuildContext context) {
//     Color greenTheme = Color.fromARGB(255, 33, 217, 128);
//     return Column(children: [
//       SizedBox(
//         height: 10,
//       ),
//       SelectableText(
//         "AGREEABLENESS",
//         style: TextStyle(
//             color: greenTheme, fontWeight: FontWeight.w800, fontSize: 18),
//       ),
//       FacetTitle(index: 0),
//       rowTable(
//         fasetScore: fasetScore[0],
//         num: 1,
//       ),
//       FacetTitle(index: 1),
//       rowTable(
//         fasetScore: fasetScore[1],
//         num: 2,
//       ),
//       FacetTitle(index: 2),
//       rowTable(
//         fasetScore: fasetScore[2],
//         num: 3,
//       ),
//       SizedBox(
//         height: 20,
//       ),
//       SelectableText(
//         "Conscientiousness".toUpperCase(),
//         style: TextStyle(
//             color: greenTheme, fontWeight: FontWeight.w800, fontSize: 18),
//       ),
//       FacetTitle(index: 3),
//       rowTable(
//         fasetScore: fasetScore[3],
//         num: 4,
//       ),
//       FacetTitle(index: 4),
//       rowTable(
//         fasetScore: fasetScore[4],
//         num: 5,
//       ),
//       FacetTitle(index: 5),
//       rowTable(
//         fasetScore: fasetScore[5],
//         num: 6,
//       ),
//       SizedBox(
//         height: 20,
//       ),
//       SelectableText(
//         "Emotional Stability".toUpperCase(),
//         style: TextStyle(
//             color: greenTheme, fontWeight: FontWeight.w800, fontSize: 18),
//       ),
//       FacetTitle(index: 6),
//       rowTable(
//         fasetScore: fasetScore[6],
//         num: 7,
//       ),
//       FacetTitle(index: 7),
//       rowTable(
//         fasetScore: fasetScore[7],
//         num: 8,
//       ),
//       FacetTitle(index: 8),
//       rowTable(
//         fasetScore: fasetScore[8],
//         num: 9,
//       ),
//       SizedBox(
//         height: 20,
//       ),
//       SelectableText(
//         "Extraversion".toUpperCase(),
//         style: TextStyle(
//             color: greenTheme, fontWeight: FontWeight.w800, fontSize: 18),
//       ),
//       FacetTitle(index: 9),
//       rowTable(
//         fasetScore: fasetScore[9],
//         num: 10,
//       ),
//       FacetTitle(index: 10),
//       rowTable(
//         fasetScore: fasetScore[10],
//         num: 11,
//       ),
//       FacetTitle(index: 11),
//       rowTable(
//         fasetScore: fasetScore[11],
//         num: 12,
//       ),
//       SizedBox(
//         height: 20,
//       ),
//       SelectableText(
//         "Open Mindedness".toUpperCase(),
//         style: TextStyle(
//             color: greenTheme, fontWeight: FontWeight.w800, fontSize: 18),
//       ),
//       FacetTitle(index: 12),
//       rowTable(
//         fasetScore: fasetScore[12],
//         num: 13,
//       ),
//       FacetTitle(index: 13),
//       rowTable(
//         fasetScore: fasetScore[13],
//         num: 14,
//       ),
//       FacetTitle(index: 14),
//       rowTable(
//         fasetScore: fasetScore[14],
//         num: 15,
//       ),
//     ]);
//   }
// }

// class FacetTitle extends StatelessWidget {
//   const FacetTitle({Key? key, required this.index}) : super(key: key);

//   final int index;
//   @override
//   Widget build(BuildContext context) {
//     Color greenTheme = Color.fromARGB(255, 33, 217, 128);
//     List<String> facetTitle = [
//       "Compassion",
//       "Respectfulness",
//       "Trust",
//       "Organization",
//       "Productiveness",
//       "Responsibility",
//       "Anxiety",
//       "Depression",
//       "Emotional Volatility",
//       "Assertiveness",
//       "Energy Level",
//       "Sociability",
//       "Aesthetic Sensitivity",
//       "Creative Imagination",
//       "Intellectual Curiosity"
//     ];
//     return Column(
//       children: [
//         SizedBox(
//           height: 10,
//         ),
//         SelectableText(
//           facetTitle[index],
//           style: TextStyle(fontWeight: FontWeight.w600),
//         ),
//         SizedBox(
//           height: 5,
//         ),
//       ],
//     );
//   }
// }

// class BarChart extends StatelessWidget {
//   const BarChart({
//     Key? key,
//     required this.dom,
//   }) : super(key: key);

//   final List<int> dom;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(children: [
//       BarChartCategories(),
//       Center(
//         child: SizedBox(
//           width: 500,
//           height: 365,
//           // MediaQuery.of(context).size.width *
//           // (1400 / MediaQuery.of(context).size.width),
//           //color: Colors.grey.withOpacity(0.4),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               SizedBox(
//                 width: 246,
//               ),
//               DottedLine(
//                 direction: Axis.vertical,
//                 lineLength: 335,
//               ),
//               SizedBox(
//                 width: 150,
//               ),
//               DottedLine(
//                 direction: Axis.vertical,
//                 lineLength: 335,
//               ),
//             ],
//           ),
//         ),
//       ),
//       Column(
//         children: [
//           SizedBox(
//             height: 20,
//           ),
//           BarChartRow(values: dom[0], num: 1),
//           BarChartRow(values: dom[1], num: 2),
//           BarChartRow(values: dom[2], num: 3),
//           BarChartRow(values: dom[3], num: 4),
//           BarChartRow(values: dom[4], num: 5),
//         ],
//       ),
//     ]);
//   }
// }

// class DescriptionDomain extends StatelessWidget {
//   const DescriptionDomain({
//     Key? key,
//     required this.dom,
//     required this.number,
//     required this.name,
//   }) : super(key: key);

//   final int dom;
//   final int number;
//   final String name;

//   @override
//   Widget build(BuildContext context) {
//     String bullet =
//         "\u2022 "; //Dom1 Agreeableness, dom2 Conscientiousness, dom3 Emotional Stability, dom4 Extraversion, dom5 Open Mindness
//     String domHigh = "";
//     String domMed = "";
//     String domLow = "";

//     void DomText() {
//       switch (number) {
//         case 1:
//           domHigh =
//               "Individu memiliki kepedulian yang tinggi terhadap orang lain dan menghargai hak serta nilai yang dimiliki oleh orang lain. Hal ini membuat individu secara aktif melakukan berbagai perilaku untuk meningkatkan kesejahteraan orang lain. Secara keseluruhan, individu juga memiliki pandangan dan keyakinan yang positif terhadap orang lain, sehingga mudah bagi individu untuk percaya pada orang lain.";
//           domMed =
//               "Individu memiliki kepedulian terhadap orang lain dan menghargai hak serta nilai yang dimiliki orang lain. Namun demikian, individu tidak secara aktif melakukan kegiatan untuk meningkatkan kesejahteraan orang lain. Secara keseluruhan, individu kurang memiliki pandangan dan keyakinan yang positif terhadap orang lain, sehingga  sulit bagi individu untuk percaya pada orang lain dalam situasi-situasi tertentu.";
//           domLow =
//               "Individu memiliki kepedulian yang rendah terhadap kesejahteraan orang lain dan kurang menghargai hak serta nilai yang dimiliki orang lain. Hal ini membuat individu berperilaku apatis/acuh tak acuh terhadap orang lain. Secara keseluruhan, individu juga memiliki pandangan dan keyakinan yang negatif terhadap orang lain, sehingga sulit bagi individu untuk percaya pada orang lain.";
//           break;
//         case 2:
//           domHigh =
//               "Individu memiliki dorongan yang kuat untuk melakukan aktivitas yang berorientasi pada suatu tujuan tertentu. Dalam mencapai tujuan tersebut, individu melakukan berbagai hal secara teratur dan sistematis. Individu juga memiliki etos kerja yang baik, bertanggungjawab, dan berkomitmen terhadap tanggung jawab yang diberikan. Hal ini membuat individu dapat diandalkan untuk menyelesaikan berbagai pekerjaan yang diberikan secara mandiri. ";

//           domMed =
//               "Individu dapat melakukan aktivitas yang berorientasi pada suatu tujuan tertentu. Dalam mencapai tujuan tersebut, individu melakukannya dengan cukup teratur dan sistematis. Individu juga memiliki etos kerja, cukup bertanggungjawab, dan cukup berkomitmen terhadap tanggung jawab yang diberikan, sehingga dapat sdiandalkan untuk menyelesaikan beberapa pekerjaan tertentu secara mandiri.";

//           domLow =
//               "Individu kurang memiliki dorongan untuk melakukan usaha yang berorientasi pada suatu tujuan tertentu. Dalam beraktivitas, individu sulit menerapkan keteraturan dan kesulitan bekerja secara sistematis. Individu juga memiliki etos kerja yang kurang baik dan komitmen yang rendah karena seringkali melakukan aktivitas sesuka hati. Hal ini membuat individu sulit untuk diandalkan dan memerlukan pemantauan dari orang lain dalam menyelesaikan pekerjaanya. ";
//           break;
//         case 3:
//           domHigh =
//               "Individu mampu mengendalikan emosinya dalam berbagai situasi. Hal ini membuat individu tetap bersikap tenang dan rasional dalam menghadapi berbagai situasi. Individu juga memiliki optimisme, minat, dan semangat yang tinggi untuk menjalani kesehariannya. ";

//           domMed =
//               "Individu mampu mengendalikan emosinya pada situasi tertentu. Individu dapat bersikap tenang dan rasional pada situasi tertentu dan di satu sisi dapat mudah terbawa emosi pada beberapa situasi tertentu. Individu memiliki optimisme, minat, dan semangat yang cukup untuk menjalani kesehariannya.";

//           domLow =
//               "Individu kesulitan mengendalikan emosinya dalam berbagi situasi. Hal ini membuat individu mudah terbawa emosi dalam menghadapi situasi. Individu juga lebih sering merasakan emosi negatif seperti perasaan cemas, khawatir tanpa alasan, sedih, dan tegang. Berbagai emosi negatif ini juga membuat individu memiliki sikap pesimis dan minat yang rendah dalam menjalani aktivitas sehari-hari.";
//           break;
//         case 4:
//           domHigh =
//               "Individu semangat dan antusias dalam beraktivitas. Dalam situasi sosial, individu sering menunjukkan emosi positif, mudah mengungkapkan pendapatnya, dan memiliki kemauan tinggi untuk terlibat dalam interaksi sosial. Hal ini membuat individu mudah beradaptasi dengan situasi sosial baru.";
//           domMed =
//               "Individu cukup semangat dan antusias dalam beraktivitas. Dalam situasi sosial, individu cukup menunjukkan emosi positif, dapat mengungkapkan pendapatnya, dan cukup terlibat dalam interaksi sosial. Hal ini membuat individu cukup dapat beradaptasi dengan situasi sosial baru.";

//           domLow =
//               "Individu kurang semangat dan antusias dalam beraktivitas. Dalam situasi sosial, individu jarang menunjukkan emosi positif, sulit mengungkapkan pendapatnya, dan memiliki kemauan rendah untuk terlibat dalam interaksi sosial. Hal ini membuat individu sulit beradaptasi dengan situasi sosial baru.";
//           break;
//         case 5:
//           domHigh =
//               "Individu memiliki keingintahuan yang tinggi sehingga akan mencari informasi secara menyeluruh dan mendalam. Ia mampu mempertanyakan suatu kondisi atau informasi selagi mencari kebenaran. Individu juga memiliki perasaan positif terhadap keindahan. Ia dapat mengapresiasi dan menikmatinya. Saat bekerja maupun berkreasi, individu akan mengusahakan adanya nilai estetika dalam hal-hal yang ia ciptakan. Ia akan berpikir secara kreatif serta terbuka terhadap ide-ide baru atau berbeda. Ide yang dimilikinya dapat bersifat orisinal dan visioner.";
//           domMed =
//               "Individu merasa nyaman dengan informasi yang ia miliki atau dapatkan. Ia akan mencari informasi lebih lanjut jika memang dirasa perlu. Individu juga mampu mengapresiasi dan menikmati keindahan. Akan tetapi, ia tidak secara aktif mencari atau mengusahakan adanya nilai estetika dalam berbagai hal. Ia mampu berpikir secara kreatif dan terbuka terhadap ide baru meskipun tidak bersifat orisinal dan visioner.";

//           domLow =
//               "Individu memiliki keingintahuan yang rendah sehingga ia akan cenderung menerima informasi yang ia terima tanpa mempertanyakannya lebih lanjut. Individu juga memiliki ketertarikan yang rendah terhadap keindahan. Ia akan lebih mengutamakan nilai fungsi dibandingkan nilai estetika. Individu memiliki kreativitas yang rendah serta lebih cenderung merasa nyaman dengan kondisi dan ide yang sudah ada. Ide-ide baru dapat membuatnya merasa khawatir/terancam.";
//           break;
//       }
//     }

//     DomText();
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
//                 child: SelectableText(
//                   number == 1
//                       ? "$bullet Agreeableness"
//                       : number == 2
//                           ? "$bullet Conscientiousness"
//                           : number == 3
//                               ? "$bullet Emotional Stability"
//                               : number == 4
//                                   ? "$bullet Extraversion"
//                                   : "$bullet Open Mindedness",
//                   style: TextStyle(
//                       fontWeight: FontWeight.w600, fontStyle: FontStyle.italic),
//                 ),
//               ),
//               SelectableText(
//                 dom >= 7
//                     ? ": Tinggi"
//                     : dom >= 4
//                         ? ": Sedang"
//                         : ": Rendah",
//                 style: TextStyle(
//                   fontWeight: FontWeight.w600,
//                 ),
//               )
//             ],
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(55, 0, 0, 0),
//             child: SelectableText(
//               dom >= 7
//                   ? domHigh
//                       .replaceAll('Individu', name)
//                       .replaceAll('individu', name)
//                   : dom >= 4
//                       ? domMed
//                           .replaceAll('Individu', name)
//                           .replaceAll('individu', name)
//                       : domLow
//                           .replaceAll('Individu', name)
//                           .replaceAll('individu', name),
//               textAlign: TextAlign.justify,
//             ),
//           ),
//           SizedBox(
//             height: 15,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class BarChartCategories extends StatelessWidget {
//   const BarChartCategories({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         height: 20,
//         width: 500,
//         child: Row(
//           //mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(
//               width: 165,
//             ),
//             SelectableText(
//               "Low",
//               style: TextStyle(color: Colors.grey),
//             ),
//             SizedBox(
//               width: 100,
//             ),
//             SelectableText(
//               "Medium",
//               style: TextStyle(color: Colors.grey),
//             ),
//             SizedBox(
//               width: 100,
//             ),
//             SelectableText(
//               "High",
//               style: TextStyle(color: Colors.grey),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class BarChartRow extends StatelessWidget {
//   BarChartRow({
//     Key? key,
//     required int values,
//     required this.num,
//   })  : _value = values,
//         super(key: key);

//   final int _value;
//   final int num;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         SelectableText(
//           num == 1
//             ? "Agreeableness           "
//             : num == 2
//                 ? "Conscientiousness    "
//                 : num == 3
//                     ? "Emotional Stability    "
//                     : num == 4
//                         ? "Extraversion               "
//                         : "Open Mindedness     ",
//         ),
//         num == 5
//             ? Container(
//                 height: 70,
//                 width: 2,
//                 color: Colors.black,
//               )
//             : Container(
//                 margin: EdgeInsets.fromLTRB(2, 0, 0, 0),
//                 height: 70,
//                 width: 2,
//                 color: Colors.black,
//               ),
//         Container(
//           color: chooseColor(_value),
//           height: 30,
//           width: scoreToBarLength(_value).toDouble(),
//         ),
//         SizedBox(
//           height: 30,
//           width: 450 - scoreToBarLength(_value).toDouble(),
//         )
//       ],
//     );
//   }
// }

// int scoreToBarLength(int score) {
//   switch (score) {
//     case 1:
//       return 50;
//       break;
//     case 2:
//       return 100;
//       break;
//     case 3:
//       return 150;
//       break;
//     case 4:
//       return 200;
//       break;
//     case 5:
//       return 250;
//       break;
//     case 6:
//       return 300;
//       break;
//     case 7:
//       return 350;
//       break;
//     case 8:
//       return 400;
//       break;
//     case 9:
//       return 450;
//       break;
//     default:
//       return 0;
//   }
// }

// Color? chooseColor(score) {
//   if (score < 4)
//     return Colors.red[200];
//   else if (score < 7)
//     return Colors.yellow[300];
//   else
//     return Colors.green[300];
// }

// class rowTable extends StatelessWidget {
//   rowTable({
//     Key? key,
//     required int fasetScore,
//     required this.num,
//   })  : _fasetScore = fasetScore,
//         super(key: key);

//   final int _fasetScore;
//   final int num;
//   final Color fasetColor = Color.fromARGB(255, 50, 241, 149);
//   String leftTitle = "";
//   String rightTitle = "";
//   getLeftTitle() {
//     switch (num) {
//       case 1:
//         leftTitle = "Data $num";
//         break;
//       case 2:
//         leftTitle = "Data $num";
//         break;
//       case 3:
//         leftTitle = "Data $num";
//         break;
//       case 4:
//         leftTitle = "Data $num";
//         break;
//       case 5:
//         leftTitle = "Data $num";
//         break;
//       case 6:
//         leftTitle = "Data $num";
//         break;
//       case 7:
//         leftTitle = "Data $num";
//         break;
//       case 8:
//         leftTitle = "Data $num";
//         break;
//       case 9:
//         leftTitle = "Data $num";
//         break;
//       case 10:
//         leftTitle = "Data $num";
//         break;
//       case 11:
//         leftTitle = "Data $num";
//         break;
//       case 12:
//         leftTitle = "Data $num";
//         break;
//       case 13:
//         leftTitle = "Data $num";
//         break;
//       case 14:
//         leftTitle = "Data $num";
//         break;
//       case 15:
//         leftTitle = "Data $num";
//         break;
//       default:
//     }
//   }

//   getRightTitle() {
//     switch (num) {
//       case 1:
//         rightTitle = "Data $num";
//         break;
//       case 2:
//         rightTitle = "Data $num";
//         break;
//       case 3:
//         rightTitle = "Data $num";
//         break;
//       case 4:
//         rightTitle = "Data $num";
//         break;
//       case 5:
//         rightTitle = "Data $num";
//         break;
//       case 6:
//         rightTitle = "Data $num";
//         break;
//       case 7:
//         rightTitle = "Data $num";
//         break;
//       case 8:
//         rightTitle = "Data $num";
//         break;
//       case 9:
//         rightTitle = "Data $num";
//         break;
//       case 10:
//         rightTitle = "Data $num";
//         break;
//       case 11:
//         rightTitle = "Data $num";
//         break;
//       case 12:
//         rightTitle = "Data $num";
//         break;
//       case 13:
//         rightTitle = "Data $num";
//         break;
//       case 14:
//         rightTitle = "Data $num";
//         break;
//       case 15:
//         rightTitle = "Data $num";
//         break;
//       default:
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     getLeftTitle();
//     getRightTitle();
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Tooltip(
//             textStyle: TextStyle(fontSize: 13, color: Colors.white),
//             message: 'Left Data Details ',
//             child: SelectableText(leftTitle)),
//         SizedBox(
//           width: 20,
//         ),
//         Container(
//           height: 20,
//           width: 40,
//           decoration: BoxDecoration(
//             border: Border.all(),
//             color: _fasetScore == 1 ? fasetColor : null,
//           ),
//         ),
//         Container(
//           height: 20,
//           width: 40,
//           decoration: BoxDecoration(
//             border: Border.all(),
//             color: _fasetScore == 2 ? fasetColor : null,
//           ),
//         ),
//         Container(
//           height: 20,
//           width: 40,
//           decoration: BoxDecoration(
//             border: Border.all(),
//             color: _fasetScore == 3 ? fasetColor : null,
//           ),
//         ),
//         Container(
//           height: 20,
//           width: 40,
//           decoration: BoxDecoration(
//             border: Border.all(),
//             color: _fasetScore == 4 ? fasetColor : null,
//           ),
//         ),
//         Container(
//           height: 20,
//           width: 40,
//           decoration: BoxDecoration(
//             border: Border.all(),
//             color: _fasetScore == 5 ? fasetColor : null,
//           ),
//         ),
//         Container(
//           height: 20,
//           width: 40,
//           decoration: BoxDecoration(
//             border: Border.all(),
//             color: _fasetScore == 6 ? fasetColor : null,
//           ),
//         ),
//         Container(
//           height: 20,
//           width: 40,
//           decoration: BoxDecoration(
//             border: Border.all(),
//             color: _fasetScore == 7 ? fasetColor : null,
//           ),
//         ),
//         Container(
//           height: 20,
//           width: 40,
//           decoration: BoxDecoration(
//             border: Border.all(),
//             color: _fasetScore == 8 ? fasetColor : null,
//           ),
//         ),
//         Container(
//           height: 20,
//           width: 40,
//           decoration: BoxDecoration(
//             border: Border.all(),
//             color: _fasetScore == 9 ? fasetColor : null,
//           ),
//         ),
//         SizedBox(
//           width: 20,
//         ),
//         Tooltip(
//             textStyle: TextStyle(fontSize: 13, color: Colors.white),
//             message: "Right Data Details",
//             child: SelectableText(rightTitle)),
//       ],
//     );
//   }
// }
