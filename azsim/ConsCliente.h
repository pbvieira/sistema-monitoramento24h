//---------------------------------------------------------------------------

#ifndef ConsClienteH
#define ConsClienteH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
#include <DBCtrls.hpp>
#include <DBGrids.hpp>
#include <Grids.hpp>
#include <Buttons.hpp>
#include <ComCtrls.hpp>
#include <Mask.hpp>
#include <Graphics.hpp>
#include <ToolWin.hpp>
//---------------------------------------------------------------------------
class TFConsCliente : public TForm
{
__published:	// IDE-managed Components
    TPageControl *PCResultado;
    TTabSheet *TabSheet1;
    TDBGrid *DBGClientes;
    TGroupBox *GroupBox1;
    TEdit *EdtNome;
    TEdit *EdtCodigo;
    TLabel *Label4;
    TLabel *Label6;
    TSpeedButton *BtnConsultar;
    TGroupBox *GPBConsEndereco;
    TEdit *EdtCidade;
    TLabel *Label11;
    TSpeedButton *BtnTodos;
    TStatusBar *SBarConsCliente;
    TGroupBox *GPBNomeSelecionado;
    TDBText *TXTNome;
    TDBText *TXTCodigo;
    TPanel *PMenu;
    TPanel *PFechar;
    TSpeedButton *BtnFechar;
    TSpeedButton *BtnAbrirClientes;
    TSpeedButton *BtnAbrirContratos;
    TSpeedButton *BtnSelecionar;
    TDBGrid *DBGContratos;
    TSpeedButton *BtnRelatorioClientes;
    TGroupBox *GroupBox2;
    TDBLookupComboBox *CmbFilial;
    TCheckBox *CkbAtivos;
    void __fastcall BtnConsultarClick(TObject *Sender);
    void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
    void __fastcall DBGClientesDblClick(TObject *Sender);
    void __fastcall DBGClientesKeyPress(TObject *Sender, char &Key);
    void __fastcall EdtNomeKeyPress(TObject *Sender, char &Key);
    void __fastcall DBGContratosKeyPress(TObject *Sender, char &Key);
    void __fastcall DBGContratosDblClick(TObject *Sender);
    void __fastcall FormShow(TObject *Sender);
    void __fastcall BtnFecharClick(TObject *Sender);
    void __fastcall EdtNomeKeyUp(TObject *Sender, WORD &Key,
          TShiftState Shift);
    void __fastcall BtnSelecionarClick(TObject *Sender);
    void __fastcall BtnRelatorioClientesClick(TObject *Sender);
private:	// User declarations
    TIntegerField *ObjetoCodigoCliente;
public:		// User declarations
    __fastcall TFConsCliente(TComponent* Owner);
    void __fastcall SetarObjetoCodigoCliente(TIntegerField *CampoCodigo);
};
//---------------------------------------------------------------------------
extern PACKAGE TFConsCliente *FConsCliente;
//---------------------------------------------------------------------------
#endif
