//---------------------------------------------------------------------------

#ifndef OcorrenciaH
#define OcorrenciaH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
#include <DBCtrls.hpp>
#include <DBGrids.hpp>
#include <Grids.hpp>
#include <Mask.hpp>
#include <Buttons.hpp>
#include <DB.hpp>
#include <IBCustomDataSet.hpp>
#include <IBDatabase.hpp>
#include <IBQuery.hpp>
#include <Provider.hpp>
#include <DBClient.hpp>
#include <ComCtrls.hpp>
#include <DateUtils.hpp>

#include "Home.h"
#include "Login.h"
#include "DMApp.h"
#include "OcorrenciaContatos.h"
#include "OcorrenciasAbertas.h"
#include <IBStoredProc.hpp>
//---------------------------------------------------------------------------
class TFOcorrencia : public TForm
{
__published:	// IDE-managed Components
    TLabel *Label3;
    TDBEdit *EdtStatus;
    TDBEdit *EdtDescricaoStatus;
    TLabel *Label4;
    TLabel *Label5;
    TDBEdit *EdtSetor;
    TDBEdit *EdtLocalSetor;
    TLabel *Label6;
    TLabel *Label2;
    TDBEdit *EdtNmCliente;
    TLabel *Label9;
    TDBEdit *EdtEndereco;
    TDBEdit *EdtBairro;
    TLabel *Label10;
    TDBEdit *EdtCidade;
    TLabel *Label11;
    TLabel *Label20;
    TDBEdit *EdtPontoRef;
    TLabel *Label17;
    TDBEdit *EdtDataEvento;
    TLabel *Label8;
    TDBEdit *EdtTipoCtx;
    TDBEdit *EdtCodificador;
    TLabel *Label12;
    TDBEdit *EdtCtx;
    TDBEdit *EdtDataAberturaOcorrencia;
    TLabel *Label7;
    TDBEdit *EdtChave;
    TLabel *Label15;
    TPanel *Panel1;
    TPanel *Panel2;
    TDBEdit *EdtKmRetorno;
    TDBEdit *EdtKmTotalPercorrido;
    TLabel *Label13;
    TLabel *Label14;
    TLabel *Label16;
    TLabel *Label18;
    TLabel *Label19;
    TLabel *Label21;
    TLabel *Label22;
    TLabel *Label23;
    TLabel *Label24;
    TLabel *Label25;
    TLabel *Label26;
    TLabel *Label27;
    TDBMemo *EdtResumo;
    TLabel *Label28;
    TLabel *Label29;
    TDBMemo *EdtProcedimentos;
    TDBMemo *EdtOcorrenciaPolicial;
    TLabel *Label31;
    TDBLookupComboBox *CmbSubTipoOcorrencia;
    TDBLookupComboBox *CmbTipoOcorrencia;
    TLabel *Label30;
    TLabel *Label32;
    TDBLookupComboBox *CmbOperadora;
    TDBLookupComboBox *CmbAgente;
    TDBEdit *EdtCodAgente;
    TLabel *Label33;
    TIBTransaction *IBTCliente;
    TIBQuery *IBQCliente;
    TDataSetProvider *DSPCliente;
    TClientDataSet *CDSCliente;
    TDataSource *DSCliente;
    TPageControl *PCGrids;
    TTabSheet *TSContatos;
    TDBGrid *DBGContatos;
    TTabSheet *TSSetores;
    TClientDataSet *CDSContato;
    TStringField *CDSContatoNMCONTATO;
    TIntegerField *CDSContatoCDTIPOCONTATO;
    TStringField *CDSContatoPARENTESCO;
    TStringField *CDSContatoFONE1;
    TStringField *CDSContatoFONE1OBS;
    TStringField *CDSContatoFONE2;
    TStringField *CDSContatoFONE2OBS;
    TStringField *CDSContatoFONE3;
    TStringField *CDSContatoFONE3OBS;
    TStringField *CDSContatoFONE4;
    TStringField *CDSContatoFONE4OBS;
    TStringField *CDSContatoSENHA;
    TStringField *CDSContatoCONTRASENHA;
    TDateField *CDSContatoDATANASCIMENTO;
    TDataSource *DSContato;
    TIBTransaction *IBTAgente;
    TIBQuery *IBQAgente;
    TIntegerField *IBQAgenteCDUSUARIO;
    TDataSetProvider *DSPAgente;
    TClientDataSet *CDSAgente;
    TIntegerField *CDSAgenteCDUSUARIO;
    TIBTransaction *IBTOcorrencia;
    TIBQuery *IBQOcorrencia;
    TDataSetProvider *DSPOcorrencia;
    TClientDataSet *CDSOcorrencia;
    TDataSource *DSOcorrencia;
    TIBTransaction *IBTOperador;
    TIBQuery *IBQOperador;
    TIntegerField *IntegerField9;
    TDataSetProvider *DSPOperador;
    TClientDataSet *CDSOperador;
    TIntegerField *IntegerField10;
    TIBQuery *IBQProcedimeto;
    TClientDataSet *CDSProcedimento;
    TDataSource *DSProcedimeto;
    TIBStringField *IBQProcedimetoPROCEDIMENTOS;
    TIntegerField *IBQProcedimetoCDCLIENTE;
    TDataSetProvider *DSPProcedimento;
    TDataSource *DSLinkCliente;
    TClientDataSet *CDSTipoOcorrencia;
    TDataSetProvider *DSPTipoOcorrencia;
    TIBQuery *IBQTipoOcorrencia;
    TIBTransaction *IBTTipoOcorrencia;
    TIntegerField *IBQTipoOcorrenciaCDTIPOOCORRENCIA;
    TIBStringField *IBQTipoOcorrenciaDETIPOOCORRENCIA;
    TIntegerField *CDSTipoOcorrenciaCDTIPOOCORRENCIA;
    TStringField *CDSTipoOcorrenciaDETIPOOCORRENCIA;
    TIBTransaction *IBTSubTipoOcorrencia;
    TIBQuery *IBQSubTipoOcorrencia;
    TDataSetProvider *DSPSubTipoOcorrencia;
    TClientDataSet *CDSSubTipoOcorrencia;
    TIntegerField *IBQSubTipoOcorrenciaCDSUBTIPOOCORRENCIA;
    TIntegerField *IBQSubTipoOcorrenciaCDTIPOOCORRENCIA;
    TIBStringField *IBQSubTipoOcorrenciaDESUBTIPOOCORRENCIA;
    TIntegerField *CDSSubTipoOcorrenciaCDSUBTIPOOCORRENCIA;
    TIntegerField *CDSSubTipoOcorrenciaCDTIPOOCORRENCIA;
    TStringField *CDSSubTipoOcorrenciaDESUBTIPOOCORRENCIA;
    TDataSource *DSSetores;
    TIBQuery *IBQSetores;
    TDataSetProvider *DSPSetores;
    TClientDataSet *CDSSetores;
    TIBTransaction *IBTSetores;
    TIBStringField *IBQSetoresLOCAL;
    TStringField *CDSSetoresLOCAL;
    TDBGrid *DBGSetores;
    TIBTransaction *IBTProcedimento;
    TIntegerField *CDSProcedimentoCDCLIENTE;
    TStringField *CDSProcedimentoPROCEDIMENTOS;
    TIBStringField *IBQAgenteLOGIN;
    TStringField *CDSAgenteLOGIN;
    TIBStringField *IBQOperadorLOGIN;
    TStringField *CDSOperadorLOGIN;
    TLabel *Label1;
    TDBEdit *EdtFone1;
    TLabel *Label34;
    TDBEdit *EdtFone2;
    TLabel *Label35;
    TDBEdit *EdtFone3;
    TLabel *Label36;
    TDBEdit *EdtFone1Obs;
    TLabel *Label37;
    TDBEdit *EdtFone2Obs;
    TLabel *Label38;
    TDBEdit *EdtFone3Obs;
    TLabel *Label39;
    TDBEdit *EdtFone4;
    TLabel *Label40;
    TDBEdit *EdtFone5;
    TLabel *Label41;
    TDBEdit *EdtFone6;
    TLabel *Label42;
    TDBEdit *EdtFone4Obs;
    TLabel *Label43;
    TDBEdit *EdtFone5Obs;
    TLabel *Label44;
    TDBEdit *EdtFone6Obs;
    TLabel *Label45;
    TDBMemo *EdtObs;
    TIntegerField *IBQSetoresNUMSETOR;
    TIntegerField *CDSSetoresNUMSETOR;
    TSpeedButton *BtnOrdemServico;
    TIBStoredProc *IBSPGenIdOcorrencia;
    TIBTransaction *IBTGenIdOcorrencia;
    TSpeedButton *BtnLocalizarCliente;
    TIntegerField *IBQOcorrenciaCDOCORRENCIA;
    TIntegerField *IBQOcorrenciaCDOCORRENCIAPAI;
    TIntegerField *IBQOcorrenciaPORTACOM;
    TIntegerField *IBQOcorrenciaNREVENTO;
    TIBStringField *IBQOcorrenciaTIPOCTX;
    TIntegerField *IBQOcorrenciaCTX;
    TIntegerField *IBQOcorrenciaEQUIPAMENTO;
    TIBStringField *IBQOcorrenciaSTATUS;
    TIBStringField *IBQOcorrenciaDESTATUS;
    TIntegerField *IBQOcorrenciaNUMSETOR;
    TIBStringField *IBQOcorrenciaLOCAL;
    TIntegerField *IBQOcorrenciaCDCLIENTE;
    TIntegerField *IBQOcorrenciaCDORDEMSERVICO;
    TDateTimeField *IBQOcorrenciaDATACADASTRO;
    TDateTimeField *IBQOcorrenciaDATAEVENTO;
    TDateTimeField *IBQOcorrenciaDATAATENDIMENTO;
    TIntegerField *IBQOcorrenciaCDAGENTE;
    TIntegerField *IBQOcorrenciaCDOPERADORABERTURA;
    TIntegerField *IBQOcorrenciaCDOPERADORENCERRAMENTO;
    TTimeField *IBQOcorrenciaHORASAIDAEMP;
    TTimeField *IBQOcorrenciaHORASAIDALOCAL;
    TTimeField *IBQOcorrenciaHORAABERTURALACRE;
    TIBBCDField *IBQOcorrenciaKMSAIDA;
    TTimeField *IBQOcorrenciaHORACHEGADALOCAL;
    TTimeField *IBQOcorrenciaHORACHEGADAEMP;
    TIBStringField *IBQOcorrenciaLACRE;
    TIBBCDField *IBQOcorrenciaKMRETORNO;
    TTimeField *IBQOcorrenciaTEMPODESOLOCAMENTO;
    TTimeField *IBQOcorrenciaTEMPORETORNO;
    TTimeField *IBQOcorrenciaTEMPOATENDIMENTO;
    TIBBCDField *IBQOcorrenciaKMTOTALPERCORRIDO;
    TIBStringField *IBQOcorrenciaRESUMO;
    TIntegerField *IBQOcorrenciaCDTIPOOCORRENCIA;
    TIntegerField *IBQOcorrenciaCDSUBTIPOOCORRENCIA;
    TIBStringField *IBQOcorrenciaOCORRENCIAPOLICIAL;
    TIntegerField *IBQOcorrenciaISOCORRENCIAPOLICIAL;
    TDateTimeField *IBQOcorrenciaDATAENCERRAMENTO;
    TIntegerField *IBQOcorrenciaISOCORRENCIAENCERRADA;
    TIntegerField *CDSOcorrenciaCDOCORRENCIA;
    TIntegerField *CDSOcorrenciaCDOCORRENCIAPAI;
    TIntegerField *CDSOcorrenciaPORTACOM;
    TIntegerField *CDSOcorrenciaNREVENTO;
    TStringField *CDSOcorrenciaTIPOCTX;
    TIntegerField *CDSOcorrenciaCTX;
    TIntegerField *CDSOcorrenciaEQUIPAMENTO;
    TStringField *CDSOcorrenciaSTATUS;
    TStringField *CDSOcorrenciaDESTATUS;
    TIntegerField *CDSOcorrenciaNUMSETOR;
    TStringField *CDSOcorrenciaLOCAL;
    TIntegerField *CDSOcorrenciaCDCLIENTE;
    TIntegerField *CDSOcorrenciaCDORDEMSERVICO;
    TDateTimeField *CDSOcorrenciaDATACADASTRO;
    TDateTimeField *CDSOcorrenciaDATAEVENTO;
    TDateTimeField *CDSOcorrenciaDATAATENDIMENTO;
    TIntegerField *CDSOcorrenciaCDAGENTE;
    TIntegerField *CDSOcorrenciaCDOPERADORABERTURA;
    TIntegerField *CDSOcorrenciaCDOPERADORENCERRAMENTO;
    TTimeField *CDSOcorrenciaHORASAIDAEMP;
    TTimeField *CDSOcorrenciaHORASAIDALOCAL;
    TTimeField *CDSOcorrenciaHORAABERTURALACRE;
    TBCDField *CDSOcorrenciaKMSAIDA;
    TTimeField *CDSOcorrenciaHORACHEGADALOCAL;
    TTimeField *CDSOcorrenciaHORACHEGADAEMP;
    TStringField *CDSOcorrenciaLACRE;
    TBCDField *CDSOcorrenciaKMRETORNO;
    TTimeField *CDSOcorrenciaTEMPODESOLOCAMENTO;
    TTimeField *CDSOcorrenciaTEMPORETORNO;
    TTimeField *CDSOcorrenciaTEMPOATENDIMENTO;
    TBCDField *CDSOcorrenciaKMTOTALPERCORRIDO;
    TStringField *CDSOcorrenciaRESUMO;
    TIntegerField *CDSOcorrenciaCDTIPOOCORRENCIA;
    TIntegerField *CDSOcorrenciaCDSUBTIPOOCORRENCIA;
    TStringField *CDSOcorrenciaOCORRENCIAPOLICIAL;
    TIntegerField *CDSOcorrenciaISOCORRENCIAPOLICIAL;
    TDateTimeField *CDSOcorrenciaDATAENCERRAMENTO;
    TIntegerField *CDSOcorrenciaISOCORRENCIAENCERRADA;
    TIBStringField *IBQOcorrenciaCHAVE;
    TIBQuery *IBQContato;
    TIntegerField *IBQContatoCDCLIENTECONTATO;
    TIntegerField *IBQContatoCDCLIENTE;
    TIBStringField *IBQContatoNMCONTATO;
    TIntegerField *IBQContatoCDTIPOCONTATO;
    TIBStringField *IBQContatoPARENTESCO;
    TIBStringField *IBQContatoENDERECO;
    TIBStringField *IBQContatoBAIRRO;
    TIBStringField *IBQContatoCIDADE;
    TIBStringField *IBQContatoUF;
    TIBStringField *IBQContatoCEP;
    TIBStringField *IBQContatoOBSERVACAO;
    TIBStringField *IBQContatoFONE1;
    TIBStringField *IBQContatoFONE1OBS;
    TIBStringField *IBQContatoFONE2;
    TIBStringField *IBQContatoFONE2OBS;
    TIBStringField *IBQContatoFONE3;
    TIBStringField *IBQContatoFONE3OBS;
    TIBStringField *IBQContatoFONE4;
    TIBStringField *IBQContatoFONE4OBS;
    TIBStringField *IBQContatoSENHA;
    TIBStringField *IBQContatoCONTRASENHA;
    TDateField *IBQContatoDATANASCIMENTO;
    TStringField *CDSOcorrenciaCHAVE;
    TStringField *CDSOcorrenciaNMAGENTE;
    TStringField *CDSOcorrenciaNMOPERADORA;
    TStringField *CDSOcorrenciaDETIPOOCORRENCIA;
    TStringField *CDSOcorrenciaDESUBTIPOOCORRENCIA;
    TIntegerField *IBQClienteCDCLIENTE;
    TIBStringField *IBQClienteNMCLIENTE;
    TIBStringField *IBQClienteENDERECO;
    TIBStringField *IBQClienteBAIRRO;
    TIBStringField *IBQClienteCIDADE;
    TIBStringField *IBQClientePONTOREF;
    TIBStringField *IBQClienteFONE1;
    TIBStringField *IBQClienteFONEOBS1;
    TIBStringField *IBQClienteFONE2;
    TIBStringField *IBQClienteFONEOBS2;
    TIBStringField *IBQClienteFONE3;
    TIBStringField *IBQClienteFONEOBS3;
    TIBStringField *IBQClienteFONE4;
    TIBStringField *IBQClienteFONEOBS4;
    TIBStringField *IBQClienteFONE5;
    TIBStringField *IBQClienteFONEOBS5;
    TIBStringField *IBQClienteFONE6;
    TIBStringField *IBQClienteFONEOBS6;
    TIBStringField *IBQClienteOBSERVACAO;
    TIntegerField *CDSClienteCDCLIENTE;
    TStringField *CDSClienteNMCLIENTE;
    TStringField *CDSClienteENDERECO;
    TStringField *CDSClienteBAIRRO;
    TStringField *CDSClienteCIDADE;
    TStringField *CDSClientePONTOREF;
    TStringField *CDSClienteFONE1;
    TStringField *CDSClienteFONEOBS1;
    TStringField *CDSClienteFONE2;
    TStringField *CDSClienteFONEOBS2;
    TStringField *CDSClienteFONE3;
    TStringField *CDSClienteFONEOBS3;
    TStringField *CDSClienteFONE4;
    TStringField *CDSClienteFONEOBS4;
    TStringField *CDSClienteFONE5;
    TStringField *CDSClienteFONEOBS5;
    TStringField *CDSClienteFONE6;
    TStringField *CDSClienteFONEOBS6;
    TStringField *CDSClienteOBSERVACAO;
    TDataSetField *CDSClienteIBQContato;
    TLabel *Label46;
    TMaskEdit *EdtSaidaEmp;
    TMaskEdit *EdtChegadaLocal;
    TMaskEdit *EdtTempoDeslocamento;
    TMaskEdit *EdtSaidaLocal;
    TMaskEdit *EdtChegadaEmpresa;
    TMaskEdit *EdtTempoRetorno;
    TMaskEdit *EdtTempoAtendimento;
    TDBEdit *EdtLacre;
    TDBEdit *EdtKmSaida;
    TDBEdit *EdtHoraLacre;
    TIBQuery *IBQCodificador;
    TIntegerField *IntegerField1;
    TIBStringField *IBStringField1;
    TIBTransaction *IBTCodificador;

