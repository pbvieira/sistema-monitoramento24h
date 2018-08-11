//----------------------------------------------------------------------------
#ifndef RelTopEventosH
#define RelTopEventosH
//----------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include <vcl\QuickRpt.hpp>
#include <vcl\QRCtrls.hpp>
#include <ExtCtrls.hpp>
//----------------------------------------------------------------------------
class TQRPTopEventos : public TQuickRep
{
__published:
    TQRBand *QRBand1;
    TQRBand *QRBand2;
    TQRDBText *QRDBText2;
    TQRDBText *QRDBText3;
    TQRDBText *QRDBText5;
    TQRBand *QRBand3;
    TQRSysData *QRSysData1;
    TQRDBText *QRDBText4;
    TQRDBText *QRDBText8;
    TQRDBText *QRDBText1;
    TQRBand *QRBand4;
    TQRLabel *QRLabel2;
    TQRSysData *QRSysData2;
private:
public:
   __fastcall TQRPTopEventos::TQRPTopEventos(TComponent* Owner);
};
//----------------------------------------------------------------------------
extern TQRPTopEventos *QRPTopEventos;
//----------------------------------------------------------------------------
#endif