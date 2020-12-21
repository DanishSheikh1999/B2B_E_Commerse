import 'package:flutter/material.dart';
import 'package:flutter_sign/seller/sellerHome/RunningOrders.dart';
import 'package:flutter_sign/seller/sellerHome/Unfulfilledorders.dart';
import 'package:flutter_sign/seller/sellerHome/sellerProducts.dart';

class SellerHome extends StatefulWidget {
  @override
  _SellerHomeState createState() => _SellerHomeState();
}

class _SellerHomeState extends State<SellerHome>  with TickerProviderStateMixin{
  TabController tabController ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController= TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TabBar(
            controller: tabController,
            labelPadding: EdgeInsets.all(10),
            unselectedLabelColor: Colors.grey[600],
            indicatorColor: Colors.orange[400],
            labelColor: Colors.orange[400],
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 3.0,
                    isScrollable: false,
            tabs: [
            Container(
                        height: 35,
                        width: 100,
                        child: Center(
                          child: new Text(
                            'Running',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      Container(
                        width: 100.0,
                        height: 35,
                        child: Center(
                          child: new Text(
                            'Unfulfilled',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      Container(
                        width: 150,
                        height: 35,
                        child: Center(
                          child: new Text(
                            'My Products',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      )
          ],),
          Expanded(
              child: Container(
            
              child:TabBarView(
                controller: tabController,
                children: [
                   RunningOrders(),
                   UnfulfilledOrders(),
                   SellerProducts()
                         
                ])
            ),
          )
        ],),
    );
  }
}