//---------------------------------------------------------------------------

#ifndef SelectRelNaoIdentificadosH
#define SelectRelNaoIdentificadosH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Buttons.hpp>
//---------------------------------------------------------------------------
class TFSelectRelNaoIdentificados : public TForm
{
__published:	// IDE-managed Components
    TSpeedButton *BtnFechar;
    TGroupBox *GroupBox2;
    TEdit *EdtNumDias;
    TLabel *Label1;
    TSpeedButton *BtnSemComunicacao;
    void __fastcall BtnSemComunicacaoClick(TObject *Sender);
    void __fastcall BtnFecharClick(TObject *Sender);
    void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
private:	// User declarations
public:		// User declarations
    __fastcall TFSelectRelNaoIdentificados(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFSelectRelNaoIdentificados *FSelectRelNaoIdentificados;
//---------------------------------------------------------------------------
#endif
