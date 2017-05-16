//---------------------------------------------------------------------------

#ifndef ConsEventoH
#define ConsEventoH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
#include <DBGrids.hpp>
#include <Grids.hpp>
#include <ComCtrls.hpp>
#include <DBCtrls.hpp>
#include <Mask.hpp>
#include <DB.hpp>
#include <DBClient.hpp>
#include <IBCustomDataSet.hpp>
#include <IBDatabase.hpp>
#include <IBQuery.hpp>
#include <Provider.hpp>
#include <Buttons.hpp>
//---------------------------------------------------------------------------
class TFConsEvento : public TForm
{
__published:	// IDE-managed Components
    TPanel *PTitulo;
    TLabel *Label1;
    TPanel *Panel1;
    TDBGrid *DBGEventos;
    TIBTransaction *IBTConsEventos;
    TIBQuery *IBQConsEventos;
    TDataSetProvider *DSPEventos;
    TClientDataSet *CDSConsEventos;
    TDataSource *DSEventos;
    TIntegerField *IBQConsEventosCTX;
    TIntegerField *IBQConsEventosPORTACOM;
    TIntegerField *IBQConsEventosEQUIPAMENTO;
    TIBStringField *IBQConsEventosSTATUS;
    TIBStringField *IBQConsEventosDESTATUS;
    TIBStringField *IBQConsEventosNMCLIENTE;
    TIBStringField *IBQConsEventosENDERECO;
    TIBStringField *IBQConsEventosCIDADE;
    TIntegerField *CDSConsEventosCTX;
    TIntegerField *CDSConsEventosPORTACOM;
    TIntegerField *CDSConsEventosEQUIPAMENTO;
    TStringField *CDSConsEventosSTATUS;
    TStringField *CDSConsEventosDESTATUS;
    TStringField *CDSConsEventosNMCLIENTE;
    TStringField *CDSConsEventosENDERECO;
    TStringField *CDSConsEventosCIDADE;
    TGroupBox *GBCliente;
    TLabel *Label6;
    TEdit *EdtCodCliente;
    TEdit *EdtNome;
    TEdit *EdtCodificador;
    TLabel *Label4;
    TGroupBox *GBData;
    TLabel *Label3;
    TDateTimePicker *EdtDataFinal;
    TDateTimePicker *EdtDataInicial;
    TLabel *Label2;
    TGroupBox *GBEstatus;
    TLabel *Label5;
    TEdit *EdtStatus;
    TEdit *EdtStatusDescricao;
    TLabel *Label8;
    TLabel *Label9;
    TDateTimeField *IBQConsEventosDATAEVENTO;
    TDateTimeField *CDSConsEventosDATAEVENTO;
    TSpeedButton *BtnConsultar;
    TTimer *TMRConsulta;
    TCheckBox *CkbAtualizar;
    void __fastcall BtnConsultarClick(TObject *Sender);
    void __fastcall ParaTimerDaConsulta(TObject *Sender);
    void __fastcall DBGEventosDrawColumnCell(TObject *Sender,
          const TRect &Rect, int DataCol, TColumn *Column,
          TGridDrawState State);
    void __fastcall TMRConsultaTimer(TObject *Sender);
    void __fastcall CkbAtualizarClick(TObject *Sender);
private:	// User declarations
    void __fastcall ConfiguraCriteriosSQL(TClientDataSet *CDSConsEventos);
public:		// User declarations
    __fastcall TFConsEvento(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFConsEvento *FConsEvento;
//---------------------------------------------------------------------------
#endif
