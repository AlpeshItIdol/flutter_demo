import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ViewModel/BusinessViewModel.dart';
import 'BusinessDetails.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final BusinessViewModel _businessViewModel = BusinessViewModel();

  @override
  void initState() {
    _businessViewModel.sendGetRequest(data: "NYC");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFFFCF5),
        title: Text("Test demo"),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _businessViewModel.search,
                  onChanged: (value){

                    _businessViewModel.search.text = value;
                    _businessViewModel.sendGetRequest(data: _businessViewModel.search.text.toString());
                  },
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: InkWell(
                      onTap: (){
                        _businessViewModel.search.clear();
                         _businessViewModel.sendGetRequest(data: _businessViewModel.search.text.toString());

                      },
                        child: Icon(Icons.cancel)),
                    contentPadding: EdgeInsets.only(top: 1,bottom: 1),
                    border: const OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(7.0)),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),


              _businessViewModel.businessesList.isEmpty ?
                  Center(
                    child: Container(
                      child: Text("No Data Found"),
                    ),
                  ):
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.77,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: _businessViewModel.businessesList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => BusinessDetails(_businessViewModel.businessesList[index])));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 2.0,
                                    color: Color.fromRGBO(0, 0, 0, 0.16),
                                    offset: Offset(2, 2),
                                  ),
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(_businessViewModel
                                  .businessesList[index].name
                                  .toString()),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
