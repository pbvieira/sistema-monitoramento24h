//----------------------------------------------------------------------------
#ifndef RelOcorrenciasEncerradasH
#define RelOcorrenciasEncerradasH
//----------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include <vcl\QuickRpt.hpp>
#include <vcl\QRCtrls.hpp>
#include <ExtCtrls.hpp>
//----------------------------------------------------------------------------
class TQRPOcorrenciasEncerradas : public TQuickRep
{
__published:
    TQRBand *TitleBand1;
    TQRBand *DetailBand1;
    TQRLabel *QRLabel3;
    TQRGroup *QRGroup1;
    TQRDBText *QRDBTNMCLIENTE;
    TQRLabel *QRLabel1;
    TQRDBText *QRDBTDATAEVENTO;
    TQRLabel *QRLabel2;
    TQRLabel *QRLabel4;
    TQRDBText *QRDBTDATAENCERRAMENTO;
    TQRLabel *QRLabel6;
    TQRDBText *QRDBTRESUMO;
    TQRLabel *QRLabel7;
    TQRLabel *QRLabel8;
    TQRLabel *QRLabel9;
    TQRDBText *QRDBTOPERADORABERTURA;
    TQRDBText *QRDBTOPERADORENCERRAMENTO;
    TQRDBText *QRDBTAGENTE;
    TQRLabel *QRLabel10;
    TQRDBText *QRDBTSTATUS;
    TQRDBText *QRDBTDESTATUS;
    TQRDBText *QRDBTLOCAL;
    TQRLabel *QRLabel11;
    TQRLabel *QRLabel12;
    TQRDBText *QRDBTKMTOTALPERCORRIDO;
    TQRDBText *QRDBTDATAATENDIMENTO;
    TQRLabel *QRLabel5;
    TQRDBText *QRDBTEQUIPAMENTO;
    TQRBand *QRBand1;
    TQRSysData *QRSysData1;
    TQRSysData *QRSysData2;
private:
public:
   __fastcall TQRPOcorrenciasEncerradas::TQRPOcorrenciasEncerradas(TComponent* Owner);
};
//----------------------------------------------------------------------------
extern TQRPOcorrenciasEncerradas *QRPOcorrenciasEncerradas;
//----------------------------------------------------------------------------
#endif