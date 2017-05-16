//---------------------------------------------------------------------------

#ifndef ListRelatoriosAtendimentoH
#define ListRelatoriosAtendimentoH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Buttons.hpp>
#include <ComCtrls.hpp>
#include <DB.hpp>
#include <DBClient.hpp>
#include <IBCustomDataSet.hpp>
#include <IBDatabase.hpp>
#include <IBQuery.hpp>
#include <Provider.hpp>
//---------------------------------------------------------------------------
class TFListRelatoriosAtendimento : public TForm
{
__published:	// IDE-managed Components
    TGroupBox *GroupBox2;
    TLabel *Label10;
    TLabel *Label11;
    TDateTimePicker *EdtDataFinalTotais;
    TDateTimePicker *EdtDataInicialTotais;
    TGroupBox *GroupBox3;
    TLabel *Label12;
    TLabel *Label13;
    TLabel *Label14;
    TEdit *EdtCodClienteTotais;
    TEdit *EdtNomeTotais;
    TEdit *EdtCodificadorTotais;
    TGroupBox *GroupBox4;
    TLabel *Label15;
    TLabel *Label16;
    TEdit *EdtStatusTotais;
    TEdit *EdtStatusDescricaoTotais;
    TSpeedButton *BtnTotalEveHoraCli;
    TSpeedButton *BtnTotalEveDataCli;
    TSpeedButton *BtnTotalEventos;
    TLabel *Label1;
    TSpeedButton *BtnOcorrenciasCliente;
    TIBTransaction *IBTRelAtendimento;
    TIBQuery *IBQRelAtendimento;
    TDataSetProvider *DSPRelAtendimento;
    TClientDataSet *CDSRelAtendimento;
    TSpeedButton *BtnFechar;
    TSpeedButton *BtnEventosClientesDataHora;
    void __fastcall BtnTotalEveHoraCliClick(TObject *Sender);
    void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
    void __fastcall BtnFecharClick(TObject *Sender);
    void __fastcall BtnTotalEveDataCliClick(TObject *Sender);
    void __fastcall BtnTotalEventosClick(TObject *Sender);
    void __fastcall BtnEventosClientesDataHoraClick(TObject *Sender);
    void __fastcall BtnOcorrenciasClienteClick(TObject *Sender);
private:	// User declarations
    void __fastcall ConfiguraCriteriosSQL();
public:		// User declarations
    __fastcall TFListRelatoriosAtendimento(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFListRelatoriosAtendimento *FListRelatoriosAtendimento;
//---------------------------------------------------------------------------
#endif
