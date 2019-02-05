//---------------------------------------------------------------------------
#ifndef HomeH
#define HomeH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <Menus.hpp>
#include <ToolWin.hpp>
#include <IBEvents.hpp>
#include <DB.hpp>
#include <DBClient.hpp>
#include <IBCustomDataSet.hpp>
#include <IBDatabase.hpp>
#include <IBQuery.hpp>
#include <Provider.hpp>
#include <DBGrids.hpp>
#include <Grids.hpp>
#include <Buttons.hpp>

#include <sysmac.h>

#include "DMApp.h"
#include "CadCliente.h"
#include "ConsCliente.h"
#include "CadMonitoramento.h"
#include "OcorrenciaAviso.h"
#include "Ocorrencia.h"
#include "CadProcedimento.h"
#include "CadFilial.h"
#include "CadUsuario.h"
#include "CadSenhas.h"
#include "CadClienteProcedimento.h"
#include "OcorrenciasAbertas.h"
#include "CadContratoBasico.h"
#include <dbcgrids.hpp>
#include "SHDocVw_OCX.h"
#include <OleCtrls.hpp>
#include <DBTables.hpp>
#include <MXDB.hpp>
#include <Mxstore.hpp>
#include <MXTABLES.hpp>
#include <MXGRID.hpp>

