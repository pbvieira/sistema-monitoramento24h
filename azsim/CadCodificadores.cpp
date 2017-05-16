//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "CadCodificadores.h"
#include "DMApp.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "CadBase"
#pragma resource "*.dfm"
TFCadCodificadores *FCadCodificadores;

//---------------------------------------------------------------------------

__fastcall TFCadCodificadores::TFCadCodificadores(TComponent* Owner)
    : TFCadBase(Owner)
{
    this->CDSCodificadores->Active = true;
    if(IBTCodificadores->InTransaction)
        IBTCodificadores->Commit();
    this->SetDataSetBase(this->CDSCodificadores);

    this->HabilitaBarraBotoes();
    this->HabilitaCamposFormulario(false);
}

//---------------------------------------------------------------------------

void __fastcall TFCadCodificadores::DSPCodificadoresGetTableName(
      TObject *Sender, TDataSet *DataSet, AnsiString &TableName)
{
    TableName = "CODIFICADOR";
}

//---------------------------------------------------------------------------


