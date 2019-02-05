//---------------------------------------------------------------------------

#ifndef ConsSimplesClientesH
#define ConsSimplesClientesH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Buttons.hpp>
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TFConsSimplesClientes : public TForm
{
__published:	// IDE-managed Components
    TPanel *Panel1;
    TLabel *Label17;
    TLabel *Label18;
    TSpeedButton *BtnConsultaRapida;
    TLabel *Label15;
    TEdit *EdtCodigoConsultaRapida;
    TEdit *EdtNomeConsultaRapida;
    TPanel *pnlTituloClientes;
    void __fastcall BtnConsultaRapidaClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
    __fastcall TFConsSimplesClientes(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFConsSimplesClientes *FConsSimplesClientes;
//---------------------------------------------------------------------------
#endif
