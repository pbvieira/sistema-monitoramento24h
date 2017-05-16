//----------------------------------------------------------------------------
#ifndef RelEventosClienteDataHoraH
#define RelEventosClienteDataHoraH
//----------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include <vcl\QuickRpt.hpp>
#include <vcl\QRCtrls.hpp>
#include <ExtCtrls.hpp>
//----------------------------------------------------------------------------
class TQRPEventosClienteDataHora : public TQuickRep
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
private:
public:
    __fastcall TQRPEventosClienteDataHora::TQRPEventosClienteDataHora(TComponent* Owner);
};
//----------------------------------------------------------------------------
extern TQRPEventosClienteDataHora *QRPEventosClienteDataHora;
//----------------------------------------------------------------------------
#endif