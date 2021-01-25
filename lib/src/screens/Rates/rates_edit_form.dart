import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../../cubit/rates/rates_state.dart';

class RatesEditForm extends StatefulWidget {
  final mainContext;
  final mainState;
  final mainRepository;
  const RatesEditForm({
    Key key,
    this.mainContext,
    this.mainState,
    this.mainRepository,
  }) : super(key: key);

  @override
  _RatesEditFormState createState() => _RatesEditFormState();
}

class _RatesEditFormState extends State<RatesEditForm> {
  final _formKey = GlobalKey<FormState>();

  String electricityAboveState;
  String electricityBelowState;
  String coldWaterState;
  String hotWaterState;
  String sewerageState;
  String rentState;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        title: const Text('Edit Rates'),
        content: Builder(
          builder: (context) {
            if (widget.mainState is RatesEmptyState) {
              return Center(
                child: Text('There is no Rates Fields'),
              );
            }

            if (widget.mainState is RatesErrorState) {
              return Center(
                child: Text('Fetching Rates Data error'),
              );
            }

            if (widget.mainState is RatesLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (widget.mainState is RatesLoadedState) {
              return Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _formField(
                        'Electricity Above 100',
                        widget.mainState.loadedRates.electricityAbove,
                        RateType.ElecAbove100,
                      ),
                      _formField(
                        'Electricity Below 100',
                        widget.mainState.loadedRates.electricityBelow,
                        RateType.ElecBelow100,
                      ),
                      _formField(
                        'Cold Water',
                        widget.mainState.loadedRates.coldWater,
                        RateType.ColdWater,
                      ),
                      _formField(
                        'Hot Water',
                        widget.mainState.loadedRates.hotWater,
                        RateType.HotWater,
                      ),
                      _formField(
                        'Sewerage',
                        widget.mainState.loadedRates.sewerage,
                        RateType.Sewerage,
                      ),
                      _formField(
                        'Rent',
                        widget.mainState.loadedRates.rent,
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

    if (newRates.length > 0) widget.mainRepository.editRates(newRates);
  }
}
