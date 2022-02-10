import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class AnimalState {
  String animal;
  AnimalState({
    required this.animal,
  });
}

abstract class AnimalEvent {}

class CowState extends AnimalState {
  String cow;
  CowState(animal, {required this.cow}) : super(animal: animal);
}

class CowEvent extends AnimalEvent {}

class AnimalBloc<E extends AnimalEvent, S extends AnimalState>
    extends Bloc<AnimalEvent, AnimalState> {
  AnimalBloc({required String animal}) : super(AnimalState(animal: animal));
}

class CowBloc extends AnimalBloc<CowEvent, CowState> {
  //how to set initial cowbloc state here?
  CowBloc() : super(animal: "animal");
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(),
        //<CowBloc,AnimalState> is ok
        body: BlocBuilder<CowBloc, CowState>(
          bloc: CowBloc(),
          builder: (context, state) {
            return Center(
              child: Column(
                children: [
                  Text(state.animal),
                  // Text(state.cow),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
