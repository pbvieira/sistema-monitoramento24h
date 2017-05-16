//---------------------------------------------------------------------------

#ifndef CadSenhasH
#define CadSenhasH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Buttons.hpp>
#include <ComCtrls.hpp>
#include <DBGrids.hpp>
#include <ExtCtrls.hpp>
#include <Grids.hpp>
#include <ToolWin.hpp>
//---------------------------------------------------------------------------
class TFCadSenha : public TForm
{
__published:	// IDE-managed Components
    TPanel *PMenu;
    TPanel *POperacoes;
    TToolBar *TBOperacoes;
    TToolButton *BtnNovo;
    TToolButton *BtnGravar;
    TToolButton *BtnCancelar;
    TToolButton *BtnDeletar;
    TPanel *PFechar;
    TSpeedButton *BtnFechar;
    TDBGrid *DBGContatos;
    void __fastcall BtnNovoClick(TObject *Sender);
    void __fastcall BtnDeletarClick(TObject *Sender);
    void __fastcall BtnCancelarClick(TObject *Sender);
    void __fastcall BtnFecharClick(TObject *Sender);
    void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
    void __fastcall BtnGravarClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
    __fastcall TFCadSenha(TComponent* Owner);
    bool __fastcall ValidaSenha();
};
//---------------------------------------------------------------------------
extern PACKAGE TFCadSenha *FCadSenha;
//---------------------------------------------------------------------------
#endif