    void __fastcall DBGContatosDrawColumnCell(TObject *Sender,
          const TRect &Rect, int DataCol, TColumn *Column,
          TGridDrawState State);
    void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
    void __fastcall FormKeyPress(TObject *Sender, char &Key);
    void __fastcall CmbTipoOcorrenciaExit(TObject *Sender);
    void __fastcall EdtOcorrenciaPolicialExit(TObject *Sender);
    void __fastcall CDSEventosNUMSETORGetText(TField *Sender,
          AnsiString &Text, bool DisplayText);
    void __fastcall FormShow(TObject *Sender);
    void __fastcall CDSClienteTIPOCTXGetText(TField *Sender,
          AnsiString &Text, bool DisplayText);
    void __fastcall CDSOcorrenciaCDSUBTIPOOCORRENCIAChange(TField *Sender);
    void __fastcall BtnOrdemServicoClick(TObject *Sender);
    void __fastcall BtnLocalizarClienteClick(TObject *Sender);
    void __fastcall DSPOcorrenciaGetTableName(TObject *Sender,
          TDataSet *DataSet, AnsiString &TableName);
    void __fastcall EdtResumoEnter(TObject *Sender);
    void __fastcall CDSOcorrenciaCDCLIENTEChange(TField *Sender);
    void __fastcall EdtDataEventoDblClick(TObject *Sender);
    void __fastcall EdtDataAberturaOcorrenciaDblClick(TObject *Sender);
private:
    bool __fastcall ValidaOcorrencia();
    void __fastcall GeraOcorrenciaId();
    void __fastcall CalculaTemposEDistancias();
    bool __fastcall ValidaHora(AnsiString HoraInformada);
    TDateTime __fastcall ConfiguraDataHora(AnsiString HoraInformada, bool bNovoDia);
    void __fastcall CalcularTempoDeslocamento();
    void __fastcall CalcularTempoRetorno();
    void __fastcall CalcularTempoAtendimento();
public:
    __fastcall TFOcorrencia(TComponent* Owner);
    void __fastcall ConsultaOcorrencia(int iCodigoOcorrencia);
    void __fastcall AbrirManualmente();

    int FOcorrenciaId;
};
//---------------------------------------------------------------------------
extern PACKAGE TFOcorrencia *FOcorrencia;
//---------------------------------------------------------------------------
#endif
