import 'package:flutter/material.dart';

class MenuItem extends StatefulWidget{
  const MenuItem({super.key});
  @override
  State<StatefulWidget> createState() => MenuItemState();
}

class MenuItemState extends State<MenuItem>{
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 10,right: 10, bottom: 40),
      padding: const EdgeInsets.only(right: 5.0, left: 5.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 5.0,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0xfff4f4f4),
            spreadRadius: 2,
            blurRadius: 15
          ),
        ]
      ),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 120,
            child:  SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.contain,
                child: Image.network("https://www.kfc.by/admin/files/4575.png")
              ),
            )
          ),   
          const SizedBox(height: 5),
          const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Бургер де люкс",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ),
          const SizedBox(height: 5),
          FittedBox(
            fit: BoxFit.contain,
            child: Row(
              children: [
                const Text(
                  '\$20.00',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffa191fc),
                  ),
                ),
                const SizedBox(
                  width: 12, 
                ),
                TextButton(
                  onPressed: (){}, 
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color(0xffa191fc)),
                    foregroundColor: MaterialStateProperty.all(const Color(0xffe6e0ff)),
                  ),
                  child: const Row(
                    children: [
                      Text('Add to cart'),
                      SizedBox(width: 5),
                      Icon(
                        Icons.shopping_basket,
                        size: 17,
                      )
                    ],
                  ) 
                )
              ]
            )
          )
        ],
      ),
    );
  }
}