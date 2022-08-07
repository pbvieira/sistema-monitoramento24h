//---------------------------------------------------------------------------

#ifndef homeH
#define homeH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <Menus.hpp>
#include <ExtCtrls.hpp>
#include <Grids.hpp>
#include <ValEdit.hpp>
//---------------------------------------------------------------------------
class TFHome : public TForm
{
__published:	// IDE-managed Components
    TStatusBar *SBarHome;
    TMainMenu *MMenuHome;
    TMenuItem *Aplicativo1;
    TMenuItem *Sair1;
    TMenuItem *Dados1;
    TMenuItem *Ferramentas1;
    TMenuItem *Registro1;
    TMenuItem *Contratos1;
    TMenuItem *Filiais1;
    TPanel *PHome;
private:	// User declarations
public:		// User declarations
        __fastcall TFHome(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFHome *FHome;
//---------------------------------------------------------------------------
#endif
