import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class DetailedDishScreen extends StatelessWidget{
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
          style: Theme.of(context).appBarTheme.titleTextStyle
        ),
        backgroundColor:Theme.of(context).scaffoldBackgroundColor,
      elevation: AppDimens.elevetion_0, 
        centerTitle: true,
        leading: const BackButton(
          color: AppColors.primaryColor
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              Align(
                child: Container(
                  margin: const EdgeInsets.only(top: AppDimens.padding45),
                  width: MediaQuery.sizeOf(context).width / 1.5,
                  height: MediaQuery.sizeOf(context).height / 3.6,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(AppDimens.padding20),
                    ),
                    boxShadow:const <BoxShadow>[
                      BoxShadow(
                        color: AppColors.shadowBlack,
                        blurRadius: AppDimens.blurRadiusShadow_20, 
                        offset: AppDimens.boxShadowOffset,
                      ),
                    ],
                    color: Theme.of(context).cardColor,
                  ),
                  child: AppImage(imageURL: dishModel.url,),
                ),
              ),
              const SizedBox(
                height: AppDimens.verticalSpacing_40,
              ),
              NumberStepperWidget(),
              const SizedBox(
                height: AppDimens.verticalSpacing_40,
              ),
              Text(
                dishModel.name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: AppDimens.verticalSpacing_20,
              ),
              Text(
                '${dishModel.price}\$',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: AppDimens.verticalSpacing_20,
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
                height: AppDimens.verticalSpacing_20,
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
                height: AppDimens.verticalSpacing_80,
              ),
            ],
          )
        )
      ),
      bottomSheet: AppButton(
        onTap: () {}, //TODO add to cart logic
        width: MediaQuery.of(context).size.width / 7,
        margin: const EdgeInsets.only(
          bottom: AppDimens.padding20,
          right: AppDimens.padding15,
          left: AppDimens.padding15,
        ),
        padding: AppDimens.padding20,
        title: StringConstants.addToCartString,
        textStyle: AppFonts.white_bold_14,
        boxDecoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(AppDimens.padding20)),
          gradient: AppColors.primaryGradient,
        ),
      ),
    );
  }
}