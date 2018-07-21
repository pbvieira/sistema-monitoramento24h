//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "DMInfo.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TfdmInfo *fdmInfo;
//---------------------------------------------------------------------------
__fastcall TfdmInfo::TfdmInfo(TComponent* Owner)
    : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------
