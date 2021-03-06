import '../composants/notesListView.dart';
import '../outils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../composants/notesListView.dart';
import '../outils/constantes.dart';
import '../outils/styles.dart';
import 'package:animated_floating_buttons/animated_floating_buttons.dart';

class ReadWritePage extends StatefulWidget{
  const ReadWritePage({Key? key}) : super(key: key);

  @override
  State<ReadWritePage> createState() => _Home();
}

class _Home extends State<ReadWritePage> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  final GlobalKey<AnimatedFloatingActionButtonState> floatingBTNKey =GlobalKey<AnimatedFloatingActionButtonState>();
  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }
  @override
  void dispose(){
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeNavigationStatus>(create: (BuildContext context)=>HomeNavigationStatus(),)
      ],
      child: Builder(
        builder: (context) {
          _tabController.addListener((){Provider.of<HomeNavigationStatus>(context, listen: false).tabSelected = _tabController.index;
          });
          return Scaffold(
            backgroundColor: Palette.getNoir(1),
            floatingActionButton: AnimatedFloatingActionButton(
              spaceBetween: -10,
              tooltip: "Ajouter une Note",
              animatedIconData: AnimatedIcons.menu_close,
              colorStartAnimation: Palette.getBleu(1),
              colorEndAnimation: Palette.getBlanc(.7),
              key: floatingBTNKey,
              fabButtons: <Widget>[
                buildFloatChild(Icons.pending_actions),
                buildFloatChild(Icons.pending_actions)
              ],
            ),
            appBar: AppBar(
              leading: const Icon(Icons.close),
              elevation: 0,
              title: Text('Titre de la note', style: StyleDeTexte.getLeadingTextStyle(),),
              actions: [
                HomeActionBTN(label: 'Recherche', icon: Icon(Icons.search_rounded, color: Palette.getBlanc(.7),), destination: RouteName.params,),
                HomeActionBTN(label: 'Param??tres', icon: Icon(Icons.settings, color: Palette.getBlanc(.7 )), destination: RouteName.params,)
              ],
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 40,
                  width: MQ.getLargeur(context),
                  child: TabBar(
                    unselectedLabelColor: Palette.getBleu(1),
                    indicatorColor: Palette.getMarron(1),
                    indicatorWeight: 4,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: [
                      CustomTab(0, 'R??cents'),
                      CustomTab(1, 'Dossiers'),
                    ],
                    controller: _tabController,
                  ),
                ),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TabBarView(
                        controller: _tabController,
                        children: const [
                          TabViewRecents(),
                          TabViewDossiers()
                        ],
                      ),
                    )
                )
              ],
            ),
          );
        }
      ),
    );
  }
}

class CustomTab extends StatelessWidget{
  int index;
  String title;
  CustomTab(this.index, this.title, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Consumer<HomeNavigationStatus>(
    builder: (context, status, child){
      return Text(title, style: (status.tabSelected == index)?StyleDeTexte.getTabTitleSelectedStyle(16):StyleDeTexte.getTabTitleStyle(16));
    },
  );
}


class HomeActionBTN extends StatelessWidget{ //Les boutons d'action
  late final Icon _icon;
  late final String _label, _destination;
  HomeActionBTN({Key? key, icon = Icon, label = String, destination = String}) : super(key: key){
    _icon = icon;
    _destination = destination;
    _label = label;
  }
  @override
  Widget build(BuildContext context){
    //ToDo: Impl??menter les fonctionnalit??s des action buttons
    return OutlinedButton(onPressed: (){/*context.goNamed(_destination);*/}, style: StyleDeBTN.getHomeActionBTNStyle(), child: _icon);
  }
}

class TabViewRecents extends StatefulWidget{
  const TabViewRecents({Key? key}) : super(key: key);

  @override
  State<TabViewRecents> createState() => _TabViewRecents();
}

class _TabViewRecents extends State<TabViewRecents>{
  @override
  Widget build(BuildContext context){
    return Container(
      color: Palette.getNoir(1),
      child: NotesListView.getRecentsView(),
    );
  }
}

class TabViewDossiers extends StatefulWidget{
  const TabViewDossiers({Key? key}) : super(key: key);
  @override
  State<TabViewDossiers> createState() => _TabViewDossiers();
}

class _TabViewDossiers extends State<TabViewDossiers>{
  @override
  Widget build(BuildContext context){
    return Container(color: Palette.getNoir(1),);
  }
}

class HomeNavigationStatus extends ChangeNotifier{
  int _tabSelected = 0;
  int get tabSelected => _tabSelected;
  set tabSelected(int i){_tabSelected = i; notifyListeners();}
}

FloatingActionButton buildFloatChild(IconData iconData){
  return FloatingActionButton(onPressed: (){}, child: Icon(iconData), backgroundColor: Palette.getBleu(1),);
}