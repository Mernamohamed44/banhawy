import 'package:banhawy/core/dio_helper/dio_helper.dart';
import 'package:banhawy/core/models/operation_details_model/operation_details_model.dart';
import 'package:bloc/bloc.dart';
import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'operation_details_screen_state.dart';

class OperationsDetailsScreenCubit extends Cubit<OperationsDetailsScreenState> {
  OperationsDetailsScreenCubit() : super(InitialState());
  OperationDetailsModel? operationDetailsModel;
  void fetchOperation() {
    emit(FetchOperationDetailsLoadingState());
    DioHelper.get('fetch_patient_home').then((value) {
      operationDetailsModel = OperationDetailsModel.fromJson(value.data);
      print(operationDetailsModel!.message);
      emit(FetchOperationDetailsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(FetchOperationDetailsErrorState());
    });
  }

  Future<Uint8List> generatePdf(PdfPageFormat format, String title) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    final font = await PdfGoogleFonts.nunitoExtraLight();

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Column(
            children: [
              pw.SizedBox(
                width: double.infinity,
                child: pw.FittedBox(
                  child: pw.Text(title, style: pw.TextStyle(font: font)),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Flexible(child: pw.FlutterLogo())
            ],
          );
        },
      ),
    );

    return pdf.save();
  }
}
