import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:gender_detector/home/model/model.dart';
import 'package:meta/meta.dart';

part 'gender_state.dart';

class GenderCubit extends Cubit<GenderState> {
  GenderCubit() : super(GenderInitial());
  void genderDetector(String name)async{
  emit(GenderLoading());
  try{
  final resp=await Dio().get('https://api.genderize.io/?name=$name');
  emit(GenderSuccess(Gender.fromJson(resp.data)));
  }catch(e){
  emit(GenderFailure(e.toString()));
  }
}
}