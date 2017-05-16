//---------------------------------------------------------------------------


#ifndef MonitorH
#define MonitorH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Buttons.hpp>
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TFMonitor : public TFrame
{
__published:	// IDE-managed Components
    TPanel *PCabecalho;
    TSpeedButton *btnConectar;
    TSpeedButton *btnDesconectar;
    TPanel *Panel2;
    TLabel *Label1;
    TComboBox *cmbPorta;
    TMemo *mmEventos;
private:	// User declarations
public:		// User declarations
    __fastcall TFMonitor(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFMonitor *FMonitor;
//---------------------------------------------------------------------------
#endif
