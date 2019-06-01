import 'package:flutter/material.dart';
import 'dart:async';
import 'package:async_loader/async_loader.dart';
import 'package:jobsearcher_flutter/models/login_model.dart';
//Pages
import 'dashboard_pages/job_list.dart';
import 'dashboard_pages/my_jobs.dart';
import 'dashboard_pages/my_profile.dart';
import 'package:dio/dio.dart';

//Models
import 'package:jobsearcher_flutter/models/dashboard.model.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  static TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<Widget> _widgetOptions = <Widget>[
    Home(),
    JobList(),
    MyJobs(),
    MyProfile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  } // On click Listener

  final GlobalKey<AsyncLoaderState> asyncLoaderState =
      new GlobalKey<AsyncLoaderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text('Job List')),
          BottomNavigationBarItem(
              icon: Icon(Icons.work), title: Text('My Jobs')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Profile'))
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text('dummy@gmail.com'),
              accountName: Text('Dummy'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/a.jpg'),
              ),
            ),
            ListTile(
              title: Text('Dashboard'),
              leading: Icon(Icons.dashboard),
            ),
            ListTile(
              title: Text('Job List'),
              leading: Icon(Icons.search),
            ),
            ListTile(
              title: Text('My Jobs'),
              leading: Icon(Icons.work),
            ),
            ListTile(
              title: Text('My Profile'),
              leading: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static final GlobalKey<AsyncLoaderState> asyncLoaderState =
      new GlobalKey<AsyncLoaderState>();
  static List<String> items = [
    'Category',
    'Category',
    'Categoasfasfafafry',
    'Category',
    'Category',
    'Categorsy',
    'Category',
    'Category'
  ];
  static List<String> images = [
    'assets/a.jpg',
    'assets/b.jpg',
    'assets/c.jpg',
    'assets/d.jpeg',
    'assets/e.jpg',
    'assets/a.jpg',
    'assets/a.jpg',
    'assets/b.jpg',
    'assets/c.jpg',
    'assets/d.jpeg',
    'assets/e.jpg',
    'assets/a.jpg',
    'assets/a.jpg',
    'assets/b.jpg',
    'assets/c.jpg',
    'assets/d.jpeg',
    'assets/e.jpg',
    'assets/a.jpg',
    'assets/b.jpg',
    'assets/c.jpg'
  ];

  List trendingjobs = map<Widget>(images, (index, i) {
    return Container(
      width: 200.0,
      child: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.all(4.0),
              padding: EdgeInsets.only(right: 8.0, left: 8.0),
              child: Center(
                child: Image.asset(i),
              )),
          Text('Data')
        ],
      ),
    );
  }).toList();

  static List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  static final CREATE_POST_URL =
      'http://ec2-52-15-37-169.us-east-2.compute.amazonaws.com:3000/jobsearcher/api/dashboard';

  static Widget getDashboardData(DashboardModel items) {
    return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Text('Job Searchers'),
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  title: Text("",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background: Image.network(
                    "https://findmyemployment.com/blog/wp-content/uploads/2019/02/jobsearch.jpg",
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment(-1.0, 0),
                margin: EdgeInsets.all(16.0),
                child: Text(
                  'Categories',
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 8.0, right: 8.0),
                child: SizedBox(
                  height: 40.0,
                  child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: items.data.categories.length,
                    itemBuilder: (BuildContext context, int index) => InkWell(
                          
                          child: Container(
                            margin: EdgeInsets.all(4.0),
                            padding: EdgeInsets.only(left:8.0,right: 8.0),
                            child: Center(
                                child:
                                    Text(items.data.categories[index].title)),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey[300]),
                          ),
                        ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment(-1.0, 0),
                margin: EdgeInsets.all(16.0),
                child: Text(
                  'Trending Jobs',
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 8.0, right: 8.0),
                child: SizedBox(
                  height: 150.0,
                  child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: items.data.jobs.length,
                    itemBuilder: (BuildContext context, int index) => InkWell(onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => JobDetail()),
                            )
                          },child:Card(
                          margin: EdgeInsets.all(4.0),
                          child: Container(
                            width: 200.0,
                            height: 150,
                            child: Column(
                              children: <Widget>[
                                Image.network(items.data.jobs[index].image),
                                Container(
                                  child: Text(items.data.jobs[index].title),
                                  alignment: Alignment(-1.0, 0.0),
                                  margin: EdgeInsets.all(4.0),
                                )
                              ],
                            ),
                          ),
                        ),)
                  ),
                ),
              )
            ],
          ),
        ));
  }

  static Widget getNoConnectionWidget() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 60.0,
          child: new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage('assets/no-wifi.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        new Text("No Internet Connection"),
        new FlatButton(
            color: Colors.red,
            child: new Text(
              "Retry",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => asyncLoaderState.currentState.reloadState())
      ],
    );
  }

  var _asyncLoader = new AsyncLoader(
    key: asyncLoaderState,
    initState: () async {
      try {
        Response response = await Dio().get(CREATE_POST_URL);
        return response.data;
      } catch (e) {
        print(e);
      }
    },
    renderLoad: () => Center(child: new CircularProgressIndicator()),
    renderError: ([error]) => getNoConnectionWidget(),
    renderSuccess: ({data}) =>
        getDashboardData(new DashboardModel.fromJson(data)),
  );
  @override
  Widget build(BuildContext context) {
    return new Center(child: _asyncLoader);
  }
}

class JobDetail extends StatefulWidget {
  @override
  _JobDetailState createState() => _JobDetailState();
}

class _JobDetailState extends State<JobDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text("Job Title",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                    background: Image.network(
                      "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                      fit: BoxFit.cover,
                    )),
              ),
            ];
          },
          body: Center(
            child: Text("Sample Text"),
          ),
        ));
  }

}
