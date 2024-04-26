import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo_project/Model/BusinessesModel.dart';

class BusinessDetails extends StatefulWidget {
  Business businessesList;
  BusinessDetails(this.businessesList, {super.key});

  @override
  State<BusinessDetails> createState() => _BusinessDetailsState();
}

class _BusinessDetailsState extends State<BusinessDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // FFFCF5
      backgroundColor: const Color(0xffFFFCF5),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Business Details Screen"),
      ),
      body: Container(
        color: const Color(0xffFFFBF2),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 2.0,
                        color: Color.fromRGBO(0, 0, 0, 0.16),
                        offset: Offset(2, 2),
                      ),
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.6,
                          child: Text(widget.businessesList.name.toString(),style: const TextStyle(
                            fontSize: 18,
                            overflow: TextOverflow.ellipsis
                          ),),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff003087),
                          ),

                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          child: Row(
                            children: [
                              const Icon(Icons.star,color: Colors.white,size: 15,),
                              const SizedBox(width: 5,),
                              Text(widget.businessesList.rating.toString(),style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15
                              ),),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),

                    SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(

                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.yellowAccent.shade100,width: 2),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(widget.businessesList.categories![index].alias.toString()),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(width: 20,);
                        }, itemCount: widget.businessesList.categories!.length,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      color: Colors.red,
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: widget.businessesList.imageUrl.toString(),
                        progressIndicatorBuilder: (context, url, downloadProgress) =>
                            CircularProgressIndicator(value: downloadProgress.progress),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    const SizedBox(height: 20,),

                    Row(
                      children: [
                        const Text("Address:- ",style: TextStyle(fontSize: 18),),

                        Flexible(
                          child: Text("${ widget.businessesList.location?.displayAddress![0] ?? ""}, "
                              "${ widget.businessesList.location?.displayAddress![1] ?? ""}, "
                            "${widget.businessesList.location!.displayAddress!.length >= 3 ? widget.businessesList.location!.displayAddress![2] : ""}"

                            ,style: TextStyle(fontSize: 18),maxLines: 3,),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        const Text("Phone No:- ",style: TextStyle(fontSize: 18),),

                        Text("${ widget.businessesList.phone ?? ""},"
                          ,style: const TextStyle(fontSize: 18),),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        const Text("landline No:- ",style: TextStyle(fontSize: 18),),

                        Text("${ widget.businessesList.displayPhone ?? ""},"
                          ,style: const TextStyle(fontSize: 18),),
                      ],
                    ),
                    const SizedBox(height: 10,),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }
}
