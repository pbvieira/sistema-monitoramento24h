//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include <Dateutils.hpp>
#include "SelectReportOcorrenciaUnit.h"
#include "RelOcorrenciasEncerradas.h"
#include "DMApp.h"
#include "DMOcorrencia.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFSelectReportOcorrencia *FSelectReportOcorrencia;
//---------------------------------------------------------------------------
__fastcall TFSelectReportOcorrencia::TFSelectReportOcorrencia(TComponent* Owner)
    : TForm(Owner)
{
    EdtDataInicialTotais->Date = IncDay(DModule->RetornaDataHoraAtual(), -1);
    EdtDataFinalTotais->Date   = IncDay(DModule->RetornaDataHoraAtual(),  2);

    QRPOcorrenciasEncerradas   = new TQRPOcorrenciasEncerradas(this);
}

//---------------------------------------------------------------------------

void __fastcall TFSelectReportOcorrencia::BtnOcorrenciasClick(
      TObject *Sender)
{
    try{
        AnsiString SQL_ORDER_BY = " ORDER BY O.DATAEVENTO, O.CDOCORRENCIA";
        AnsiString SQL_FILTRO_DATA =
            "SELECT "
            "    O.CDOCORRENCIA, O.DATAEVENTO, O.DATAATENDIMENTO, O.DATAENCERRAMENTO, O.CTX, O.PORTACOM, O.EQUIPAMENTO, "
            "    C.CDCLIENTE, C.ENDERECO, C.CIDADE, "
            "    CASE WHEN C.NMFANTASIA IS NULL THEN C.NMCLIENTE ELSE C.NMFANTASIA END AS NMCLIENTE, "
            "    O.STATUS || '.' || REPLACE(O.REFERENCIA, 'F', '*') AS STATUS,  O.DESTATUS, "
            "    CASE "
            "        WHEN TRIM(S.SETOR) <> '' AND TRIM(O.NUMSETOR) <> 'FF' THEN "
            "            REPLACE(O.NUMSETOR, 'F', '') || ' - ' || O.LOCAL "
            "        ELSE NULL END AS LOCAL, "
            "    O.RESUMO, OPA.LOGIN AS OPERADORABERTURA, OPE.LOGIN AS OPERADORENCERRAMENTO, AG.LOGIN AS AGENTE, O.KMTOTALPERCORRIDO "
            "FROM OCORRENCIA O JOIN STATUS S ON O.STATUS = S.ESTATUS AND O.REFERENCIA = S.REFERENCIA1 "
            "    INNER JOIN CLIENTE C ON O.CDCLIENTE = C.CDCLIENTE "
            "    INNER JOIN USUARIO OPA ON O.CDOPERADORABERTURA = OPA.CDUSUARIO "
            "    INNER JOIN USUARIO OPE ON O.CDOPERADORENCERRAMENTO = OPE.CDUSUARIO "
            "    LEFT JOIN USUARIO AG ON O.CDAGENTE = AG.CDUSUARIO "
            "WHERE O.ISOCORRENCIAENCERRADA = 1 AND O.DATAEVENTO BETWEEN :DATAINICIAL AND :DATAFINAL ";

        AnsiString SQL_FILTRO = SQL_FILTRO_DATA + SQL_ORDER_BY;
        AnsiString SQL_FILTRO_CODIGO = SQL_FILTRO_DATA + " AND O.CDCLIENTE = :CDCLIENTE" + SQL_ORDER_BY;
        AnsiString SQL_FILTRO_NOME   = SQL_FILTRO_DATA + " AND (C.NMCLIENTE LIKE UPPER(:NMCLIENTE) OR C.NMFANTASIA LIKE UPPER(:NMCLIENTE))" + SQL_ORDER_BY;
        AnsiString SQL_FILTRO_CODIFICADOR = SQL_FILTRO_DATA + " AND O.EQUIPAMENTO = :EQUIPAMENTO" + SQL_ORDER_BY;

        CDSRelAtendimento->Close();
        IBQRelAtendimento->SQL->Clear();
        IBQRelAtendimento->SQL->Text = SQL_FILTRO_DATA;

        int CodigoCliente = StrToIntDef(EdtCodClienteTotais->Text, 0);
        AnsiString NomeCliente = EdtNomeTotais->Text;
        int Codificador = StrToIntDef(EdtCodificadorTotais->Text, 0);;

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

void __fastcall TFSelectReportOcorrencia::ConfiguraCriteriosSQL()
{
    int CodigoCliente = StrToIntDef(EdtCodClienteTotais->Text, 0);
    AnsiString NomeCliente = EdtNomeTotais->Text;
    int Codificador = StrToIntDef(EdtCodificadorTotais->Text, 0);;

    if(CodigoCliente > 0){
        IBQRelAtendimento->ParamByName("CDCLIENTE")->AsInteger = CodigoCliente;
    }else if(NomeCliente != ""){
        IBQRelAtendimento->ParamByName("NMCLIENTE")->AsString = "%" + NomeCliente + "%";
    }else if(Codificador > 0){
        IBQRelAtendimento->ParamByName("EQUIPAMENTO")->AsInteger = Codificador;
    }
}

//---------------------------------------------------------------------------
void __fastcall TFSelectReportOcorrencia::BtnFecharClick(TObject *Sender)
{
    Close();
}
//---------------------------------------------------------------------------
void __fastcall TFSelectReportOcorrencia::FormClose(TObject *Sender,
      TCloseAction &Action)
{
    CDSRelAtendimento->Close();
    QRPOcorrenciasEncerradas->Free();
    Action = caFree;
}
//---------------------------------------------------------------------------
