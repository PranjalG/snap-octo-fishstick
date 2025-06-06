import 'package:flutter/material.dart';
import 'package:layout/data_models/api_result_data_model.dart';
import 'package:layout/services/remote_api.dart';
import 'package:layout/services/routes.dart';

class PaginationScreen extends StatefulWidget {
  const PaginationScreen({super.key});

  @override
  State<PaginationScreen> createState() => _PaginationScreenState();
}

class _PaginationScreenState extends State<PaginationScreen> {
  Future<ApiResultData?>? _dataFuture;

  @override
  void initState() {
    super.initState();
    _dataFuture = RemoteApi.getDataList(1, 8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagination Screen'),
        backgroundColor: Colors.cyan,
      ),
      body: FutureBuilder<ApiResultData?>(
        future: _dataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(
              child: Text('No data received or an error occurred.'),
            );
          } else {
            final result = snapshot.data!;
            return ListView.builder(
              itemCount: result.docs?.length,
              itemBuilder: (context, index) {
                final doc = result.docs?[index];
                return Container(
                  height: 160,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    // color: Color(0xff4A94D5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Author(s): ${doc?.authorName}',
                          style: const TextStyle(
                              color: Colors.brown,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Key: ${doc?.authorKey}',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
