//---------------------------------------------------------------------------

#ifndef CadCentralH
#define CadCentralH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
#include <DBCtrls.hpp>
#include <Mask.hpp>
#include <Buttons.hpp>
#include <ComCtrls.hpp>
#include <ToolWin.hpp>
#include <DBGrids.hpp>
#include <Grids.hpp>
#include <Graphics.hpp>
//---------------------------------------------------------------------------
class TFCadCentral : public TForm
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
    TGroupBox *GroupBox1;
    TLabel *Label4;
    TLabel *Label19;
    TLabel *Label3;
    TLabel *Label5;
    TDBEdit *EdtCodigo;
    TEdit *EdtNomeCliente;
    TDBEdit *EdtLocalInstalacao;
    TDBEdit *EdtInfoTecnica;
    TGroupBox *GroupBox2;
    TDBGrid *DBGSetor;
    TDBMemo *EdtInfoComercial;
    void __fastcall FormCreate(TObject *Sender);
    void __fastcall BtnNovoClick(TObject *Sender);
    void __fastcall BtnGravarClick(TObject *Sender);
    void __fastcall BtnEditarClick(TObject *Sender);
    void __fastcall BtnCancelarClick(TObject *Sender);
    void __fastcall BtnDeletarClick(TObject *Sender);
    void __fastcall BtnFecharClick(TObject *Sender);
    void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
    void __fastcall EdtNomeClienteEnter(TObject *Sender);
    void __fastcall DBGSetorDrawColumnCell(TObject *Sender,
          const TRect &Rect, int DataCol, TColumn *Column,
          TGridDrawState State);
private:	// User declarations
    void __fastcall ChangeEnter(TObject *Sender);
    void __fastcall ChangeExit(TObject *Sender);
    void __fastcall HabilitaBarraBotoes(void);
    void __fastcall HabilitaCamposFormulario(bool Status);
    void __fastcall ConfiguraCharCaseForm(void);
    void __fastcall ConfiguraEventosForm(void);
    void __fastcall ConsultaCliente(int CdContrato);
    void __fastcall ConfiguraConsultaAuxiliar();
public:		// User declarations
    __fastcall TFCadCentral(TComponent* Owner);
    void __fastcall ConsultaCentral(int CodigoCentral);
    bool __fastcall ValidaCentral();
    int CodigoCliente;
};
//---------------------------------------------------------------------------
extern PACKAGE TFCadCentral *FCadCentral;
//---------------------------------------------------------------------------
#endif
