//---------------------------------------------------------------------------

#ifndef CadMonitoramentoH
#define CadMonitoramentoH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
#include <DBCtrls.hpp>
#include <Mask.hpp>
#include <ComCtrls.hpp>
#include <Buttons.hpp>
#include <ToolWin.hpp>
//---------------------------------------------------------------------------
class TFCadMonitoramento : public TForm
{
__published:	// IDE-managed Components
    TGroupBox *GroupBox1;
    TLabel *Label6;
    TEdit *EdtNomeCliente;
    TPageControl *PCDiasSemana;
    TTabSheet *TabSheet1;
    TTabSheet *TabSheet2;
    TTabSheet *TabSheet3;
    TTabSheet *TabSheet4;
    TTabSheet *TabSheet5;
    TTabSheet *TabSheet6;
    TTabSheet *TabSheet7;
    TPanel *PMenu;
    TPanel *POperacoes;
    TToolBar *TBOperacoes;
    TToolButton *BtnNovo;
    TToolButton *BtnGravar;
    TToolButton *BtnEditar;
    TToolButton *BtnCancelar;
    TToolButton *BtnDeletar;
    TToolButton *BtnPesquisa;
    TPanel *PFechar;
    TSpeedButton *BtnFechar;
    TLabel *Label2;
    TEdit *EdtCodCliente;
    TMaskEdit *EdtHIni1Segunda;
    TLabel *Label3;
    TLabel *Label5;
    TMaskEdit *EdtHFim1Segunda;
    TMaskEdit *EdtHIni2Segunda;
    TLabel *Label7;
    TMaskEdit *EdtHFim2Segunda;
    TLabel *Label8;
    TMaskEdit *EdtHIni3Segunda;
    TLabel *Label9;
    TMaskEdit *EdtHFim3Segunda;
    TLabel *Label10;
    TCheckBox *CkbMonitorAtivo;
    TSpeedButton *BtnCancelarSegunda;
    TMaskEdit *EdtHIni1Terca;
    TLabel *Label11;
    TLabel *Label12;
    TMaskEdit *EdtHFim1Terca;
    TMaskEdit *EdtHIni2Terca;
    TLabel *Label13;
    TMaskEdit *EdtHFim2Terca;
    TLabel *Label14;
    TMaskEdit *EdtHIni3Terca;
    TLabel *Label15;
    TMaskEdit *EdtHFim3Terca;
    TLabel *Label16;
    TSpeedButton *BtnCancelarTerca;
    TMaskEdit *EdtHIni1Quarta;
    TLabel *Label17;
    TLabel *Label18;
    TMaskEdit *EdtHFim1Quarta;
    TMaskEdit *EdtHIni2Quarta;
    TLabel *Label19;
    TMaskEdit *EdtHFim2Quarta;
    TLabel *Label20;
    TMaskEdit *EdtHIni3Quarta;
    TLabel *Label21;
    TMaskEdit *EdtHFim3Quarta;
    TLabel *Label22;
    TSpeedButton *BtnCancelarQuarta;
    TMaskEdit *EdtHIni1Quinta;
    TLabel *Label23;
    TLabel *Label24;
    TMaskEdit *EdtHFim1Quinta;
    TMaskEdit *EdtHIni2Quinta;
    TLabel *Label25;
    TMaskEdit *EdtHFim2Quinta;
    TLabel *Label26;
    TMaskEdit *EdtHIni3Quinta;
    TLabel *Label27;
    TMaskEdit *EdtHFim3Quinta;
    TLabel *Label28;
    TSpeedButton *BtnCancelarQuinta;
    TMaskEdit *EdtHIni1Sexta;
    TLabel *Label29;
    TLabel *Label30;
    TMaskEdit *EdtHFim1Sexta;
    TMaskEdit *EdtHIni2Sexta;
    TLabel *Label31;
    TMaskEdit *EdtHFim2Sexta;
    TLabel *Label32;
    TMaskEdit *EdtHIni3Sexta;
    TLabel *Label33;
    TMaskEdit *EdtHFim3Sexta;
    TLabel *Label34;
    TSpeedButton *BtnCancelarSexta;
    TMaskEdit *EdtHIni1Sabado;
    TLabel *Label35;
    TLabel *Label36;
    TMaskEdit *EdtHFim1Sabado;
    TLabel *Label37;
    TMaskEdit *EdtHFim2Sabado;
    TLabel *Label38;
    TMaskEdit *EdtHIni3Sabado;
    TLabel *Label39;
    TMaskEdit *EdtHFim3Sabado;
    TLabel *Label40;
    TSpeedButton *BtnCancelarSabado;
    TMaskEdit *EdtHIni2Sabado;
    TMaskEdit *EdtHIni1Domingo;
    TLabel *Label41;
    TLabel *Label42;
    TMaskEdit *EdtHFim1Domingo;
    TMaskEdit *EdtHIni2Domingo;
    TLabel *Label43;
    TMaskEdit *EdtHFim2Domingo;
    TLabel *Label44;
    TMaskEdit *EdtHIni3Domingo;
    TLabel *Label45;
    TMaskEdit *EdtHFim3Domingo;
    TLabel *Label46;
    TSpeedButton *BtnCancelarDomingo;
    TSpeedButton *BtnCadExcecao;
    void __fastcall BtnNovoClick(TObject *Sender);
    void __fastcall BtnCancelarClick(TObject *Sender);
    void __fastcall BtnFecharClick(TObject *Sender);
    void __fastcall FormCreate(TObject *Sender);
    void __fastcall EdtCodClienteKeyUp(TObject *Sender, WORD &Key,
          TShiftState Shift);
    void __fastcall BtnPesquisaClick(TObject *Sender);
    void __fastcall BtnCancelarDomingoClick(TObject *Sender);
    void __fastcall BtnCancelarSegundaClick(TObject *Sender);
    void __fastcall BtnCancelarTercaClick(TObject *Sender);
    void __fastcall BtnCancelarQuartaClick(TObject *Sender);
    void __fastcall BtnCancelarQuintaClick(TObject *Sender);
    void __fastcall BtnCancelarSextaClick(TObject *Sender);
    void __fastcall BtnCancelarSabadoClick(TObject *Sender);
    void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
    void __fastcall BtnGravarClick(TObject *Sender);
    void __fastcall BtnDeletarClick(TObject *Sender);
private:	// User declarations

