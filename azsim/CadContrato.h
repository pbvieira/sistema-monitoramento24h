//---------------------------------------------------------------------------

#ifndef CadContratoH
#define CadContratoH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
#include <Buttons.hpp>
#include <ComCtrls.hpp>
#include <ToolWin.hpp>
#include <DBCtrls.hpp>
#include <Mask.hpp>
#include <Graphics.hpp>
//---------------------------------------------------------------------------
class TFCadContrato : public TForm
{
__published:	// IDE-managed Components
    TPanel *PMenu;
    TPanel *POperacoes;
    TToolBar *TBOperacoes;
    TToolButton *BtnNovo;
    TToolButton *BtnGravar;
    TToolButton *BtnEditar;
    TToolButton *BtnCancelar;
    TToolButton *BtnDeletar;
    TToolButton *BtnPesquisa;
    TPanel *PFechar;
    TSpeedButton *BtnFechar;
    TDBEdit *EdtCodigo;
    TLabel *Label4;
    TDBLookupComboBox *CmbTipoContrato;
    TLabel *Label14;
    TLabel *Label6;
    TDBEdit *EdtCodCodificador;
    TLabel *Label9;
    TDBEdit *EdtDataAtivacao;
    TLabel *Label17;
    TDBEdit *EdtDataInicial;
    TLabel *Label3;
    TDBEdit *EdtDataFinal;
    TLabel *Label5;
    TDBEdit *EdtDiaRevisao;
    TLabel *Label7;
    TDBLookupComboBox *CmbReceita;
    TLabel *Label8;
    TDBLookupComboBox *CmbItem;
    TLabel *Label10;
    TLabel *Label11;
    TDBEdit *EdtValorInicial;
    TDBEdit *EdtValorAtual;
    TLabel *Label12;
    TDBEdit *EdtChave;
    TLabel *Label15;
    TLabel *Label19;
    TDBEdit *EdtEnderecoCob;
    TLabel *Label18;
    TDBEdit *EdtBairroCob;
    TDBEdit *EdtCepCob;
    TDBEdit *EdtUfCob;
    TDBEdit *EdtCidadeCob;
    TLabel *Label16;
    TLabel *Label20;
    TLabel *Label21;
    TLabel *Label22;
    TDBLookupComboBox *CmbTipoCobranca;
    TDBEdit *EdtDiaVenc;
    TLabel *Label23;
    TLabel *Label24;
    TDBEdit *EdtTolerancia;
    TDBEdit *EdtQtdParcelas;
    TLabel *Label25;
    TDBCheckBox *CkbConfChave;
    TDBCheckBox *CkbLocacao;
    TDBEdit *EdtCodCliente;
    TEdit *EdtNomeCliente;
    TDBLookupComboBox *CmbMotivoCancelamento;
    TLabel *Label26;
    TDBCheckBox *CkbInativo;
    void __fastcall FormCreate(TObject *Sender);
    void __fastcall BtnNovoClick(TObject *Sender);
    void __fastcall BtnGravarClick(TObject *Sender);
    void __fastcall BtnEditarClick(TObject *Sender);
    void __fastcall BtnCancelarClick(TObject *Sender);
    void __fastcall BtnDeletarClick(TObject *Sender);
    void __fastcall BtnFecharClick(TObject *Sender);
    void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
    void __fastcall EdtNomeClienteEnter(TObject *Sender);
    void __fastcall EdtModeloCodificadorEnter(TObject *Sender);
    void __fastcall CkbInativoClick(TObject *Sender);
private:	// User declarations
    void __fastcall ChangeEnter(TObject *Sender);
    void __fastcall ChangeExit(TObject *Sender);
    void __fastcall GeraContratoId(void);
    void __fastcall HabilitaBarraBotoes(void);
    void __fastcall HabilitaCamposFormulario(bool Status);
    void __fastcall ConfiguraCharCaseForm(void);
    void __fastcall ConfiguraEventosForm(void);
    void __fastcall ConsultaCliente(int CdCliente, bool AtualizaEndereco);
    void __fastcall ConsultaCodificador(int CdCodificador);
    void __fastcall ConfiguraConsultaAuxiliar();
public:		// User declarations
    __fastcall TFCadContrato(TComponent* Owner);
    void __fastcall ConsultaContrato(int CodigoContrato, int CodigoCliente);
    bool __fastcall ValidaContrato();
};
//---------------------------------------------------------------------------
extern PACKAGE TFCadContrato *FCadContrato;
//---------------------------------------------------------------------------
#endif
