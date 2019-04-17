//----------------------------------------------------------------------------
#ifndef RelNaoIdentificadosH
#define RelNaoIdentificadosH
//----------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include <vcl\QuickRpt.hpp>
#include <vcl\QRCtrls.hpp>
#include <ExtCtrls.hpp>
//----------------------------------------------------------------------------
class TQRPRelNaoIdentificados : public TQuickRep
{
__published:
    TQRBand *QRBand1;
    TQRLabel *QRLabel3;
    TQRBand *QRBand2;
    TQRLabel *QRLabel1;
    TQRLabel *QRLabel2;
    TQRLabel *QRLabel4;
    TQRLabel *QRLabel5;
    TQRLabel *QRLabel6;
    TQRBand *DetailBand1;
    TQRDBText *QRDBText1;
    TQRDBText *QRDBText2;
    TQRDBText *QRDBText3;
    TQRDBText *QRDBText4;
    TQRDBText *QRDBText5;
    TQRBand *PageFooterBand1;
    TQRSysData *QRSysData2;
    TQRSysData *QRSysData1;
    void __fastcall QuickRepStartPage(TCustomQuickRep *Sender);
private:
public:
    int NumDias;
   __fastcall TQRPRelNaoIdentificados::TQRPRelNaoIdentificados(TComponent* Owner);
};
//----------------------------------------------------------------------------
extern TQRPRelNaoIdentificados *QRPRelNaoIdentificados;
//----------------------------------------------------------------------------
#endif