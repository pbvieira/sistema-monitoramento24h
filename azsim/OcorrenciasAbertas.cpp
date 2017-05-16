//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "OcorrenciasAbertas.h"
#include "DMApp.h"
#include "Ocorrencia.h"
#include "Home.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFConsOcorrenciasAbertas *FConsOcorrenciasAbertas;
//---------------------------------------------------------------------------

__fastcall TFConsOcorrenciasAbertas::TFConsOcorrenciasAbertas(TComponent* Owner)
    : TForm(Owner)
{
}

//---------------------------------------------------------------------------

void __fastcall TFConsOcorrenciasAbertas::FormCreate(TObject *Sender)
{
    try{
        CDSOcorrenciasAbertas->Active = true;
        if(IBTOcorrenciasAbertas->InTransaction)
            IBTOcorrenciasAbertas->Commit();
    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao abrir o formulário de ocorrências abertas."
            "\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);

        Close();
    }
}

//---------------------------------------------------------------------------

void __fastcall TFConsOcorrenciasAbertas::DBGOcorrenciasDblClick(
      TObject *Sender)
{
    TFOcorrencia *FOcorrencia = NULL;
    int iCdOcorrencia = CDSOcorrenciasAbertasCDOCORRENCIA->AsInteger;
    if(iCdOcorrencia > 0){
        FOcorrencia = dynamic_cast <TFOcorrencia*>(FHome->OcorrenciaEmAtendimento(iCdOcorrencia));
        if(FOcorrencia != NULL){
            FOcorrencia->Show();
        }else{
            FOcorrencia = new TFOcorrencia(FHome);
            FOcorrencia->FOcorrenciaId = iCdOcorrencia;
            FOcorrencia->ConsultaOcorrencia(iCdOcorrencia);
            FOcorrencia->Show();
        }
    }
}

//---------------------------------------------------------------------------

void __fastcall TFConsOcorrenciasAbertas::DBGOcorrenciasDrawColumnCell(
      TObject *Sender, const TRect &Rect, int DataCol, TColumn *Column,
      TGridDrawState State)
{
    if(ValidaOcorrencia()){
        DBGOcorrencias->Canvas->Font->Color = clRed;
    }

    if(CDSOcorrenciasAbertas->RecNo % 2){
        DBGOcorrencias->Canvas->Brush->Color = clCream;
    }else{
        DBGOcorrencias->Canvas->Brush->Color = clWindow;
    }

    if(State.Contains(gdSelected)){
        DBGOcorrencias->Canvas->Brush->Color = clMoneyGreen;
    }

    DBGOcorrencias->DefaultDrawColumnCell(Rect, DataCol, Column, State);
}

//---------------------------------------------------------------------------

void __fastcall TFConsOcorrenciasAbertas::AtualizarListaOcorrencias()
{
    CDSOcorrenciasAbertas->Active = false;
    CDSOcorrenciasAbertas->Active = true;
    if(IBTOcorrenciasAbertas->InTransaction)
        IBTOcorrenciasAbertas->Commit();
}

//---------------------------------------------------------------------------

void __fastcall TFConsOcorrenciasAbertas::FormClose(TObject *Sender,
      TCloseAction &Action)
{
    Action = caFree;
}

//---------------------------------------------------------------------------

void __fastcall TFConsOcorrenciasAbertas::CDSOcorrenciasAbertasAfterScroll(
      TDataSet *DataSet)
{
    LblOcorrencia->Caption =
        Format("Ocorrência # %s",
            ARRAYOFCONST((
                CDSOcorrenciasAbertasCDOCORRENCIA->AsString)));
}

//---------------------------------------------------------------------------

bool __fastcall TFConsOcorrenciasAbertas::ValidaOcorrencia()
{
    try{
        String CdOcorrencia = CDSOcorrenciasAbertasCDOCORRENCIA->AsString;
        String Operadora = CDSOcorrenciasAbertasCDOPERADORENCERRAMENTO->AsString;
        String Resumo = CDSOcorrenciasAbertasRESUMO->AsString;
        String TipoOcorrencia = CDSOcorrenciasAbertasCDTIPOOCORRENCIA->AsString;
        String SubTipoOcorrencia = CDSOcorrenciasAbertasCDSUBTIPOOCORRENCIA->AsString;
        if(Operadora == "" || Resumo == "" || TipoOcorrencia == "" || SubTipoOcorrencia == "" ){
            return false;
        }
        return true;
    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao validar o o encerramento da ocorrência."
            "\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

