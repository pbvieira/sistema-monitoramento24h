//----------------------------------------------------------------------------
#ifndef TReportEventosH
#define TReportEventosH
//----------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include <vcl\QuickRpt.hpp>
#include <vcl\QRCtrls.hpp>
#include <ExtCtrls.hpp>
//----------------------------------------------------------------------------
class TReportEventos : public TQuickRep
{
__published:
    TQRBand *TitleBand1;
    TQRBand *DetailBand1;
    TQRLabel *QRLabel3;
    TQRGroup *QRGroup1;
    TQRDBText *QRDBText1;
    TQRDBText *QRDBText5;
    TQRDBText *QRDBText3;
    TQRDBText *QRDBText4;
    TQRDBText *QRDBText8;
    TQRBand *QRBand1;
    TQRSysData *QRSysData1;
    TQRLabel *QRLabel1;
    TQRDBText *QRDBText7;
    TQRSysData *QRSysData2;
private:
public:
    __fastcall TReportEventos::TReportEventos(TComponent* Owner);
};
//----------------------------------------------------------------------------
extern TReportEventos *ReportEventos;
//----------------------------------------------------------------------------
#endif