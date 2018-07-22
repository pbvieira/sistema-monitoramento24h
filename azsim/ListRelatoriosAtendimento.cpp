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
        AnsiString SQL_FILTRO_NOME = SQL_FILTRO_DATA   + " AND C.NMCLIENTE LIKE UPPER(:NMCLIENTE) OR C.NMFANTASIA LIKE UPPER(:NMCLIENTE)" + ORDER_BY;
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
            SQL_FILTRO = SQL_FILTRO + " AND E.STATUS LIKE :STATUS";
            IBQRelAtendimento->SQL->Text = SQL_FILTRO;
            IBQRelAtendimento->ParamByName("STATUS")->Size = 5;

        }else if(StatusDescricao != ""){
            CDSRelAtendimento->Close();
            IBQRelAtendimento->SQL->Clear();
            SQL_FILTRO = SQL_FILTRO + " AND E.DESTATUS LIKE :DESTATUS";
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

void __fastcall TFListRelatoriosAtendimento::BtnOcorrenciasClick(
      TObject *Sender)
{
    try{
        AnsiString SQL_ORDER_BY = " ORDER BY DATAEVENTO, CDOCORRENCIA";

        AnsiString SQL_FILTRO_DATA =
            "SELECT "
            "    O.CDOCORRENCIA, O.DATAEVENTO, O.DATAATENDIMENTO, O.DATAENCERRAMENTO, O.CTX, O.PORTACOM, O.EQUIPAMENTO, "
            "    C.CDCLIENTE, C.NMCLIENTE, C.ENDERECO, C.CIDADE, "
            "    O.STATUS || '.' || REPLACE(O.REFERENCIA, 'F', '*') AS STATUS,  O.DESTATUS, "
            "    CASE "
            "        WHEN TRIM(O.NUMSETOR) <> '' AND TRIM(O.NUMSETOR) <> 'FF' THEN "
            "            REPLACE(O.NUMSETOR, 'F', '') || ' - ' || O.LOCAL "
            "        ELSE NULL END AS LOCAL, "
            "    O.RESUMO, OPA.LOGIN AS OPERADORABERTURA, OPE.LOGIN AS OPERADORENCERRAMENTO, AG.LOGIN AS AGENTE, O.KMTOTALPERCORRIDO "
            "FROM OCORRENCIA O "
            "    INNER JOIN CLIENTE C ON O.CDCLIENTE = C.CDCLIENTE "
            "    INNER JOIN USUARIO OPA ON O.CDOPERADORABERTURA = OPA.CDUSUARIO "
            "    INNER JOIN USUARIO OPE ON O.CDOPERADORENCERRAMENTO = OPE.CDUSUARIO "
            "    LEFT JOIN USUARIO AG ON O.CDAGENTE = AG.CDUSUARIO "
            "WHERE O.ISOCORRENCIAENCERRADA = 1 AND O.DATAEVENTO BETWEEN :DATAINICIAL AND :DATAFINAL" + SQL_ORDER_BY;

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
                " AND O.STATUS LIKE :STATUS" + SQL_ORDER_BY;
            IBQRelAtendimento->SQL->Text = SQL_FILTRO;
            IBQRelAtendimento->ParamByName("STATUS")->Size = 5;

        }else if(StatusDescricao != ""){
            CDSRelAtendimento->Close();
            IBQRelAtendimento->SQL->Clear();
            SQL_FILTRO = SQL_FILTRO.SubString(0, StrLen(SQL_FILTRO.c_str()) - StrLen(SQL_ORDER_BY.c_str())) +
                " AND O.DESTATUS LIKE :DESTATUS" + SQL_ORDER_BY;
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



