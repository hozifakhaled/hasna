import 'package:flutter/material.dart';
import 'package:hasna/constants/images.dart';

class ZekrOptionsMenu extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ZekrOptionsMenu({
    super.key,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        if (value == 'edit') {
          onEdit();
        } else if (value == 'delete') {
          onDelete();
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem<String>(
          value: 'edit',
          child: Text('تعديل'),
        ),
        const PopupMenuItem<String>(
          value: 'delete',
          child: Text('حذف'),
        ),
      ],
      icon: Image.asset(
        Assets.imagesMorevertical, 
        width: 24,
        height: 24,
      ),
    );
  }
}
