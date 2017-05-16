//---------------------------------------------------------------------------

#ifndef OcorrenciaContatosH
#define OcorrenciaContatosH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <DBGrids.hpp>
#include <Grids.hpp>
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TFOConsOcorrenciasContatos : public TForm
{
__published:	// IDE-managed Components
    TPageControl *PCGrids;
    TTabSheet *TSContatos;
    TDBGrid *DBGContatos;
    TTabSheet *TSEventos;
    TLabel *Label34;
    TTabSheet *TSSetores;
    TLabel *Label35;
    TTabSheet *TSCameras;
    TLabel *Label36;
    void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
    void __fastcall DBGContatosDrawColumnCell(TObject *Sender,
          const TRect &Rect, int DataCol, TColumn *Column,
          TGridDrawState State);
private:	// User declarations
public:		// User declarations
    __fastcall TFOConsOcorrenciasContatos(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFOConsOcorrenciasContatos *FOConsOcorrenciasContatos;
//---------------------------------------------------------------------------
#endif
