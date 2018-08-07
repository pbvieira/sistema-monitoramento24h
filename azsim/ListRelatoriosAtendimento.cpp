//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include <Dateutils.hpp>
#include "RelTopEventos.h"
#include "RelTopEventosClienteData.h"
#include "RelTopEventosClienteHora.h"
#include "ReportEventosUnit.h"
#include "ListRelatoriosAtendimento.h"

#include "DMApp.h"
#include "RelOcorrenciasEncerradas.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFListRelatoriosAtendimento *FListRelatoriosAtendimento;

//---------------------------------------------------------------------------

__fastcall TFListRelatoriosAtendimento::TFListRelatoriosAtendimento(TComponent* Owner)
    : TForm(Owner)
{
    EdtDataInicialTotais->Date = IncDay(DModule->RetornaDataHoraAtual(), -1);
    EdtDataFinalTotais->Date   = IncDay(DModule->RetornaDataHoraAtual(),  2);

    QRPTopEventos              = new TQRPTopEventos(this);
    QRPTopEventosClienteHora   = new TQRPTopEventosClienteHora(this);
    QRPTopEventosClienteData   = new TQRPTopEventosClienteData(this);
    ReportEventos              = new TReportEventos(this);
    QRPOcorrenciasEncerradas   = new TQRPOcorrenciasEncerradas(this);
}

//---------------------------------------------------------------------------

void __fastcall TFListRelatoriosAtendimento::FormClose(TObject *Sender,
      TCloseAction &Action)
{
    CDSRelAtendimento->Close();
    QRPTopEventosClienteHora->Free();
    QRPTopEventosClienteData->Free();
    ReportEventos->Free();
    QRPOcorrenciasEncerradas->Free();
    Action = caFree;
}

//---------------------------------------------------------------------------

void __fastcall TFListRelatoriosAtendimento::BtnFecharClick(
      TObject *Sender)
{
    Close();
}

//---------------------------------------------------------------------------

void __fastcall TFListRelatoriosAtendimento::ConfiguraCriteriosSQL()
{
    int CodigoCliente = StrToIntDef(EdtCodClienteTotais->Text, 0);
    AnsiString NomeCliente = EdtNomeTotais->Text;
    int Codificador = StrToIntDef(EdtCodificadorTotais->Text, 0);;
    AnsiString Estatus = EdtStatusTotais->Text;
    AnsiString StatusDescricao = EdtStatusDescricaoTotais->Text;

    if(CodigoCliente > 0){
        IBQRelAtendimento->ParamByName("CDCLIENTE")->AsInteger = CodigoCliente;
    }else if(NomeCliente != ""){
        IBQRelAtendimento->ParamByName("NMCLIENTE")->AsString = "%" + NomeCliente + "%";
    }else if(Codificador > 0){
        IBQRelAtendimento->ParamByName("EQUIPAMENTO")->AsInteger = Codificador;
    }

    if(Estatus != ""){
        if(StrLen(Estatus.c_str()) < 4){
            IBQRelAtendimento->ParamByName("STATUS")->AsString = Estatus + "%";
        }else{
            IBQRelAtendimento->ParamByName("STATUS")->AsString = Estatus;
        }
    }else if(StatusDescricao != ""){
        IBQRelAtendimento->ParamByName("DESTATUS")->AsString = "%" + StatusDescricao + "%";
    }
}

//---------------------------------------------------------------------------


