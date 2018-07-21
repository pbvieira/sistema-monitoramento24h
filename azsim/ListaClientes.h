//---------------------------------------------------------------------------

#ifndef ListaClientesH
#define ListaClientesH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <DBGrids.hpp>
#include <Grids.hpp>
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TFListaClientes : public TForm
{
__published:	// IDE-managed Components
    TPanel *pnlTituloClientes;
    TLabel *Label1;
    TDBGrid *DBGClientes;
    void __fastcall DBGClientesDrawColumnCell(TObject *Sender,
          const TRect &Rect, int DataCol, TColumn *Column,
          TGridDrawState State);
    void __fastcall DBGClientesDblClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
    __fastcall TFListaClientes(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFListaClientes *FListaClientes;
//---------------------------------------------------------------------------
#endif
