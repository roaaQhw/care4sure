// ignore_for_file: prefer_const_constructors

import 'package:care4sure/components/components.dart';
import 'package:care4sure/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:care4sure/view/notification.dart';
import 'package:flutter/material.dart';


final streetcontroller = TextEditingController();

class Pharmacy1 extends StatefulWidget {
  const Pharmacy1({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _Pharmacy1State createState() => _Pharmacy1State();
}

class _Pharmacy1State extends State<Pharmacy1> {
  final items2 = ['i1', 'i2', 'i3', 'i4', 'i5'];
  final items1 = ['i1', 'i2', 'i3', 'i4', 'i5'];
  final items3 = ['i1', 'i2', 'i3', 'i4', 'i5'];
  String? value2;
  String? value3;

  String? value1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffF8F9F9),
          elevation: 0.0,
          titleSpacing: 60.0,
          title: Container(
            height: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage("assets/logo.png"),
                  fit: BoxFit.none,
                )),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios,
                size: 21.0, color: Color(0XFF243162)),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Notification1(),
                    ));
              },
              icon: const Icon(Icons.add_alert_rounded,
                  size: 31.0, color: Color(0XFF243162)),
            ),
          ],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage("assets/pharmacy-otc-products-turkey-64209774.png"),
                          fit: BoxFit.fill,
                        )),
                  ),
                  Center(
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        CircleAvatar(
                          maxRadius: 50.0,
                          backgroundImage: AssetImage("sedra.jpg"),
                          backgroundColor: Color(0xFF00818a),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "name pharmacy",
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 50.0, left: 20, top: 20.0, bottom: 50),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 34.0,
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                ),
                                prefixIcon: const Icon(
                                  Icons.edit,
                                  size: 17,
                                  color: Color(0xFF216583),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          AppLocalizations.of(context)!.fullname,
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        icon(Icons.location_on, 21, Color(0xFF00818a)),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          "position",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 34,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: Colors.blue[50],
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: value1,
                                hint: Text(
                                    AppLocalizations.of(context)!.governorate),
                                icon: const Icon(Icons.arrow_drop_down,
                                    color: Colors.grey),
                                isExpanded: true,
                                //isDense: true,
                                //  itemHeight: 20.0,
                                //    elevation: 0.4,
                                items: items1.map(buildMenuItem).toList(),
                                onChanged: (value) =>
                                    setState(() => this.value1 = value),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              AppLocalizations.of(context)!.governorate,
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 34,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: Colors.blue[50],
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: value3,
                                hint: Text(AppLocalizations.of(context)!.city),
                                icon: const Icon(Icons.arrow_drop_down,
                                    color: Colors.grey),
                                isExpanded: true,
                                //isDense: true,
                                //  itemHeight: 20.0,
                                //    elevation: 0.4,
                                items: items1.map(buildMenuItem).toList(),
                                onChanged: (value) =>
                                    setState(() => this.value3 = value),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              AppLocalizations.of(context)!.city,
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 34,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: Colors.blue[50],
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: value2,
                                hint: Text(AppLocalizations.of(context)!.area),
                                icon: const Icon(Icons.arrow_drop_down,
                                    color: Colors.grey),
                                isExpanded: true,
                                //isDense: true,
                                //  itemHeight: 20.0,
                                //    elevation: 0.4,
                                items: items1.map(buildMenuItem).toList(),
                                onChanged: (value) =>
                                    setState(() => this.value2 = value),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              AppLocalizations.of(context)!.area,
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              controller: streetcontroller,
                              decoration: InputDecoration(
                                labelText: AppLocalizations.of(context)!.street,
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(53.0),
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return AppLocalizations.of(context)!.empty;
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              AppLocalizations.of(context)!.street,
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        icon(Icons.work, 21, Color(0xFF00818a)),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          "Working hours",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'Day',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 34,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: Colors.blue[50],
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: value2,
                                icon: const Icon(Icons.arrow_drop_down,
                                    color: Colors.grey),
                                isExpanded: true,
                                //isDense: true,
                                //  itemHeight: 20.0,
                                //    elevation: 0.4,
                                items: items1.map(buildMenuItem).toList(),
                                onChanged: (value) =>
                                    setState(() => this.value2 = value),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Row(
                              children: [
                                Text(
                                  'From',
                                  style: TextStyle(
                                      fontSize: 18.0, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 34,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.0),
                                      color: Colors.blue[50],
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        value: value2,
                                        icon: const Icon(Icons.arrow_drop_down,
                                            color: Colors.grey),
                                        isExpanded: true,
                                        //isDense: true,
                                        //  itemHeight: 20.0,
                                        //    elevation: 0.4,
                                        items: items1.map(buildMenuItem).toList(),
                                        onChanged: (value) =>
                                            setState(() => this.value2 = value),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(
                          width: 30,
                        ),
                        Expanded(
                            child: Row(
                              children: [
                                Text(
                                  'To',
                                  style: TextStyle(
                                      fontSize: 18.0, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 34,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.0),
                                      color: Colors.blue[50],
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        value: value2,
                                        icon: const Icon(Icons.arrow_drop_down,
                                            color: Colors.grey),
                                        isExpanded: true,
                                        //isDense: true,
                                        //  itemHeight: 20.0,
                                        //    elevation: 0.4,
                                        items: items1.map(buildMenuItem).toList(),
                                        onChanged: (value) =>
                                            setState(() => this.value2 = value),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              icon(Icons.call, 21, Color(0xFF00818a)),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                "Contact Information",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: 3,
                            itemBuilder: (context, index) => Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: icon(Icons.restore_from_trash_sharp,
                                        20, Color(0xFF00818a))),
                                Expanded(
                                  child: Container(
                                    height: 32,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.0),
                                      color: Colors.white,
                                    ),
                                    child: TextFormField(
                                      controller: streetcontroller,
                                      decoration: InputDecoration(
                                        hintText: "0965469230",
                                        border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(53.0),
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return AppLocalizations.of(context)!
                                              .empty;
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            separatorBuilder:
                                (BuildContext context, int index) => SizedBox(
                              height: 15,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        icon(Icons.email, 21, Color(0xFF00818a)),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          AppLocalizations.of(context)!.email,
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      height: 34.0,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                          ),
                          prefixIcon: const Icon(
                            Icons.edit,
                            size: 17,
                            color: Color(0xFF216583),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        icon(Icons.key, 21, Color(0xFF00818a)),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          AppLocalizations.of(context)!.password,
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      height: 34.0,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                          ),
                          prefixIcon: const Icon(
                            Icons.edit,
                            size: 17,
                            color: Color(0xFF216583),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 30.0,
                    ),
                    defaultButton(
                        function: () {},
                        textt: AppLocalizations.of(context)!.confirmation,
                        isUpperCase: false,
                        width: 180.0,
                        radios: 22),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}