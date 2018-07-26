//----------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "RelFichaClientes.h"
#include "DMCliente.h"
//----------------------------------------------------------------------------
#pragma resource "*.dfm"
TQrpFichaCliente *QrpFichaCliente;
//----------------------------------------------------------------------------
__fastcall TQrpFichaCliente::TQrpFichaCliente(TComponent* Owner)
    : TQuickRep(Owner)
{
}
//----------------------------------------------------------------------------


void __fastcall TQrpFichaCliente::QuickRepBeforePrint(
      TCustomQuickRep *Sender, bool &PrintReport)
{
        IBQSetores->Close();
        IBQSetores->ParamByName("CDCONTRATO")->Value = DModuleCliente->CDSConsClienteCDCONTRATO->AsInteger;
        IBQSetores->Open();

        if(IBQSetores->IsEmpty()){
                QrlSetores->Caption = "Cadastro sem setores cadastrados";
        }else{
                QrlSetores->Caption = EmptyStr;
        }

        IBQContato->Close();
        IBQContato->ParamByName("CDCLIENTE")->Value = DModuleCliente->CDSConsClienteCDCLIENTE->AsInteger;
        IBQContato->Open();

        if(IBQContato->IsEmpty()){
                QrlSenhas->Caption = "Cadastro sem senhas cadastradas";
        }else{
                QrlSenhas->Caption = EmptyStr;
        }
}
//---------------------------------------------------------------------------

