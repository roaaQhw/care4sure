import 'package:care4sure/dio/dio_helper.dart';
import 'package:care4sure/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:care4sure/model/listview.dart';
import 'package:care4sure/repo/posts/post_fake.dart';
import 'package:care4sure/view/rush.dart';
import 'package:care4sure/view_model/postsvm.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

import '../../components/components.dart';

// ignore: must_be_immutable
class Home1 extends StatefulWidget {
  static ListViewm l = ListViewm(
  image: const Image(
  image: AssetImage("assets/pharmacy-otc-products-turkey-64209774.jpg"),
  ),
  pharmacyName: "serda",
  pharmacyWebsite: "alkateb");

  const Home1({Key? key}) : super(key: key);



  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  final searchcontroller = TextEditingController();
  final area1 = ['باب توما', 'القيمرية', 'الحميدية', 'الحريقة'];

  List<ListViewm> listt = [
    Home1.l,
    Home1.l,
    Home1.l,
    Home1.l,
    Home1.l,
    Home1.l,
    Home1.l
  ];

  final items1 = ['i1', 'i2', 'i3', 'i4', 'i5'];

  String? value;

  var postsViewModel = PostsViewModel(postsRepository: PostsFake());

  @override
  Widget build(BuildContext context) {
    //PostsViewModel pp = context.watch<PostsViewModel>();
    return Container(

          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage("assets/Mask Group 4.png"),
                fit: BoxFit.fill,
                // colorFilter: ColorFilter.mode(
                //     Colors.black.withOpacity(0.3), BlendMode.darken)
              )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 33.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26.0),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      controller: searchcontroller,
                      decoration: InputDecoration(
                        labelText:
                        AppLocalizations.of(context)!.search_for_medicine,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(40.0),
                          ),
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 33,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.grey[400],
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: value,
                        hint: const Text("area"),
                        icon: const Icon(Icons.arrow_drop_down,
                            color: Colors.grey),
                        isExpanded: true,
                        //isDense: true,
                        //  itemHeight: 20.0,
                        //    elevation: 0.4,
                        items: area1.map(buildMenuItem).toList(),
                        onChanged: (value) =>
                            setState(() => this.value = value),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                text(
                    text: AppLocalizations.of(context)!
                        .pharmacies_that_contain_the_medicine,
                    c: Colors.black,
                    fs: 18.0),
                const SizedBox(
                  height: 15.0,
                ),
                FutureBuilder(
                  future: DioHelper.getAllPlaces(),
                  builder: (BuildContext context,
                      AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      Response<dynamic> response = snapshot.data;
                      List<dynamic> data = response.data['data'];
                      print(data[0].toString());
                      return Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          separatorBuilder: (context, index) => Container(
                            width: double.infinity,
                            height: 3.0,
                            color: const Color(0xFFb5b4b4),
                          ),
                          itemCount: data.length,
                          itemBuilder: (context, index) => listpharm2(
                            context,
                            data[index]['address']['city']['name_ar'],
                            data[index]['username'],
                            // 'http://care4sure.herokuapp.com/assets/images/' +
                            //     data[index]['imagePath'],
                            // data[index]["assets/pharmacy.jpg"],
                            listt[index].image!,
                          ),
                        ),
                      );
                    }
                    if (snapshot.hasError) {
                      return const Center(
                          child: Text('Internet connection error'));
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  iconSize: 61,
                  alignment: Alignment.center,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RushSceen(),
                        ));
                  },
                  icon: const Icon(
                    Icons.add_circle,
                    size: 61,
                    color: Color(0xFF026c73),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}