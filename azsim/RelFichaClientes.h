#include <Provider.hpp>
#include <Classes.hpp>
#include <Controls.hpp>
#include <DB.hpp>
#include <ExtCtrls.hpp>
#include <IBCustomDataSet.hpp>
#include <IBQuery.hpp>
#include <QRCtrls.hpp>
#include <QuickRpt.hpp>

//----------------------------------------------------------------------------
class TQrpFichaCliente : public TQuickRep
{
__published:
        TQRBand *QrbDetalheCliente;
        TIBQuery *IBQSetores;
        TIBStringField *IBQSetoresLOCAL;
        TIntegerField *IBQSetoresNUMSETOR;
        TQRLabel *QRLabel3;
        TQRLabel *QRLabel4;
        TQRLabel *QRLabel5;
        TQRLabel *QRLabel6;
        TQRDBText *QRDBText3;
        TQRDBText *QRDBText4;
        TQRDBText *QRDBText6;
        TQRDBText *QRDBText7;
        TQRLabel *QRLabel1;
        TQRDBText *QRDBText1;
        TQRLabel *QRLabel2;
        TQRDBText *QRDBText2;
        TQRLabel *QRLabel7;
        TQRDBText *QRDBText5;
        TQRDBText *QRDBText8;
        TQRDBText *QRDBText9;
        TQRDBText *QRDBText10;
        TQRLabel *QRLabel8;
        TQRDBText *QRDBText11;
        TQRDBText *QRDBText12;
        TIBQuery *IBQContato;
        TIntegerField *IBQContatoCDCLIENTECONTATO;
        TIntegerField *IBQContatoCDCLIENTE;
        TIBStringField *IBQContatoNMCONTATO;
        TIntegerField *IBQContatoCDTIPOCONTATO;
        TIBStringField *IBQContatoPARENTESCO;
        TIBStringField *IBQContatoENDERECO;
        TIBStringField *IBQContatoBAIRRO;
        TIBStringField *IBQContatoCIDADE;
        TIBStringField *IBQContatoUF;
        TIBStringField *IBQContatoCEP;
        TIBStringField *IBQContatoOBSERVACAO;
        TIBStringField *IBQContatoFONE1;
        TIBStringField *IBQContatoFONE1OBS;
        TIBStringField *IBQContatoFONE2;
        TIBStringField *IBQContatoFONE2OBS;
        TIBStringField *IBQContatoFONE3;
        TIBStringField *IBQContatoFONE3OBS;
        TIBStringField *IBQContatoFONE4;
        TIBStringField *IBQContatoFONE4OBS;
        TIBStringField *IBQContatoSENHA;
        TIBStringField *IBQContatoCONTRASENHA;
        TDateField *IBQContatoDATANASCIMENTO;
        TQRLabel *QRLabel9;
        TQRDBText *QRDBText13;
        TQRLabel *QRLabel10;
        TQRDBText *QRDBText14;
        TQRLabel *QRLabel11;
        TQRDBText *QRDBText15;
        TQRDBText *QRDBText16;
        TQRDBText *QRDBText17;
        TQRDBText *QRDBText18;
        TQRLabel *QRLabel12;
        TQRDBText *QRDBText19;
        TQRDBText *QRDBText20;
        TQRLabel *QRLabel13;
        TQRDBText *QRDBText21;
        TQRExpr *QRExpr1;
        TQRShape *QRShape1;
        TQRSubDetail *QrSubdetalheSenhas;
        TQRBand *GroupHeaderBand2;
        TQRLabel *QRLabel15;
        TQRDBText *QRDBText24;
        TQRDBText *QRDBText25;
        TQRLabel *QRLabel16;
        TQRLabel *QRLabel17;
        TQRLabel *QRLabel18;
        TQRDBText *QRDBText26;
        TQRDBText *QRDBText27;
        TQRLabel *QrlSenhas;
    TQRLabel *QRLabel19;
    TQRSubDetail *QrpDetalheSetores;
    TQRBand *GroupHeaderBand1;
    TQRLabel *QRLabel14;
    TQRDBText *QrdbSetor;
    TQRLabel *QrlSetores;
    TQRDBText *QrdbLocal;
        void __fastcall QuickRepBeforePrint(TCustomQuickRep *Sender,
          bool &PrintReport);
        void __fastcall QrbDetalheClienteAfterPrint(TQRCustomBand *Sender,
          bool BandPrinted);
private:
public:
   __fastcall TQrpFichaCliente::TQrpFichaCliente(TComponent* Owner);
};
//----------------------------------------------------------------------------
extern TQrpFichaCliente *QrpFichaCliente;
//----------------------------------------------------------------------------
