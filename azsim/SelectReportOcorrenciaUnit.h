//---------------------------------------------------------------------------

#ifndef SelectReportOcorrenciaUnitH
#define SelectReportOcorrenciaUnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <DB.hpp>
#include <DBClient.hpp>
#include <ExtCtrls.hpp>
#include <IBCustomDataSet.hpp>
#include <IBDatabase.hpp>
#include <IBQuery.hpp>
#include <Provider.hpp>
#include <Buttons.hpp>
//---------------------------------------------------------------------------
class TFSelectReportOcorrencia : public TForm
{
__published:	// IDE-managed Components
    TGroupBox *GroupBox2;
    TLabel *Label10;
    TLabel *Label11;
    TLabel *Label1;
    TDateTimePicker *EdtDataFinalTotais;
    TDateTimePicker *EdtDataInicialTotais;
    TGroupBox *GroupBox3;
    TLabel *Label12;
    TLabel *Label13;
    TLabel *Label14;
    TEdit *EdtCodClienteTotais;
    TEdit *EdtNomeTotais;
    TEdit *EdtCodificadorTotais;
    TClientDataSet *CDSRelAtendimento;
    TDataSetProvider *DSPRelAtendimento;
    TIBQuery *IBQRelAtendimento;
    TIBTransaction *IBTRelAtendimento;
    TPanel *pnlTituloOcorrencias;
    TSpeedButton *BtnOcorrencias;
    TSpeedButton *BtnFechar;
    void __fastcall BtnOcorrenciasClick(TObject *Sender);
    void __fastcall ConfiguraCriteriosSQL();
    void __fastcall BtnFecharClick(TObject *Sender);
    void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
private:	// User declarations
public:		// User declarations
    __fastcall TFSelectReportOcorrencia(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFSelectReportOcorrencia *FSelectReportOcorrencia;
//---------------------------------------------------------------------------
#endif
