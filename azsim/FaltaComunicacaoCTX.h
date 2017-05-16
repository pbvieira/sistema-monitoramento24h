//---------------------------------------------------------------------------

#ifndef FaltaComunicacaoCTXH
#define FaltaComunicacaoCTXH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <DBGrids.hpp>
#include <Grids.hpp>
#include <Buttons.hpp>
#include <ExtCtrls.hpp>
#include <Graphics.hpp>
#include <DBCtrls.hpp>
//---------------------------------------------------------------------------
class TFAvisoFaltaComunicacaoCTX : public TForm
{
__published:	// IDE-managed Components
    TDBGrid *DBGCtxs;
    TSpeedButton *BtnFechar;
    TSpeedButton *BtnDesativarMonitoramento;
    TPanel *Panel1;
    TLabel *lblTituloAlerta;
    TImage *Image1;
    TDBMemo *EdtMotivoDesativar;
    TLabel *Label2;
    void __fastcall DBGCtxsDrawColumnCell(TObject *Sender,
          const TRect &Rect, int DataCol, TColumn *Column,
          TGridDrawState State);
    void __fastcall BtnFecharClick(TObject *Sender);
    void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
    void __fastcall BtnDesativarMonitoramentoClick(TObject *Sender);
    void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
    __fastcall TFAvisoFaltaComunicacaoCTX(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFAvisoFaltaComunicacaoCTX *FAvisoFaltaComunicacaoCTX;
//---------------------------------------------------------------------------
#endif
