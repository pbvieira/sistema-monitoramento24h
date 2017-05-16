//----------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "RelTopEventosClienteHora.h"
#include "ListRelatoriosAtendimento.h"
//----------------------------------------------------------------------------
#pragma resource "*.dfm"
TQRPTopEventosClienteHora *QRPTopEventosClienteHora;
//----------------------------------------------------------------------------
__fastcall TQRPTopEventosClienteHora::TQRPTopEventosClienteHora(TComponent* Owner)
    : TQuickRep(Owner)
{
}
//----------------------------------------------------------------------------