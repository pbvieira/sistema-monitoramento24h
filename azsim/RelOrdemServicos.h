//----------------------------------------------------------------------------
#ifndef RelOrdemServicosH
#define RelOrdemServicosH
//----------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include <vcl\QuickRpt.hpp>
#include <vcl\QRCtrls.hpp>
#include <ExtCtrls.hpp>
//----------------------------------------------------------------------------
class TQRPOrdemServicos : public TQuickRep
{
__published:
    TQRGroup *QRGroup1;
    TQRSysData *QRSysData1;
    TQRShape *QRShape6;
    TQRShape *QRShape5;
    TQRShape *QRShape4;
    TQRShape *QRShape3;
    TQRShape *QRShape2;
    TQRShape *QRShape1;
    TQRLabel *QRLabel9;
    TQRLabel *QRLabel8;
    TQRLabel *QRLabel7;
    TQRLabel *QRLabel6;
    TQRLabel *QRLabel5;
    TQRLabel *QRLabel4;
    TQRLabel *QRLabel3;
    TQRLabel *QRLabel2;
    TQRLabel *QRLabel17;
    TQRLabel *QRLabel16;
    TQRLabel *QRLabel15;
    TQRLabel *QRLabel14;
    TQRLabel *QRLabel13;
    TQRLabel *QRLabel12;
    TQRLabel *QRLabel11;
    TQRLabel *QRLabel10;
    TQRLabel *QRLabel1;
    TQRDBText *QRDBText9;
    TQRDBText *QRDBText8;
    TQRDBText *QRDBText7;
    TQRDBText *QRDBText6;
    TQRDBText *QRDBText5;
    TQRDBText *QRDBText4;
    TQRDBText *QRDBText3;
    TQRDBText *QRDBText23;
    TQRDBText *QRDBText22;
    TQRDBText *QRDBText21;
    TQRDBText *QRDBText20;
    TQRDBText *QRDBText2;
    TQRDBText *QRDBText19;
    TQRDBText *QRDBText18;
    TQRDBText *QRDBText17;
    TQRDBText *QRDBText16;
    TQRDBText *QRDBText15;
    TQRDBText *QRDBText14;
    TQRDBText *QRDBText13;
    TQRDBText *QRDBText12;
    TQRDBText *QRDBText11;
    TQRDBText *QRDBText10;
    TQRDBText *QRDBText1;
    TQRBand *DetailBand1;
    TQRLabel *QRLabel18;
    TQRDBText *QRDBText24;
    TQRLabel *QRLabel19;
    TQRDBText *QRDBText25;
private:
public:
   __fastcall TQRPOrdemServicos::TQRPOrdemServicos(TComponent* Owner);
};
//----------------------------------------------------------------------------
extern TQRPOrdemServicos *QRPOrdemServicos;
//----------------------------------------------------------------------------
#endif