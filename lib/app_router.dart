import 'package:breaking_bad_project/business_logic/cubit/characters_cubit.dart';
import 'package:breaking_bad_project/constants/strings.dart';
import 'package:breaking_bad_project/data/models/characters.dart';
import 'package:breaking_bad_project/data/repositories/characters_repository.dart';
import 'package:breaking_bad_project/data/web_services/characters_web_services.dart';
import 'package:breaking_bad_project/presentation/screens/characters_details_screen.dart';
import 'package:breaking_bad_project/presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => charactersCubit,
            child: const CharactersScreen(),
          ),
        );

      case characterDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
            builder: (_) =>  CharacterDetailsScreen(character: character,));
    }
  }
}
