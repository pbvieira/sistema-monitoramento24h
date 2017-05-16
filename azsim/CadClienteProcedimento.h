//---------------------------------------------------------------------------

#ifndef CadClienteProcedimentoH
#define CadClienteProcedimentoH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Buttons.hpp>
#include <ComCtrls.hpp>
#include <DBCtrls.hpp>
#include <ExtCtrls.hpp>
#include <ToolWin.hpp>
//---------------------------------------------------------------------------
class TFCadClienteProcedimento : public TForm
{
__published:	// IDE-managed Components
    TPanel *PMenu;
    TPanel *POperacoes;
    TToolBar *TBOperacoes;
    TPanel *PFechar;
    TSpeedButton *BtnFechar;
    TGroupBox *GroupBox2;
    TDBLookupComboBox *CmbProcedimento;
    TDBMemo *MmProcedimentos;
    TSpeedButton *BtnSelecionar;
    void __fastcall BtnFecharClick(TObject *Sender);
    void __fastcall BtnSelecionarClick(TObject *Sender);
    void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
    void __fastcall ConfiguraEventosForm(void);
    void __fastcall ChangeEnter(TObject * Sender);
    void __fastcall ChangeExit(TObject *Sender);
public:		// User declarations
    __fastcall TFCadClienteProcedimento(TComponent* Owner);

};
//---------------------------------------------------------------------------
extern PACKAGE TFCadClienteProcedimento *FCadClienteProcedimento;
//---------------------------------------------------------------------------
#endif
