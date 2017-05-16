//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "OcorrenciaContatos.h"
#include "Ocorrencia.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFOConsOcorrenciasContatos *FOConsOcorrenciasContatos;
TFOcorrencia *FOcorrenciaPai;
//---------------------------------------------------------------------------
__fastcall TFOConsOcorrenciasContatos::TFOConsOcorrenciasContatos(TComponent* Owner)
    : TForm(Owner)
{
    FOcorrenciaPai = dynamic_cast <TFOcorrencia*> (Owner);
    this->Caption = FOcorrenciaPai->Caption;
    DBGContatos->DataSource = FOcorrenciaPai->DSContato;
}
//---------------------------------------------------------------------------
void __fastcall TFOConsOcorrenciasContatos::FormClose(TObject *Sender,
      TCloseAction &Action)
{
    Action = caFree;
}
//---------------------------------------------------------------------------
void __fastcall TFOConsOcorrenciasContatos::DBGContatosDrawColumnCell(
      TObject *Sender, const TRect &Rect, int DataCol, TColumn *Column,
      TGridDrawState State)
{
    if(FOcorrenciaPai->CDSContato->RecNo % 2){
        DBGContatos->Canvas->Brush->Color = 15138520;
    }else{
        DBGContatos->Canvas->Brush->Color = clWindow;
    }

    if(State.Contains(gdSelected)){
        DBGContatos->Canvas->Brush->Color = clTeal;
    }

    DBGContatos->DefaultDrawColumnCell(Rect, DataCol, Column, State);
}
//---------------------------------------------------------------------------

