//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ListaClientes.h"
#include "FichaCliente.h"
#include "Login.h"
#include "DMCliente.h"
#include "Home.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFListaClientes *FListaClientes;
//---------------------------------------------------------------------------
__fastcall TFListaClientes::TFListaClientes(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFListaClientes::DBGClientesDrawColumnCell(TObject *Sender,
      const TRect &Rect, int DataCol, TColumn *Column,
      TGridDrawState State)
{
    if(DModuleCliente->CDSConsCliente->RecNo % 2){
        (dynamic_cast <TDBGrid*> (Sender))->Canvas->Brush->Color = COLOR_GRID_ALTERNATE_ROW;
    }else{
        (dynamic_cast <TDBGrid*> (Sender))->Canvas->Brush->Color = clWindow;
    }

    if(State.Contains(gdSelected)){
        DBGClientes->Canvas->Brush->Color = COLOR_GRID_SELECTED_ROW;
    }
    DBGClientes->DefaultDrawColumnCell(Rect, DataCol, Column, State);    
}
//---------------------------------------------------------------------------
void __fastcall TFListaClientes::DBGClientesDblClick(TObject *Sender)
{
    if(DModuleCliente->DSConsCliente->DataSet->Active &&
        DModuleCliente->DSConsCliente->DataSet->RecordCount > 0){
        int CodigoCliente = DModuleCliente->DSConsCliente->DataSet->FieldValues["CDCLIENTE"];
        FFichaCliente = new TFFichaCliente(FHome);
        FFichaCliente->Show();
        Close();
    }
}
//---------------------------------------------------------------------------
