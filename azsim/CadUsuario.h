//---------------------------------------------------------------------------

#ifndef CadUsuarioH
#define CadUsuarioH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Buttons.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <ToolWin.hpp>
#include <DBCtrls.hpp>
#include <Mask.hpp>
#include <DBGrids.hpp>
#include <Grids.hpp>
//---------------------------------------------------------------------------
class TFCadUsuario : public TForm
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
    TPanel *Panel1;
    TDBGrid *DBGUsuario;
    TLabel *Label6;
    TLabel *Label10;
    TLabel *Label3;
    TLabel *Label2;
    TDBEdit *EdtSenha;
    TDBEdit *EdtUsuario;
    TDBCheckBox *CkbAdmin;
    TDBEdit *EdtNmUsuario;
    TDBLookupComboBox *CmbTipoUsuario;
    TLabel *Label1;
    TPanel *pnlTituloForm;
    void __fastcall FormCreate(TObject *Sender);
    void __fastcall BtnNovoClick(TObject *Sender);
    void __fastcall BtnGravarClick(TObject *Sender);
    void __fastcall BtnEditarClick(TObject *Sender);
    void __fastcall BtnCancelarClick(TObject *Sender);
    void __fastcall BtnDeletarClick(TObject *Sender);
    void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
    void __fastcall BtnFecharClick(TObject *Sender);
    void __fastcall DBGUsuarioDrawColumnCell(TObject *Sender,
          const TRect &Rect, int DataCol, TColumn *Column,
          TGridDrawState State);
private:	// User declarations
    void __fastcall ChangeEnter(TObject *Sender);
    void __fastcall ChangeExit(TObject *Sender);
    void __fastcall HabilitaBarraBotoes(void);
    void __fastcall HabilitaCamposFormulario(bool Status);
    void __fastcall ConfiguraCharCaseForm(void);
    void __fastcall ConfiguraEventosForm(void);
    void __fastcall GeraUsuarioId(void);
public:		// User declarations
    __fastcall TFCadUsuario(TComponent* Owner);
    bool __fastcall ValidaUsuario();
};
//---------------------------------------------------------------------------
extern PACKAGE TFCadUsuario *FCadUsuario;
//---------------------------------------------------------------------------
#endif