void __fastcall TQrpFichaCliente::QrbDetalheClienteAfterPrint(
      TQRCustomBand *Sender, bool BandPrinted)
{
        IBQSetores->Close();
        IBQSetores->ParamByName("CDCONTRATO")->Value = DModuleCliente->CDSConsClienteCDCONTRATO->AsInteger;
        IBQSetores->Open();

        if(IBQSetores->IsEmpty()){
                QrlSetores->Caption = "Cadastro sem setores cadastrados";
        }else{
                QrlSetores->Caption = EmptyStr;
        }

        IBQContato->Close();
        IBQContato->ParamByName("CDCLIENTE")->Value = DModuleCliente->CDSConsClienteCDCLIENTE->AsInteger;
        IBQContato->Open();

        if(IBQContato->IsEmpty()){
                QrlSenhas->Caption = "Cadastro sem senhas cadastradas";
        }else{
                QrlSenhas->Caption = EmptyStr;
        }
}
//---------------------------------------------------------------------------
/*
void __fastcall TFListRelatoriosAtendimento::BtnTotalEveHoraCliClick(TObject *Sender)
{
    try{
        AnsiString SQL_FILTRO_DATA = " SELECT "
            "     COUNT(EVE.STATUS) AS TOTAL, EVE.CDCLIENTE, EVE.NMCLIENTE, EVE.EQUIPAMENTO, "
            "     CAST( "
            "         LPAD(EXTRACT(YEAR FROM EVE.DATAEVENTO),4,'0') || '-' || "
            "         LPAD(EXTRACT(MONTH FROM EVE.DATAEVENTO),2,'0') || '-' || "
            "         LPAD(EXTRACT(DAY FROM EVE.DATAEVENTO),2,'0') "
            "     AS DATE) AS DATAEVENTO, "
            "     LPAD(EXTRACT(HOUR FROM EVE.DATAEVENTO),2,'0') AS HORAEVENTO, "
            "     LPAD(EXTRACT(DAY FROM EVE.DATAEVENTO),2,'0') || '/' || "
            "     LPAD(EXTRACT(MONTH FROM EVE.DATAEVENTO),2,'0') || '/' || "
            "     LPAD(EXTRACT(YEAR FROM EVE.DATAEVENTO),4,'0') || ' - ' || "
            "     LPAD(EXTRACT(HOUR FROM EVE.DATAEVENTO),2,'0') || 'H' AS DATAHORAEVENTO, "
            "     EVE.STATUS || '.' || REPLACE(EVE.REFERENCIA, 'F', '*') AS STATUS, EVE.DESTATUS, "
            "     CASE "
            "         WHEN TRIM(EVE.NUMSETOR) <> '' AND TRIM(EVE.NUMSETOR) <> 'FF' THEN "
            "             REPLACE(EVE.NUMSETOR, 'F', '') || ' - ' || EVE.LOCAL "
            "         ELSE NULL END AS LOCAL "
            " FROM LOGEVENTO EVE "
            " WHERE EVE.CDCLIENTE > 0 AND EVE.DATAEVENTO BETWEEN :DATAINICIAL AND :DATAFINAL"
            " GROUP BY EVE.CDCLIENTE, EVE.NMCLIENTE, EVE.EQUIPAMENTO, DATAEVENTO, HORAEVENTO, DATAHORAEVENTO, STATUS, EVE.DESTATUS, LOCAL "
            " ORDER BY EVE.NMCLIENTE, DATAEVENTO, HORAEVENTO, TOTAL DESC";


        AnsiString SQL_FILTRO = SQL_FILTRO_DATA;
        AnsiString SQL_FILTRO_CODIGO = SQL_FILTRO_DATA + " AND EVE.CDCLIENTE = :CDCLIENTE";
        AnsiString SQL_FILTRO_NOME = SQL_FILTRO_DATA   + " AND EVE.NMCLIENTE LIKE UPPER(:NMCLIENTE)";
        AnsiString SQL_FILTRO_CODIFICADOR = SQL_FILTRO_DATA + " AND EVE.EQUIPAMENTO = :EQUIPAMENTO";

        CDSRelAtendimento->Close();
        IBQRelAtendimento->SQL->Clear();
        IBQRelAtendimento->SQL->Text = SQL_FILTRO;

        int CodigoCliente = StrToIntDef(EdtCodClienteTotais->Text, 0);
        AnsiString NomeCliente = EdtNomeTotais->Text;
        int Codificador = StrToIntDef(EdtCodificadorTotais->Text, 0);;
        AnsiString Estatus = EdtStatusTotais->Text;
        AnsiString StatusDescricao = EdtStatusDescricaoTotais->Text;

        if(CodigoCliente > 0){
            CDSRelAtendimento->Close();
            IBQRelAtendimento->SQL->Clear();
            SQL_FILTRO = SQL_FILTRO_CODIGO;
            IBQRelAtendimento->SQL->Text = SQL_FILTRO;

        }else if(NomeCliente != ""){
            CDSRelAtendimento->Close();
            IBQRelAtendimento->SQL->Clear();
            SQL_FILTRO = SQL_FILTRO_NOME;
            IBQRelAtendimento->SQL->Text = SQL_FILTRO;

        }else if(Codificador > 0){
            CDSRelAtendimento->Close();
            IBQRelAtendimento->SQL->Clear();
            SQL_FILTRO = SQL_FILTRO_CODIFICADOR;
            IBQRelAtendimento->SQL->Text = SQL_FILTRO;
        }

        if(Estatus != ""){
            CDSRelAtendimento->Close();
            IBQRelAtendimento->SQL->Clear();
            SQL_FILTRO = SQL_FILTRO + " AND EVE.STATUS LIKE :STATUS";
            IBQRelAtendimento->SQL->Text = SQL_FILTRO;
            IBQRelAtendimento->ParamByName("STATUS")->Size = 5;

        }else if(StatusDescricao != ""){
            CDSRelAtendimento->Close();
            IBQRelAtendimento->SQL->Clear();
            SQL_FILTRO = SQL_FILTRO + " AND EVE.DESTATUS LIKE :DESTATUS";
            IBQRelAtendimento->SQL->Text = SQL_FILTRO;
        }

        ConfiguraCriteriosSQL();

        IBQRelAtendimento->ParamByName("DATAINICIAL")->AsDate = EdtDataInicialTotais->Date;
        IBQRelAtendimento->ParamByName("DATAFINAL")->AsDate = EdtDataFinalTotais->Date;
        CDSRelAtendimento->Active = true;
        int totalRegistros = CDSRelAtendimento->RecordCount;

        if(totalRegistros > 0){
            QRPTopEventosClienteHora->DataSet = CDSRelAtendimento;
            QRPTopEventosClienteHora->PreviewModal();
        }else{
            Application->MessageBox("Nenhum registro localizado", "Sucesso", MB_ICONINFORMATION|MB_OK);
        }

        if(IBTRelAtendimento->InTransaction){
            IBTRelAtendimento->Commit();
        }

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao consultar os totais de eventos por hora.\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }
}
*/
//---------------------------------------------------------------------------
/*
void __fastcall TFListRelatoriosAtendimento::BtnTotalEveDataCliClick(
      TObject *Sender)
{
    try{
        AnsiString SQL_FILTRO_DATA = "SELECT TOTAL, CDCLIENTE, NMCLIENTE, EQUIPAMENTO, "
            " DATAEVENTO, STATUS, DESTATUS, LOCAL "
            "FROM VLOGEVE_TOTAIS_CLIENTE_DATA WHERE DATAEVENTO BETWEEN :DATAINICIAL AND :DATAFINAL";

        AnsiString SQL_FILTRO = SQL_FILTRO_DATA;
        AnsiString SQL_FILTRO_CODIGO = SQL_FILTRO_DATA + " AND CDCLIENTE = :CDCLIENTE";
        AnsiString SQL_FILTRO_NOME = SQL_FILTRO_DATA   + " AND NMCLIENTE LIKE UPPER(:NMCLIENTE)";
        AnsiString SQL_FILTRO_CODIFICADOR = SQL_FILTRO_DATA + " AND EQUIPAMENTO = :EQUIPAMENTO";

        CDSRelAtendimento->Close();
        IBQRelAtendimento->SQL->Clear();
        IBQRelAtendimento->SQL->Text = SQL_FILTRO;

        int CodigoCliente = StrToIntDef(EdtCodClienteTotais->Text, 0);
        AnsiString NomeCliente = EdtNomeTotais->Text;
        int Codificador = StrToIntDef(EdtCodificadorTotais->Text, 0);;
        AnsiString Estatus = EdtStatusTotais->Text;
        AnsiString StatusDescricao = EdtStatusDescricaoTotais->Text;

        if(CodigoCliente > 0){
            CDSRelAtendimento->Close();
            IBQRelAtendimento->SQL->Clear();
            SQL_FILTRO = SQL_FILTRO_CODIGO;
            IBQRelAtendimento->SQL->Text = SQL_FILTRO;

        }else if(NomeCliente != ""){
            CDSRelAtendimento->Close();
            IBQRelAtendimento->SQL->Clear();
            SQL_FILTRO = SQL_FILTRO_NOME;
            IBQRelAtendimento->SQL->Text = SQL_FILTRO;

        }else if(Codificador > 0){
            CDSRelAtendimento->Close();
            IBQRelAtendimento->SQL->Clear();
            SQL_FILTRO = SQL_FILTRO_CODIFICADOR;
            IBQRelAtendimento->SQL->Text = SQL_FILTRO;
        }

        if(Estatus != ""){
            CDSRelAtendimento->Close();
            IBQRelAtendimento->SQL->Clear();
            SQL_FILTRO = SQL_FILTRO + " AND STATUS LIKE :STATUS";
            IBQRelAtendimento->SQL->Text = SQL_FILTRO;
            IBQRelAtendimento->ParamByName("STATUS")->Size = 5;

        }else if(StatusDescricao != ""){
            CDSRelAtendimento->Close();
            IBQRelAtendimento->SQL->Clear();
            SQL_FILTRO = SQL_FILTRO + " AND DESTATUS LIKE :DESTATUS";
            IBQRelAtendimento->SQL->Text = SQL_FILTRO;
        }

        ConfiguraCriteriosSQL();

        IBQRelAtendimento->ParamByName("DATAINICIAL")->AsDate = EdtDataInicialTotais->Date;
        IBQRelAtendimento->ParamByName("DATAFINAL")->AsDate = EdtDataFinalTotais->Date;
        CDSRelAtendimento->Active = true;
        int totalRegistros = CDSRelAtendimento->RecordCount;

        if(totalRegistros > 0){
            QRPTopEventosClienteData->DataSet = CDSRelAtendimento;
            QRPTopEventosClienteData->PreviewModal();
        }else{
            Application->MessageBox("Nenhum registro localizado", "Sucesso", MB_ICONINFORMATION|MB_OK);
        }

        if(IBTRelAtendimento->InTransaction){
            IBTRelAtendimento->Commit();
        }

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao consultar os totais de eventos por data.\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }
}
*/
//---------------------------------------------------------------------------

