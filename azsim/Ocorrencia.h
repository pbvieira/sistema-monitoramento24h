//---------------------------------------------------------------------------

#ifndef OcorrenciaH
#define OcorrenciaH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
#include <DBCtrls.hpp>
#include <DBGrids.hpp>
#include <Grids.hpp>
#include <Mask.hpp>
#include <Buttons.hpp>
#include <DB.hpp>
#include <IBCustomDataSet.hpp>
#include <IBDatabase.hpp>
#include <IBQuery.hpp>
#include <Provider.hpp>
#include <DBClient.hpp>
#include <ComCtrls.hpp>
#include <DateUtils.hpp>

#include "Home.h"
#include "Login.h"
#include "DMApp.h"
#include "OcorrenciaContatos.h"
#include "OcorrenciasAbertas.h"
#include <IBStoredProc.hpp>
//---------------------------------------------------------------------------
class TFOcorrencia : public TForm
{
__published:	// IDE-managed Components
    TPanel *pnlTituloForm;
    TPanel *Panel2;
    TLabel *Label8;
    TLabel *Label3;
    TLabel *Label4;
    TLabel *Label5;
    TLabel *Label6;
    TLabel *Label2;
    TLabel *Label9;
    TLabel *Label10;
    TLabel *Label11;
    TLabel *Label20;
    TLabel *Label17;
    TLabel *Label12;
    TLabel *Label7;
    TLabel *Label15;
    TLabel *Label1;
    TLabel *Label34;
    TLabel *Label35;
    TLabel *Label36;
    TLabel *Label37;
    TLabel *Label38;
    TLabel *Label39;
    TLabel *Label40;
    TLabel *Label41;
    TLabel *Label42;
    TLabel *Label43;
    TLabel *Label44;
    TSpeedButton *BtnLocalizarCliente;
    TLabel *Label46;
    TLabel *Label47;
    TLabel *Label48;
    TLabel *Label49;
    TLabel *Label50;
    TLabel *Label51;
    TDBEdit *EdtStatus;
    TDBEdit *EdtDescricaoStatus;
    TDBEdit *EdtSetor;
    TDBEdit *EdtLocalSetor;
    TDBEdit *EdtNmCliente;
    TDBEdit *EdtEndereco;
    TDBEdit *EdtBairro;
    TDBEdit *EdtCidade;
    TDBEdit *EdtPontoRef;
    TDBEdit *EdtDataEvento;
    TDBEdit *EdtTipoCtx;
    TDBEdit *EdtCodificador;
    TDBEdit *EdtCtx;
    TDBEdit *EdtDataAberturaOcorrencia;
    TDBEdit *EdtChave;
    TDBEdit *EdtFone1;
    TDBEdit *EdtFone2;
    TDBEdit *EdtFone3;
    TDBEdit *EdtFone1Obs;
    TDBEdit *EdtFone2Obs;
    TDBEdit *EdtFone3Obs;
    TDBEdit *EdtFone4;
    TDBEdit *EdtFone5;
    TDBEdit *EdtFone6;
    TDBEdit *EdtFone4Obs;
    TDBEdit *EdtFone5Obs;
    TDBEdit *EdtFone6Obs;
    TDBMemo *EdtObs;
    TDBEdit *EdtFone7;
    TDBEdit *EdtFone7Obs;
    TDBEdit *EdtFone8;
    TDBEdit *EdtFone8Obs;
    TDBEdit *EdtNomeFantasia;
    TPanel *Panel3;
    TLabel *Label13;
    TLabel *Label14;
    TLabel *Label16;
    TLabel *Label18;
    TLabel *Label19;
    TLabel *Label21;
    TLabel *Label22;
    TLabel *Label23;
    TLabel *Label24;
    TLabel *Label25;
    TLabel *Label26;
    TLabel *Label27;
    TLabel *Label28;
    TLabel *Label29;
    TLabel *Label31;
    TLabel *Label30;
    TLabel *Label32;
    TLabel *Label33;
    TLabel *Label45;
    TSpeedButton *BtnOrdemServico;
    TDBEdit *EdtKmRetorno;
    TDBEdit *EdtKmTotalPercorrido;
    TDBMemo *EdtResumo;
    TDBMemo *EdtProcedimentos;
    TDBMemo *EdtOcorrenciaPolicial;
    TDBLookupComboBox *CmbSubTipoOcorrencia;
    TDBLookupComboBox *CmbTipoOcorrencia;
    TDBLookupComboBox *CmbOperadora;
    TDBLookupComboBox *CmbAgente;
    TDBEdit *EdtCodAgente;
    TMaskEdit *EdtSaidaEmp;
    TMaskEdit *EdtChegadaLocal;
    TMaskEdit *EdtTempoDeslocamento;
    TMaskEdit *EdtSaidaLocal;
    TMaskEdit *EdtChegadaEmpresa;
    TMaskEdit *EdtTempoRetorno;
    TMaskEdit *EdtTempoAtendimento;
    TDBEdit *EdtLacre;
    TDBEdit *EdtKmSaida;
    TDBEdit *EdtHoraLacre;
    TPageControl *PCGrids;
    TTabSheet *TSContatos;
    TDBGrid *DBGContatos;
    TTabSheet *TSSetores;
    TDBGrid *DBGSetores;
    TTabSheet *tbCentral;
    TPanel *Panel1;
    TGroupBox *GrpNomeSelecionado;
    TDBText *TXTModeloCentral;
    TDBText *TXTLocalInstalacao;
    TLabel *Label53;
    TLabel *Label54;

