//----------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "RelClientes.h"
#include "DMCliente.h"
//----------------------------------------------------------------------------
#pragma resource "*.dfm"
TQRPClientes *QRPClientes;
//----------------------------------------------------------------------------
__fastcall TQRPClientes::TQRPClientes(TComponent* Owner)
    : TQuickRep(Owner)
{
}
//----------------------------------------------------------------------------