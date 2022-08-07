//---------------------------------------------------------------------------
#ifndef monitorH
#define monitorH
//---------------------------------------------------------------------------
#include "BCAzCtx.h"
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
#include <Buttons.hpp>
#include <ComCtrls.hpp>
#include <DBGrids.hpp>
#include <Grids.hpp>
#include <dbclient.hpp>


#include <sysmac.h>
#include <IdBaseComponent.hpp>
#include <IdComponent.hpp>
#include <IdHTTP.hpp>
#include <IdTCPClient.hpp>
#include <IdTCPConnection.hpp>
#include <DB.hpp>
#include <DBClient.hpp>
#include <Provider.hpp>
#include <xmldom.hpp>
#include <Xmlxform.hpp>
//---------------------------------------------------------------------------
class TFMonitor : public TForm
{
__published:	// IDE-managed Components
    TPageControl *PCMonitor;
    TTabSheet *TSMonitor;
        TMemo *mmComunicacaoCtx;
    TPanel *panelRodape;
    TSpeedButton *btnConectar;
    TSpeedButton *BtnFechar;
    TSpeedButton *BtnSolicitarEventos;
    TTimer *TMRSetDataHora;
    TIdHTTP *httpEventosClient;
    TTabSheet *TSEventos;
    TMemo *mmEventos;
    TXMLTransformClient *XMLTransformClient1;
    TDataSetProvider *DataSetProvider1;
    TClientDataSet *ClientDataSet1;
    TIntegerField *ClientDataSet1NREVENTO;
    TIntegerField *ClientDataSet1PORTACOM;
    TStringField *ClientDataSet1TIPOCTX;
    TIntegerField *ClientDataSet1CTX;
    TIntegerField *ClientDataSet1CODIFICADOR;
    TStringField *ClientDataSet1STATUS;
    TStringField *ClientDataSet1REFERENCIA;
    TDateTimeField *ClientDataSet1DATAEVENTO;
    TIntegerField *ClientDataSet1ISPUBLICADO;
    void __fastcall FormCreate(TObject *Sender);
    void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
    void __fastcall btnConectarClick(TObject *Sender);
    void __fastcall FormShow(TObject *Sender);
    void __fastcall BtnFecharClick(TObject *Sender);
    void __fastcall BtnSolicitarEventosClick(TObject *Sender);
    void __fastcall TMRSetDataHoraTimer(TObject *Sender);
private:	// User declarations
    void __fastcall ConectarCtx(byte porta);
    void __fastcall PrintCtxLog(AnsiString log);
    void __fastcall PrintEventoLog(AnsiString log);
    bool __fastcall CarregaMetodosDll(void);
    bool __fastcall AdicionarEvento(WORD wNrEvento, DWORD dwCodificador, AnsiString szStatus, AnsiString szReferencia, TDateTime dtDataEHora);
    bool __fastcall InterpretaRetornoDll(BYTE erro);
public:		// User declarations
    __fastcall TFMonitor(TComponent* Owner);
    void __fastcall AppMessage(tagMSG &Msg, bool &Handled);
    void __fastcall OnWMCopyData(TWMCopyData &Msg);
    BEGIN_MESSAGE_MAP
            MESSAGE_HANDLER(WM_COPYDATA, TWMCopyData, OnWMCopyData);
    END_MESSAGE_MAP(TForm);
};
//---------------------------------------------------------------------------
extern PACKAGE TFMonitor *FMonitor;
//---------------------------------------------------------------------------

#ifndef MONITOR
#define MONITOR  extern
#else
#define MONITOR
#endif

#define NR_RETRANSMISSOES_CTX     3
#define ESPERA_RESPOSTA_CTX       200
#define PERIODO_TIMER             30
#define NR_MAX_MSG                1000
#define TAM_CAMINHO               30
#define TAM_BUFFER                1000

#define SetBit(a,b)               (a |=  (0x01<<(b)))
#define ClearBit(a,b)             (a &= ~(0x01<<(b)))
#define CheckBit(a,b)             ((a>>b) & 0x01)

