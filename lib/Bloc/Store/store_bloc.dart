import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:grocery/Bloc/Product/products_bloc.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/model/store.dart';
import 'package:meta/meta.dart';

part 'store_event.dart';
part 'store_state.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  final dbRefrance = FirebaseFirestore.instance.collection('Store');
  final ProductsBloc productBloc;
  Map<String, Store> showStore = {};
  Map<String, Map<String, List<Product>>> storeProduct = {};
  StoreBloc(this.productBloc) : super(StoreInitial()) {
    on<GetStore>((event, emit) async {
      // TODO: implement event handler
      emit(FectchStore());

      if (showStore.isEmpty) {
        final snapshot = dbRefrance.snapshots();
        await snapshot.forEach((data) async {
          data.docs.forEach((element) {
            Store store = Store.fromJson(element.data());
            showStore.addAll({store.storeName: store});
            // showStore[store.storeName] = store;
          });

          for (int i = 0; i < showStore.length; i++) {
            String key = showStore.keys.elementAt(i);
            for (int j = 0; j < showStore[key]!.category.length; j++) {
              List<CategoryName> list =
                  showStore[key]?.category[j].categoryName ?? [];
              storeProduct[showStore[key]!.storeName] = {};
              for (int k = 0; k < list.length; k++) {
                storeProduct[showStore[key]!.storeName]![list[k].subName] = [];

                print("**********************${storeProduct}");
                for (int t = 0; t < list[k].subId.length; t++) {
                  if (!productBloc.isProductAvailable(list[k].subId[t])) {
                    await productBloc.fetchProduct(list[k].subId[t]);
                    Product? p = productBloc.getProduct(list[k].subId[t]);

                    storeProduct[showStore[key]?.storeName]![list[k].subName]!
                        .add(p!);
                  } else {
                    Product? p = productBloc.getProduct(list[k].subId[t]);
                    storeProduct[showStore[key]!.storeName]?[list[k].subName]
                        ?.add(p!);
                  }
                }
              }
            }
          }
          emit(ShowStore(showStore, storeProduct));
        });
      } else {
        emit(ShowStore(showStore, storeProduct));
      }
      print("--------------------------------${showStore.length}");
    });
  }
}
