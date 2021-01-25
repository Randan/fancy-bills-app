import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/rates/rates_repository.dart';
import '../../cubit/rates/rates_state.dart';
import '../../cubit/rates/rates_cubit.dart';

class RatesEditForm extends StatefulWidget {
  RatesEditForm({Key key}) : super(key: key);

  @override
  _RatesEditFormState createState() => _RatesEditFormState();
}

class _RatesEditFormState extends State<RatesEditForm> {
  final ratesRepository = RatesRepository();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RatesCubit>(
      create: (BuildContext context) =>
          RatesCubit(ratesRepository)..fetchRates(),
      child: Center(
        child: AlertDialog(
          title: const Text('Edit Rates'),
          content: _form(),
          actions: _formActions(context),
        ),
      ),
    );
  }

  BlocBuilder _form() {
    return BlocBuilder<RatesCubit, RatesState>(
      builder: (_, state) {
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
                  _formField('Electricity Above 100',
                      state.loadedRates.electricityAbove),
                  _formField('Electricity Below 100',
                      state.loadedRates.electricityBelow),
                  _formField('Cold Water', state.loadedRates.coldWater),
                  _formField('Hot Water', state.loadedRates.hotWater),
                  _formField('Sewerage', state.loadedRates.sewerage),
                  _formField('Rent', state.loadedRates.rent),
                ],
              ),
            ),
          );
        }

        return Container();
      },
    );
  }

  TextFormField _formField(title, value) {
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
      onChanged: (value) => print(value),
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
          print('Edit Button Pressed');
        },
        textColor: Theme.of(context).primaryColor,
        child: Text('Save'),
      ),
    ];
  }
}
