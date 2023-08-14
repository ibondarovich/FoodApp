import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:detailed_dish_view/src/bloc/bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'components/ingredient_item.dart';

class DetailedDishScreen extends StatelessWidget {
  final DishModel dishModel;

  const DetailedDishScreen({
    super.key,
    required this.dishModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          StringConstants.appBarTitle,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: AppDimens.elevetion0,
        centerTitle: true,
        leading: const BackButton(color: AppColors.primaryColor),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: <Widget>[
              Align(
                child: Container(
                  margin: const EdgeInsets.only(top: AppDimens.padding45),
                  width: MediaQuery.sizeOf(context).width / 1.5,
                  height: MediaQuery.sizeOf(context).height / 3.6,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(AppDimens.padding20),
                    ),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: AppColors.shadowBlack,
                        blurRadius: AppDimens.blurRadiusShadow20,
                        offset: AppDimens.boxShadowOffset,
                      ),
                    ],
                    color: Theme.of(context).cardColor,
                  ),
                  child: AppImage(
                    filePath: dishModel.url,
                  ),
                ),
              ),
              const SizedBox(
                height: AppDimens.verticalSpacing20,
              ),
              const SizedBox(
                height: AppDimens.verticalSpacing40,
              ),
              Text(
                dishModel.name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: AppDimens.verticalSpacing20,
              ),
              Text(
                '${dishModel.price}\$',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: AppDimens.verticalSpacing20,
              ),
              Container(
                padding: const EdgeInsets.only(
                  right: AppDimens.padding35,
                  left: AppDimens.padding35,
                ),
                child: Text(
                  dishModel.description,
                  textAlign: TextAlign.justify,
                  style: AppFonts.normal_14,
                ),
              ),
              const SizedBox(
                height: AppDimens.verticalSpacing20,
              ),
              const Text(
                StringConstants.ingredientsTitle,
                style: AppFonts.bold_14,
              ),
              Container(
                alignment: Alignment.center,
                child: Wrap(
                  children: List.generate(
                    dishModel.ingredients.length,
                    (index) => Container(
                      margin: const EdgeInsets.all(AppDimens.padding10),
                      width: MediaQuery.of(context).size.width / 3,
                      child: IngredientItem(
                        title: dishModel.ingredients[index],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: AppDimens.verticalSpacing80,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: BlocProvider(
        create: (context) => DetailedDishViewBloc(
          saveCartItemUseCase: appLocator.get<SaveCartItemUseCase>(),
        ),
        child: BlocBuilder<DetailedDishViewBloc, DetailedDishViewState>(
          builder: (BuildContext context, DetailedDishViewState state) {
            return AppButton(
              onTap: () {
                BlocProvider.of<DetailedDishViewBloc>(context).add(
                  OnSaveItemEvent(
                    dishModel: dishModel,
                  ),
                );
              },
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 13,
              margin: const EdgeInsets.only(
                bottom: AppDimens.padding20,
                right: AppDimens.padding15,
                left: AppDimens.padding15,
              ),
              padding: const EdgeInsets.all(AppDimens.padding20),
              title: StringConstants.addToCartString,
              textStyle: AppFonts.bold_14.copyWith(
                color: AppColors.white,
              ),
            );
          },
        ),
      ),
    );
  }
}
