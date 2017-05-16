//---------------------------------------------------------------------------

#ifndef OcorrenciasAbertasH
#define OcorrenciasAbertasH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
#include <DBGrids.hpp>
#include <Grids.hpp>
#include <IBEvents.hpp>
#include <DB.hpp>
#include <DBClient.hpp>
#include <IBCustomDataSet.hpp>
#include <IBDatabase.hpp>
#include <IBQuery.hpp>
#include <Provider.hpp>
#include <ComCtrls.hpp>
#include <DBCtrls.hpp>
#include <ToolWin.hpp>
#include <Mask.hpp>
#include <Buttons.hpp>
//---------------------------------------------------------------------------
class TFConsOcorrenciasAbertas : public TForm
{
__published:// IDE-managed Components
    TDataSource *DSOcorrenciasAbertas;
    TIBTransaction *IBTOcorrenciasAbertas;
    TIBQuery *IBQOcorrenciasAbertas;
    TIntegerField *IBQOcorrenciasAbertasCDOCORRENCIA;
    TIntegerField *IBQOcorrenciasAbertasCTX;
    TIntegerField *IBQOcorrenciasAbertasPORTACOM;
    TIntegerField *IBQOcorrenciasAbertasEQUIPAMENTO;
    TIBStringField *IBQOcorrenciasAbertasSTATUS;
    TIBStringField *IBQOcorrenciasAbertasDESTATUS;
    TIBStringField *IBQOcorrenciasAbertasNMCLIENTE;
    TIBStringField *IBQOcorrenciasAbertasENDERECO;
    TIBStringField *IBQOcorrenciasAbertasBAIRRO;
    TIBStringField *IBQOcorrenciasAbertasCIDADE;
    TDataSetProvider *DSPOcorrenciasAbertas;
    TClientDataSet *CDSOcorrenciasAbertas;
    TIntegerField *CDSOcorrenciasAbertasCDOCORRENCIA;
    TIntegerField *CDSOcorrenciasAbertasCTX;
    TIntegerField *CDSOcorrenciasAbertasPORTACOM;
    TIntegerField *CDSOcorrenciasAbertasEQUIPAMENTO;
    TStringField *CDSOcorrenciasAbertasSTATUS;
    TStringField *CDSOcorrenciasAbertasDESTATUS;
    TStringField *CDSOcorrenciasAbertasNMCLIENTE;
    TStringField *CDSOcorrenciasAbertasENDERECO;
    TStringField *CDSOcorrenciasAbertasBAIRRO;
    TStringField *CDSOcorrenciasAbertasCIDADE;
    TPanel *Panel1;
    TDBLookupComboBox *DBLookupComboBox1;
    TLabel *Label1;
    TPageControl *PGCOcorrencias;
    TTabSheet *TSOcorrencias;
    TDBGrid *DBGOcorrencias;
    TPanel *Panel2;
    TLabel *LblOcorrencia;
    TLabel *Label3;
    TIntegerField *IBQOcorrenciasAbertasCDOPERADORENCERRAMENTO;
    TIntegerField *IBQOcorrenciasAbertasCDTIPOOCORRENCIA;
    TIntegerField *IBQOcorrenciasAbertasCDSUBTIPOOCORRENCIA;
    TIBStringField *IBQOcorrenciasAbertasRESUMO;
    TIntegerField *CDSOcorrenciasAbertasCDOPERADORENCERRAMENTO;
    TIntegerField *CDSOcorrenciasAbertasCDTIPOOCORRENCIA;
    TIntegerField *CDSOcorrenciasAbertasCDSUBTIPOOCORRENCIA;
    TStringField *CDSOcorrenciasAbertasRESUMO;
    void __fastcall FormCreate(TObject *Sender);
    void __fastcall DBGOcorrenciasDblClick(TObject *Sender);
    void __fastcall DBGOcorrenciasDrawColumnCell(TObject *Sender,
          const TRect &Rect, int DataCol, TColumn *Column,
          TGridDrawState State);
    void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
    void __fastcall CDSOcorrenciasAbertasAfterScroll(TDataSet *DataSet);
private:	// User declarations
    bool __fastcall ValidaOcorrencia();
public:		// User declarations
    __fastcall TFConsOcorrenciasAbertas(TComponent* Owner);
    void __fastcall AtualizarListaOcorrencias();
};
//---------------------------------------------------------------------------
extern PACKAGE TFConsOcorrenciasAbertas *FConsOcorrenciasAbertas;
//---------------------------------------------------------------------------
#endif
