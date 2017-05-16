//---------------------------------------------------------------------------

#ifndef CadOrdemServicoH
#define CadOrdemServicoH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <DBCtrls.hpp>
#include <Mask.hpp>
#include <Buttons.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <ToolWin.hpp>
#include <DB.hpp>
#include <DBClient.hpp>
#include <IBCustomDataSet.hpp>
#include <IBDatabase.hpp>
#include <IBQuery.hpp>
#include <IBStoredProc.hpp>
#include <Provider.hpp>
//---------------------------------------------------------------------------
class TFCadOrdemServico : public TForm
{
__published:	// IDE-managed Components
    TGroupBox *GroupBox1;
    TLabel *Label6;
    TLabel *Label19;
    TLabel *Label18;
    TLabel *Label16;
    TLabel *Label20;
    TLabel *Label21;
    TDBEdit *EdtCodCliente;
    TEdit *EdtNomeCliente;
    TEdit *EdtEnderecoMon;
    TEdit *EdtBairroMon;
    TEdit *EdtCidadeMon;
    TEdit *EdtUfMon;
    TEdit *EdtCepMon;
    TPanel *PMenu;
    TPanel *POperacoes;
    TToolBar *TBOperacoes;
    TToolButton *BtnNovo;
    TToolButton *BtnGravar;
    TToolButton *BtnEditar;
    TToolButton *BtnCancelar;
    TToolButton *BtnDeletar;
    TPanel *PFechar;
    TSpeedButton *BtnFechar;
    TDBMemo *EdtOrdemServico;
    TLabel *Label1;
    TDBCheckBox *CkbRetrabalho;
    TGroupBox *GroupBox2;
    TDBMemo *EdtObservacoes;
    TLabel *Label3;
    TGroupBox *GroupBox3;
    TDBEdit *EdtHoraInicio;
    TDBEdit *EdtHoraFim;
    TLabel *Label7;
    TDBEdit *EdtDataExecucao;
    TLabel *Label4;
    TLabel *Label5;
    TLabel *Label32;
    TDBLookupComboBox *CmbOperadorEncerramento;
    TLabel *Label33;
    TDBLookupComboBox *CmbTecnico;
    TDBEdit *EdtDataAberturaOcorrencia;
    TLabel *Label8;
    TLabel *Label9;
    TDBLookupComboBox *CmbOperadorAbertura;
    TIBTransaction *IBTOperadorAbertura;
    TIBQuery *IBQOperadorAbertura;
    TIntegerField *IBQOperadorAberturaCDUSUARIO;
    TIBStringField *IBQOperadorAberturaLOGIN;
    TDataSetProvider *DSPOperadorAbertura;
    TClientDataSet *CDSOperadorAbertura;
    TIntegerField *CDSOperadorAberturaCDUSUARIO;
    TStringField *CDSOperadorAberturaLOGIN;
    TIBTransaction *IBTOperadorEncerramento;
    TIBQuery *IBQOperadorEncerramento;
    TIntegerField *IntegerField9;
    TIBStringField *IBQOperadorEncerramentoLOGIN;
    TDataSetProvider *DSPOperadorEncerramento;
    TClientDataSet *CDSOperadorEncerramento;
    TIntegerField *IntegerField10;
    TStringField *CDSOperadorEncerramentoLOGIN;
    TIBTransaction *IBTOrdemServico;
    TIBQuery *IBQOrdemServico;
    TIntegerField *IBQOrdemServicoCDORDEMSERVICO;
    TIntegerField *IBQOrdemServicoCDCLIENTE;
    TIBStringField *IBQOrdemServicoDEORDEMSERVICO;
    TIntegerField *IBQOrdemServicoISRETRABALHO;
    TIBStringField *IBQOrdemServicoOBSERVACAO;
    TIntegerField *IBQOrdemServicoISORDEMENCERRADA;
    TDataSetProvider *DSPOrdemServico;
    TDataSource *DSOrdemServico;
    TClientDataSet *CDSOrdemServico;
    TIntegerField *CDSOrdemServicoCDORDEMSERVICO;
    TIntegerField *CDSOrdemServicoCDCLIENTE;
    TStringField *CDSOrdemServicoDEORDEMSERVICO;
    TIntegerField *CDSOrdemServicoISRETRABALHO;
    TStringField *CDSOrdemServicoOBSERVACAO;
    TIntegerField *CDSOrdemServicoISORDEMENCERRADA;
    TIBTransaction *IBTTecnico;
    TIBQuery *IBQTecnico;
    TIntegerField *IntegerField1;
    TIBStringField *IBStringField1;
    TDataSetProvider *DSPTecnico;
    TClientDataSet *CDSTecnico;
    TIntegerField *IntegerField2;
    TStringField *StringField1;
    TIntegerField *IBQOrdemServicoCDOPERADORABERTURA;
    TIntegerField *IBQOrdemServicoCDOPERADORENCERRAMENTO;
    TIntegerField *IBQOrdemServicoCDTECNICO;
    TDateField *IBQOrdemServicoDATAEXECUCAO;
    TTimeField *IBQOrdemServicoHORAINICIO;
    TTimeField *IBQOrdemServicoHORAFIM;
    TIntegerField *CDSOrdemServicoCDOPERADORABERTURA;
    TIntegerField *CDSOrdemServicoCDOPERADORENCERRAMENTO;
    TIntegerField *CDSOrdemServicoCDTECNICO;
    TDateField *CDSOrdemServicoDATAEXECUCAO;
    TTimeField *CDSOrdemServicoHORAINICIO;
    TTimeField *CDSOrdemServicoHORAFIM;
    TStringField *CDSOrdemServicoNMOPABERTURA;
    TStringField *CDSOrdemServicoNMOPENCERRAMENTO;
    TStringField *CDSOrdemServicoNMTECNICO;
    TSpeedButton *BtnLocalizarCliente;
    TIBStoredProc *IBSPGenIdOrdemServico;
    TIBTransaction *IBTGenIdOrdemServico;
    TLabel *Label2;
    TDBEdit *EdtCodigoOS;
    TLabel *Label10;
    TDateTimeField *CDSOrdemServicoDATACADASTRO;
    TDateTimeField *IBQOrdemServicoDATACADASTRO;
    TDateTimeField *IBQOrdemServicoDATAENCERRAMENTO;
    TDateTimeField *CDSOrdemServicoDATAENCERRAMENTO;
    TToolButton *BtnConsultar;
    TIBStringField *IBQOrdemServicoSTATUS;
    TStringField *CDSOrdemServicoSTATUS;
    void __fastcall FormCreate(TObject *Sender);
    void __fastcall BtnFecharClick(TObject *Sender);
    void __fastcall BtnNovoClick(TObject *Sender);
    void __fastcall EdtNomeClienteEnter(TObject *Sender);
    void __fastcall BtnGravarClick(TObject *Sender);
    void __fastcall BtnEditarClick(TObject *Sender);
    void __fastcall BtnCancelarClick(TObject *Sender);
    void __fastcall BtnDeletarClick(TObject *Sender);
    void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
    void __fastcall CDSOrdemServicoBeforePost(TDataSet *DataSet);
    void __fastcall BtnLocalizarClienteClick(TObject *Sender);
    void __fastcall CDSOrdemServicoCDCLIENTEChange(TField *Sender);
    void __fastcall BtnConsultarClick(TObject *Sender);

private:	// User declarations
    void __fastcall ConfiguraCharCaseForm(void);
    void __fastcall ConfiguraEventosForm(void);
    void __fastcall ChangeExit(TObject *Sender);
    void __fastcall ChangeEnter(TObject *Sender);
    void __fastcall HabilitaBarraBotoes(void);
    void __fastcall HabilitaCamposFormulario(bool Status);
    void __fastcall ConfiguraConsultaAuxiliar();
    void __fastcall ConsultaCliente(int CdCliente);
    void __fastcall GeraOrdemServicoId(void);
    bool __fastcall ValidaEncerramentoOrdemServico();
    bool __fastcall ValidaOrdemServico();
    TIntegerField *ObjetoCodigoOS;
    TStringField *ObjetoResumoOC;
public:		// User declarations
    __fastcall TFCadOrdemServico(TComponent* Owner);
    void __fastcall ConsultaOrdemServico(int CodigoOS);
void __fastcall CriarOrdemServicoOcorrencia(
        int CodigoCliente, int CodigoOperador, AnsiString DescricaoOrdemServico,
            AnsiString Estatus, TIntegerField *CampoCodigoOS, TStringField *CampoResumoOC);
};
//---------------------------------------------------------------------------
extern PACKAGE TFCadOrdemServico *FCadOrdemServico;
//---------------------------------------------------------------------------
#endif