typedef struct
    {
    // Imagem dos Parâmetros de Operação do CTX 3.1
    WORD  wCodigoCtx;                   // Código da CTX 3.1. Ex: 1000.4
    BYTE  bValidade;                    // Prazo em que a CTX permanecerá em operação em dias
    WORD  wNrEvento;                    // Número do último evento recebido
    WORD  wNrRelatorio;                 // Número do último relatório recebido
    DWORD dwAssinatura;                 // Assinatura da CTX 3.1 (usada para validação do conteúdo da memória de dados)
    BYTE  bConfiguracao;                // Byte de configuração do funcionamento da CTX 3.1
    BYTE  bStatus;                      // Byte de status da CTX 3.1
    BYTE  bHabAutomato;
    BYTE  bDia;                         // Data atual da CTX 3.1 no formato dd/mm/aaaa
    BYTE  bMes;
    WORD  wAno;
    BYTE  bHora;                        // Horário atual da CTX no formato hh:mm:ss
    BYTE  bMinuto;
    BYTE  bSegundo;
    BYTE  bSaidas;                      // Cada bit corresponde a uma saída da CTX.
    char  cTecla;                       // Código ASCII da última tecla pressionada na CTX.
    // Parâmetros da conexão telefônica
    BYTE  bHabilitacao;
    BYTE  bNrToques;                    // Número da toques para a CTX atender o telefone.
    BYTE  bNrMaxTentativas;             // Número máximo de tentativas de transmissão de uma mesma mensagem da CTX para o MTA (durante a conexão).
    BYTE  bSemLinha;                    // Tempo (min) sem linha telefônica após o qual a CTX sinaliza este erro.
    BYTE  bStatusCTF;
    BYTE  bEstadoCTF;
    BYTE  bEstadoDiscar;
    BYTE  bNrTentativas;
    BYTE  bTempo;
    // Parâmetros de impressão
    BYTE  bHabImp;
    BYTE  bMargem;
    BYTE  bLinhasPagina;
    WORD  wNrEventoImp;
    WORD  wNrRelatorioImp;
    BYTE  bStatusImp;
    BYTE  bLinhaAtual;
    BYTE  bNrCaracteres;
    // Parâmetros da bateria
    WORD  wTempoMaxFaltaAC;
    BYTE  bTensaoBaixaBat;
    BYTE  bTensaoCriticaBat;
    BYTE  bEstadoBat;
    BYTE  bTensaoBat;
    WORD  wTempoFaltaAC;
    BYTE  bIntervTestes;
    // Parâmetros gerais CTX
    BYTE  bHabCTX;
    BYTE  bArea;
    BYTE  bMilharDV;
    BYTE  bStatusCTX;
    BYTE  bReservado;
    WORD  wTempoMaxPortadora;
    WORD  wTempoPortadora;
    // Parâmetros gerais somente do CTD
    BYTE  bAreaRtx;
    WORD  wAtrasoEvento;
    WORD  wAtrasoRelatorio;
    // Parâmetros relativos ao tom
    WORD  wPreambulo;
    WORD  wTomInicial;
    WORD  wTom;
    WORD  wGuardaTx;
    WORD  wGuardaRx;
    WORD  wTimeOut;
    BYTE  bEstadoTom;
    BYTE  bNrTons;

    //
    // Variáveis de interface com a DLL
    //
    BYTE bCom;                          // Número da porta serial do PC utilizada na comunicação com a CTX.
    HINSTANCE hiDll;                    // Handle para a DLL
    // Declaração dos ponteiros para função
    BYTE (__stdcall *bEndNetwork)(void);
    BYTE (__stdcall *bGetDllError)(DWORD* erro);
    BYTE (__stdcall *bGetDllVersion)(WORD* nr_versao, char* versao, char* autores);
    BYTE (__stdcall *bInitNetwork)(HWND handle, WORD codigo_ctx, char* com, BYTE nr_retransmissoes, WORD espera_inicio_resposta, BYTE periodo_timer, BYTE reservado);
    BYTE (__stdcall *bReadCounter)(WORD* contador);
    BYTE (__stdcall *bWaitResponse)(void);

    BYTE (__stdcall *bLoadConfiguration)(void);
    BYTE (__stdcall *bOpenTelephoneConnection)(void);
    BYTE (__stdcall *bPrintString)(char* mensagem);
    BYTE (__stdcall *bPutEvent)(DWORD codigo, BYTE tipo, BYTE referencia);
    BYTE (__stdcall *bPutLog)(DWORD codigo, BYTE tipo, BYTE referencia , BYTE* geral);
    BYTE (__stdcall *bReadAllEventsFrom)(short int nr_evento);
    BYTE (__stdcall *bReadAllLogsFrom)(short int nr_relatorio);
    BYTE (__stdcall *bReadParameter)(BYTE codigo);
    BYTE (__stdcall *bResetCTX)(BYTE tipo);
    BYTE (__stdcall *bResetOutputs)(BYTE saidas);
    BYTE (__stdcall *bSaveConfiguration)(void);
    BYTE (__stdcall *bSendDTMFMessage)(char* mensagem);
    BYTE (__stdcall *bSetDateTime)(BYTE dia, BYTE mes, WORD ano, BYTE hora, BYTE minuto, BYTE segundo);
    BYTE (__stdcall *bSetOutputs)(BYTE saidas);
    BYTE (__stdcall *bSetSignature)(BYTE dia, BYTE mes, WORD ano);
    BYTE (__stdcall *bSetTelephoneCommands)(char* comando);
    BYTE (__stdcall *bWriteParameter)(BYTE codigo, VALPAR* valor);

    BYTE (__stdcall *bBufferToCTAConfig)(BYTE* buffer, BYTE* habilitacao, BYTE* area, BYTE* milhar_DV, BYTE* reservado, WORD* tempo_portadora);
    BYTE (__stdcall *bBufferToCTAStatus)(BYTE* buffer, BYTE* status, BYTE* reservado, WORD* tempo_portadora);
    BYTE (__stdcall *bBufferToCTDConfig)(BYTE* buffer, BYTE* habilitacao, BYTE* area, BYTE* milhar_DV, BYTE* area_RTX, WORD* atraso_evento, WORD* atraso_relatorio, WORD* tempo_portadora);
    BYTE (__stdcall *bBufferToCTDStatus)(BYTE* buffer, BYTE* status, BYTE* reservado, WORD* tempo_portadora);
    BYTE (__stdcall *bBufferToCTFConfig)(BYTE* buffer, BYTE* habilitacao, BYTE* nr_toques, BYTE* nr_tentativas, BYTE* sem_linha);
    BYTE (__stdcall *bBufferToCTFStatus)(BYTE* buffer, BYTE* status, BYTE* estado, BYTE* estado_discar, BYTE* nr_tentativas, BYTE* sem_linha);
    BYTE (__stdcall *bBufferToCTXCode)(BYTE* buffer, WORD* codigo);
    BYTE (__stdcall *bBufferToCTXConfig)(BYTE* buffer, BYTE* config);
    BYTE (__stdcall *bBufferToCTXStatus)(BYTE* buffer, BYTE* status);
    BYTE (__stdcall *bBufferToDateTime)(BYTE* buffer, BYTE* dia, BYTE* mes, WORD* ano, BYTE* hora, BYTE* minuto, BYTE* segundo);
    BYTE (__stdcall *bBufferToError)(BYTE* buffer, BYTE* codigo, char* descricao);
    BYTE (__stdcall *bBufferToEvent)(BYTE* buffer, WORD* nr_evento, DWORD* codigo, BYTE* tipo, BYTE* referencia);
    BYTE (__stdcall *bBufferToExpirationTime)(BYTE* buffer, BYTE* dias);
    BYTE (__stdcall *bBufferToKey)(BYTE* buffer, char* tecla);
    BYTE (__stdcall *bBufferToLog)(BYTE* buffer, WORD* nr_relatorio, DWORD* codigo, BYTE* tipo, BYTE* referencia, BYTE* geral);
    BYTE (__stdcall *bBufferToMessage)(BYTE* mensagem, BYTE* tipo_mensagem, char* acBufferAux, DWORD* tempo);
    BYTE (__stdcall *bBufferToMTACode)(BYTE* buffer, DWORD* codigo);
    BYTE (__stdcall *bBufferToOutputs)(BYTE* buffer, BYTE* saidas);
    BYTE (__stdcall *bBufferToPowerConfig)(BYTE* buffer, WORD* falta_AC, BYTE* tensao_baixa, BYTE* tensao_critica, BYTE* intervalo);
    BYTE (__stdcall *bBufferToPowerStatus)(BYTE* buffer, BYTE* estado, BYTE* tensao, WORD* falta_AC);
    BYTE (__stdcall *bBufferToPrintConfig)(BYTE* buffer, BYTE* habilitacao, BYTE* margem, BYTE* linhas);
    BYTE (__stdcall *bBufferToPrintStatus)(BYTE* buffer, short int* nr_evento, short int* nr_relatorio, BYTE* status, BYTE* linha_atual, BYTE* nr_caracteres);
    BYTE (__stdcall *bBufferToSignature)(BYTE* buffer, DWORD* assinatura);
    BYTE (__stdcall *bBufferToString)(BYTE* buffer, char* str);
    BYTE (__stdcall *bBufferToToneConfig)(BYTE* buffer, WORD* preambulo, WORD* tom_inicial, WORD* tom, WORD* guarda_tx, WORD* guarda_rx, WORD* time_out);
    BYTE (__stdcall *bBufferToToneStatus)(BYTE* buffer, BYTE* estado, BYTE* nr_tons);
    }SCTX;

MONITOR char acBuffer[TAM_BUFFER];
MONITOR SCTX stCtx;
MONITOR AnsiString asParametros[NR_MAX_MSG], asArquivo[NR_MAX_MSG];
MONITOR WORD wIndPar;
#endif
