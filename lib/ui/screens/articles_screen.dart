import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testbloc12/bloc/articles_cubit.dart';
import 'package:testbloc12/di/app_injector.dart';
import 'package:testbloc12/models/news_item_model.dart';
import 'package:testbloc12/providers/articles_provider.dart';
import 'package:testbloc12/providers/provider_notifier.dart';
import 'package:testbloc12/ui/widgets/loading_widget.dart';
import 'package:testbloc12/ui/widgets/article_item_widget.dart';


class ArticlesScreen extends StatefulWidget {
  ArticlesScreen([this.id]);

  final int id;

  @override
  _ArticlesScreenState createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  final articlesCubit = getItInstance<ArticlesCubit>();

  @override
  void initState() {
    articlesCubit.fetchNews(id: widget.id);
    super.initState();
  }

  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width,
        color: Colors.white,
        child: buildBlocBuilder(),
      ),
    );
  }

  buildLoadedArticlesList(List<Article> articles) {
    return ProviderNotifier(child: (ArticlesProvider articlesProvider) {
      return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return ArticleItemWidget(
            articlesProvider.allArticles[index],
          );
        },
      );
    });
  }

  buildBlocBuilder() {
    return BlocBuilder<ArticlesCubit, ArticlesState>(
      bloc: articlesCubit,
      builder: (context, state) {
        if (state is ArticlesLoaded) {
          return buildLoadedArticlesList(state.articles);
        } else if (state is ArticlesError) {
          return ErrorWidget(state.error);
        } else {
          return LoadingWidget();
        }
      },
    );
  }

}
