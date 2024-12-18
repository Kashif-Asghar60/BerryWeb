import 'dart:async';
import 'dart:io';

import 'package:background_fetch/background_fetch.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
  BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dio Background Download',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

const List<String> _urls = [
  'https://samplelib.com/lib/preview/mp4/sample-5s.mp4',
  'https://samplelib.com/lib/preview/mp4/sample-30s.mp4'
];

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ProgressInfo> _progressInfos = [];
  int _totalProgress = 0;
  int _totalRetries = 3;
  bool _allCompleted = false;

  @override
  void initState() {
    super.initState();
    _prepare();
    BackgroundFetch.configure(
        BackgroundFetchConfig(
            minimumFetchInterval: 15,
            stopOnTerminate: false,
            enableHeadless: true,
            requiresBatteryNotLow: false,
            requiresCharging: false,
            requiresStorageNotLow: false,
            requiresDeviceIdle: false,
            requiredNetworkType: NetworkType.ANY),
        _onBackgroundFetch);
  }

  void _prepare() async {
    Directory? directory = await getExternalStorageDirectory();
    if (directory != null) {
      _startDownload(directory.path);
    }
  }

  void _startDownload(String path) {
    for (String url in _urls) {
      final progressInfo =
          ProgressInfo(url: url, progress: 0, retriesLeft: _totalRetries);
      _progressInfos.add(progressInfo);

      _downloadFileWithRetry(url, path, progressInfo);
    }
  }

  void _downloadFileWithRetry(
      String url, String path, ProgressInfo progressInfo) async {
    await downloadFile(
      url,
      path,
      (progress) {
        setState(() {
          progressInfo.progress = progress;
          _updateTotalProgress();
        });
      },
    );

    if (progressInfo.progress == -1 && progressInfo.retriesLeft > 0) {
      progressInfo.retriesLeft--;
      Timer(Duration(seconds: 2), () {
        _downloadFileWithRetry(url, path, progressInfo);
      });
    } else if (progressInfo.progress == 100) {
      _checkCompletion();
    }
  }

  void _updateTotalProgress() {
    int totalDownloaded = _progressInfos.fold(
        0,
        (sum, info) =>
            sum + (info.progress > 0 ? info.progress : 0)); // Ignore failures
    _totalProgress = (totalDownloaded / (_urls.length * 100) * 100).toInt();
  }

  void _checkCompletion() {
    if (_progressInfos.every((info) => info.progress == 100)) {
      setState(() {
        _allCompleted = true;
      });
    }
  }

  void _onBackgroundFetch(String taskId) async {
    print('BackgroundFetch event received for task: $taskId');
    Directory? directory = await getExternalStorageDirectory();
    if (directory != null) {
      String path = directory.path;
      for (String url in _urls) {
        await downloadFile(url, path, null); // No UI updates in background
      }
    }
    BackgroundFetch.finish(taskId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dio Background Download'),
      ),
      body: Column(
        children: [
          if (_totalProgress > 0)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LinearProgressIndicator(value: _totalProgress / 100),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: _progressInfos.length,
              itemBuilder: (context, index) {
                final info = _progressInfos[index];
                return ListTile(
                  title: Text(info.url.split('/').last),
                  subtitle: Text(
                    info.progress == -1
                        ? 'Download failed, retries left: ${info.retriesLeft}'
                        : '${info.progress}%',
                  ),
                  trailing: info.progress == -1
                      ? ElevatedButton(
                          onPressed: () async {
                            Directory? directory =
                                await getExternalStorageDirectory();
                            if (directory != null) {
                              // Retry only the failed download
                              _downloadFileWithRetry(
                                  info.url, directory.path, info);
                            }
                          },
                          child: Text('Retry'),
                        )
                      : (info.progress == 100
                          ? Icon(Icons.check, color: Colors.green)
                          : CircularProgressIndicator(
                              value: info.progress / 100,
                            )),
                );
              },
            ),
          ),
          if (_allCompleted)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'All downloads completed!',
                style: TextStyle(color: Colors.green, fontSize: 16),
              ),
            ),
        ],
      ),
    );
  }
}

Future<void> downloadFile(
    String url, String savePath, Function(int progress)? onProgress) async {
  Dio dio = Dio();
  String fileName = url.split('/').last;
  String fullPath = '$savePath/$fileName';

  try {
    await dio.download(
      url,
      fullPath,
      onReceiveProgress: (received, total) {
        if (total != -1 && onProgress != null) {
          onProgress((received / total * 100).toInt());
        }
      },
    );
    if (onProgress != null) {
      onProgress(100); // Mark as complete
    }
    print("Downloaded $fileName successfully");
  } on DioError catch (e) {
    if (onProgress != null) {
      onProgress(-1); // Signal failure
    }
    print('Download failed for $url: ${e.message}');
  }
}

class ProgressInfo {
  final String url;
  int progress;
  int retriesLeft;
  ProgressInfo(
      {required this.url, required this.progress, required this.retriesLeft});
}

// Define the headless task
@pragma('vm:entry-point')
void backgroundFetchHeadlessTask(HeadlessTask task) async {
  String taskId = task.taskId;
  print('[BackgroundFetch] Headless event received for task: $taskId');
  if (task.timeout) {
    print('[BackgroundFetch] Task timeout: $taskId');
    BackgroundFetch.finish(taskId);
    return;
  }
  Directory? directory = await getExternalStorageDirectory();
  if (directory != null) {
    String path = directory.path;
    for (String url in _urls) {
      await downloadFile(url, path, null);
    }
  }
  BackgroundFetch.finish(taskId);
}
