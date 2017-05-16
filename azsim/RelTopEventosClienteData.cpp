//----------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "RelTopEventosClienteData.h"
#include "ListRelatoriosAtendimento.h"
//----------------------------------------------------------------------------
#pragma resource "*.dfm"
TQRPTopEventosClienteData *QRPTopEventosClienteData;
//----------------------------------------------------------------------------
__fastcall TQRPTopEventosClienteData::TQRPTopEventosClienteData(TComponent* Owner)
    : TQuickRep(Owner)
{
}
//----------------------------------------------------------------------------
