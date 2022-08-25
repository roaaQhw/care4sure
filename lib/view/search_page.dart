import 'package:care4sure/components/components.dart';
import 'package:care4sure/dio/dio_helper.dart';
import 'package:care4sure/view/medicine_details.dart';
import 'package:care4sure/view/notification.dart';
import 'package:care4sure/view/sidemenu.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

enum Types { one, two, more }

enum Filter { byName, byComposition, byExpireDate, byFactory }

class _SearchPageState extends State<SearchPage> {
  var searchController = TextEditingController();
  bool isVisible = false;
  Types types = Types.one;
  Filter filter = Filter.byName;
  bool isLoading = false;
  String? materials;


  List<dynamic> result = [];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF293462),
          title: Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: height * .03),
              child: Image.asset(
                'assets/logo1.png',
              ),
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Notification1(),
                  ));
            },
            icon: const Icon(Icons.notifications),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NavBar(),
                    ));
              },
              icon: const Icon(Icons.list),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * .021, vertical: height * .025),
            child: FutureBuilder(
              future: DioHelper.getAllMaterials()

                ,
              builder: (context,AsyncSnapshot<Object?> snapshot) {
                if(snapshot.hasData){
                  dynamic response = snapshot.data;
                  List allMaterials = response.data['data'];
                  List<String> materialsNames = [];
                  allMaterials.forEach((element) {
                    materialsNames.add(element[0]['material_name']);
                  });
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showCupertinoDialog(
                                context: context,
                                builder: (context) => CupertinoAlertDialog(
                                  title: const Text('اختر نوع الفلترة'),
                                  content: Column(
                                    children: [
                                      SizedBox(
                                        height: height * .02,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            filter = Filter.byName;
                                            Navigator.of(context).pop();
                                          });
                                        },
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(
                                            const Color(0xFF05ADB8),
                                          ),
                                        ),
                                        child: const Text('الفلترة حسب اسم الدواء'),
                                      ),
                                      SizedBox(
                                        height: height * .02,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            filter = Filter.byComposition;
                                            Navigator.of(context).pop();
                                          });
                                        },
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(
                                            const Color(0xFF05ADB8),
                                          ),
                                        ),
                                        child: const Text('الفلترة حسب تركيبة دواء'),
                                      ),
                                      SizedBox(
                                        height: height * .02,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            filter = Filter.byExpireDate;
                                            Navigator.of(context).pop();
                                          });
                                        },
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(
                                            const Color(0xFF05ADB8),
                                          ),
                                        ),
                                        child: const Text(
                                            'الفلترة حسب مدة انتهاء الصلاحية '),
                                      ),
                                      SizedBox(
                                        height: height * .02,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            filter = Filter.byFactory;
                                            Navigator.of(context).pop();
                                          });
                                        },
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(
                                            const Color(0xFF05ADB8),
                                          ),
                                        ),
                                        child:
                                        const Text('الفلترة حسب الشركة المصنعة'),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF05ADB8),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              height: height * .053,
                              width: width * .23,
                              child: Center(
                                child: SvgPicture.asset(
                                  'assets/filter_icon.svg',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * .6,
                            height: height * .053,
                            child: filter == Filter.byComposition
                                ? DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: materials,
                                hint: const Text("Materials"),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),

                                icon: const Icon(Icons.arrow_drop_down,
                                    color: Colors.grey),
                                isExpanded: true,
                                //isDense: true,
                                //  itemHeight: 20.0,
                                //    elevation: 0.4,
                                items:
                                materialsNames.map(buildMenuItem).toList(),
                                onChanged: (value) =>
                                    setState(() {
                                      for (int i = 1 ; i < materialsNames.length ; i++) {

                                        if(materialsNames[i] == value){
                                          setState(() {
                                            isLoading = true;
                                            DioHelper.materials({
                                              'material_ids' : [i]
                                            }).then((value) {
                                              setState(() {
                                                isLoading = false;
                                                result.clear();
                                                result = value.data['data'];
                                              });
                                            }).catchError((onError){
                                              setState(() {
                                                print(onError.toString());
                                                isLoading = false;
                                              });
                                            });
                                          });
                                        }

                                      }
                                    }),
                              ),
                            )
                                : TextFormField(
                              onFieldSubmitted: (value) {
                                setState(() {
                                  isLoading = true;
                                  if (filter == Filter.byName) {
                                    DioHelper.materials(
                                        {'medicine_name': value}).then((value) {
                                      setState(() {
                                        result.clear();
                                        print(value.data.toString());
                                        result = value.data['data'];
                                        isLoading = false;
                                      });
                                    }).catchError((onError) {
                                      setState(() {
                                        print(onError.toString());
                                        isLoading = false;
                                      });
                                    });
                                  }
                                  if (filter == Filter.byExpireDate) {
                                    DioHelper.materialsEx().then((value) {
                                      setState(() {
                                        result.clear();
                                        print(value.data.toString());
                                        result = value.data['data'];
                                        isLoading = false;
                                      });
                                    }).catchError((onError) {
                                      setState(() {
                                        print(onError.toString());
                                        isLoading = false;
                                      });
                                    });
                                  }
                                  if (filter == Filter.byFactory) {
                                    DioHelper.materials(
                                        {'company_name': value}).then((value) {
                                      setState(() {
                                        result.clear();
                                        print(value.data.toString());
                                        result = value.data['data'];
                                        isLoading = false;
                                      });
                                    }).catchError((onError) {
                                      setState(() {
                                        print(onError.toString());
                                        isLoading = false;
                                      });
                                    });
                                  }
                                });
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                labelText: 'ابحث عن تركيبة دواء معينة ',
                                labelStyle: const TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                suffixIcon: const Icon(Icons.search),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * .015,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * .012,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            filter == Filter.byName
                                ? Row(
                              children: [
                                const Text('اظهار البديل'),
                                Checkbox(
                                  value: isVisible,
                                  onChanged: (newValue) {
                                    setState(() {
                                      isVisible = newValue!;
                                    });
                                  },
                                  fillColor: MaterialStateProperty.all(
                                    const Color(0xFF05ADB8),
                                  ),
                                ),
                              ],
                            )
                                : SizedBox(),
                            const Text('نتيجة البحث'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * .015,
                      ),
                      isVisible
                          ? Column(
                        children: [
                          SizedBox(
                            height: (height * .08) * 5,
                            // single card need 0.08 and we have 5 item
                            child: FutureBuilder(
                              future: DioHelper.alter(data: {
                                'medicine_name' : 'setamool'
                              }),
                              builder: (context,AsyncSnapshot<Object?> snapshot) {
                                if (snapshot.hasData) {
                                  dynamic response = snapshot.data;
                                  dynamic data = response
                                      .data['data']['Alternatives with one materials'];
                                  return ListView.builder(
                                    itemCount: data.length,
                                    itemBuilder: (context, index) =>
                                        Card(
                                          child: ListTile(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      MedicineDetails(),
                                                ),
                                              );
                                            },
                                            leading:
                                            SvgPicture.asset(
                                                'assets/medicines.svg'),
                                            title: Text(data = data[index]['name'] .toString() != null
                                                ? data = data[index]['name']
                                            : "Empty"),

                                            trailing: SizedBox(
                                              width: width * .47,
                                              // child: Row(
                                              //   mainAxisAlignment:
                                              //   MainAxisAlignment.spaceEvenly,
                                              //   children: const [
                                              //     Text('تركيبة 1,'),
                                              //     Text('تركيبة 2,'),
                                              //     Text('تركيبة 3'),
                                              //   ],
                                              // ),
                                            ),
                                          ),
                                        ),
                                  );
                                }

                                else if (snapshot.hasError)
                                  return Text('Internet connection error');

                                return Center(
                                    child: CircularProgressIndicator());
                              }
                            ),
                          ),
                          SizedBox(
                            height: height * .021,
                          ),
                          Row(
                            children: [
                              const Spacer(),
                              // GestureDetector(
                              //   onTap: () {
                              //     showCupertinoDialog(
                              //       context: context,
                              //       builder: (context) => CupertinoAlertDialog(
                              //         title: const Text('اختر صنف'),
                              //         content: Column(
                              //           children: [
                              //             ElevatedButton(
                              //               onPressed: () {
                              //                 setState(() {
                              //                   types = Types.one;
                              //                   Navigator.of(context).pop();
                              //                 });
                              //               },
                              //               style: ButtonStyle(
                              //                 backgroundColor:
                              //                 MaterialStateProperty.all(
                              //                   const Color(0xFF05ADB8),
                              //                 ),
                              //               ),
                              //               child: const Text('حسب مادة'),
                              //             ),
                              //             SizedBox(
                              //               height: height * .02,
                              //             ),
                              //             ElevatedButton(
                              //               onPressed: () {
                              //                 setState(() {
                              //                   types = Types.two;
                              //                   Navigator.of(context).pop();
                              //                 });
                              //               },
                              //               style: ButtonStyle(
                              //                 backgroundColor:
                              //                 MaterialStateProperty.all(
                              //                   const Color(0xFF05ADB8),
                              //                 ),
                              //               ),
                              //               child: const Text('حسب مادتين'),
                              //             ),
                              //             SizedBox(
                              //               height: height * .02,
                              //             ),
                              //             ElevatedButton(
                              //               onPressed: () {
                              //                 setState(() {
                              //                   types = Types.more;
                              //                   Navigator.of(context).pop();
                              //                 });
                              //               },
                              //               style: ButtonStyle(
                              //                 backgroundColor:
                              //                 MaterialStateProperty.all(
                              //                   const Color(0xFF05ADB8),
                              //                 ),
                              //               ),
                              //               child: const Text('أكثر'),
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              //     );
                              //   },
                              //   child: Container(
                              //     decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(20.0),
                              //       color: Colors.white,
                              //       border: Border.all(
                              //         color: Colors.black,
                              //       ),
                              //     ),
                              //     padding: const EdgeInsets.all(8),
                              //     child: Text(
                              //       types == Types.one
                              //           ? 'حسب مادة'
                              //           : types == Types.two
                              //           ? 'حسب مادتين'
                              //           : 'أكثر',
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                          SizedBox(
                            height: height * .021,
                          ),
                          SizedBox(
                            height: (height * .08) * 5,
                            // single card need 0.08 and we have 5 item
                            child: ListView.builder(
                              itemCount: 5,
                              itemBuilder: (context, index) => Card(
                                child: ListTile(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MedicineDetails(),
                                      ),
                                    );
                                  },
                                  leading:
                                  SvgPicture.asset('assets/medicines.svg'),
                                  title: const Text('اسم الدواء'),
                                  trailing: SizedBox(
                                    width: width * .47,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: const [
                                        Text('تركيبة 1,'),
                                        Text('تركيبة 2,'),
                                        Text('تركيبة 3'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                          : SizedBox(
                        height: (height * .08) * 5,
                        // single card need 0.08 and we have 5 item
                        child: !isLoading
                            ? ListView.builder(
                          itemCount: result.isEmpty ? 1 : result.length,
                          itemBuilder: (context, index) => result.isEmpty
                              ? Text('No matches')
                              : Card(
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        MedicineDetails(),
                                  ),
                                );
                              },
                              leading: SvgPicture.asset(
                                  'assets/medicines.svg'),
                              title: Text(result[index]['name_ar']),
                              trailing: SizedBox(
                                width: width * .47,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(result[index]['materials']
                                    [0]['material_name']),
                                    Text(result[index]['materials']
                                    [1]['material_name']),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                            : Center(child: CircularProgressIndicator()),
                      ),
                    ],
                  );
                }
                else if(snapshot.hasError)
                  return Text('Internet connection error');

                return Center(child: CircularProgressIndicator());

              }
            ),
          ),
        ),
      ),
    );
  }
}
