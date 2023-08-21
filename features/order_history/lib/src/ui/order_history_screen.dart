import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import '../bloc/bloc.dart';
import 'components/empty_order_history_screen.dart';
import 'components/order_item.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringConstants.appBarTitle,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: AppDimens.elevetion0,
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (BuildContext context) => OrderHistoryBloc(
          fetchOrderUseCase: appLocator.get<FetchOrdersUseCase>(),
          fetchUserIdUseCase: appLocator.get<FetchUserIdUseCase>(),
        ),
        child: BlocBuilder<OrderHistoryBloc, OrderHistoryState>(
          builder: (BuildContext context, OrderHistoryState state) {
            if (state.isLoading) {
              return const AppLoaderWidget();
            } else {
              if (state.orders.isNotEmpty) {
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
                          StringConstants.yourOrdersTitle,
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
                          physics: const BouncingScrollPhysics(),
                          itemCount: state.orders.length,
                          itemBuilder: (BuildContext context, int index) {
                            return OrderItem(orderModel: state.orders[index]);
                          },
                        ),
                      ),
                    )
                  ],
                );
              } else {
                return EmptyOrderHistoryScreen();
              }
            }
          },
        ),
      ),
    );
  }
}
