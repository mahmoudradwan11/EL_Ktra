import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ek/core/mangers/toast.dart';
import 'package:ek/core/user_controller/cart_cubit/cart_states.dart';
import 'package:ek/core/user_controller/db_cubit/db_states.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseCubit extends Cubit<DatabaseStates> {
  DatabaseCubit() : super(DatabaseInitStates());
  static DatabaseCubit get(context) => BlocProvider.of(context);
  Database? database;
  void createDatabase() {
    openDatabase('Orders.db', version: 1, onCreate: (database, version) {
      print('Database Created');
      database
          .execute(
              'create table Orders(id INTEGER PRIMARY KEY, address TEXT , date TEXT , phone TEXT , paymentMethod TEXT , cardNo TEXT , expiry TEXT , cvv TEXT , itemsCount TEXT , total TEXT , subTotal TEXT )')
          .then((value) {
        print('Table Orders Created');
      }).catchError((error) {
        print('Error occur : $error');
      });
    }, onOpen: (database) {
      getData(database);
      print('Database opened');
    }).then((value) {
      database = value;
      emit(CreateDatabaseState());
    }).catchError((error) {
      emit(ErrorCreateDatabaseState());
    });
  }
  Future<void> insertOrder({
    required String address,
    required String date,
    required String phone,
    required String cardNumber,
    required String expiry,
    required String cvv,
    required String itemsCount,
    required String total,
    required String subTotal,
  }) async {
    database!.transaction((txn) {
      return txn
          .rawInsert(
              'INSERT INTO Orders(address,date,phone,paymentMethod,cardNo,expiry,cvv,itemsCount,total,subTotal) VALUES("$address","$date","$phone","$paymentSelected","$cardNumber","$expiry","$cvv","$itemsCount","$total","$subTotal")')
          .then((value) {
        print('$value Inserted Successfully');
        emit(InsertDatabaseState());
        getData(database);
        showToast('Order Confirm', ToastStates.SUCCESS);
      }).catchError((error) {
        print('Error occur : $error');
        emit(ErrorInsertDatabaseState());
      });
    });
  }
  List<Map> userOrders = [];
void getData(database)
{
  userOrders = [];
  database!.rawQuery('select * from Orders').then((value) {
    value.forEach((element) {
        userOrders.add(element);
    });
    print(userOrders);
    emit(GetDatabaseState());
  }).catchError((error) {
    print('Error occur no data');
    emit(ErrorGetDatabaseState());
  });
}
  String? paymentSelected = "Cash";
  selectedPayment(sort){
    paymentSelected = sort;
    print(paymentSelected);
    emit(ChoosePaymentMethod());
  }
  void deleteCart({required int id}) async {
    await database!
        .rawDelete('DELETE FROM Orders WHERE id= ?', [id]).then((value) {
      getData(database);
      emit(DeleteDatabase());
    });
  }
  int activeStep = 0;
  void changeActive(int index){
    activeStep = index;
    emit(ChangeActiveTap());
  }
}