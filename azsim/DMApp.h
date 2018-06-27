//---------------------------------------------------------------------------

#ifndef DMAppH
#define DMAppH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <DB.hpp>
#include <IBDatabase.hpp>
#include <IBCustomDataSet.hpp>
#include <IBQuery.hpp>
#include <Provider.hpp>
#include <DBClient.hpp>
#include <ImgList.hpp>
#include <IBStoredProc.hpp>
#include <IBSQLMonitor.hpp>
#include <IBSQL.hpp>
#include <DBLocal.hpp>
#include <DBLocalI.hpp>
#include <IBEvents.hpp>

#define ARQUIVO_INICIALIZACAO "./AZSIM.ini"
#define SECAO_BASE "Conexão Base"
#define SECAO_MONITOR "Monitor Serial"

#include "CadCliente.h"
#include "CadProcedimento.h"
//---------------------------------------------------------------------------
class TDModule : public TDataModule
{
__published:	// IDE-managed Components
    TIBDatabase *IBCONAzsim;
    TImageList *ILForm12;
    TIBTransaction *IBTFilial;
    TIBQuery *IBQFilial;
    TDataSetProvider *DSPFilial;
    TClientDataSet *CDSFilial;
    TIntegerField *CDSFilialCDFILIAL;
    TStringField *CDSFilialNMFILIAL;
    TIntegerField *IBQFilialCDFILIAL;
    TIBStringField *IBQFilialNMFILIAL;
    TIBQuery *IBQConsAuxCadastros;
    TIBTransaction *IBTConsAuxCadastros;
    TDataSource *DSFilial;
    TIBStoredProc *IBSPFilial;
    TIBTransaction *IBTGenIdFilial;
    TIBStoredProc *IBSPGenIdUsuario;
    TIBTransaction *IBTUsuario;
    TIBQuery *IBQUsuario;
    TDataSetProvider *DSPUsuario;
    TClientDataSet *CDSUsuario;
    TDataSource *DSUsuario;
    TIBTransaction *IBTGenIdUsuario;
    TIntegerField *IBQUsuarioCDUSUARIO;
    TIBStringField *IBQUsuarioNMUSUARIO;
    TIBStringField *IBQUsuarioLOGIN;
    TIBStringField *IBQUsuarioSENHA;
    TIntegerField *IBQUsuarioISADMIN;
    TIntegerField *CDSUsuarioCDUSUARIO;
    TStringField *CDSUsuarioNMUSUARIO;
    TStringField *CDSUsuarioLOGIN;
    TStringField *CDSUsuarioSENHA;
    TIntegerField *CDSUsuarioISADMIN;
    TIBQuery *IBQLogin;
    TIBTransaction *IBTLogin;
    TIntegerField *IBQLoginCDUSUARIO;
    TIntegerField *IBQLoginISADMIN;
    TIBStringField *IBQLoginLOGIN;
    TIBStringField *IBQLoginNMUSUARIO;
    TIBStringField *IBQLoginSENHA;
    TIntegerField *IBQUsuarioCDTIPOUSUARIO;
    TIntegerField *CDSUsuarioCDTIPOUSUARIO;
    TDataSetProvider *DSPTipoUsuario;
    TIBQuery *IBQTipoUsuario;
    TIntegerField *IBQTipoUsuarioCDTIPOUSUARIO;
    TIBStringField *IBQTipoUsuarioDETIPOUSUARIO;
    TIBTransaction *IBTTipoUsuario;
    TClientDataSet *CDSTipoUsuario;
    TIntegerField *CDSTipoUsuarioCDTIPOUSUARIO;
    TStringField *CDSTipoUsuarioDETIPOUSUARIO;
    TStringField *CDSUsuarioDETIPOUSUARIO;
    TIBQuery *IBQInsereMonitoramento;
    TIBTransaction *IBTMonitaramento;
    TIBQuery *IBQAtualizaMonitoramento;
    TIBTransaction *IBTParametro;
    TIBQuery *IBQParametro;
    TIBTransaction *IBTConsFilial;
    TDataSource *DSConsFilial;
    TClientDataSet *CDSConsFilial;
    TIntegerField *IntegerField1;
    TStringField *StringField1;
    TDataSetProvider *DSPConsFilial;
    TIBQuery *IBQConsFilial;
    TIntegerField *IntegerField2;
    TIBStringField *IBStringField1;
    void __fastcall DataModuleCreate(TObject *Sender);
    void __fastcall DataModuleDestroy(TObject *Sender);
    void __fastcall CDSFilialBeforePost(TDataSet *DataSet);
    void __fastcall CDSUsuarioBeforePost(TDataSet *DataSet);
private:	// User declarations
    void GeraFilialId(void);
public:		// User declarations
    __fastcall TDModule(TComponent* Owner);
    static TDateTime __fastcall RetornaDataHoraAtual();
    static void __fastcall SalvaLog(AnsiString log);
};
//---------------------------------------------------------------------------
extern PACKAGE TDModule *DModule;
//---------------------------------------------------------------------------
#endif