void __fastcall TFListRelatoriosAtendimento::BtnEventosClick(
      TObject *Sender)
{
    try{
        AnsiString ORDER_BY = " ORDER BY E.NMCLIENTE, E.DATAEVENTO";
        AnsiString SQL_FILTRO_DATA = "SELECT E.CDCLIENTE, E.EQUIPAMENTO, E.DATAEVENTO, "
          "    CASE WHEN C.NMFANTASIA IS NULL THEN C.NMCLIENTE ELSE C.NMFANTASIA END AS NMCLIENTE, "
          "    E.STATUS || '.' || REPLACE(E.REFERENCIA, 'F', '*') AS STATUS, "
          "    E.DESTATUS, "
          "    CASE "
          "        WHEN TRIM(S.SETOR) <> '' AND TRIM(E.NUMSETOR) <> 'FF' THEN "
          "            REPLACE(E.NUMSETOR, 'F', '') || ' - ' || E.LOCAL "
          "        ELSE NULL END AS LOCAL "
          "FROM LOGEVENTO E JOIN STATUS S ON E.STATUS = S.ESTATUS AND E.REFERENCIA = S.REFERENCIA1 "
          "JOIN CLIENTE C ON E.CDCLIENTE = C.CDCLIENTE "
          "WHERE E.CDCLIENTE > 0 AND E.DATAEVENTO BETWEEN :DATAINICIAL AND :DATAFINAL";

        AnsiString SQL_FILTRO = SQL_FILTRO_DATA + ORDER_BY;
        AnsiString SQL_FILTRO_CODIGO = SQL_FILTRO_DATA + " AND E.CDCLIENTE = :CDCLIENTE" + ORDER_BY;
        AnsiString SQL_FILTRO_NOME = SQL_FILTRO_DATA   + " AND (C.NMCLIENTE LIKE UPPER(:NMCLIENTE) OR C.NMFANTASIA LIKE UPPER(:NMCLIENTE))" + ORDER_BY;
        AnsiString SQL_FILTRO_CODIFICADOR = SQL_FILTRO_DATA + " AND E.EQUIPAMENTO = :EQUIPAMENTO" + ORDER_BY;

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
            SQL_FILTRO = SQL_FILTRO_DATA + " AND E.STATUS LIKE :STATUS" + ORDER_BY;
            IBQRelAtendimento->SQL->Text = SQL_FILTRO;
            IBQRelAtendimento->ParamByName("STATUS")->Size = 5;

        }else if(StatusDescricao != ""){
            CDSRelAtendimento->Close();
            IBQRelAtendimento->SQL->Clear();
            SQL_FILTRO = SQL_FILTRO_DATA + " AND E.DESTATUS LIKE :DESTATUS" + ORDER_BY;
            IBQRelAtendimento->SQL->Text = SQL_FILTRO;
        }

        ConfiguraCriteriosSQL();

        IBQRelAtendimento->ParamByName("DATAINICIAL")->AsDate = EdtDataInicialTotais->Date;
        IBQRelAtendimento->ParamByName("DATAFINAL")->AsDate = EdtDataFinalTotais->Date;
        CDSRelAtendimento->Active = true;
        int totalRegistros = CDSRelAtendimento->RecordCount;

        if(totalRegistros > 0){
            ReportEventos->DataSet = CDSRelAtendimento;
            ReportEventos->PreviewModal();
        }else{
            Application->MessageBox("Nenhum registro localizado", "Sucesso", MB_ICONINFORMATION|MB_OK);
        }

        if(IBTRelAtendimento->InTransaction){
            IBTRelAtendimento->Commit();
        }

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao consultar os eventos do cliente por data e hora.\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFListRelatoriosAtendimento::BtnTotalEventosHoraClick(TObject *Sender)
{
    try{
        AnsiString SQL_ORDER_BY = " ORDER BY EVE.NMCLIENTE, DATAEVENTO, HORAEVENTO, TOTAL DESC";
        AnsiString SQL_GROUP_BY = " GROUP BY EVE.CDCLIENTE, EVE.NMCLIENTE, EVE.EQUIPAMENTO, DATAEVENTO, HORAEVENTO, DATAHORAEVENTO, STATUS, EVE.DESTATUS, LOCAL ";
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
            "        WHEN TRIM(S.SETOR) <> '' AND TRIM(EVE.NUMSETOR) <> 'FF' THEN "
            "            REPLACE(EVE.NUMSETOR, 'F', '') || ' - ' || EVE.LOCAL "
            "        ELSE NULL END AS LOCAL "
            " FROM LOGEVENTO EVE JOIN STATUS S ON EVE.STATUS = S.ESTATUS AND EVE.REFERENCIA = S.REFERENCIA1 "
            " INNER JOIN CLIENTE C ON EVE.CDCLIENTE = C.CDCLIENTE "
            " WHERE EVE.CDCLIENTE > 0 AND EVE.DATAEVENTO BETWEEN :DATAINICIAL AND :DATAFINAL";

        AnsiString SQL_FILTRO = SQL_FILTRO_DATA + SQL_GROUP_BY + SQL_ORDER_BY;
        AnsiString SQL_FILTRO_CODIGO = SQL_FILTRO_DATA + " AND EVE.CDCLIENTE = :CDCLIENTE" + SQL_GROUP_BY + SQL_ORDER_BY;
        AnsiString SQL_FILTRO_NOME = SQL_FILTRO_DATA   + " AND (C.NMCLIENTE LIKE UPPER(:NMCLIENTE) OR C.NMFANTASIA LIKE UPPER(:NMCLIENTE))" + SQL_GROUP_BY + SQL_ORDER_BY;
        AnsiString SQL_FILTRO_CODIFICADOR = SQL_FILTRO_DATA + " AND EVE.EQUIPAMENTO = :EQUIPAMENTO" + SQL_GROUP_BY + SQL_ORDER_BY;

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
            SQL_FILTRO = SQL_FILTRO_DATA + " AND EVE.STATUS LIKE :STATUS" + SQL_GROUP_BY + SQL_ORDER_BY;
            IBQRelAtendimento->SQL->Text = SQL_FILTRO;
            IBQRelAtendimento->ParamByName("STATUS")->Size = 5;

        }else if(StatusDescricao != ""){
            CDSRelAtendimento->Close();
            IBQRelAtendimento->SQL->Clear();
            SQL_FILTRO = SQL_FILTRO_DATA + " AND EVE.DESTATUS LIKE :DESTATUS" + SQL_GROUP_BY + SQL_ORDER_BY;
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

//---------------------------------------------------------------------------

void __fastcall TFListRelatoriosAtendimento::BtnTotalEventosDiaClick(TObject *Sender)
{
    try{
        AnsiString SQL_ORDER_BY = " ORDER BY EVE.NMCLIENTE, DATAEVENTO, TOTAL DESC";
        AnsiString SQL_GROUP_BY = " GROUP BY EVE.CDCLIENTE, EVE.NMCLIENTE, EVE.EQUIPAMENTO, DATAEVENTO, STATUS, EVE.DESTATUS, LOCAL ";
        AnsiString SQL_FILTRO_DATA = "SELECT "
          "    COUNT(EVE.STATUS) AS TOTAL, EVE.CDCLIENTE, EVE.NMCLIENTE, EVE.EQUIPAMENTO, "
          "    CAST( "
          "        LPAD(EXTRACT(YEAR FROM EVE.DATAEVENTO),4,'0')  || '-' || "
          "        LPAD(EXTRACT(MONTH FROM EVE.DATAEVENTO),2,'0') || '-' || "
          "        LPAD(EXTRACT(DAY FROM EVE.DATAEVENTO),2,'0') "
          "    AS DATE) AS DATAEVENTO, "
          "    EVE.STATUS || '.' || REPLACE(EVE.REFERENCIA, 'F', '*') AS STATUS, EVE.DESTATUS, "
          "    CASE "
          "        WHEN TRIM(S.SETOR) <> '' AND TRIM(EVE.NUMSETOR) <> 'FF' THEN "
          "            REPLACE(EVE.NUMSETOR, 'F', '') || ' - ' || EVE.LOCAL "
          "        ELSE NULL END AS LOCAL "
          " FROM LOGEVENTO EVE  JOIN STATUS S ON EVE.STATUS = S.ESTATUS AND EVE.REFERENCIA = S.REFERENCIA1 "
          " INNER JOIN CLIENTE C ON EVE.CDCLIENTE = C.CDCLIENTE "
          " WHERE EVE.CDCLIENTE > 0 AND DATAEVENTO BETWEEN :DATAINICIAL AND :DATAFINAL ";

        AnsiString SQL_FILTRO = SQL_FILTRO_DATA + SQL_GROUP_BY + SQL_ORDER_BY;
        AnsiString SQL_FILTRO_CODIGO = SQL_FILTRO_DATA + " AND EVE.CDCLIENTE = :CDCLIENTE" + SQL_GROUP_BY + SQL_ORDER_BY;
        AnsiString SQL_FILTRO_NOME = SQL_FILTRO_DATA   + " AND (C.NMCLIENTE LIKE UPPER(:NMCLIENTE) OR C.NMFANTASIA LIKE UPPER(:NMCLIENTE))" + SQL_GROUP_BY + SQL_ORDER_BY;
        AnsiString SQL_FILTRO_CODIFICADOR = SQL_FILTRO_DATA + " AND EQUIPAMENTO = :EQUIPAMENTO" + SQL_GROUP_BY + SQL_ORDER_BY;

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
            SQL_FILTRO = SQL_FILTRO_DATA + " AND EVE.STATUS LIKE :STATUS" + SQL_GROUP_BY + SQL_ORDER_BY;
            IBQRelAtendimento->SQL->Text = SQL_FILTRO;
            IBQRelAtendimento->ParamByName("STATUS")->Size = 5;

        }else if(StatusDescricao != ""){
            CDSRelAtendimento->Close();
            IBQRelAtendimento->SQL->Clear();
            SQL_FILTRO = SQL_FILTRO_DATA + " AND EVE.DESTATUS LIKE :DESTATUS" + SQL_GROUP_BY + SQL_ORDER_BY;
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

//---------------------------------------------------------------------------


void __fastcall TFListRelatoriosAtendimento::BtnTotaisEventosClick(
      TObject *Sender)
{
    try{
        AnsiString SQL_FILTRO_DATA = "SELECT TOTAL, CDCLIENTE, NMCLIENTE, EQUIPAMENTO, "
            " DATAEVENTO, STATUS, DESTATUS, LOCAL "
            "FROM VLOGEVE_TOTAIS WHERE DATAEVENTO BETWEEN :DATAINICIAL AND :DATAFINAL";


        "SELECT "
        "    COUNT(EVE.STATUS) AS TOTAL, EVE.CDCLIENTE, EVE.NMCLIENTE, EVE.EQUIPAMENTO, "
        "    CAST( "
        "        LPAD(EXTRACT(YEAR FROM EVE.DATAEVENTO),4,'0') || '-' || "
        "        LPAD(EXTRACT(MONTH FROM EVE.DATAEVENTO),2,'0') || '-' || "
        "        LPAD(EXTRACT(DAY FROM EVE.DATAEVENTO),2,'0') "
        "    AS DATE) AS DATAEVENTO, "
        "    EVE.STATUS || '.' || REPLACE(EVE.REFERENCIA, 'F', '*') AS STATUS, EVE.DESTATUS, "
        "    CASE "
        "        WHEN TRIM(EVE.NUMSETOR) <> '' AND TRIM(EVE.NUMSETOR) <> 'FF' THEN "
        "            REPLACE(EVE.NUMSETOR, 'F', '') || ' - ' || EVE.LOCAL "
        "        ELSE NULL END AS LOCAL "
        "FROM LOGEVENTO EVE "
        "WHERE EVE.CDCLIENTE > 0 AND EVE.DATAEVENTO BETWEEN :DATAINICIAL AND :DATAFINAL ";

        // PENDENTE

        "GROUP BY EVE.CDCLIENTE, EVE.NMCLIENTE, EVE.EQUIPAMENTO, DATAEVENTO, STATUS, EVE.DESTATUS, LOCAL "
        "HAVING COUNT(EVE.STATUS) > 2 "
        "ORDER BY TOTAL DESC, DATAEVENTO"

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
            QRPTopEventos->DataSet = CDSRelAtendimento;
            QRPTopEventos->PreviewModal();
        }else{
            Application->MessageBox("Nenhum registro localizado", "Sucesso", MB_ICONINFORMATION|MB_OK);
        }

        if(IBTRelAtendimento->InTransaction){
            IBTRelAtendimento->Commit();
        }

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao consultar os totais de eventos (Prioridade na Manutenção).\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }    
}
//---------------------------------------------------------------------------

