//---------------------------------------------------------------------------

#ifndef CadBaseH
#define CadBaseH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Buttons.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <ToolWin.hpp>
#include <DB.hpp>
#include <DBClient.hpp>
#include <DBCtrls.hpp>
#include <Mask.hpp>
#include <DBGrids.hpp>
#include <Grids.hpp>
//---------------------------------------------------------------------------
class TFCadBase : public TForm
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
    TToolButton *BtnVoltar;
    TToolButton *BtnAvancar;
    TPanel *PFechar;
    TSpeedButton *BtnFechar;
    void __fastcall BtnNovoClick(TObject *Sender);
    void __fastcall BtnGravarClick(TObject *Sender);
    void __fastcall BtnEditarClick(TObject *Sender);
    void __fastcall BtnCancelarClick(TObject *Sender);
    void __fastcall BtnDeletarClick(TObject *Sender);
    void __fastcall BtnFecharClick(TObject *Sender);
    void __fastcall FormCreate(TObject *Sender);
    void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
private:
    TClientDataSet *FDataSetBase;
public:		// User declarations
    __fastcall TFCadBase(TComponent* Owner);
    void __fastcall ChangeFormStyle(TObject * Sender);
    void __fastcall SetDataSetBase(TClientDataSet* ClientDS);
    void __fastcall ChangeEnter(TObject * Sender);
    void __fastcall ChangeExit(TObject *Sender);
    void __fastcall HabilitaBarraBotoes(void);
    void __fastcall HabilitaCamposFormulario(bool Status);
    void __fastcall ConfiguraCharCaseForm(void);
    void __fastcall ConfiguraEventosForm(void);    
};
//---------------------------------------------------------------------------
extern PACKAGE TFCadBase *FCadBase;
//---------------------------------------------------------------------------
#endif
