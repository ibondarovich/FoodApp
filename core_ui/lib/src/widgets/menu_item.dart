import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatefulWidget{
  final DishModel dishModel;
  const MenuItem({
    super.key,
    required this.dishModel
  });
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
                child: Image.network(widget.dishModel.url)
              ),
            )
          ),   
          const SizedBox(height: 5),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.dishModel.name,
                style: const TextStyle(
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
                Text(
                  '${widget.dishModel.price}\$',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 252, 218, 145),
                  ),
                ),
                const SizedBox(
                  width: 12, 
                ),
                TextButton(
                  onPressed: (){}, 
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 253, 201, 91)),
                    foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 248, 248, 248)),
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