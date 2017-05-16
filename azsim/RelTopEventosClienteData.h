//----------------------------------------------------------------------------
#ifndef TQRPTopEventosClienteDataH
#define TQRPTopEventosClienteDataH
//----------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include <vcl\QuickRpt.hpp>
#include <vcl\QRCtrls.hpp>
#include <ExtCtrls.hpp>
//----------------------------------------------------------------------------
class TQRPTopEventosClienteData : public TQuickRep
{
__published:
    TQRBand *QRBand3;
    TQRLabel *QRLabel3;
    TQRGroup *QRGroup1;
    TQRDBText *QRDBText1;
    TQRDBText *QRDBText7;
    TQRLabel *QRLabel1;
    TQRBand *QRBand1;
    TQRSysData *QRSysData1;
    TQRBand *DetailBand1;
    TQRDBText *QRDBText2;
    TQRDBText *QRDBText5;
    TQRDBText *QRDBText3;
    TQRDBText *QRDBText4;
    TQRDBText *QRDBText8;
private:
public:
   __fastcall TQRPTopEventosClienteData::TQRPTopEventosClienteData(TComponent* Owner);
};
//----------------------------------------------------------------------------
extern TQRPTopEventosClienteData *QRPTopEventosClienteData;
//----------------------------------------------------------------------------
#endif