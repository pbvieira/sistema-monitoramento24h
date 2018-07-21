//---------------------------------------------------------------------------

#ifndef CadContratoBasicoH
#define CadContratoBasicoH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Buttons.hpp>
#include <ComCtrls.hpp>
#include <DBCtrls.hpp>
#include <ExtCtrls.hpp>
#include <Mask.hpp>
#include <ToolWin.hpp>
#include <DBGrids.hpp>
#include <Grids.hpp>
#include <Graphics.hpp>
//---------------------------------------------------------------------------
class TFCadContratoBasico : public TForm
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
    TPanel *PFechar;
    TSpeedButton *BtnFechar;
    TToolButton *BtnVoltar;
    TToolButton *BtnAvancar;
    TPageControl *PgcContrato;
    TTabSheet *TbsContrato;
    TTabSheet *TbsSetor;
    TPanel *pnlTituloForm;
    TPanel *Panel2;
    TLabel *Label4;
    TLabel *Label6;
    TLabel *Label9;
    TLabel *Label19;
    TLabel *Label18;
    TLabel *Label16;
    TLabel *Label20;
    TLabel *Label21;
    TLabel *Label15;
    TSpeedButton *BtnLocalizarCliente;
    TLabel *Label17;
    TLabel *Label7;
    TLabel *Label8;
    TLabel *Label10;
    TLabel *Label11;
    TLabel *Label12;
    TLabel *Label13;
    TLabel *Label14;
    TLabel *Label28;
    TLabel *Label29;
    TLabel *Label30;
    TLabel *Label31;
    TLabel *Label32;
    TDBEdit *EdtCodigo;
    TDBEdit *EdtCodCodificador;
    TDBEdit *EdtCodCliente;
    TEdit *EdtNomeCliente;
    TDBEdit *EdtEnderecoMon;
    TDBEdit *EdtBairroMon;
    TDBEdit *EdtCidadeMon;
    TDBEdit *EdtUfMon;
    TDBEdit *EdtCepMon;
    TDBEdit *EdtChave;
    TDBEdit *EdtDataAtivacao;
    TDBEdit *EdtDataInicial;
    TDBEdit *EdtDataFinal;
    TDBEdit *EdtDiaRevisao;
    TDBLookupComboBox *CmbReceita;
    TDBLookupComboBox *CmbItem;
    TDBEdit *EdtValorInicial;
    TDBEdit *EdtValorAtual;
    TDBLookupComboBox *CmbTipoCobranca;
    TDBEdit *EdtDiaVenc;
    TDBEdit *EdtTolerancia;
    TDBEdit *EdtQtdParcelas;
    TDBCheckBox *CkbConfChave;
    TDBCheckBox *CkbLocacao;
    TDBLookupComboBox *CmbMotivoCancelamento;
    TDBCheckBox *CkbInativo;
    TPanel *Panel3;
    TLabel *Label1;
    TLabel *Label3;
    TLabel *Label5;
    TLabel *Label2;
    TLabel *Label23;
    TDBMemo *EdtInfoComercial;
    TDBEdit *EdtLocalInstalacao;
    TDBEdit *EdtInfoTecnica;
    TDBGrid *DBGSetor;
    TImage *Image1;
    void __fastcall FormCreate(TObject *Sender);
    void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
    void __fastcall ChangeEnter(TObject * Sender);
    void __fastcall ChangeExit(TObject *Sender);
    void __fastcall BtnNovoClick(TObject *Sender);
    void __fastcall BtnGravarClick(TObject *Sender);
    void __fastcall BtnEditarClick(TObject *Sender);
    void __fastcall BtnCancelarClick(TObject *Sender);
    void __fastcall BtnDeletarClick(TObject *Sender);
    void __fastcall BtnFecharClick(TObject *Sender);
    void __fastcall EdtNomeClienteEnter(TObject *Sender);
    void __fastcall BtnVoltarClick(TObject *Sender);
    void __fastcall BtnAvancarClick(TObject *Sender);
    void __fastcall DBGSetorDrawColumnCell(TObject *Sender,
          const TRect &Rect, int DataCol, TColumn *Column,
          TGridDrawState State);
    void __fastcall BtnLocalizarClienteClick(TObject *Sender);
    
private:
    void __fastcall HabilitaBarraBotoes(void); // User declarations
    void __fastcall HabilitaCamposFormulario(bool Status);
    void __fastcall ConfiguraCharCaseForm(void);
    void __fastcall ConfiguraEventosForm(void);
    void __fastcall ConfiguraConsultaAuxiliar();

public:		// User declarations
    __fastcall TFCadContratoBasico(TComponent* Owner);
    void __fastcall ConsultaContrato(int CodigoContrato, int CodigoCliente);
    bool __fastcall ValidaContrato();
    void __fastcall ConsultaCliente(int CdCliente, bool AtualizaEndereco);
};
//---------------------------------------------------------------------------
extern PACKAGE TFCadContratoBasico *FCadContratoBasico;
//---------------------------------------------------------------------------
#endif
