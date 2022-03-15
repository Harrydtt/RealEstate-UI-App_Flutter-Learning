import 'package:carousel_slider/carousel_slider.dart';
import 'package:estate/models/property_model.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class DetailsPage extends StatelessWidget {
  final PropertyModel propertyModel;
  const DetailsPage({Key? key, required this.propertyModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselwithIndicatorDemo(
                  propertyModel: propertyModel,
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(propertyModel.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(fontWeight: FontWeight.bold)),
                          const Spacer(),
                          const Icon(LineIcons.starAlt, color: Colors.amber),
                          Text(propertyModel.rating.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  )),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(propertyModel.subTitle.toString(),
                          style:
                              Theme.of(context).textTheme.subtitle2!.copyWith(
                                    color: Colors.black.withOpacity(0.5),
                                  )),
                      const SizedBox(height: 32),
                      DetailSpecItems(propertyModel: propertyModel),
                      const SizedBox(height: 32),
                      Text("Description",
                          style: Theme.of(context).textTheme.headline6),
                      const SizedBox(height: 12),
                      Text(propertyModel.details,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(
                                  color: Colors.black.withOpacity(0.5),
                                  letterSpacing: 1.1,
                                  height: 1.4)),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ],
            )),
        Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border:
                            Border.all(color: Colors.black.withOpacity(0.3)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 20,
                              offset: const Offset(4, 4),
                              spreadRadius: 4),
                        ],
                      ),
                      height: 55,
                      width: 55,
                      child: const Icon(LineIcons.facebookMessenger),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border:
                            Border.all(color: Colors.black.withOpacity(0.3)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 20,
                              offset: const Offset(4, 4),
                              spreadRadius: 4),
                        ],
                      ),
                      height: 55,
                      width: 55,
                      child: const Icon(LineIcons.heart),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: Colors.black.withOpacity(0.3)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 20,
                                  offset: const Offset(4, 4),
                                  spreadRadius: 4),
                            ],
                          ),
                          height: 55,
                          width: 55,
                          child: Center(
                            child: Text(
                              "BUY NOW",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          )),
                    ),
                  )
                ],
              ),
            )),
      ]),
    );
  }
}

class DetailSpecItems extends StatelessWidget {
  const DetailSpecItems({
    Key? key,
    required this.propertyModel,
  }) : super(key: key);

  final PropertyModel propertyModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Color(0xffE7CD68),
              shape: BoxShape.circle,
            ),
            child: const Icon(LineIcons.home),
          ),
          const SizedBox(width: 8),
          Text(
            "${propertyModel.rooms} Rooms",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const SizedBox(width: 20),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Color(0xffE7CD68),
              shape: BoxShape.circle,
            ),
            child: const Icon(LineIcons.areaChart),
          ),
          const SizedBox(width: 8),
          Text(
            "${propertyModel.area} Sqft",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const SizedBox(width: 20),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Color(0xffE7CD68),
              shape: BoxShape.circle,
            ),
            child: const Icon(LineIcons.building),
          ),
          const SizedBox(width: 8),
          Text(
            "${propertyModel.floors} Floors",
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
    );
  }
}

class CarouselwithIndicatorDemo extends StatefulWidget {
  final PropertyModel propertyModel;
  const CarouselwithIndicatorDemo({Key? key, required this.propertyModel})
      : super(key: key);

  @override
  State<CarouselwithIndicatorDemo> createState() =>
      _CarouselwithIndicatorDemoState();
}

class _CarouselwithIndicatorDemoState extends State<CarouselwithIndicatorDemo> {
  int _current = 0;

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
            carouselController: _controller,
            items: widget.propertyModel.images
                .map((item) => Image.asset(
                      item,
                      fit: BoxFit.cover,
                      width: 1000,
                    ))
                .toList(),
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height / 1.7,
              autoPlay: true,
              enlargeCenterPage: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            )),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.propertyModel.images.asMap().entries.map((entry) {
            return GestureDetector(
                onTap: () {},
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
                  width: 12,
                  height: _current == entry.key ? 6 : 4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(_current == entry.key ? 0.5 : 0.2)),
                ));
          }).toList(),
        )
      ],
    );
  }
}
