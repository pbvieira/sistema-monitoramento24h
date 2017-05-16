//----------------------------------------------------------------------------
#ifndef RelTopEventosClienteHoraH
#define RelTopEventosClienteHoraH
//----------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include <vcl\QuickRpt.hpp>
#include <vcl\QRCtrls.hpp>
#include <ExtCtrls.hpp>
//----------------------------------------------------------------------------
class TQRPTopEventosClienteHora : public TQuickRep
{
__published:
    TQRBand *QRBand1;
    TQRSysData *QRSysData1;
    TQRBand *QRBand2;
    TQRDBText *QRDBText2;
    TQRDBText *QRDBText3;
    TQRDBText *QRDBText4;
    TQRDBText *QRDBText5;
    TQRDBText *QRDBText6;
    TQRDBText *QRDBText8;
    TQRLabel *QRLabel2;
    TQRGroup *QRGroup1;
    TQRDBText *QRDBText1;
    TQRDBText *QRDBText7;
    TQRLabel *QRLabel1;
    TQRBand *QRBand3;
    TQRLabel *QRLabel3;
private:
public:
   __fastcall TQRPTopEventosClienteHora::TQRPTopEventosClienteHora(TComponent* Owner);
};
//----------------------------------------------------------------------------
extern TQRPTopEventosClienteHora *QRPTopEventosClienteHora;
//----------------------------------------------------------------------------
#endif