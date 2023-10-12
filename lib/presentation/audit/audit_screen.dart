
import 'package:flutter/material.dart';
import 'package:petro_audit/presentation/audit/widgets/bottum_audit_section.dart';
import 'package:petro_audit/presentation/audit/widgets/top_graph_section.dart';


class ScreenAudit extends StatelessWidget {
  const ScreenAudit({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 20),
        TopSection(),
        Expanded(
          child: BottumSection(),
        )
      ],
    );
  }
}
