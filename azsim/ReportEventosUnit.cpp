//----------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "ReportEventosUnit.h"
#include "ListRelatoriosAtendimento.h"
//----------------------------------------------------------------------------
#pragma resource "*.dfm"
TReportEventos *ReportEventos;
//----------------------------------------------------------------------------
__fastcall TReportEventos::TReportEventos(TComponent* Owner)
    : TQuickRep(Owner)
{
}
//----------------------------------------------------------------------------