    void __fastcall DBGContatosDrawColumnCell(TObject *Sender,
          const TRect &Rect, int DataCol, TColumn *Column,
          TGridDrawState State);
    void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
    void __fastcall FormKeyPress(TObject *Sender, char &Key);
    void __fastcall CmbTipoOcorrenciaExit(TObject *Sender);
    void __fastcall FormShow(TObject *Sender);
    void __fastcall CDSOcorrenciaTIPOCTXGetText(TField *Sender, AnsiString
        &Text, bool DisplayText);
    void __fastcall CDSOcorrenciaCDSUBTIPOOCORRENCIAChange(TField *Sender);
    void __fastcall BtnOrdemServicoClick(TObject *Sender);
    void __fastcall BtnLocalizarClienteClick(TObject *Sender);
    void __fastcall EdtResumoEnter(TObject *Sender);
    void __fastcall EdtDataEventoDblClick(TObject *Sender);
    void __fastcall EdtDataAberturaOcorrenciaDblClick(TObject *Sender);
    void __fastcall DBGSetoresDrawColumnCell(TObject *Sender,
          const TRect &Rect, int DataCol, TColumn *Column,
          TGridDrawState State);
    void __fastcall EdtOcorrenciaPolicialExit(TObject *Sender);
    void __fastcall CDSOcorrenciaCDCLIENTEChange(TField *Sender);
private:
    bool __fastcall ValidaOcorrencia();
    void __fastcall GeraOcorrenciaId();
    void __fastcall CalculaTemposEDistancias();
    bool __fastcall ValidaHora(AnsiString HoraInformada);
    TDateTime __fastcall ConfiguraDataHora(AnsiString HoraInformada, bool bNovoDia);
    void __fastcall CalcularTempoDeslocamento();
    void __fastcall CalcularTempoRetorno();
    void __fastcall CalcularTempoAtendimento();
public:
    __fastcall TFOcorrencia(TComponent* Owner);
    void __fastcall ConsultaOcorrencia(int iCodigoOcorrencia);
    void __fastcall AbrirManualmente();

    int FOcorrenciaId;
};
//---------------------------------------------------------------------------
extern PACKAGE TFOcorrencia *FOcorrencia;
//---------------------------------------------------------------------------
#endif
