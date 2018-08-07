//----------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "RelOcorrenciasEncerradas.h"
#include "ListRelatoriosAtendimento.h"
#include "SelectReportOcorrenciaUnit.h"
//----------------------------------------------------------------------------
#pragma resource "*.dfm"
TQRPOcorrenciasEncerradas *QRPOcorrenciasEncerradas;
//----------------------------------------------------------------------------
__fastcall TQRPOcorrenciasEncerradas::TQRPOcorrenciasEncerradas(TComponent* Owner)
    : TQuickRep(Owner)
{

}
//----------------------------------------------------------------------------