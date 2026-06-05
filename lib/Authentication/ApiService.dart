import 'dart:convert';
import 'dart:io';
import 'package:epcc/Models/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

// Function to write data to a file
Future<void> writeDataToFile(String filename, String data) async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/$filename.json');
  await file.writeAsString(data);
  // log("Data saved to file: ${file.path}");
}

// Function to read data from a file
Future<String?> readDataFromFile(String filename) async {
  try {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$filename.json');
    if (await file.exists()) {
      String fileData = await file.readAsString();
      // log("Data retrieved from file: $fileData");
      return fileData;
    } else {
      return null;
    }
  } catch (e) {
    debugPrint("Error reading file: $e");
    return null;
  }
}

// Function to clear cache by deleting the file
Future<void> clearCacheFile(String filename) async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/$filename.json');
  if (await file.exists()) {
    await file.delete();
    // log("Cache file deleted");
  } else {
    // log("Cache file not found");
  }
}

class ApiService extends GetConnect {
  final cacheFileName = "API_EPCC_Cache";

  // Fetch details with file-based caching
  Future<List<dynamic>> fetchDetails() async {
    try {
      // log("Fetch details function calling...");

      // Check if cache exists in the file
      String? cachedData = await readDataFromFile(cacheFileName);
      if (cachedData == null) {
        // Make network request
        var response =
            await get(Constant.powerEndpoint, headers: Constant.apiHeaders);
        if (response.status.hasError) {
          return Future.error(response.statusText!);
        } else {
          var body = jsonEncode(response.body);

          // Save API response to a file for caching
          await writeDataToFile(cacheFileName, body);

          // Return the response data
          return [response.body["status"], response.body["data"]];
        }
      } else {
        // Use cached data
        var response = jsonDecode(cachedData);
        return [response['status'], response['data']];
      }
    } catch (e) {
      debugPrint("An error occurred: $e");
      return [];
    }
  }

  // Function to fetch and update cache
  void getResponse() async {
    try {
      var response =
          await get(Constant.powerEndpoint, headers: Constant.apiHeaders);
      if (response.statusCode == 200) {
        var body = jsonEncode(response.body);
        await clearCacheFile(cacheFileName);
        await writeDataToFile(cacheFileName, body);
      }
    } catch (e) {
      debugPrint("An error occurred while fetching data: $e");
    }
  }
}
