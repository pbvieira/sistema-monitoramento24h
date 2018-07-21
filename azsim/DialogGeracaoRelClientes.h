//----------------------------------------------------------------------------
#ifndef DialogGeracaoRelClientesH
#define DialogGeracaoRelClientesH
//----------------------------------------------------------------------------
#include <vcl\System.hpp>
#include <vcl\Windows.hpp>
#include <vcl\SysUtils.hpp>
#include <vcl\Classes.hpp>
#include <vcl\Graphics.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include <vcl\Controls.hpp>
#include <vcl\Buttons.hpp>
#include <vcl\ExtCtrls.hpp>
//----------------------------------------------------------------------------
class TdlgGeracaoRelClientes : public TForm
{
__published:
    TButton *btnRelatorio;
    TButton *btnPlanilha;
    void __fastcall btnRelatorioClick(TObject *Sender);
    void __fastcall btnPlanilhaClick(TObject *Sender);
private:
public:
	virtual __fastcall TdlgGeracaoRelClientes(TComponent* AOwner);
};
//----------------------------------------------------------------------------
extern PACKAGE TdlgGeracaoRelClientes *dlgGeracaoRelClientes;
//----------------------------------------------------------------------------
#endif    