    TDataSetState FormState;

    void __fastcall PreenchaIntervaloHorario(int iDiaSemana,
        AnsiString HIni1, AnsiString HFim1, AnsiString HIni2, AnsiString HFim2,
        AnsiString HIni3, AnsiString HFim3, int iAtivo);

    bool __fastcall GravaMonitoramento(int CdCliente, AnsiString szDiaSemana, int iDiaSemana,
        AnsiString HIni1, AnsiString HFim1, AnsiString HIni2, AnsiString HFim2,
        AnsiString HIni3, AnsiString HFim3, int iAtivo);

    bool __fastcall ValidaIntervaloHora(int iDiaSemana, AnsiString szDiaSemana, AnsiString HIni1, AnsiString HFim1,
        AnsiString HIni2, AnsiString HFim2, AnsiString HIni3, AnsiString HFim3);

    void __fastcall SetaFocoNaAba(int iDiaSemana);

    void __fastcall ConsultaDiaSemana(int CdCliente, int iDiaSemana);

    bool __fastcall ExisteDiaSemana(int CdCliente, int iDiaSemana);

    bool __fastcall ValidaHora(AnsiString szHorario);

    void __fastcall ExcluirMonitoramento(int CdCliente);

    void __fastcall LimparCamposHorario(int iDiaSemana);
    void __fastcall ConsultaCliente(int CdCliente);
    void __fastcall LimpaCamposDoForm();
    void __fastcall HabilitaBarraBotoes(void);
    void __fastcall HabilitaCamposFormulario(bool Status);
    void __fastcall ConfiguraEventosForm(void);
    void __fastcall ChangeEnter(TObject *Sender);
    void __fastcall ChangeExit(TObject *Sender);
    void __fastcall ConfiguraCharCaseForm(void);
public:		// User declarations
    __fastcall TFCadMonitoramento(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFCadMonitoramento *FCadMonitoramento;
//---------------------------------------------------------------------------
#endif
