import 'package:flutter/material.dart';
import 'package:Queszz/presentation/viewmodels/home_viewmodel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<HomeViewModel>(context, listen: false).loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.settings_outlined),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
        title: Text("Queszz"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Material(
          color: Theme.of(context).primaryColor,
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  child: Image.network(
                    "https://picsum.photos/id/1014/200",
                  ),
                ),
                accountName: Text("John Doe"),
                accountEmail: Text("johndoe@gmail.com"),
              ),
              ListTile(
                title: Text(
                  "Leadboard",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "Statistics",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "Share",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context).letsPlay,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Text(
                AppLocalizations.of(context).chooseCategory,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
              ),
              if (viewModel.uiState == UIState.Loading)
                CircularProgressIndicator(),
              if (viewModel.uiState == UIState.Loading) Text("Error"),
              if (viewModel.uiState == UIState.Success)
                Expanded(
                  child: ListView.builder(
                    itemCount: viewModel.categoryList.length,
                    itemBuilder: (context, index) {
                      final category = viewModel.categoryList[index];

                      return Text(category.name);
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
