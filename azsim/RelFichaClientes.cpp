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

