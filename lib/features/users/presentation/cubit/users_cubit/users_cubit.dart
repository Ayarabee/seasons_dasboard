import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seasons_dashboard/features/users/data/repos/users_repo_implementation.dart';

import '../../../../../core/app_widgets/my_snack_bar.dart';
import '../../../../../core/core_models/user_model.dart';
import 'users_states.dart';


class UsersCubit extends Cubit<UsersStates> {

  UsersCubit(this.repo) :
        super(UsersInitialState());

  final UsersRepoImplementation repo;
  static UsersCubit get (context) => BlocProvider.of(context);


  List<UserModel> users =[];
  Future<void> viewAll () async
  {
    users =[];
    emit(ViewAllUsersLoadingState());
    var response = await repo.viewAll();
    response.fold((failure)
    {
      emit(ViewAllUsersErrorState(failure.errorMessage));
    }, (result)
    {
      users = result;
      emit(ViewAllUsersSuccessState());
    });
  }


  Future<void> add({
    required context,
    required UserModel userModel
  }) async {
    emit(AddLoadingState());
    var response = await repo.add(
        userModel : userModel
    );
    response.fold((failure) {
      emit(AddErrorState(failure.errorMessage));
      callMySnackBar(context: context, text: failure.errorMessage);
    }, (result) async
    {
      if (result.success!) {
        emit(AddSuccessState());
        callMySnackBar(context: context, text: 'Add Success');
        await viewAll();
      }
      else
      {
        emit(AddErrorState(result.message!));
        callMySnackBar(context: context, text: result.message!);
      }
    });
  }

  Future<void> delete ({
    required context,
    required String id,
    required int index,
  }) async
  {
    emit(DeleteLoadingState());
    var response = await repo.delete(
        id: id
    );
    response.fold((failure)
    {
      emit(DeleteErrorState(failure.errorMessage));
      callMySnackBar(context: context, text: failure.errorMessage);
    }, (result)async
    {
      if(result.success!) {
        emit(DeleteSuccessState());
        callMySnackBar(context: context, text: 'Delete Success');
        users.removeAt(index);
       // await viewAll();
      }
      else
      {
        emit(DeleteErrorState(result.message!));
        callMySnackBar(context: context, text: result.message!);
      }
    });
  }


  Future<void> edit({
    required context,
    required UserModel userModel
  }) async {
    emit(EditLoadingState());
    var response = await repo.edit(
        userModel: userModel
    );
    response.fold((failure) {
      emit(EditErrorState(failure.errorMessage));
      callMySnackBar(context: context, text: failure.errorMessage);
    }, (result) async
    {
      if(result.success!) {
        emit(EditSuccessState());
        callMySnackBar(context: context, text: 'Edit Success');
        await viewAll();
      }
      else
      {
        emit(EditErrorState(result.message!));
        callMySnackBar(context: context, text: result.message!);
      }
    });
  }
}