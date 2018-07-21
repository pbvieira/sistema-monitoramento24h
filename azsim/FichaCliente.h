//---------------------------------------------------------------------------

#ifndef FichaClienteH
#define FichaClienteH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Buttons.hpp>
#include <ComCtrls.hpp>
#include <DBCtrls.hpp>
#include <DBGrids.hpp>
#include <ExtCtrls.hpp>
#include <Grids.hpp>
#include <Mask.hpp>
//---------------------------------------------------------------------------
class TFFichaCliente : public TForm
{
__published:	// IDE-managed Components
    TPanel *pnlTituloForm;
    TPageControl *pcDadosCliente;
    TTabSheet *tbsDadosBasicos;
    TPanel *Panel2;
    TLabel *Label2;
    TLabel *Label9;
    TLabel *Label10;
    TLabel *Label11;
    TLabel *Label20;
    TLabel *Label12;
    TLabel *Label15;
    TLabel *Label1;
    TLabel *Label34;
    TLabel *Label35;
    TLabel *Label36;
    TLabel *Label37;
    TLabel *Label38;
    TLabel *Label39;
    TLabel *Label40;
    TLabel *Label41;
    TLabel *Label42;
    TLabel *Label43;
    TLabel *Label44;
    TLabel *Label46;
    TLabel *Label47;
    TLabel *Label48;
    TLabel *Label49;
    TLabel *Label50;
    TLabel *Label51;
    TDBEdit *EdtNmCliente;
    TDBEdit *EdtEndereco;
    TDBEdit *EdtBairro;
    TDBEdit *EdtCidade;
    TDBEdit *EdtPontoRef;
    TDBEdit *EdtCodificador;
    TDBEdit *EdtChave;
    TDBEdit *EdtFone1;
    TDBEdit *EdtFone2;
    TDBEdit *EdtFone3;
    TDBEdit *EdtFone1Obs;
    TDBEdit *EdtFone2Obs;
    TDBEdit *EdtFone3Obs;
    TDBEdit *EdtFone4;
    TDBEdit *EdtFone5;
    TDBEdit *EdtFone6;
    TDBEdit *EdtFone4Obs;
    TDBEdit *EdtFone5Obs;
    TDBEdit *EdtFone6Obs;
    TDBMemo *EdtObs;
    TDBEdit *EdtFone7;
    TDBEdit *EdtFone7Obs;
    TDBEdit *EdtFone8;
    TDBEdit *EdtFone8Obs;
    TDBEdit *EdtNomeFantasia;
    TTabSheet *TSContatos;
    TDBGrid *DBGContatos;
    TTabSheet *TSSetores;
    TDBGrid *DBGSetores;
    TTabSheet *tbCentral;
    TPanel *Panel1;
    TGroupBox *GrpNomeSelecionado;
    TDBText *TXTModeloCentral;
    TDBText *TXTLocalInstalacao;
    TLabel *Label53;
    TLabel *Label54;
    void __fastcall DBGContatosDrawColumnCell(TObject *Sender,
          const TRect &Rect, int DataCol, TColumn *Column,
          TGridDrawState State);
    void __fastcall DBGSetoresDrawColumnCell(TObject *Sender,
          const TRect &Rect, int DataCol, TColumn *Column,
          TGridDrawState State);
private:	// User declarations
public:		// User declarations
    __fastcall TFFichaCliente(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFFichaCliente *FFichaCliente;
//---------------------------------------------------------------------------
#endif
