//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "DMOcorrencia.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TfdmOcorrencia *fdmOcorrencia;
//---------------------------------------------------------------------------
__fastcall TfdmOcorrencia::TfdmOcorrencia(TComponent* Owner)
    : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TfdmOcorrencia::DSPOcorrenciaGetTableName(TObject *Sender,
      TDataSet *DataSet, AnsiString &TableName)
{
    TableName = "OCORRENCIA";    
}
//---------------------------------------------------------------------------



