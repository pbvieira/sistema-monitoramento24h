//---------------------------------------------------------------------------

#ifndef CadFilialH
#define CadFilialH
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
class TFCadFilial : public TForm
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
    TDBGrid *DBGFilial;
    void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
    void __fastcall BtnGravarClick(TObject *Sender);
    void __fastcall BtnNovoClick(TObject *Sender);
    void __fastcall BtnCancelarClick(TObject *Sender);
    void __fastcall BtnDeletarClick(TObject *Sender);
    void __fastcall BtnFecharClick(TObject *Sender);
    void __fastcall DBGFilialDrawColumnCell(TObject *Sender,
          const TRect &Rect, int DataCol, TColumn *Column,
          TGridDrawState State);
private:	// User declarations
public:		// User declarations
    __fastcall TFCadFilial(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFCadFilial *FCadFilial;
//---------------------------------------------------------------------------
#endif