//---------------------------------------------------------------------------
class TFHome : public TForm
{
__published:	// IDE-managed Components
    TMainMenu *MMenuHome;
    TMenuItem *MnCadastros;
    TStatusBar *SBarHome;
    TMenuItem *MnFiliais;
    TMenuItem *MnUsuarios;
    TMenuItem *N3;
    TMenuItem *MnSair;
    TMenuItem *MnConfiguracao;
    TMenuItem *MnConsultas;
    TMenuItem *MnRelatorios;
    TMenuItem *MnConsClientes;
    TMenuItem *MnCadCliente;
    TMenuItem *MnCadContrato;
    TMenuItem *N1;
    TMenuItem *MnOrdemServico;
    TMenuItem *MnCadProcedimento;
    TTimer *TMRConsulta;
    TDataSource *DSEventos;
    TClientDataSet *CDSConsEventos;
    TIntegerField *CDSConsEventosCTX;
    TIntegerField *CDSConsEventosPORTACOM;
    TIntegerField *CDSConsEventosEQUIPAMENTO;
    TStringField *CDSConsEventosDESTATUS;
    TStringField *CDSConsEventosNMCLIENTE;
    TStringField *CDSConsEventosENDERECO;
    TStringField *CDSConsEventosCIDADE;
    TDateTimeField *CDSConsEventosDATAEVENTO;
    TDataSetProvider *DSPEventos;
    TIBQuery *IBQConsEventos;
    TIntegerField *IBQConsEventosCTX;
    TIntegerField *IBQConsEventosPORTACOM;
    TIntegerField *IBQConsEventosEQUIPAMENTO;
    TIBStringField *IBQConsEventosDESTATUS;
    TIBStringField *IBQConsEventosNMCLIENTE;
    TIBStringField *IBQConsEventosENDERECO;
    TIBStringField *IBQConsEventosCIDADE;
    TDateTimeField *IBQConsEventosDATAEVENTO;
    TIBTransaction *IBTConsEventos;
    TTimer *TMRMonitoramento;
    TIBEvents *IBEOcorrencia;
    TMenuItem *MnMonitorSerial;
    TMenuItem *MnMonitor1;
    TMenuItem *MnMonitor2;
    TMenuItem *MnMonitor3;
    TMenuItem *MnMonitor4;
    TMenuItem *MnMonitor5;
    TMenuItem *MnMonitor6;
    TMenuItem *MnMonitor7;
    TMenuItem *MnMonitor8;
    TMenuItem *MnMonitor9;
    TMenuItem *MnMonitor10;
    TMenuItem *MnMonitor11;
    TMenuItem *MnMonitor12;
    TMenuItem *MnMonitor13;
    TMenuItem *MnMonitor14;
    TMenuItem *MnMonitor15;
    TMenuItem *MnMonitor16;
    TDataSource *DSRelAtendimento;
    TClientDataSet *CDSRelAtendimento;
    TDataSetProvider *DSPRelAtendimento;
    TIBQuery *IBQRelAtendimento;
    TIBTransaction *IBTRelAtendimento;
    TIBTransaction *IBTOcorrenciasAbertas;
    TIBQuery *IBQOcorrenciasAbertas;
    TIntegerField *IBQOcorrenciasAbertasCDOCORRENCIA;
    TIntegerField *IBQOcorrenciasAbertasCTX;
    TIntegerField *IBQOcorrenciasAbertasPORTACOM;
    TIntegerField *IBQOcorrenciasAbertasEQUIPAMENTO;
    TIBStringField *IBQOcorrenciasAbertasSTATUS;
    TIBStringField *IBQOcorrenciasAbertasDESTATUS;
    TIBStringField *IBQOcorrenciasAbertasNMCLIENTE;
    TIBStringField *IBQOcorrenciasAbertasENDERECO;
    TIBStringField *IBQOcorrenciasAbertasBAIRRO;
    TIBStringField *IBQOcorrenciasAbertasCIDADE;
    TIntegerField *IBQOcorrenciasAbertasCDOPERADORENCERRAMENTO;
    TIntegerField *IBQOcorrenciasAbertasCDTIPOOCORRENCIA;
    TIntegerField *IBQOcorrenciasAbertasCDSUBTIPOOCORRENCIA;
    TIBStringField *IBQOcorrenciasAbertasRESUMO;
    TDataSetProvider *DSPOcorrenciasAbertas;
    TClientDataSet *CDSOcorrenciasAbertas;
    TIntegerField *CDSOcorrenciasAbertasCDOCORRENCIA;
    TIntegerField *CDSOcorrenciasAbertasCTX;
    TIntegerField *CDSOcorrenciasAbertasPORTACOM;
    TIntegerField *CDSOcorrenciasAbertasEQUIPAMENTO;
    TStringField *CDSOcorrenciasAbertasSTATUS;
    TStringField *CDSOcorrenciasAbertasDESTATUS;
    TStringField *CDSOcorrenciasAbertasNMCLIENTE;
    TStringField *CDSOcorrenciasAbertasENDERECO;
    TStringField *CDSOcorrenciasAbertasBAIRRO;
    TStringField *CDSOcorrenciasAbertasCIDADE;
    TIntegerField *CDSOcorrenciasAbertasCDOPERADORENCERRAMENTO;
    TIntegerField *CDSOcorrenciasAbertasCDTIPOOCORRENCIA;
    TIntegerField *CDSOcorrenciasAbertasCDSUBTIPOOCORRENCIA;
    TStringField *CDSOcorrenciasAbertasRESUMO;
    TDataSource *DSOcorrenciasAbertas;
    TIBStringField *IBQConsEventosSTATUS;
    TStringField *CDSConsEventosSTATUS;
    TIBTransaction *IBTConsFaltaComunicacao;
    TIBQuery *IBQConsFaltaComunicacao;
    TDataSetProvider *DSPConsFaltaComunicacao;
    TClientDataSet *CDSConsFaltaComunicacao;
    TDataSource *DSConsFaltaComunicacao;
    TIntegerField *IBQConsFaltaComunicacaoCTX;
    TIntegerField *IBQConsFaltaComunicacaoPORTACOM;
    TIntegerField *IBQConsFaltaComunicacaoTIPOCTX;
    TDateTimeField *IBQConsFaltaComunicacaoDATACONEXAO;
    TDateTimeField *IBQConsFaltaComunicacaoDATA_ULTIMOEVENTO;
    TLargeintField *IBQConsFaltaComunicacaoMINUTOS_SEM_COMUNICACAO;
    TIntegerField *CDSConsFaltaComunicacaoCTX;
    TIntegerField *CDSConsFaltaComunicacaoPORTACOM;
    TIntegerField *CDSConsFaltaComunicacaoTIPOCTX;
    TDateTimeField *CDSConsFaltaComunicacaoDATACONEXAO;
    TDateTimeField *CDSConsFaltaComunicacaoDATA_ULTIMOEVENTO;
    TLargeintField *CDSConsFaltaComunicacaoMINUTOS_SEM_COMUNICACAO;
    TIntegerField *IBQConsFaltaComunicacaoCDUSUARIO_DESATIVOU;
    TIBStringField *IBQConsFaltaComunicacaoMOTIVO_DESATIVOU;
    TIntegerField *CDSConsFaltaComunicacaoCDUSUARIO_DESATIVOU;
    TStringField *CDSConsFaltaComunicacaoMOTIVO_DESATIVOU;
    TIntegerField *IBQConsFaltaComunicacaoMONITORAMENTO_ATIVO;
    TIntegerField *CDSConsFaltaComunicacaoMONITORAMENTO_ATIVO;
    TMenuItem *MnRelEventos;
    TMenuItem *MnCadastrarOS;
    TMenuItem *MnConsultarOS;
    TMenuItem *MnCadCodificador;
    TDateTimeField *IBQOcorrenciasAbertasDATAEVENTO;
    TIntegerField *IBQOcorrenciasAbertasCDCLIENTE;
    TDateTimeField *CDSOcorrenciasAbertasDATAEVENTO;
    TIntegerField *CDSOcorrenciasAbertasCDCLIENTE;
    TIntegerField *IBQConsEventosCDCLIENTE;
    TIntegerField *CDSConsEventosCDCLIENTE;
    TDateTimeField *IBQRelAtendimentoDATAEVENTO;
    TIntegerField *IBQRelAtendimentoCTX;
    TIntegerField *IBQRelAtendimentoPORTACOM;
    TIntegerField *IBQRelAtendimentoEQUIPAMENTO;
    TIBStringField *IBQRelAtendimentoNMCLIENTE;
    TIBStringField *IBQRelAtendimentoENDERECO;
    TIBStringField *IBQRelAtendimentoCIDADE;
    TIBStringField *IBQRelAtendimentoSTATUS;
    TIBStringField *IBQRelAtendimentoDESTATUS;
    TIBStringField *IBQRelAtendimentoLOCAL;
    TIBStringField *IBQRelAtendimentoRESUMO;
    TIBStringField *IBQRelAtendimentoOPERADORABERTURA;
    TIBStringField *IBQRelAtendimentoOPERADORENCERRAMENTO;
    TIBStringField *IBQRelAtendimentoAGENTE;
    TIBBCDField *IBQRelAtendimentoKMTOTALPERCORRIDO;
    TDateTimeField *CDSRelAtendimentoDATAEVENTO;
    TIntegerField *CDSRelAtendimentoCTX;
    TIntegerField *CDSRelAtendimentoPORTACOM;
    TIntegerField *CDSRelAtendimentoEQUIPAMENTO;
    TStringField *CDSRelAtendimentoNMCLIENTE;
    TStringField *CDSRelAtendimentoENDERECO;
    TStringField *CDSRelAtendimentoCIDADE;
    TStringField *CDSRelAtendimentoSTATUS;
    TStringField *CDSRelAtendimentoDESTATUS;
    TStringField *CDSRelAtendimentoLOCAL;
    TStringField *CDSRelAtendimentoRESUMO;
    TStringField *CDSRelAtendimentoOPERADORABERTURA;
    TStringField *CDSRelAtendimentoOPERADORENCERRAMENTO;
    TStringField *CDSRelAtendimentoAGENTE;
    TBCDField *CDSRelAtendimentoKMTOTALPERCORRIDO;
    TIntegerField *IBQRelAtendimentoCDCLIENTE;
    TIntegerField *CDSRelAtendimentoCDCLIENTE;
    TIntegerField *IBQRelAtendimentoCDOCORRENCIA;
    TIntegerField *CDSRelAtendimentoCDOCORRENCIA;
    TMenuItem *MnAtendimento;
    TMenuItem *MnAbrirOcorrencia;
    TPanel *PHome;
    TPageControl *PGCHome;
    TTabSheet *TSRegistroEventos;
    TPanel *pnlEventos;
    TDBGrid *gridEventos;
    TTabSheet *TSResgistroOcorrencia;
    TPanel *pnlConsultaEventos;
    TLabel *Label2;
    TDateTimePicker *EdtDataInicial;
    TDateTimePicker *EdtDataFinal;
    TLabel *Label3;
    TLabel *Label6;
    TEdit *EdtCodCliente;
    TEdit *EdtNome;
    TLabel *Label8;
    TEdit *EdtCodificador;
    TLabel *Label4;
    TLabel *Label5;
    TEdit *EdtStatus;
    TEdit *EdtStatusDescricao;
    TLabel *Label9;
    TSpeedButton *BtnConsultar;
    TCheckBox *CkbAtualizar;
    TPanel *pnlOcorrencias;
    TDBGrid *gridOcorrencias;
    TSplitter *Splitter1;
    TPanel *pnlTituloForm;
    TPanel *pnlSubTituloForm;
    TPanel *Panel2;
    TSpeedButton *BtnConsultarOC;
    TSpeedButton *BtnImprimirOC;
    TGroupBox *GroupBox1;
    TLabel *Label1;
    TLabel *Label7;
    TDateTimePicker *EdtDataFinalOC;
    TDateTimePicker *EdtDataInicialOC;
    TDBGrid *DBGOcorrenciasHist;
    TGroupBox *GroupBox2;
    TLabel *Label10;
    TLabel *Label11;
    TLabel *Label12;
    TEdit *EdtCodClienteOC;
    TEdit *EdtNomeOC;
    TEdit *EdtCodificadorOC;
    TGroupBox *GroupBox3;
    TLabel *Label13;
    TLabel *Label14;
    TEdit *EdtStatusOC;
    TEdit *EdtStatusDescricaoOC;
    TPanel *Panel3;
    TMenuItem *MnRelOcorrencias;
    TMenuItem *N2;
    TMenuItem *MnRelContratosAtivos;
    TMenuItem *MnRelContratosInativos;
    TMenuItem *N4;
    TMenuItem *Clientesativos1;
    TMenuItem *Clientesinativos1;
    TMenuItem *N5;
    TMenuItem *Codificadores1;
    TMenuItem *N6;
    TTabSheet *TSUltimoEstado;
    TPanel *Panel4;
    TPanel *Panel5;
    TMenuItem *Consultasimplificadadeclientes1;
    TDataSource *DSIdentificao;
    TClientDataSet *CDSIdentificao;
    TDataSetProvider *DSPIdentificao;
    TIBQuery *IBQIdentificao;
    TIBTransaction *IBTIdentificao;
    TDateTimeField *IBQIdentificaoULTIMADATA;
    TIntegerField *IBQIdentificaoCDCLIENTE;
    TIBStringField *IBQIdentificaoIDENTIFICACAO;
    TIBStringField *IBQIdentificaoNMCLIENTE;
    TIBStringField *IBQIdentificaoENDERECO;
    TIBStringField *IBQIdentificaoBAIRRO;
    TIBStringField *IBQIdentificaoCIDADE;
    TIntegerField *IBQIdentificaoTOTAL30DIAS;
    TDateTimeField *CDSIdentificaoULTIMADATA;
    TIntegerField *CDSIdentificaoCDCLIENTE;
    TStringField *CDSIdentificaoIDENTIFICACAO;
    TStringField *CDSIdentificaoNMCLIENTE;
    TStringField *CDSIdentificaoENDERECO;
    TStringField *CDSIdentificaoBAIRRO;
    TStringField *CDSIdentificaoCIDADE;
    TIntegerField *CDSIdentificaoTOTAL30DIAS;
    TDataSource *DSLinkIdentificacaoCliente;
    TIBQuery *IBQIdentificacaoCliente;
    TDataSetProvider *DSPIdentificaoCliente;
    TClientDataSet *CDSIdentificaoCliente;
    TIntegerField *IBQIdentificacaoClienteCDLOGULTIMOESTADO;
    TDateField *IBQIdentificacaoClienteDATACADASTRO;
    TDateTimeField *IBQIdentificacaoClienteDATAIDENTIFICACAO;
    TIntegerField *IBQIdentificacaoClienteCDCLIENTE;
    TIBStringField *IBQIdentificacaoClienteIDENTIFICACAO;
    TDateTimeField *IBQIdentificacaoClienteDATAULTIMOEVENTO;
    TIBStringField *IBQIdentificacaoClienteULTIMOEVENTO;
    TDataSetField *CDSIdentificaoIBQIdentificacaoCliente;
    TIntegerField *CDSIdentificaoClienteCDLOGULTIMOESTADO;
    TDateField *CDSIdentificaoClienteDATACADASTRO;
    TDateTimeField *CDSIdentificaoClienteDATAIDENTIFICACAO;
    TIntegerField *CDSIdentificaoClienteCDCLIENTE;
    TStringField *CDSIdentificaoClienteIDENTIFICACAO;
    TDateTimeField *CDSIdentificaoClienteDATAULTIMOEVENTO;
    TStringField *CDSIdentificaoClienteULTIMOEVENTO;
    TDataSource *DSIdentificacaoCliente;
    TIBBCDField *IBQIdentificaoPERCENTUAL;
    TBCDField *CDSIdentificaoPERCENTUAL;
    TPageControl *PageControl1;
    TTabSheet *TSIdentificacao;
    TTabSheet *TSSemIdentificacao;
    TDBGrid *DBGClientesUltimosEventos;
    TDBGrid *DBGClientesIdentificados;
    TPanel *Panel1;
    TSpeedButton *BtnConsultarClientesIdentificados;
    TSpeedButton *SpeedButton3;
    TSplitter *Splitter2;
    TDBGrid *DBGrid3;
    TPanel *Panel6;
    TSpeedButton *BtnConsultarClientesNaoIdentificados;
    TSpeedButton *SpeedButton4;
    TDBGrid *DBGrid4;
    TSplitter *Splitter3;
    TGroupBox *GroupBox4;
    TLabel *Label15;
    TLabel *Label16;
    TLabel *Label17;
    TEdit *EdtCodClienteIdentificados;
    TEdit *EdtNomeClienteIdentificados;
    TEdit *EdtCodificadorIdentificados;
    void __fastcall MnSairClick(TObject *Sender);
    void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
    void __fastcall MnCadContratoClick(TObject *Sender);
    void __fastcall MnCadClienteClick(TObject *Sender);
    void __fastcall MnConsClientesClick(TObject *Sender);
    void __fastcall MnCadProcedimentoClick(TObject *Sender);
    void __fastcall MnFiliaisClick(TObject *Sender);
    void __fastcall MnUsuariosClick(TObject *Sender);
    void __fastcall FormShow(TObject *Sender);
    void __fastcall DBGOcorrenciasHistDblClick(TObject *Sender);
    void __fastcall BtnConsultarClick(TObject *Sender);
    void __fastcall TMRConsultaTimer(TObject *Sender);
    void __fastcall CkbAtualizarClick(TObject *Sender);
    void __fastcall MnCadMonitoramentoClick(TObject *Sender);
    void __fastcall TMRMonitoramentoTimer(TObject *Sender);
    void __fastcall IBEOcorrenciaEventAlert(TObject *Sender,
          AnsiString EventName, int EventCount, bool &CancelAlerts);
    void __fastcall MnMonitor1Click(TObject *Sender);
    void __fastcall MnMonitor2Click(TObject *Sender);
    void __fastcall MnMonitor3Click(TObject *Sender);
    void __fastcall MnMonitor4Click(TObject *Sender);
    void __fastcall MnMonitor5Click(TObject *Sender);
    void __fastcall MnMonitor6Click(TObject *Sender);
    void __fastcall MnMonitor7Click(TObject *Sender);
    void __fastcall MnMonitor8Click(TObject *Sender);
    void __fastcall MnMonitor9Click(TObject *Sender);
    void __fastcall MnMonitor10Click(TObject *Sender);
    void __fastcall MnMonitor11Click(TObject *Sender);
    void __fastcall MnMonitor12Click(TObject *Sender);
    void __fastcall MnMonitor13Click(TObject *Sender);
    void __fastcall MnMonitor14Click(TObject *Sender);
    void __fastcall MnMonitor15Click(TObject *Sender);
    void __fastcall MnMonitor16Click(TObject *Sender);
    void __fastcall BtnConsultarOCClick(TObject *Sender);
    void __fastcall gridOcorrenciasDblClick(TObject *Sender);
    void __fastcall DSPConsFaltaComunicacaoGetTableName(TObject *Sender,
          TDataSet *DataSet, AnsiString &TableName);
    void __fastcall MnRelEventosClick(TObject *Sender);
    void __fastcall MnCadastrarOSClick(TObject *Sender);
    void __fastcall MnConsultarOSClick(TObject *Sender);
    void __fastcall MnCadCodificadorClick(TObject *Sender);
    void __fastcall BtnImprimirOCClick(TObject *Sender);
    void __fastcall MnAbrirOcorrenciaClick(TObject *Sender);
    void __fastcall gridOcorrenciasDrawColumnCell(TObject *Sender,
          const TRect &Rect, int DataCol, TColumn *Column,
          TGridDrawState State);
    void __fastcall gridEventosDrawColumnCell(TObject *Sender,
          const TRect &Rect, int DataCol, TColumn *Column,
          TGridDrawState State);
    void __fastcall DBGOcorrenciasHistDrawColumnCell(TObject *Sender,
          const TRect &Rect, int DataCol, TColumn *Column,
          TGridDrawState State);
    void __fastcall MnRelOcorrenciasClick(TObject *Sender);
    void __fastcall Clientesativos1Click(TObject *Sender);
    void __fastcall Clientesinativos1Click(TObject *Sender);
    void __fastcall Consultasimplificadadeclientes1Click(TObject *Sender);
    void __fastcall BtnConsultarClientesIdentificadosClick(TObject *Sender);
    void __fastcall DBGClientesIdentificadosDrawColumnCell(TObject *Sender,
          const TRect &Rect, int DataCol, TColumn *Column,
          TGridDrawState State);
    void __fastcall DBGClientesUltimosEventosDrawColumnCell(TObject *Sender,
          const TRect &Rect, int DataCol, TColumn *Column,
          TGridDrawState State);
    void __fastcall BtnConsultarClientesNaoIdentificadosClick(
          TObject *Sender);
private:	// User declarations
    // Métodos
    HWND __fastcall CarregaMonitor(LPCTSTR program, LPCTSTR args);
    void __fastcall ConfiguraCriteriosEventosSQL();
    void __fastcall ConfiguraCriteriosOcorrenciasSQL();
    void __fastcall ConfiguraCriteriosIdentificacaoSQL();
    void __fastcall ConfiguraCriteriosNaoIdentificacaoSQL();       
    bool __fastcall ValidaOcorrencia();

public:		// User declarations
    __fastcall TFHome(TComponent* Owner);
    void __fastcall AtualizarListaOcorrencias();
    bool __fastcall FormEstaAberto(AnsiString Name);
    TForm* OcorrenciaEmAtendimento(int iCdOcorrencia);
};

//---------------------------------------------------------------------------
extern PACKAGE TFHome *FHome;
//---------------------------------------------------------------------------

#ifndef AZSIM
#define AZSIM  extern
#else
#define AZSIM
#endif

#define NR_RETRANSMISSOES_CTX     2
#define ESPERA_RESPOSTA_CTX       200
#define PERIODO_TIMER             30
#define NR_MAX_MSG                1000
#define TAM_CAMINHO               30
#define TAM_BUFFER                1000

#define SetBit(a,b)               (a |=  (0x01<<(b)))
#define ClearBit(a,b)             (a &= ~(0x01<<(b)))
#define CheckBit(a,b)             ((a>>b) & 0x01)

AZSIM char acBuffer[TAM_BUFFER];

#endif
