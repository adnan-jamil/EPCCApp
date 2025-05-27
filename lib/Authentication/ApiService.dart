import 'dart:convert';
import 'dart:developer';
import 'dart:io';
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
      log("File not found");
      return null;
    }
  } catch (e) {
    log("Error reading file: $e");
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
  final apiUrl = "https://epcc.ap.ngrok.io/power/iflpowapi.php";
  final cacheFileName = "API_EPCC_Cache";

  // Fetch details with file-based caching
  Future<List<dynamic>> fetchDetails() async {
    try {
      // log("Fetch details function calling...");

      // Check if cache exists in the file
      String? cachedData = await readDataFromFile(cacheFileName);
      if (cachedData == null) {
        // log("Cache not found, making network request to $apiUrl");

        // Make network request
        var response = await get(apiUrl);
        if (response.status.hasError) {
          log("Error fetching data: ${response.statusText}");
          return Future.error(response.statusText!);
        } else {
          var body = jsonEncode(response.body);
          log("Network request successful, saving data to file");

          // Save API response to a file for caching
          await writeDataToFile(cacheFileName, body);

          // Return the response data
          return [response.body["status"], response.body["data"]];
        }
      } else {
        log("Cache found, using cached data...");
        // Use cached data
        var response = jsonDecode(cachedData);
        return [response['status'], response['data']];
      }
    } catch (e) {
      log("An error occurred: $e");
      return [];
    }
  }

  // Function to fetch and update cache
  void getResponse() async {
    try {
      // log("Making network request to $apiUrl...");
      var response = await get(apiUrl);
      if (response.statusCode == 200) {
        var body = jsonEncode(response.body);
        log("Received data successfully: ${response.body}");
        // log("Received data successfully");

        // Clear the existing cache
        // log("Clearing existing cache...");
        await clearCacheFile(cacheFileName);

        // Save new data to cache file
        // log("Saving new data to file...");
        await writeDataToFile(cacheFileName, body);
      } else {
        log("Unexpected status code: ${response.statusCode}");
      }
    } catch (e) {
      log("An error occurred while fetching data: $e");
    }
  }
}
