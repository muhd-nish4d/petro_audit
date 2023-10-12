import 'package:flutter/material.dart';
import 'package:petro_audit/models/status_enum.dart';
import 'package:petro_audit/provider/audit_provider.dart';
import 'package:provider/provider.dart';

class BottumSection extends StatelessWidget {
  const BottumSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AuditProvider>(builder: (context, value, child) {
      return value.status == CallStatus.success
          ? ListView.builder(
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) {
                var datas = value.auditData![index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          datas.auditTitle ?? 'No Title',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        ListTile(
                          leading: Text(datas.conductedByEmpName != ''
                              ? datas.conductedByEmpName
                              : 'Unknown'),
                          title: Text(
                              datas.auditLocation ?? "Didn't provide location"),
                          trailing: Text(
                            datas.auditStatus ?? '',
                            style: TextStyle(
                                color: datas.auditStatus == 'In Progress'
                                    ? Colors.orange
                                    : datas.auditStatus == 'Closed'
                                        ? Colors.green
                                        : Colors.red),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: value.auditData!.length,
            )
          : value.status == CallStatus.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const Center(
                  child: Icon(Icons.wifi_find_rounded),
                );
    });
  }
}
