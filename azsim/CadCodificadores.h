//---------------------------------------------------------------------------

#ifndef CadCodificadoresH
#define CadCodificadoresH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "CadBase.h"
#include <Buttons.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <ToolWin.hpp>
#include <DB.hpp>
#include <DBClient.hpp>
#include <IBCustomDataSet.hpp>
#include <IBQuery.hpp>
#include <Provider.hpp>
#include <IBDatabase.hpp>
#include <DBCtrls.hpp>
#include <Mask.hpp>
#include <DBGrids.hpp>
#include <Grids.hpp>
//---------------------------------------------------------------------------
class TFCadCodificadores : public TFCadBase
{
__published:	// IDE-managed Components
    TDataSource *DSCodificadores;
    TClientDataSet *CDSCodificadores;
    TDataSetProvider *DSPCodificadores;
    TIBQuery *IBQCodificadores;
    TIBTransaction *IBTCodificadores;
    TIntegerField *IBQCodificadoresCDCODIFICADOR;
    TIntegerField *CDSCodificadoresCDCODIFICADOR;
    TGroupBox *GroupBox1;
    TDBEdit *EdtCodificador;
    TLabel *Label6;
    TGroupBox *GroupBox2;
    TDBGrid *DBGUsuario;
    TIBStringField *IBQCodificadoresNMCLIENTE;
    TIntegerField *IBQCodificadoresCDCONTRATO;
    TStringField *CDSCodificadoresNMCLIENTE;
    TIntegerField *CDSCodificadoresCDCONTRATO;
    void __fastcall DSPCodificadoresGetTableName(TObject *Sender,
          TDataSet *DataSet, AnsiString &TableName);
private:	// User declarations
public:		// User declarations
    __fastcall TFCadCodificadores(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFCadCodificadores *FCadCodificadores;
//---------------------------------------------------------------------------
#endif
