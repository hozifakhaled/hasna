import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';

class ColumnTextZaker extends StatelessWidget {
  const ColumnTextZaker({super.key, required this.zaker, required this.numberofzaker, required this.asnad, required this.onTap});
  
  final String zaker;
  final String numberofzaker;
  final String asnad;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
     
    
      child: InkWell(
        splashColor: Colors.grey,
        highlightColor:Colors.grey.shade300 ,
        onTap: onTap,
        child: Column(
          children: [
           
            SizedBox(height: 10.h),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                zaker,
                style: TextStyles.text15.copyWith(color: Colors.white),
              ),
            ),
             SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Divider(color: Colors.white, endIndent: 3, height: 3),
            ),
             SizedBox(height: 10.h),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                asnad,
                style: TextStyles.text12.copyWith(
                  color: Colors.white,
                  
                ),
                
              ),
            ),
        
           
            SizedBox(height: 10.h),
        
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                numberofzaker,
                style: TextStyles.text15.copyWith(color: Colors.white),
              ),
            ),
        
             SizedBox(height: 150.h),
        
          ],
        ),
      ),
    );
  }
}
