import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/constants.dart';
import '../../cubit/rates/rates_cubit.dart';
import '../../cubit/rates/rates_state.dart';
import '../../services/rates/rates_repository.dart';

class RatesEditForm extends StatefulWidget {
  const RatesEditForm({Key key}) : super(key: key);

  @override
  _RatesEditFormState createState() => _RatesEditFormState();
}

class _RatesEditFormState extends State<RatesEditForm> {
  final _formKey = GlobalKey<FormState>();
  RatesCubit ratesCubit;

  String electricityAboveState;
  String electricityBelowState;
  String coldWaterState;
  String hotWaterState;
  String sewerageState;
  String rentState;

  final ratesRepository = RatesRepository();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        title: const Text('Edit Rates'),
        content: BlocBuilder<RatesCubit, RatesState>(
          builder: (context, state) {
            ratesCubit = context.watch<RatesCubit>();
            if (state is RatesEmptyState) {
              return Center(
                child: Text('There is no Rates Fields'),
              );
            }

            if (state is RatesErrorState) {
              return Center(
                child: Text('Fetching Rates Data error'),
              );
            }

            if (state is RatesLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is RatesLoadedState) {
              return Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _formField(
                        'Electricity > 100kW (kW/hour)',
                        state.loadedRates.electricityAbove,
                        RateType.ElecAbove100,
                      ),
                      _formField(
                        'Electricity < 100kW (kW/hour)',
                        state.loadedRates.electricityBelow,
                        RateType.ElecBelow100,
                      ),
                      _formField(
                        'Cold Water (m3)',
                        state.loadedRates.coldWater,
                        RateType.ColdWater,
                      ),
                      _formField(
                        'Hot Water (m3)',
                        state.loadedRates.hotWater,
                        RateType.HotWater,
                      ),
                      _formField(
                        'Sewerage (m3)',
                        state.loadedRates.sewerage,
                        RateType.Sewerage,
                      ),
                      _formField(
                        'Rent (month)',
                        state.loadedRates.rent,
                        RateType.Rent,
                      ),
                    ],
                  ),
                ),
              );
            }

            return Container();
          },
        ),
        actions: _formActions(context),
      ),
    );
  }

  TextFormField _formField(title, value, type) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.number,
      initialValue: value.toString(),
      decoration: InputDecoration(
        labelText: title,
      ),
      validator: (value) {
        if (value.isEmpty) return 'Enter rate';
        return null;
      },
      onChanged: (value) {
        switch (type) {
          case RateType.ElecAbove100:
            setState(() {
              electricityAboveState = value;
            });
            break;
          case RateType.ElecBelow100:
            setState(() {
              electricityBelowState = value;
            });
            break;
          case RateType.ColdWater:
            setState(() {
              coldWaterState = value;
            });
            break;
          case RateType.HotWater:
            setState(() {
              hotWaterState = value;
            });
            break;
          case RateType.Sewerage:
            setState(() {
              sewerageState = value;
            });
            break;
          case RateType.Rent:
            setState(() {
              rentState = value;
            });
            break;
        }
      },
    );
  }

  List<FlatButton> _formActions(context) {
    return [
      FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: Text('Close'),
      ),
      FlatButton(
        onPressed: () {
          _handlePressSave();
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: Text('Save'),
      ),
    ];
  }

  void _handlePressSave() {
    Map<String, num> newRates = {};

    if (this.electricityAboveState != null)
      newRates = {
        ...newRates,
        'electricityAbove': double.parse(this.electricityAboveState),
      };

    if (this.electricityBelowState != null)
      newRates = {
        ...newRates,
        'electricityBelow': double.parse(this.electricityBelowState),
      };

    if (this.coldWaterState != null)
      newRates = {
        ...newRates,
        'coldWater': double.parse(this.coldWaterState),
      };

    if (this.hotWaterState != null)
      newRates = {
        ...newRates,
        'hotWater': double.parse(this.hotWaterState),
      };

    if (this.sewerageState != null)
      newRates = {
        ...newRates,
        'sewerage': double.parse(this.sewerageState),
      };

    if (this.rentState != null)
      newRates = {
        ...newRates,
        'rent': double.parse(this.rentState),
      };

    if (newRates.length > 0) ratesCubit.editRates(newRates);
  }
}
