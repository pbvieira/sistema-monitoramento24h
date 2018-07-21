//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include <Dateutils.hpp>
#include "RelTopEventos.h"
#include "RelTopEventosClienteData.h"
#include "RelTopEventosClienteHora.h"
#include "RelEventosClienteDataHora.h"
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
    QRPTopEventos              = new TQRPTopEventos(this);
    QRPTopEventosClienteHora   = new TQRPTopEventosClienteHora(this);
    QRPTopEventosClienteData   = new TQRPTopEventosClienteData(this);
    QRPEventosClienteDataHora  = new TQRPEventosClienteDataHora(this);
    QRPOcorrenciasEncerradas   = new TQRPOcorrenciasEncerradas(this);
    
    EdtDataInicialTotais->Date = IncDay(DModule->RetornaDataHoraAtual(), -1);
    EdtDataFinalTotais->Date   = IncDay(DModule->RetornaDataHoraAtual(),  2);
}

//---------------------------------------------------------------------------

void __fastcall TFListRelatoriosAtendimento::FormClose(TObject *Sender,
      TCloseAction &Action)
{
    CDSRelAtendimento->Close();
    QRPTopEventosClienteHora->Free();
    QRPTopEventosClienteData->Free();
    QRPEventosClienteDataHora->Free();
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

void __fastcall TFListRelatoriosAtendimento::BtnTotalEveHoraCliClick(
      TObject *Sender)
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

//---------------------------------------------------------------------------

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

void __fastcall TFListRelatoriosAtendimento::BtnTotalEventosClick(
      TObject *Sender)
{
    try{
        AnsiString SQL_FILTRO_DATA = "SELECT TOTAL, CDCLIENTE, NMCLIENTE, EQUIPAMENTO, "
            " DATAEVENTO, STATUS, DESTATUS, LOCAL "
            "FROM VLOGEVE_TOTAIS WHERE DATAEVENTO BETWEEN :DATAINICIAL AND :DATAFINAL";

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

void __fastcall TFListRelatoriosAtendimento::BtnEventosClientesDataHoraClick(
      TObject *Sender)
{
    try{
        AnsiString SQL_FILTRO_DATA = "SELECT CDCLIENTE, NMCLIENTE, EQUIPAMENTO, "
            " DATAEVENTO, STATUS, DESTATUS, LOCAL "
            "FROM VLOGEVE_CLIENTE WHERE DATAEVENTO BETWEEN :DATAINICIAL AND :DATAFINAL";

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
            QRPEventosClienteDataHora->DataSet = CDSRelAtendimento;
            QRPEventosClienteDataHora->PreviewModal();
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

void __fastcall TFListRelatoriosAtendimento::BtnOcorrenciasClienteClick(
      TObject *Sender)
{
    try{
        AnsiString SQL_ORDER_BY = " ORDER BY DATAEVENTO, CDOCORRENCIA";

        AnsiString SQL_FILTRO_DATA =
            "SELECT "
            "    DATAEVENTO, DATAATENDIMENTO, DATAENCERRAMENTO, CDOCORRENCIA, EQUIPAMENTO, NMCLIENTE, STATUS, DESTATUS, "
            "    RESUMO, LOCAL, OPERADORABERTURA, OPERADORENCERRAMENTO, AGENTE, KMTOTALPERCORRIDO "
            "FROM VOCORRENCIAS_ENCERRADAS "
            "WHERE DATAEVENTO BETWEEN :DATAINICIAL AND :DATAFINAL" + SQL_ORDER_BY;;

        AnsiString SQL_FILTRO = SQL_FILTRO_DATA;
        AnsiString SQL_FILTRO_CODIGO = SQL_FILTRO_DATA.SubString(0, StrLen(SQL_FILTRO_DATA.c_str()) - StrLen(SQL_ORDER_BY.c_str())) + " AND CDCLIENTE = :CDCLIENTE" + SQL_ORDER_BY;
        AnsiString SQL_FILTRO_NOME = SQL_FILTRO_DATA.SubString(0, StrLen(SQL_FILTRO_DATA.c_str()) - StrLen(SQL_ORDER_BY.c_str())) + " AND NMCLIENTE LIKE UPPER(:NMCLIENTE)" + SQL_ORDER_BY;
        AnsiString SQL_FILTRO_CODIFICADOR = SQL_FILTRO_DATA.SubString(0, StrLen(SQL_FILTRO_DATA.c_str()) - StrLen(SQL_ORDER_BY.c_str())) + " AND EQUIPAMENTO = :EQUIPAMENTO" + SQL_ORDER_BY;

        CDSRelAtendimento->Close();
        IBQRelAtendimento->SQL->Clear();
        IBQRelAtendimento->SQL->Text = SQL_FILTRO_DATA;

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
            SQL_FILTRO = SQL_FILTRO.SubString(0, StrLen(SQL_FILTRO.c_str()) - StrLen(SQL_ORDER_BY.c_str())) +
                " AND STATUS LIKE :STATUS" + SQL_ORDER_BY;
            IBQRelAtendimento->SQL->Text = SQL_FILTRO;
            IBQRelAtendimento->ParamByName("STATUS")->Size = 5;

        }else if(StatusDescricao != ""){
            CDSRelAtendimento->Close();
            IBQRelAtendimento->SQL->Clear();
            SQL_FILTRO = SQL_FILTRO.SubString(0, StrLen(SQL_FILTRO.c_str()) - StrLen(SQL_ORDER_BY.c_str())) +
                " AND DESTATUS LIKE :DESTATUS" + SQL_ORDER_BY;
            IBQRelAtendimento->SQL->Text = SQL_FILTRO;
        }

        ConfiguraCriteriosSQL();

        IBQRelAtendimento->ParamByName("DATAINICIAL")->AsDate = EdtDataInicialTotais->Date;
        IBQRelAtendimento->ParamByName("DATAFINAL")->AsDate = EdtDataFinalTotais->Date;
        CDSRelAtendimento->Active = true;
        int totalRegistros = CDSRelAtendimento->RecordCount;

        if(totalRegistros > 0){
            QRPOcorrenciasEncerradas->DataSet = CDSRelAtendimento;
            QRPOcorrenciasEncerradas->PreviewModal();
        }else{
            Application->MessageBox("Nenhum registro localizado", "Sucesso", MB_ICONINFORMATION|MB_OK);
        }

        if(IBTRelAtendimento->InTransaction){
            IBTRelAtendimento->Commit();
        }

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao consultar as ocorrências do cliente.\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------


