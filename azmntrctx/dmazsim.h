//---------------------------------------------------------------------------

#ifndef dmazsimH
#define dmazsimH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <DB.hpp>
#include <IBCustomDataSet.hpp>
#include <IBDatabase.hpp>
#include <IBQuery.hpp>
#include <Provider.hpp>
#include <DBClient.hpp>
#include <IBEvents.hpp>
#include <DBLocal.hpp>
#include <DBLocalI.hpp>
//---------------------------------------------------------------------------
class TDModule : public TDataModule
{
__published:	// IDE-managed Components
        TIBTransaction *IBTMonitor;
    TIBDatabase *IBCONAzsim;
        TIBQuery *IBQMonitor;
    TIBTransaction *IBTStatus;
    TIBQuery *IBQStatus;
    TDataSource *DSStatus;
    TIntegerField *IBQStatusALARME;
    TIntegerField *IBQStatusCDSTATUS;
    TIntegerField *IBQStatusCOR;
    TIBStringField *IBQStatusDESCRICAO;
    TIBStringField *IBQStatusGRUPO;
    TIntegerField *IBQStatusIDENTIFICACAO;
    TIntegerField *IBQStatusMENSAGEM;
    TIntegerField *IBQStatusMONITOR;
    TIntegerField *IBQStatusOCORRENCIA;
    TIBStringField *IBQStatusREFERENCIA1;
    TIBStringField *IBQStatusREFERENCIA2;
    TIBStringField *IBQStatusSETOR;
    TDataSetProvider *DSPStatus;
    TClientDataSet *CDSStatus;
    TIntegerField *CDSStatusALARME;
    TIntegerField *CDSStatusCDSTATUS;
    TIntegerField *CDSStatusCOR;
    TStringField *CDSStatusDESCRICAO;
    TStringField *CDSStatusGRUPO;
    TIntegerField *CDSStatusIDENTIFICACAO;
    TIntegerField *CDSStatusMENSAGEM;
    TIntegerField *CDSStatusMONITOR;
    TIntegerField *CDSStatusOCORRENCIA;
    TStringField *CDSStatusREFERENCIA1;
    TStringField *CDSStatusREFERENCIA2;
    TStringField *CDSStatusSETOR;
    TIBStringField *IBQStatusESTATUS;
    TStringField *CDSStatusESTATUS;
    TIBTransaction *IBTStatusCliente;
    TIBQuery *IBQStatusCliente;
    TDataSource *DSStatusCliente;
    TDataSetProvider *DSPStatusCliente;
    TClientDataSet *CDSStatusCliente;
    TIBStringField *IBQStatusClienteESTATUS;
    TIBStringField *IBQStatusClienteREFERENCIA1;
    TIBStringField *IBQStatusClienteREFERENCIA2;
    TIBStringField *IBQStatusClienteSETOR;
    TIBStringField *IBQStatusClienteGRUPO;
    TIntegerField *IBQStatusClienteALARME;
    TIntegerField *IBQStatusClienteMENSAGEM;
    TIntegerField *IBQStatusClienteMONITOR;
    TIntegerField *IBQStatusClienteIDENTIFICACAO;
    TIntegerField *IBQStatusClienteOCORRENCIA;
    TIBStringField *IBQStatusClienteDESCRICAO;
    TIntegerField *IBQStatusClienteCOR;
    TStringField *CDSStatusClienteESTATUS;
    TStringField *CDSStatusClienteREFERENCIA1;
    TStringField *CDSStatusClienteREFERENCIA2;
    TStringField *CDSStatusClienteSETOR;
    TStringField *CDSStatusClienteGRUPO;
    TIntegerField *CDSStatusClienteALARME;
    TIntegerField *CDSStatusClienteMENSAGEM;
    TIntegerField *CDSStatusClienteMONITOR;
    TIntegerField *CDSStatusClienteIDENTIFICACAO;
    TIntegerField *CDSStatusClienteOCORRENCIA;
    TStringField *CDSStatusClienteDESCRICAO;
    TIntegerField *CDSStatusClienteCOR;
    TIntegerField *IBQStatusClienteCDCODIFICADOR;
    TIntegerField *CDSStatusClienteCDCODIFICADOR;
    TIBQuery *IBQConsCliente;
    TIBTransaction *IBTConsCliente;
    TIBQuery *IBQConsSetor;
    TIBTransaction *IBTConsSetor;
    TIBQuery *IBQOcorrencia;
    TIBTransaction *IBTOcorrencia;
    TIBQuery *IBQOcorrenciaMaster;
    TIBTransaction *IBTOcorrenciaMaster;
    TIBTransaction *IBTCtx;
    TIBQuery *IBQCtx;
    TIBQuery *IBQConsCtx;
    TIBQuery *IBQParametro;
    TIBTransaction *IBTParametro;
    TIBTransaction *IBTransaction1;
    TIBQuery *IBQuery1;
    void __fastcall DataModuleCreate(TObject *Sender);
    void __fastcall DataModuleDestroy(TObject *Sender);
private:	// User declarations
public:		// User declarations
    __fastcall TDModule(TComponent* Owner);
    static TDateTime __fastcall RetornaDataHoraAtual();
    static TDateTime __fastcall SetaDataHora(AnsiString dataEHora);
    static void __fastcall SalvaCtxLog(AnsiString log);
    static void __fastcall SalvaEventoLog(AnsiString log);
    static void __fastcall SalvaLog(AnsiString log);    
};
//---------------------------------------------------------------------------
extern PACKAGE TDModule *DModule;
//---------------------------------------------------------------------------
#endif






