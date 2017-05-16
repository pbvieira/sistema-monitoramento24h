//---------------------------------------------------------------------------

#ifndef ConsOrdemServicoH
#define ConsOrdemServicoH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <DBGrids.hpp>
#include <ExtCtrls.hpp>
#include <Grids.hpp>
#include <Buttons.hpp>
#include <ToolWin.hpp>
#include <DateUtils.hpp>
//---------------------------------------------------------------------------
class TFConsOrdemServico : public TForm
{
__published:	// IDE-managed Components
    TGroupBox *GroupBox2;
    TLabel *Label10;
    TLabel *Label11;
    TLabel *Label1;
    TDateTimePicker *EdtDataFinal;
    TDateTimePicker *EdtDataInicial;
    TGroupBox *GroupBox3;
    TLabel *Label12;
    TLabel *Label13;
    TLabel *Label14;
    TEdit *EdtCodCliente;
    TEdit *EdtNome;
    TEdit *EdtCdOrdemServico;
    TPanel *Panel1;
    TDBGrid *DBGClientes;
    TSpeedButton *BtnConsultar;
    TPanel *PMenu;
    TPanel *PFechar;
    TSpeedButton *BtnFechar;
    TSpeedButton *BtnImprimir;
    TCheckBox *CkbEncerradas;
    TSpeedButton *BtnNovaOS;
    void __fastcall BtnConsultarClick(TObject *Sender);
    void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
    void __fastcall BtnFecharClick(TObject *Sender);
    void __fastcall FormShow(TObject *Sender);
    void __fastcall BtnImprimirClick(TObject *Sender);
    void __fastcall DBGClientesDblClick(TObject *Sender);
    void __fastcall BtnNovaOSClick(TObject *Sender);
private:	// User declarations
    void __fastcall ConfiguraCriteriosOSSQL();
    void __fastcall ConfiguraCriteriosRelatorioOSSQL();
public:		// User declarations
    __fastcall TFConsOrdemServico(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFConsOrdemServico *FConsOrdemServico;
//---------------------------------------------------------------------------
#endif
