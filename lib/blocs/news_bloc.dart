import 'package:testbloc12/models/news_model.dart';
import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class NewsBloc {
  final _repository = Repository();
  final _newsFetcher = PublishSubject<ItemModel>();

  Observable<ItemModel> get allNews => _newsFetcher.stream;

  fetchAllNews({int id,String keyWord}) async{
    ItemModel itemModel = await _repository.fetchAllNews(id,keyWord) ;
    _newsFetcher.sink.add(itemModel);
  }

  dispose() {
    _newsFetcher.close();
  }
}

final bloc = NewsBloc();