abstract class LibraryStates {}

class LibraryInitState extends LibraryStates {}

class LibraryLoadingDataState extends LibraryStates {}

class LibraryGetDataSuccessState extends LibraryStates {}

class LibraryGetDataFailState extends LibraryStates {
  final String error;

  LibraryGetDataFailState({required this.error});
}

class ChangeLibraryBodyState extends LibraryStates {}
