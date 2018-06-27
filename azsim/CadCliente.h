//---------------------------------------------------------------------------

#ifndef CadClienteH
#define CadClienteH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
#include <DBCtrls.hpp>
#include <DBGrids.hpp>
#include <Grids.hpp>
#include <ComCtrls.hpp>
#include <ToolWin.hpp>
#include <Mask.hpp>
#include <Buttons.hpp>
#include <Graphics.hpp>
//---------------------------------------------------------------------------
class TFCadCliente : public TForm
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
    TGroupBox *GRPObs;
    TDBMemo *EdtObservacao;
    TGroupBox *GRPCliente;
    TLabel *Label2;
    TLabel *Label4;
    TLabel *Label6;
    TLabel *Label7;
    TLabel *Label8;
    TLabel *Label9;
    TLabel *Label10;
    TLabel *Label11;
    TLabel *Label12;
    TLabel *Label13;
    TLabel *Label22;
    TLabel *Label20;
    TLabel *Label25;
    TDBLookupComboBox *CmbFilial;
    TDBEdit *EdtCodigo;
    TDBEdit *EdtNmCliente;
    TDBEdit *EdtDocumento;
    TDBComboBox *CmbNatureza;
    TDBEdit *EdtEndereco;
    TDBEdit *EdtBairro;
    TDBEdit *EdtCidade;
    TDBEdit *EdtUf;
    TDBEdit *EdtCep;
    TDBEdit *EdtIcm;
    TDBEdit *EdtPontoRef;
    TDBEdit *EdtKmBase;
    TGroupBox *GRPContatos;
    TLabel *Label34;
    TLabel *Label35;
    TLabel *Label36;
    TLabel *Label37;
    TLabel *Label38;
    TLabel *Label39;
    TLabel *Label40;
    TLabel *Label41;
    TDBEdit *EdtFone1;
    TDBEdit *EdtFone1Obs;
    TDBEdit *EdtFone2;
    TDBEdit *EdtFone2Obs;
    TDBEdit *EdtFone3;
    TDBEdit *EdtFone3Obs;
    TDBEdit *EdtFone4;
    TDBEdit *EdtFone4Obs;
    TSpeedButton *BtnProcedimentos;
    TSpeedButton *BtnSenhas;
    TLabel *Label3;
    TLabel *Label5;
    TLabel *Label14;
    TLabel *Label15;
    TDBEdit *EdtFone5;
    TDBEdit *EdtFone5Obs;
    TDBEdit *EdtFone6;
    TDBEdit *EdtFone6Obs;
    TSpeedButton *BtnPesquisa;
    TSpeedButton *BtnContratos;
        TLabel *Label1;
        TDBEdit *EdtNomeFantasia;
        TLabel *Label16;
        TLabel *Label17;
        TLabel *Label18;
        TLabel *Label19;
        TDBEdit *EdtFone7;
        TDBEdit *EdtFone7Obs;
        TDBEdit *EdtFone8;
        TDBEdit *EdtFone8Obs;
    void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
    void __fastcall BtnFecharClick(TObject *Sender);
    void __fastcall BtnNovoClick(TObject *Sender);
    void __fastcall BtnGravarClick(TObject *Sender);
    void __fastcall BtnEditarClick(TObject *Sender);
    void __fastcall BtnCancelarClick(TObject *Sender);
    void __fastcall FormCreate(TObject *Sender);
    void __fastcall ChangeEnter(TObject *Sender);
    void __fastcall ChangeExit(TObject *Sender);
    void __fastcall HabilitaBarraBotoes(void);
    void __fastcall HabilitaCamposFormulario(bool Status, bool Todos, int IndiceDaTab);
    void __fastcall HabilitaCamposFormulario(bool Status, bool Todos);
    void __fastcall ConfiguraEventosForm(void);
    void __fastcall ConfiguraCharCaseForm(void);
    void __fastcall BtnDeletarClick(TObject *Sender);
    void __fastcall CkbMesmoEnderContatoClick(TObject *Sender);
    void __fastcall BtnProcedimentosClick(TObject *Sender);
    void __fastcall BtnSenhasClick(TObject *Sender);
    void __fastcall BtnPesquisaClick(TObject *Sender);
    void __fastcall BtnContratosClick(TObject *Sender);
private:	// User declarations
    void __fastcall GeraClienteId(void);
public:		// User declarations
    __fastcall TFCadCliente(TComponent* Owner);
    void __fastcall ConsultaCliente(int CodigoCliente);
    bool __fastcall ValidaCliente();
};
//---------------------------------------------------------------------------
extern PACKAGE TFCadCliente *FCadCliente;
//---------------------------------------------------------------------------
#endif
