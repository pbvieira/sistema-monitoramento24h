//---------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "DialogGeracaoRelClientes.h"
#include "RelFichaClientes.h"
#include "DMApp.h"
#include "DMCliente.h"
//---------------------------------------------------------------------
#pragma resource "*.dfm"
TdlgGeracaoRelClientes *dlgGeracaoRelClientes;
//---------------------------------------------------------------------
__fastcall TdlgGeracaoRelClientes::TdlgGeracaoRelClientes(TComponent* AOwner)
	: TForm(AOwner)
{
}
//---------------------------------------------------------------------
void __fastcall TdlgGeracaoRelClientes::btnRelatorioClick(TObject *Sender)
{
    ModalResult = mrOk;
}
//---------------------------------------------------------------------------


void __fastcall TdlgGeracaoRelClientes::btnPlanilhaClick(TObject *Sender)
{
    ModalResult = mrCancel;
}
//---------------------------------------------------------------------------

