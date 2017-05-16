//---------------------------------------------------------------------------

#ifndef CadProcedimentoH
#define CadProcedimentoH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Buttons.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <ToolWin.hpp>
#include <DBGrids.hpp>
#include <Grids.hpp>
//---------------------------------------------------------------------------
class TFCadProcedimento : public TForm
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
    TDBGrid *DBGProcedimento;
    void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
    void __fastcall BtnGravarClick(TObject *Sender);
    void __fastcall BtnFecharClick(TObject *Sender);
    void __fastcall BtnCancelarClick(TObject *Sender);
    void __fastcall BtnNovoClick(TObject *Sender);
    void __fastcall BtnDeletarClick(TObject *Sender);
    void __fastcall DBGProcedimentoDrawColumnCell(TObject *Sender,
          const TRect &Rect, int DataCol, TColumn *Column,
          TGridDrawState State);
private:	// User declarations
public:		// User declarations
    __fastcall TFCadProcedimento(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFCadProcedimento *FCadProcedimento;
//---------------------------------------------------------------------------
#endif
