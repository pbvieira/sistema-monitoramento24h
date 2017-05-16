//----------------------------------------------------------------------------
#ifndef RelClientesH
#define RelClientesH
//----------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include <vcl\QuickRpt.hpp>
#include <vcl\QRCtrls.hpp>
#include <ExtCtrls.hpp>
//----------------------------------------------------------------------------
class TQRPClientes : public TQuickRep
{
__published:
    TQRBand *TitleBand1;
    TQRBand *DetailBand1;
    TQRLabel *QRLabel3;
    TQRBand *QRBand1;
    TQRLabel *QRLabel1;
    TQRLabel *QRLabel2;
    TQRLabel *QRLabel4;
    TQRLabel *QRLabel5;
    TQRDBText *QRDBText1;
    TQRDBText *QRDBText2;
    TQRDBText *QRDBText3;
    TQRDBText *QRDBText4;
private:
public:
   __fastcall TQRPClientes::TQRPClientes(TComponent* Owner);
};
//----------------------------------------------------------------------------
extern TQRPClientes *QRPClientes;
//----------------------------------------------------------------------------
#endif