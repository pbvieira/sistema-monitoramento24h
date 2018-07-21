//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "FichaCliente.h"
#include "Login.h"
#include "DMCliente.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFFichaCliente *FFichaCliente;
//---------------------------------------------------------------------------
__fastcall TFFichaCliente::TFFichaCliente(TComponent* Owner)
    : TForm(Owner)
{
    pcDadosCliente->ActivePageIndex = 0;
}
//---------------------------------------------------------------------------
void __fastcall TFFichaCliente::DBGContatosDrawColumnCell(TObject *Sender,
      const TRect &Rect, int DataCol, TColumn *Column,
      TGridDrawState State)
{
    if(DModuleCliente->CDSConsContato->RecNo % 2){
        (dynamic_cast <TDBGrid*> (Sender))->Canvas->Brush->Color = COLOR_GRID_ALTERNATE_ROW;
    }else{
        (dynamic_cast <TDBGrid*> (Sender))->Canvas->Brush->Color = clWindow;
    }

    if(State.Contains(gdSelected)){
        (dynamic_cast <TDBGrid*> (Sender))->Canvas->Brush->Color = COLOR_GRID_SELECTED_ROW;
    }
    (dynamic_cast <TDBGrid*> (Sender))->DefaultDrawColumnCell(Rect, DataCol, Column, State);     
}
//---------------------------------------------------------------------------
void __fastcall TFFichaCliente::DBGSetoresDrawColumnCell(TObject *Sender,
      const TRect &Rect, int DataCol, TColumn *Column,
      TGridDrawState State)
{
    if(DModuleCliente->CDSConsSetores->RecNo % 2){
        (dynamic_cast <TDBGrid*> (Sender))->Canvas->Brush->Color = COLOR_GRID_ALTERNATE_ROW;
    }else{
        (dynamic_cast <TDBGrid*> (Sender))->Canvas->Brush->Color = clWindow;
    }

    if(State.Contains(gdSelected)){
        (dynamic_cast <TDBGrid*> (Sender))->Canvas->Brush->Color = COLOR_GRID_SELECTED_ROW;
    }
    (dynamic_cast <TDBGrid*> (Sender))->DefaultDrawColumnCell(Rect, DataCol, Column, State);
}
//---------------------------------------------------------------------------
