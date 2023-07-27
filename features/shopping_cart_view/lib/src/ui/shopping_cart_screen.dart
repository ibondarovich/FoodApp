import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart_view/shopping_cart_view.dart';
import 'package:shopping_cart_view/src/ui/components/cart_item.dart';
import 'package:shopping_cart_view/src/ui/components/empty_cart_screen.dart';

class ShoppingCartScreen extends StatefulWidget{
  const ShoppingCartScreen({super.key});

  @override
  State<StatefulWidget> createState() => ShoppingCartScreenState();
}

class ShoppingCartScreenState extends State<ShoppingCartScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar (
        title: Text(
          StringConstants.appBarTitle,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: AppDimens.elevetion0,
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => ShoppingCartViewBloc(
          fetchAllCartItemsUseCase: appLocator.get<FetchAllCartItemsUseCase>(), 
          removeCartItemUseCase: appLocator.get<RemoveCartItemUseCase>(),
          updateCartItemQuantity: appLocator.get<UpdateCartItemQuantity>(),
        ),
        child: BlocBuilder<ShoppingCartViewBloc, CartPageState>(
          builder: (BuildContext context, CartPageState state) {
            if(state.isLoading){
              return const AppLoaderWidget();
            } else{
              if(state.items.isNotEmpty){
                return Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(
                        left: AppDimens.padding20,
                        top: AppDimens.padding20,
                      ),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          StringConstants.yourCartTitle,
                          style: AppFonts.bold_21,
                        ),
                      ),
                    ),  
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: AppDimens.padding20,
                        ),
                        child: ListView.builder(
                          itemCount: state.items.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CartItem(
                              cartItem: state.items[index],
                            );
                          }
                        )
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(AppDimens.padding20),
                      child: BlocBuilder<ShoppingCartViewBloc, CartPageState>(
                        builder: (context, state) {
                          if(state.items.isNotEmpty){
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                const Text(
                                  StringConstants.totalPriceTitle,
                                  style: AppFonts.bold_20,
                                ),
                                Text(
                                  '\$${state.totalPrice}',
                                  style: AppFonts.bold_20,
                                ),
                              ],
                            );
                          }
                          return Container();
                        }
                      )
                    ),
                    AppButton(
                      onTap: () {}, //TODO payment logic
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 13,
                      margin: const EdgeInsets.only(
                        right: AppDimens.padding15,
                        left: AppDimens.padding15,
                      ),
                      padding: const EdgeInsets.all(AppDimens.padding20),
                      title: StringConstants.cartPagePayment,
                      textStyle: AppFonts.bold_14.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                );
              }
              else{
                return EmptyCartScreen();
              }
            }
          }
        )
      )
    );
  }
}