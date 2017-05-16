//----------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "RelEventosClienteDataHora.h"
#include "ListRelatoriosAtendimento.h"
//----------------------------------------------------------------------------
#pragma resource "*.dfm"
TQRPEventosClienteDataHora *QRPEventosClienteDataHora;
//----------------------------------------------------------------------------
__fastcall TQRPEventosClienteDataHora::TQRPEventosClienteDataHora(TComponent* Owner)
    : TQuickRep(Owner)
{
}
//----------------------------------------------------------------------------
