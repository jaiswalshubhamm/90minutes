import '../models/transfer.dart';
import '../network/httpClient.dart';
import '../network/apiPath.dart';

class TransferService {
  Future<Transfers> fetchTransfers(Map<String, String> params) async {
    final response = await HttpClient.instance.fetchData(
        APIPathHelper.getValue(APIPath.fetch_transfers),
        params: params);
    return Transfers.fromJson(response);
  }
}
