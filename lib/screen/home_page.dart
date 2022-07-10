import 'package:sahash/customWidgets/custom_filter.dart';
import 'package:sahash/localisation/localisation_constant.dart';
import 'package:sahash/routes/route_name.dart';
import 'package:sahash/screen/banner_image.dart';
import 'package:flutter/material.dart';
import '../customWidgets/custom_card_view.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  int selectedId;
  HomePage({Key key, this.selectedId}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 237, 236, 236),
        body: SingleChildScrollView(
          child: Column(children: [
            CustomFilter(filterId: widget.selectedId),
            const SizedBox(
              height: 10,
            ),
            const BannerImage(),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              CustomCardView(
                flexno: 3,
                icon: Icons.shopping_cart,
                name: getTranslated(context, 'orders'),
                value: "51",
                cardcolor: Colors.white,
                cardBordercolor: Colors.white,
                iconcolor: Colors.blue,
                press: () {
                  Navigator.pushNamed(context, RouteName.orderPage);
                },
              ),
              CustomCardView(
                flexno: 4,
                icon: Icons.account_balance_wallet,
                name: getTranslated(context, 'balance_lbl'),
                value: "51",
                cardcolor: Colors.white,
                cardBordercolor: Colors.white,
                iconcolor: Colors.blue,
                press: () {
                  Navigator.pushNamed(context, RouteName.multiple);
                },
              ),
              CustomCardView(
                flexno: 3,
                icon: Icons.wallet_giftcard,
                name: getTranslated(context, 'product_lbl'),
                value: "51",
                cardcolor: Colors.white,
                cardBordercolor: Colors.white,
                iconcolor: Colors.blue,
                press: () {
                  Navigator.pushNamed(context, RouteName.productPage);
                },
              ),
            ]),
            Row(
              children: [
                CustomCardView(
                  flexno: 1,
                  icon: Icons.group,
                  name: getTranslated(context, 'customer_lbl'),
                  value: "51",
                  cardcolor: Colors.white,
                  cardBordercolor: Colors.white,
                  iconcolor: Colors.blue,
                  press: () {
                    Navigator.pushNamed(context, RouteName.gradient);
                  },
                ),
                CustomCardView(
                  flexno: 1,
                  icon: Icons.star_rounded,
                  name: getTranslated(context, 'rating'),
                  value: "51",
                  cardcolor: Colors.white,
                  cardBordercolor: Colors.white,
                  iconcolor: Colors.blue,
                  press: () {
                    Navigator.pushNamed(context, RouteName.ratings);
                  },
                ),
              ],
            ),
            Row(
              children: [
                CustomCardView(
                  flexno: 1,
                  icon: Icons.not_interested,
                  name: getTranslated(context, 'sold_out'),
                  value: "51",
                  cardcolor: Colors.white,
                  cardBordercolor: Colors.white,
                  iconcolor: Colors.blue,
                  press: () {
                    Navigator.pushNamed(context, RouteName.soldOut);
                  },
                ),
                CustomCardView(
                  flexno: 1,
                  icon: Icons.offline_bolt,
                  name: getTranslated(context, 'low_stock_product'),
                  value: "51",
                  cardcolor: Colors.white,
                  cardBordercolor: Colors.white,
                  iconcolor: Colors.blue,
                  press: () {
                    Navigator.pushNamed(context, RouteName.lowStock);
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 60, bottom: 20),
              child: Row(
                children: [
                  CustomCardView(
                    flexno: 1,
                    icon: Icons.file_upload,
                    name: getTranslated(context, 'add_product'),
                    value: "51",
                    cardcolor: Colors.white,
                    cardBordercolor: Colors.white,
                    iconcolor: Colors.blue,
                    press: () {
                      Navigator.pushNamed(context, RouteName.addNewProduct);
                    },
                  ),
                ],
              ),
            )
          ]),
        ));
  }
}
