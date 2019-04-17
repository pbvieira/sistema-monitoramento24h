//----------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "RelNaoIdentificados.h"
#include "DMCliente.h"
//----------------------------------------------------------------------------
#pragma resource "*.dfm"
TQRPRelNaoIdentificados *QRPRelNaoIdentificados;
//----------------------------------------------------------------------------
__fastcall TQRPRelNaoIdentificados::TQRPRelNaoIdentificados(TComponent* Owner)
    : TQuickRep(Owner)
{

}
//----------------------------------------------------------------------------
void __fastcall TQRPRelNaoIdentificados::QuickRepStartPage(
      TCustomQuickRep *Sender)
{
    QRLabel3->Caption = "Relatório de clientes sem comunicação a mais de " + IntToStr(this->NumDias) + " dias";    
}
//---------------------------------------------------------------------------
