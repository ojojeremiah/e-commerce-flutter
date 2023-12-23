import 'package:cartify/utils/theme/app_colors.dart';
import 'package:cartify/widget/brands.dart';
import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  RangeValues values = const RangeValues(50, 1000);
  @override
  Widget build(BuildContext context) {
    RangeLabels labels =
        RangeLabels(values.start.toString(), values.start.toString());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          leading: const BackButton(color: AppColors.blackColor),
          elevation: 0,
          backgroundColor: Colors.grey[100],
          title: Container(
            margin: const EdgeInsets.only(left: 70),
            child: const Text(
              'Sort & Filter',
              style: TextStyle(
                  color: AppColors.blackColor, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Brand",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const Brands(),
                const Text(
                  "Gender",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 10),
                  child: Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(right: 10),
                          width: 80,
                          height: 40,
                          decoration: const BoxDecoration(
                              color: AppColors.lightCardColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "All",
                                style: TextStyle(color: Colors.black),
                              ))),
                      Container(
                          margin: const EdgeInsets.only(right: 10),
                          width: 80,
                          height: 40,
                          decoration: const BoxDecoration(
                              color: AppColors.lightCardColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: TextButton(
                              onPressed: () {},
                              child: const Text("Men",
                                  style: TextStyle(color: Colors.black)))),
                      Container(
                          width: 80,
                          height: 40,
                          decoration: const BoxDecoration(
                              color: AppColors.lightCardColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: TextButton(
                              onPressed: () {},
                              child: const Text("Women",
                                  style: TextStyle(color: Colors.black))))
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Price Ranges",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Text(
                    'Selected Range: \$${values.start.toInt()} - \$${values.end.toInt()}'),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: RangeSlider(
                    activeColor: AppColors.brandColor,
                    inactiveColor: AppColors.lightCardColor,
                    values: values,
                    min: 0,
                    max: 1000,
                    onChanged: (newValues) {
                      setState(() {
                        values = newValues;
                      });
                    },
                    divisions: 8,
                    labels: labels,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text(
                    'Sort by',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(right: 5),
                          width: 100,
                          height: 40,
                          decoration: const BoxDecoration(
                              color: AppColors.lightCardColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: TextButton(
                              onPressed: () {},
                              child: const Text("Popular",
                                  style: TextStyle(color: Colors.black)))),
                      Container(
                          margin: const EdgeInsets.only(right: 5),
                          width: 130,
                          height: 40,
                          decoration: const BoxDecoration(
                              color: AppColors.lightCardColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: TextButton(
                              onPressed: () {},
                              child: const Text("Most Recent",
                                  style: TextStyle(color: Colors.black)))),
                      Container(
                          width: 130,
                          height: 40,
                          decoration: const BoxDecoration(
                              color: AppColors.lightCardColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: TextButton(
                              onPressed: () {},
                              child: const Text("Price High",
                                  style: TextStyle(color: Colors.black))))
                    ],
                  ),
                ),
                const Text(
                  "Rating",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(right: 10),
                          width: 80,
                          height: 40,
                          decoration: const BoxDecoration(
                              color: AppColors.lightCardColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: GestureDetector(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.only(top: 10, left: 30),
                                child: Text(
                                  "All",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ))),
                      Container(
                          margin: const EdgeInsets.only(right: 10),
                          width: 80,
                          height: 40,
                          decoration: const BoxDecoration(
                              color: AppColors.lightCardColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                margin: const EdgeInsets.only(left: 23),
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 20,
                                      color: Colors.orange,
                                    ),
                                    Text(
                                      "5",
                                      style: TextStyle(fontSize: 20),
                                    )
                                  ],
                                ),
                              ))),
                      Container(
                          margin: const EdgeInsets.only(right: 10),
                          width: 80,
                          height: 40,
                          decoration: const BoxDecoration(
                              color: AppColors.lightCardColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                margin: const EdgeInsets.only(left: 20),
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 20,
                                      color: Colors.orange,
                                    ),
                                    Text(
                                      "4",
                                      style: TextStyle(fontSize: 20),
                                    )
                                  ],
                                ),
                              ))),
                      Container(
                          margin: const EdgeInsets.only(right: 10),
                          width: 80,
                          height: 40,
                          decoration: const BoxDecoration(
                              color: AppColors.lightCardColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                margin: const EdgeInsets.only(left: 20),
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 20,
                                      color: Colors.orange,
                                    ),
                                    Text(
                                      "3",
                                      style: TextStyle(fontSize: 20),
                                    )
                                  ],
                                ),
                              ))),
                    ],
                  ),
                ),
                Container(
                    width: 350,
                    margin: const EdgeInsets.only(top: 30, left: 15),
                    decoration: const BoxDecoration(
                        color: AppColors.brandColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Apply",
                          style: TextStyle(
                              fontSize: 18, color: AppColors.lightCardColor),
                        ))),
                Container(
                    width: 350,
                    margin: const EdgeInsets.only(top: 30, left: 15),
                    decoration: const BoxDecoration(
                        color: AppColors.lightCardColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Reset",
                          style: TextStyle(
                              fontSize: 18, color: AppColors.blackColor),
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
