//-----------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
#include <inifiles.hpp>
#include <SysUtils.hpp>
#include <classes.hpp>
#include <stdio.h>
#include <stdlib.h>
#include <winuser.h>
#include <io.h>
#include <dos.h>
#include <share.h>
#include <string.h>

#define MONITOR 
#include "monitor.h"
#include "dmazsim.h"
//-----------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

#define VALOR_INICIAL             1
#define RETARDA_SALVAMENTO        (VALOR_INICIAL + 50)
#define NR_MAX_FRAMES             1000
#define ARQUIVO_INICIALIZACAO     "./mntrctx.ini"
#define NOME_SECCAO               "Informações Gerais"  
#define DELIMITADOR               "--------------------------------------------------"

TFMonitor *FMonitor;

HWND apphwnd;

int ULTIMO_EVENTO_LIDO = 0;
static AnsiString ArquivoLogCtf;
static char  acBufferAux[TAM_BUFFER];
static char* acParametros[PRM_NR_PARAMETROS] =
{
    "Modelo = ",
    "Assinatura = ",
    "Código = ",
    "Configuração = ",
    "Estado = ",
    "Data/Horário = ",
    "Cliente = ",
    "Cabeçalho = ",
    "Evento:",
    "Relatório:",
    "Aviso:",
    "Telefone = ",
    "Comandos telefone = ",
    "Configuração da conexão telefônica: ",
    "Estado da conexão telefônica: ",
    "Conexão telefônica aberta: MTA = ",
    "Conexão telefônica fechada = ",
    "Prazo de validade = ",
    "Habilitação automato = ",
    "Configuração tom:",
    "Estado tom:",
    "Buffer DTMF RX = ",
    "Buffer DTMF TX = ",
    "Configuração CTA:",
    "Estado CTA:",
    "Configuração CTD:",
    "Estado CTD:",
    "Configuração fonte:",
    "Estado fonte:",
    "Configuração impressão:",
    "Estado impressão:",
    "Buffer impressão = ",
    "Saídas = ",
    "Tecla = ",
    "Status da CTX = "
};

//---------------------------------------------------------------------------
__fastcall TFMonitor::TFMonitor(TComponent* Owner) : TForm(Owner)
{
	Application->OnMessage = AppMessage;
}

//---------------------------------------------------------------------------

void __fastcall TFMonitor::FormCreate(TObject *Sender)
{
    struct time h;
    struct date d;

    getdate(&d);
    gettime(&h);

    try{
        ApresentaLogNoMemo("Iniciando o monitor serial Versão 1.0.1.0", true);
        ApresentaLogNoMemo("Carregando em cache os status", true);

        DModule->CDSStatus->Active = true;
        if(DModule->IBTStatus->InTransaction)
            DModule->IBTStatus->Commit();

        DModule->CDSStatusCliente->Active = true;
        if(DModule->IBTStatusCliente->InTransaction)
            DModule->IBTStatusCliente->Commit();

        PARAMSISISTEMA_SETORIZACAO = GetValorParametro(4);
        /*
        TDateTime dDataAtual = DModule->RetornaDataHoraAtual();
        AdicionarEvento(0, 159030, 3, "37", dDataAtual);
        AdicionarEvento(0, 159030, 0, "00", dDataAtual);
        AdicionarEvento(0, 159030, 0, "0F", dDataAtual);
        AdicionarEvento(3, 159030, 0, "FF", dDataAtual);
        */
        
        if(ParamCount() > 0){
            AnsiString portaCOM = ParamStr(2);
            apphwnd = (HWND)StrToInt(ParamStr(4));
            stCtx.bCom = (BYTE)StrToInt(portaCOM);
            AnsiString szPorta = Format("COM%s", ARRAYOFCONST((portaCOM)));
            AnsiString szDll = Format("bccom%s.dll", ARRAYOFCONST((portaCOM)));

            Application->Title = szPorta;
            this->Caption = szPorta;

            if (stCtx.hiDll == NULL) {
                sprintf(acBuffer,"Carregando a dll %s", szDll);
                ApresentaLogNoMemo(acBuffer, true);
                stCtx.hiDll = LoadLibrary(szDll.c_str());
                if(CarregaMetodosDll()){
                    sprintf(acBuffer,"Iniciando a comunicação serial com a porta %s", szPorta);
                    ApresentaLogNoMemo(acBuffer, true);
                    if(InterpretaRetornoDll(
                        stCtx.bInitNetwork(Application->Handle, 0, szPorta.c_str(), NR_RETRANSMISSOES_CTX,
                            ESPERA_RESPOSTA_CTX, PERIODO_TIMER, 0)!= BIBCOM_SEM_ERRO)){
                        sprintf(acBuffer,"Porta de comunicação serial %s aberta, aguardando resposta da CTX", szPorta);
                        ApresentaLogNoMemo(acBuffer, true);
                    }else{
                        sprintf(acBuffer,"Comunicação serial com a porta %s falhou", szPorta);
                        ApresentaLogNoMemo(acBuffer, true);
                    }
                }
            }
        }

    }catch(Exception &excecao){
        AnsiString classe, erro, mensagem;
        classe = this->ClassName();
        erro = excecao.ClassName();
        mensagem = excecao.Message;
        sprintf(acBuffer,"%s : %s : %s : %s", classe, "FormCreate", erro, mensagem);
        TDModule::SalvaLog(acBuffer);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFMonitor::FormClose(TObject *Sender, TCloseAction &Action)
{
    if (stCtx.hiDll != NULL){
        if(InterpretaRetornoDll(stCtx.bEndNetwork())){
            ApresentaLogNoMemo("Comunicação serial encerrada com sucesso", true);
        }else{
            ApresentaLogNoMemo("Encerramento da comunicação serial falhou", true);
        }
    }
    DModule->IBQStatus->Active = false;
}

//---------------------------------------------------------------------------

bool __fastcall TFMonitor::CarregaMetodosDll(void)
{
    bool retorno = true;
    struct time h;
    struct date d;

    getdate(&d);
    gettime(&h);

    if (stCtx.hiDll != NULL){
        ApresentaLogNoMemo("Validando a integridade da dll", true);

        stCtx.bEndNetwork = (BYTE (__stdcall*)(void)) GetProcAddress(stCtx.hiDll, "bEndNetwork");
        if (stCtx.bEndNetwork == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bEndNetwork()", true);
            retorno = false;
        }

        stCtx.bGetDllError = (BYTE (__stdcall*)(DWORD*)) GetProcAddress(stCtx.hiDll, "bGetDllError");
        if (stCtx.bGetDllError == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bGetDllError()", true);
            retorno = false;
        }

        stCtx.bGetDllVersion = (BYTE (__stdcall*)(WORD*, char*, char*)) GetProcAddress(stCtx.hiDll, "bGetDllVersion");
        if (stCtx.bGetDllVersion == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bGetDllVersion()", true);
            retorno = false;
        }

        stCtx.bInitNetwork = (BYTE (__stdcall*)(HWND, WORD, char*, BYTE, WORD, BYTE, BYTE)) GetProcAddress(stCtx.hiDll, "bInitNetwork");
        if (stCtx.bInitNetwork == NULL)	{
            ApresentaLogNoMemo("Não foi possível encontrar a função bInitNetwork()", true);
            retorno = false;
        }

        stCtx.bReadCounter = (BYTE (__stdcall*)(WORD*)) GetProcAddress(stCtx.hiDll, "bReadCounter");
        if (stCtx.bReadCounter == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bReadCounter()", true);
            retorno = false;
        }

        stCtx.bWaitResponse = (BYTE (__stdcall*)(void)) GetProcAddress(stCtx.hiDll, "bWaitResponse");
        if (stCtx.bWaitResponse == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bWaitResponse()", true);
            retorno = false;
        }

        stCtx.bLoadConfiguration = (BYTE (__stdcall*)(void)) GetProcAddress(stCtx.hiDll, "bLoadConfiguration");
        if (stCtx.bLoadConfiguration == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bLoadConfiguration()", true);
            retorno = false;
        }

        stCtx.bOpenTelephoneConnection = (BYTE (__stdcall*)(void)) GetProcAddress(stCtx.hiDll, "bOpenTelephoneConnection");
        if (stCtx.bOpenTelephoneConnection == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bOpenTelephoneConnection()", true);
            retorno = false;
        }

        stCtx.bPrintString = (BYTE (__stdcall*)(char*)) GetProcAddress(stCtx.hiDll, "bPrintString");
        if (stCtx.bPrintString == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bPrintString()", true);
            retorno = false;
        }

        stCtx.bPutEvent = (BYTE (__stdcall*)(DWORD, BYTE, BYTE)) GetProcAddress(stCtx.hiDll, "bPutEvent");
        if (stCtx.bPutEvent == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bPutEvent()", true);
            retorno = false;
        }

        stCtx.bPutLog = (BYTE (__stdcall*)(DWORD, BYTE, BYTE, BYTE*)) GetProcAddress(stCtx.hiDll, "bPutLog");
        if (stCtx.bPutLog == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bPutLog()", true);
            retorno = false;
        }

        stCtx.bReadAllEventsFrom = (BYTE (__stdcall*)(short int)) GetProcAddress(stCtx.hiDll, "bReadAllEventsFrom");
        if (stCtx.bReadAllEventsFrom == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bReadAllEventsFrom()", true);
            retorno = false;
        }

        stCtx.bReadAllLogsFrom = (BYTE (__stdcall*)(short int)) GetProcAddress(stCtx.hiDll, "bReadAllLogsFrom");
        if (stCtx.bReadAllLogsFrom == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bReadAllLogsFrom()", true);
            retorno = false;
        }

        stCtx.bReadParameter = (BYTE (__stdcall*)(BYTE)) GetProcAddress(stCtx.hiDll, "bReadParameter");
        if (stCtx.bReadParameter == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bReadParameter()", true);
            retorno = false;
        }

        stCtx.bResetCTX = (BYTE (__stdcall*)(BYTE)) GetProcAddress(stCtx.hiDll, "bResetCTX");
        if (stCtx.bResetCTX == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bResetCTX()", true);
            retorno = false;
        }

        stCtx.bResetOutputs = (BYTE (__stdcall*)(BYTE)) GetProcAddress(stCtx.hiDll, "bResetOutputs");
        if (stCtx.bResetOutputs == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bResetOutputs()", true);
            retorno = false;
        }

        stCtx.bSaveConfiguration = (BYTE (__stdcall*)(void)) GetProcAddress(stCtx.hiDll, "bSaveConfiguration");
        if (stCtx.bSaveConfiguration == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bSaveConfiguration()", true);
            retorno = false;
        }

        stCtx.bSendDTMFMessage = (BYTE (__stdcall*)(char*)) GetProcAddress(stCtx.hiDll, "bSendDTMFMessage");
        if (stCtx.bSendDTMFMessage == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bSendDTMFMessage()", true);
            retorno = false;
        }

        stCtx.bSetDateTime = (BYTE (__stdcall*)(BYTE, BYTE, WORD, BYTE, BYTE, BYTE)) GetProcAddress(stCtx.hiDll, "bSetDateTime");
        if (stCtx.bSetDateTime == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bSetDateTime()", true);
            retorno = false;
        }

        stCtx.bSetOutputs = (BYTE (__stdcall*)(BYTE)) GetProcAddress(stCtx.hiDll, "bSetOutputs");
        if (stCtx.bSetOutputs == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bSetOutputs()", true);
            retorno = false;
        }

        stCtx.bSetSignature = (BYTE (__stdcall*)(BYTE, BYTE, WORD)) GetProcAddress(stCtx.hiDll, "bSetSignature");
        if (stCtx.bSetSignature == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bSetSignature()", true);
            retorno = false;
        }

        stCtx.bSetTelephoneCommands = (BYTE (__stdcall*)(char*)) GetProcAddress(stCtx.hiDll, "bSetTelephoneCommands");
        if (stCtx.bSetTelephoneCommands == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bSetTelephoneCommands()", true);
            retorno = false;
        }

        stCtx.bWriteParameter = (BYTE (__stdcall*)(BYTE, VALPAR*)) GetProcAddress(stCtx.hiDll, "bWriteParameter");
        if (stCtx.bWriteParameter == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bWriteParameter()", true);
            retorno = false;
        }

        stCtx.bBufferToCTAConfig = (BYTE (__stdcall*)(BYTE*, BYTE*, BYTE*, BYTE*, BYTE*, WORD*)) GetProcAddress(stCtx.hiDll, "bBufferToCTAConfig");
        if (stCtx.bBufferToCTAConfig == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bBufferToCTAConfig()", true);
            retorno = false;
        }

        stCtx.bBufferToCTAStatus = (BYTE (__stdcall*)(BYTE*, BYTE*, BYTE*, WORD*)) GetProcAddress(stCtx.hiDll, "bBufferToCTAStatus");
        if (stCtx.bBufferToCTAStatus == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bBufferToCTAStatus()", true);
            retorno = false;
        }

        stCtx.bBufferToCTDConfig = (BYTE (__stdcall*)(BYTE*, BYTE*, BYTE*, BYTE*, BYTE*, WORD*, WORD*, WORD*)) GetProcAddress(stCtx.hiDll, "bBufferToCTDConfig");
        if (stCtx.bBufferToCTDConfig == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bBufferToCTDConfig()", true);
            retorno = false;
        }

        stCtx.bBufferToCTDStatus = (BYTE (__stdcall*)(BYTE*, BYTE*, BYTE*, WORD*)) GetProcAddress(stCtx.hiDll, "bBufferToCTDStatus");
        if (stCtx.bBufferToCTDStatus == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bBufferToCTDStatus()", true);
            retorno = false;
        }

        stCtx.bBufferToCTFConfig = (BYTE (__stdcall*)(BYTE*, BYTE*, BYTE*, BYTE*, BYTE*)) GetProcAddress(stCtx.hiDll, "bBufferToCTFConfig");
        if (stCtx.bBufferToCTFConfig == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bBufferToCTFConfig()", true);
            retorno = false;
        }

        stCtx.bBufferToCTFStatus = (BYTE (__stdcall*)(BYTE*, BYTE*, BYTE*, BYTE*, BYTE*, BYTE*)) GetProcAddress(stCtx.hiDll, "bBufferToCTFStatus");
        if (stCtx.bBufferToCTFStatus == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bBufferToCTFStatus()", true);
            retorno = false;
        }

        stCtx.bBufferToCTXCode = (BYTE (__stdcall*)(BYTE*, WORD*)) GetProcAddress(stCtx.hiDll, "bBufferToCTXCode");
        if (stCtx.bBufferToCTXCode == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bBufferToCTXCode()", true);
            retorno = false;
        }

        stCtx.bBufferToCTXConfig = (BYTE (__stdcall*)(BYTE*, BYTE*)) GetProcAddress(stCtx.hiDll, "bBufferToCTXConfig");
        if (stCtx.bBufferToCTXConfig == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bBufferToCTXConfig()", true);
            retorno = false;
        }

        stCtx.bBufferToCTXStatus = (BYTE (__stdcall*)(BYTE*, BYTE*)) GetProcAddress(stCtx.hiDll, "bBufferToCTXStatus");
        if (stCtx.bBufferToCTXStatus == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bBufferToCTXStatus()", true);
            retorno = false;
        }

        stCtx.bBufferToDateTime = (BYTE (__stdcall*)(BYTE*, BYTE*, BYTE*, WORD*, BYTE*, BYTE*, BYTE*)) GetProcAddress(stCtx.hiDll, "bBufferToDateTime");
        if (stCtx.bBufferToDateTime == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bBufferToDateTime()", true);
            retorno = false;
        }

        stCtx.bBufferToError = (BYTE (__stdcall*)(BYTE*, BYTE*, char*)) GetProcAddress(stCtx.hiDll, "bBufferToError");
        if (stCtx.bBufferToError == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bBufferToError()", true);
            retorno = false;
        }

        stCtx.bBufferToEvent = (BYTE (__stdcall*)(BYTE*, WORD*, DWORD*, BYTE*, BYTE*)) GetProcAddress(stCtx.hiDll, "bBufferToEvent");
        if (stCtx.bBufferToEvent == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bBufferToEvent()", true);
            retorno = false;
        }

        stCtx.bBufferToExpirationTime = (BYTE (__stdcall*)(BYTE*, BYTE*)) GetProcAddress(stCtx.hiDll, "bBufferToExpirationTime");
        if (stCtx.bBufferToExpirationTime == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bBufferToExpirationTime()", true);
            retorno = false;
        }

        stCtx.bBufferToKey = (BYTE (__stdcall*)(BYTE*, char*)) GetProcAddress(stCtx.hiDll, "bBufferToKey");
        if (stCtx.bBufferToKey == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bBufferToKey()", true);
            retorno = false;
        }

        stCtx.bBufferToLog = (BYTE (__stdcall*)(BYTE*, WORD*, DWORD*, BYTE*, BYTE*, BYTE*)) GetProcAddress(stCtx.hiDll, "bBufferToLog");
        if (stCtx.bBufferToLog == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bBufferToLog()", true);
            retorno = false;
        }

        stCtx.bBufferToMessage = (BYTE (__stdcall *)(BYTE*, BYTE*, char*, DWORD*)) GetProcAddress(stCtx.hiDll, "bBufferToMessage");
        if (stCtx.bBufferToMessage == NULL)	{
            ApresentaLogNoMemo("Não foi possível encontrar a função bBufferToMessage()", true);
            retorno = false;
        }

        stCtx.bBufferToMTACode = (BYTE (__stdcall *)(BYTE*, DWORD*)) GetProcAddress(stCtx.hiDll, "bBufferToMTACode");
        if (stCtx.bBufferToMTACode == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bBufferToMTACode()", true);
            retorno = false;
        }

        stCtx.bBufferToOutputs = (BYTE (__stdcall *)(BYTE*, BYTE*)) GetProcAddress(stCtx.hiDll, "bBufferToOutputs");
        if (stCtx.bBufferToOutputs == NULL)	{
            ApresentaLogNoMemo("Não foi possível encontrar a função bBufferToOutputs()", true);
            retorno = false;
        }

        stCtx.bBufferToPowerConfig = (BYTE (__stdcall *)(BYTE*, WORD*, BYTE*, BYTE*, BYTE*)) GetProcAddress(stCtx.hiDll, "bBufferToPowerConfig");
        if (stCtx.bBufferToPowerConfig == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bBufferToPowerConfig()", true);
            retorno = false;
        }

        stCtx.bBufferToPowerStatus = (BYTE (__stdcall *)(BYTE*, BYTE*, BYTE*, WORD*)) GetProcAddress(stCtx.hiDll, "bBufferToPowerStatus");
        if (stCtx.bBufferToPowerStatus == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bBufferToPowerStatus()", true);
            retorno = false;
        }

        stCtx.bBufferToPrintConfig = (BYTE (__stdcall *)(BYTE*, BYTE*, BYTE*, BYTE*)) GetProcAddress(stCtx.hiDll, "bBufferToPrintConfig");
        if (stCtx.bBufferToPrintConfig == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bBufferToPrintConfig()", true);
            retorno = false;
        }

        stCtx.bBufferToPrintStatus = (BYTE (__stdcall *)(BYTE*, short int*, short int*, BYTE*, BYTE*, BYTE*)) GetProcAddress(stCtx.hiDll, "bBufferToPrintStatus");
        if (stCtx.bBufferToPrintStatus == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bBufferToPrintStatus()", true);
            retorno = false;
        }

        stCtx.bBufferToSignature = (BYTE (__stdcall *)(BYTE*, DWORD*)) GetProcAddress(stCtx.hiDll, "bBufferToSignature");
        if (stCtx.bBufferToSignature == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bBufferToSignature()", true);
            retorno = false;
        }

        stCtx.bBufferToString = (BYTE (__stdcall *)(BYTE*, char*)) GetProcAddress(stCtx.hiDll, "bBufferToString");
        if (stCtx.bBufferToString == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bBufferToString()", true);
            retorno = false;
        }

        stCtx.bBufferToToneConfig = (BYTE (__stdcall *)(BYTE*, WORD*, WORD*, WORD*, WORD*, WORD*, WORD*)) GetProcAddress(stCtx.hiDll, "bBufferToToneConfig");
        if (stCtx.bBufferToToneConfig == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bBufferToToneConfig()", true);
            retorno = false;
        }

        stCtx.bBufferToToneStatus = (BYTE (__stdcall *)(BYTE*, BYTE*, BYTE*)) GetProcAddress(stCtx.hiDll, "bBufferToToneStatus");
        if (stCtx.bBufferToToneStatus == NULL){
            ApresentaLogNoMemo("Não foi possível encontrar a função bBufferToToneStatus()", true);
            retorno = false;
        }

        return retorno;

    }else{
        ApresentaLogNoMemo("Não foi possível carregar a dll", true);
        stCtx.bCom = 0;
        return false;
    }
}

//---------------------------------------------------------------------------

void __fastcall TFMonitor::OnWMCopyData(TWMCopyData &Msg){
    COPYDATASTRUCT * pCds;
    pCds = (COPYDATASTRUCT *)Msg.CopyDataStruct;
    ApresentaLogNoMemo((char *)pCds->lpData, pCds->dwData);
}

//---------------------------------------------------------------------------

void __fastcall TFMonitor::AppMessage(tagMSG &Msg, bool &Handled)
{
    BYTE* mensagem;
    struct time h;
    struct date d;

    getdate(&d);
    gettime(&h);

    mensagem = (BYTE*)Msg.lParam;

    try{
        switch(Msg.message){
            case WM_CTX_CONECTADO:
                ApresentaLogNoMemo("CTX conectado", true);
                ApresentaLogNoMemo("bReadParameter(PRM_CONFIGURACAO_CTX)", true);
                stCtx.bReadParameter(PRM_CONFIGURACAO_CTX);

                ApresentaLogNoMemo("bReadParameter(PRM_CODIGO_CTX)", true);
                stCtx.bReadParameter(PRM_CODIGO_CTX);

                sprintf(acBuffer,"bSetDateTime(%02u,%02u,%04u,%02u,%02u,%02u)",d.da_day,d.da_mon,d.da_year,h.ti_hour,h.ti_min,h.ti_sec);
                ApresentaLogNoMemo(acBuffer, true);
                stCtx.bSetDateTime(d.da_day,d.da_mon,d.da_year,h.ti_hour,h.ti_min,h.ti_sec);
                TMRSetDataHora->Enabled = true;
                Handled = true;
                break;

            case WM_CTX_DESCONECTADO:
                sprintf(acBuffer,"CTX = %5u desconectado",stCtx.wCodigoCtx);
                ApresentaLogNoMemo(acBuffer, true);
                TMRSetDataHora->Enabled = false;
                Handled = true;
                break;
            case WM_TESTE:
            case WM_ERRO:
                {
                BYTE codigo;
                char descricao[1000];

                stCtx.bBufferToError(mensagem,&codigo,descricao);
                sprintf(acBuffer,"CTX = %5u. %s",stCtx.wCodigoCtx,descricao);
                ApresentaLogNoMemo(acBuffer, true);
                Handled = true;
                }
                break;
            case WM_IDENTIFICACAO:
            case WM_NOME_CLIENTE:
            case WM_CABECALHO:
            case WM_NUMERO_TELEFONE:
            case WM_COMANDOS_TELEFONE:
            case WM_BUFFER_DTMF_RX:
            case WM_BUFFER_DTMF_TX:
            case WM_BUFFER_IMPRESSAO:
                stCtx.bBufferToString(mensagem,acBufferAux);
                sprintf(acBuffer,"CTX = %5u, %s%s",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO],acBufferAux);
                ApresentaLogNoMemo(acBuffer, true);
                Handled = true;
                break;
            case WM_ASSINATURA:
                {
                BYTE dia, mes, hora, minuto, segundo;
                WORD ano;

                stCtx.bBufferToSignature(mensagem,&stCtx.dwAssinatura);
                stCtx.bBufferToDateTime(mensagem,&dia,&mes,&ano,&hora,&minuto,&segundo);
                sprintf(acBuffer,"CTX = %5u, %s%u (%02u/%02u/%4u)",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO],stCtx.dwAssinatura,dia,mes,ano);
                ApresentaLogNoMemo(acBuffer, true);
                Handled = true;
                }
                break;
            case WM_CODIGO_CTX:
                stCtx.bBufferToCTXCode(mensagem,&stCtx.wCodigoCtx);
                sprintf(acBuffer,"%s%u",acParametros[Msg.message-WM_IDENTIFICACAO],stCtx.wCodigoCtx);
                ApresentaLogNoMemo(acBuffer, true);
                SalvarCTX();
                Handled = true;
                break;
            case WM_CONFIGURACAO_CTX:
                stCtx.bBufferToCTXConfig(mensagem,&stCtx.bConfiguracao);
                switch (stCtx.bConfiguracao)
                {
                    case 0:
                        ApresentaLogNoMemo("Configuracao CTX = CTA", true);
                    break;
                    case 1:
                        ApresentaLogNoMemo("Configuracao CTX = CTF", true);
                    break;
                    case 2:
                        ApresentaLogNoMemo("Configuracao CTX = CTD", true);
                    break;
                }

                Handled = true;
                break;
            case WM_ESTADO_CTX:
                stCtx.bBufferToCTXStatus(mensagem,&stCtx.bStatus);
                sprintf(acBuffer,"CTX = %5u, %s%04x",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO],stCtx.bStatus);
                ApresentaLogNoMemo(acBuffer, true);
                Handled = true;
                break;
            case WM_DATA_HORARIO:
                stCtx.bBufferToDateTime(mensagem,&stCtx.bDia,&stCtx.bMes,&stCtx.wAno,&stCtx.bHora,&stCtx.bMinuto,&stCtx.bSegundo);
                sprintf(acBuffer,"%CTX = %5u, %s%02u/%02u/%4u, %02u:%02u:%02u",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO],stCtx.bDia,stCtx.bMes,stCtx.wAno,stCtx.bHora,stCtx.bMinuto,stCtx.bSegundo);
                ApresentaLogNoMemo(acBuffer, true);
                Handled = true;
                break;
            case WM_EVENTO:
                {
                    DWORD dwCodificador = NULL;
                    BYTE bStatus, bReferencia = NULL;
                    BYTE dia, mes, hora, minuto, segundo = NULL;
                    WORD ano, wNrEvento = NULL;

                    stCtx.bBufferToEvent(mensagem, &wNrEvento, &dwCodificador, &bStatus, &bReferencia);
                    stCtx.bBufferToDateTime(mensagem, &dia, &mes, &ano, &hora, &minuto, &segundo);
                    sprintf(acBuffer,"%02u/%02u/%4u %02u:%02u:%02u",dia,mes,ano,hora,minuto,segundo);
                    AdicionarEvento(wNrEvento, dwCodificador, IntToHex(bStatus, 1), IntToHex(bReferencia, 2), StrToDateTime(acBuffer));

                    sprintf(acBuffer,"CTX = %5u, %s",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO]);
                    ApresentaLogNoMemo(acBuffer, true);
                    sprintf(acBuffer,"  Número do Evento = %u",wNrEvento);
                    ApresentaLogNoMemo(acBuffer, true);
                    sprintf(acBuffer,"  Código do equipamento = %05lu.%u",dwCodificador/10,(WORD)(dwCodificador%10));
                    ApresentaLogNoMemo(acBuffer, true);
                    sprintf(acBuffer,"  Status/Referência = %x.%02x",bStatus,bReferencia);
                    ApresentaLogNoMemo(acBuffer, true);
                    sprintf(acBuffer,"  Data/Horário = %02u/%02u/%4u %02u:%02u:%02u",dia,mes,ano,hora,minuto,segundo);
                    ApresentaLogNoMemo(acBuffer, true);
                    Handled = true;
                }
                break;
            case WM_RELATORIO:
            case WM_AVISO:
              {
              DWORD codigo;
              BYTE tipo, referencia;
              BYTE dia, mes, hora, minuto, segundo;
              WORD ano;
              BYTE geral[6];

              stCtx.bBufferToLog(mensagem,&stCtx.wNrRelatorio,&codigo,&tipo,&referencia,geral);
              stCtx.bBufferToDateTime(mensagem,&dia,&mes,&ano,&hora,&minuto,&segundo);
              sprintf(acBuffer,"CTX = %5u, %s",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO]);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Número do Relatório = %u",stCtx.wNrRelatorio);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Código do equipamento = %04u.%u",(WORD)(codigo/10),codigo%10);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Status/Referência = %x.%02x",tipo,referencia);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Data/Horário = %02u/%02u/%4u %02u:%02u:%02u",dia,mes,ano,hora,minuto,segundo);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Dados =  %02x%02x%02x %02x%02x%02x",geral[0],geral[1],geral[2],geral[3],geral[4],geral[5]);
              ApresentaLogNoMemo(acBuffer, true);
              Handled = true;
              }
              break;
            case WM_CONFIGURACAO_CTF:
              stCtx.bBufferToCTFConfig(mensagem,&stCtx.bHabilitacao,&stCtx.bNrToques,&stCtx.bNrMaxTentativas,&stCtx.bSemLinha);
              sprintf(acBuffer,"CTX = %5u, %s",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO]);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Habilitação = %02x",stCtx.bHabilitacao);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Número de toques = %u",stCtx.bNrToques);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Número de tentativas = %u",stCtx.bNrMaxTentativas);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Tempo sem linha = %umin",stCtx.bSemLinha);
              ApresentaLogNoMemo(acBuffer, true);
              Handled = true;
              break;
            case WM_ESTADO_CTF:
              stCtx.bBufferToCTFStatus(mensagem,&stCtx.bStatusCTF,&stCtx.bEstadoCTF,&stCtx.bEstadoDiscar,&stCtx.bNrTentativas,&stCtx.bTempo);
              sprintf(acBuffer,"CTX = %5u, %s",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO]);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Status = %02x",stCtx.bStatusCTF);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Estado = %u",stCtx.bEstadoCTF);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Estado Discar = %u",stCtx.bEstadoDiscar);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Número de tentativas = %u",stCtx.bNrTentativas);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Tempo transcorrido sem linha = %umin",stCtx.bTempo);
              ApresentaLogNoMemo(acBuffer, true);
              Handled = true;
              break;
            case WM_CONEXAO_ABERTA:
              {
              DWORD codigo;

              stCtx.bBufferToMTACode(mensagem,&codigo);
              sprintf(acBuffer,"CTX = %5u, %s%u",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO],codigo);
              ApresentaLogNoMemo(acBuffer, true);
              Handled = true;
              }
              break;
            case WM_CONEXAO_FECHADA:
              {
              BYTE status;

              stCtx.bBufferToCTFStatus(mensagem,&status,NULL,NULL,NULL,NULL);
              sprintf(acBuffer,"CTX = %5u, %s%u",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO],status);
              ApresentaLogNoMemo(acBuffer, true);
              Handled = true;
              }
              break;
            case WM_PRAZO_VALIDADE:
              stCtx.bBufferToExpirationTime(mensagem,&stCtx.bValidade);
              sprintf(acBuffer,"CTX = %5u, %s%u dias",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO],stCtx.bValidade);
              ApresentaLogNoMemo(acBuffer, true);
              Handled = true;
              break;
            case WM_HABILITACAO_AUTOMATO:
              stCtx.bBufferToCTXConfig(mensagem,&stCtx.bHabAutomato);
              sprintf(acBuffer,"CTX = %5u, %s%02xh",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO],stCtx.bHabAutomato);
              ApresentaLogNoMemo(acBuffer, true);
              Handled = true;
              break;
            case WM_CONFIGURACAO_TOM:
              stCtx.bBufferToToneConfig(mensagem,&stCtx.wPreambulo,&stCtx.wTomInicial,&stCtx.wTom,&stCtx.wGuardaTx,&stCtx.wGuardaRx,&stCtx.wTimeOut);
              sprintf(acBuffer,"CTX = %5u, %s",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO]);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Preâmbulo = %ums",stCtx.wPreambulo);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Duração do tom inicial = %ums",stCtx.wTomInicial);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Duração dos demais tons = %ums",stCtx.wTom);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Tempo entre dois tons transmitidos = %ums",stCtx.wGuardaTx);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Tempo mínimo entre dois tons recebidos = %ums",stCtx.wGuardaRx);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Tempo para detectar final de mensagem = %ums",stCtx.wTimeOut);
              ApresentaLogNoMemo(acBuffer, true);
              Handled = true;
              break;
            case WM_ESTADO_TOM:
              stCtx.bBufferToToneStatus(mensagem,&stCtx.bEstadoTom,&stCtx.bNrTons);
              sprintf(acBuffer,"CTX = %5u, %s",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO]);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Estado atual = %u",stCtx.bEstadoTom);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Nº de tons recebidos = %u tons",stCtx.bNrTons);
              ApresentaLogNoMemo(acBuffer, true);
              Handled = true;
              break;
            case WM_CONFIGURACAO_CTA:
              stCtx.bBufferToCTAConfig(mensagem,&stCtx.bHabCTX,&stCtx.bArea,&stCtx.bMilharDV,&stCtx.bReservado,&stCtx.wTempoMaxPortadora);
              sprintf(acBuffer,"CTX = %5u, %s",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO]);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Habilitação = %02xh",stCtx.bHabCTX);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Área do CTA = %u",stCtx.bArea);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Milhar sem consistência do DV = %u",stCtx.bMilharDV);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Reservado = %02xh",stCtx.bReservado);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Tempo máximo com portadora = %us",stCtx.wTempoMaxPortadora);
              ApresentaLogNoMemo(acBuffer, true);
              Handled = true;
              break;
            case WM_ESTADO_CTA:
              stCtx.bBufferToCTAStatus(mensagem,&stCtx.bStatusCTX,&stCtx.bReservado,&stCtx.wTempoPortadora);
              sprintf(acBuffer,"CTX = %5u, %s",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO]);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Estado = %02xh",stCtx.bStatusCTX);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Reservado = %02xh",stCtx.bReservado);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Tempo com portadora = %us",stCtx.wTempoPortadora);
              ApresentaLogNoMemo(acBuffer, true);
              Handled = true;
              break;
            case WM_CONFIGURACAO_CTD:
              stCtx.bBufferToCTDConfig(mensagem,&stCtx.bHabCTX,&stCtx.bArea,&stCtx.bMilharDV,&stCtx.bAreaRtx,&stCtx.wAtrasoEvento,&stCtx.wAtrasoRelatorio,&stCtx.wTempoMaxPortadora);
              sprintf(acBuffer,"CTX = %5u, %s",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO]);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Habilitação = %02xh",stCtx.bHabCTX);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Área do CTD = %u",stCtx.bArea);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Milhar sem consistência do DV = %u",stCtx.bMilharDV);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Área de retransmissão do CTD = %u",stCtx.bAreaRtx);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Atraso Retransmissão de Evento = %ums",stCtx.wAtrasoEvento);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Atraso Retransmissão de Relatório = %ums",stCtx.wAtrasoRelatorio);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Tempo máximo com portadora = %us",stCtx.wTempoMaxPortadora);
              ApresentaLogNoMemo(acBuffer, true);
              Handled = true;
              break;
            case WM_ESTADO_CTD:
              stCtx.bBufferToCTDStatus(mensagem,&stCtx.bStatusCTX,&stCtx.bReservado,&stCtx.wTempoPortadora);
              sprintf(acBuffer,"CTX = %5u, %s",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO]);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Estado = %02xh",stCtx.bStatusCTX);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Reservado = %02xh",stCtx.bReservado);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Tempo com portadora = %us",stCtx.wTempoPortadora);
              ApresentaLogNoMemo(acBuffer, true);
              Handled = true;
              break;
            case WM_CONFIGURACAO_FONTE:
              stCtx.bBufferToPowerConfig(mensagem,&stCtx.wTempoMaxFaltaAC,&stCtx.bTensaoBaixaBat,&stCtx.bTensaoCriticaBat,&stCtx.bIntervTestes);
              sprintf(acBuffer,"CTX = %5u, %s",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO]);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Tempo máximo com falta de energia = %us",stCtx.wTempoMaxFaltaAC);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Limiar de tensão baixa na bateria = %u.%u V",stCtx.bTensaoBaixaBat/10,stCtx.bTensaoBaixaBat%10);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Limiar de tensão crítica na bateria = %u.%u V",stCtx.bTensaoCriticaBat/10,stCtx.bTensaoCriticaBat%10);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Intervalo entre testes de bateria = %uh",stCtx.bIntervTestes);
              ApresentaLogNoMemo(acBuffer, true);
              Handled = true;
              break;
            case WM_ESTADO_FONTE:
              stCtx.bBufferToPowerStatus(mensagem,&stCtx.bEstadoBat,&stCtx.bTensaoBat,&stCtx.wTempoFaltaAC);
              sprintf(acBuffer,"CTX = %5u, %s",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO]);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Estado bateria = %02u",stCtx.bEstadoBat);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Tensão bateria = %u.%u V",stCtx.bTensaoBat/10,stCtx.bTensaoBat%10);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Tempo de falta de energia = %u s",stCtx.wTempoFaltaAC);
              ApresentaLogNoMemo(acBuffer, true);
              Handled = true;
              break;
            case WM_CONFIGURACAO_IMPRESSAO:
              stCtx.bBufferToPrintConfig(mensagem,&stCtx.bHabImp,&stCtx.bMargem,&stCtx.bLinhasPagina);
              sprintf(acBuffer,"CTX = %5u, %s",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO]);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Habilitação = %02xh",stCtx.bHabImp);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Margem = %u espaços",stCtx.bMargem);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Linhas na página = %u linhas",stCtx.bLinhasPagina);
              ApresentaLogNoMemo(acBuffer, true);
              Handled = true;
              break;
            case WM_ESTADO_IMPRESSAO:
              stCtx.bBufferToPrintStatus(mensagem,(short int*)&stCtx.wNrEventoImp,(short int*)&stCtx.wNrRelatorioImp,&stCtx.bStatusImp,&stCtx.bLinhaAtual,&stCtx.bNrCaracteres);
              sprintf(acBuffer,"CTX = %5u, %s",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO]);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Último evento impresso = %u",stCtx.wNrEventoImp);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Último relatório impresso = %u",stCtx.wNrRelatorioImp);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Status = %02x",stCtx.bStatusImp);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Nº da linha atual = %u",stCtx.bLinhaAtual);
              ApresentaLogNoMemo(acBuffer, true);
              sprintf(acBuffer,"  Nº de caracteres no buffer = %u",stCtx.bNrCaracteres);
              ApresentaLogNoMemo(acBuffer, true);
              Handled = true;
              break;
            case WM_SAIDAS:
              stCtx.bBufferToOutputs(mensagem,&stCtx.bSaidas);
              sprintf(acBuffer,"CTX = %5u, %s%02xh",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO],stCtx.bSaidas);
              ApresentaLogNoMemo(acBuffer, true);
              Handled = true;
              break;
            case WM_TECLA:
              stCtx.bBufferToKey(mensagem,&stCtx.cTecla);
              sprintf(acBuffer,"CTX = %5u, %s%c",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO],(stCtx.cTecla==-1? ' ': stCtx.cTecla));
              ApresentaLogNoMemo(acBuffer, true);
              Handled = true;
              break;
            }

    }catch(Exception &excecao) {
        AnsiString classe, erro, mensagem;
        classe = this->ClassName();
        erro = excecao.ClassName();
        mensagem = excecao.Message;
        sprintf(acBuffer,"%s : %s : %s : %s", classe, "AppMessage", erro, mensagem);
        TDModule::SalvaLog(acBuffer);        
    }
}

//---------------------------------------------------------------------------

void __fastcall TFMonitor::ApresentaLogNoMemo(AnsiString log, bool salvar)
{
    char MensagemLog[TAM_BUFFER];
    struct time h;
    struct date d;

    getdate(&d);
    gettime(&h);

    if(mmEventos->Lines->Count > TAM_BUFFER){
        mmEventos->Lines->Clear();
    }

    sprintf(MensagemLog,"%02u:%02u:%02u> %s.",h.ti_hour,h.ti_min,h.ti_sec,log);
    mmEventos->Lines->Add(MensagemLog);

    if(salvar){
        TDModule::SalvaLog(log);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFMonitor::AdicionarEvento(WORD wNrEvento, DWORD dwCodificador, AnsiString szStatus,
    AnsiString szReferencia, TDateTime dtDataEHora)
{
    AnsiString szDescricaoStatus, szSetor, szLocalizacao, szNomeCliente, szEndereco, szCidade, zsFilial = "";
    int iCdCliente, iTipoMonitor, iTipoIdentificacao, iDefineSeOcTemSetor = 0;
    bool bGeraAlarme, bMostrarMensagem, bSalvoComSucesso, bExisteCliente = false;

    // Complementa os dados do evento
    BuscaStatus(dwCodificador, szStatus, szReferencia, szDescricaoStatus, bGeraAlarme,
        bMostrarMensagem, iTipoMonitor, iTipoIdentificacao, iDefineSeOcTemSetor, szSetor);

    // Localiza o cliente pelo contrato e codificador
    bExisteCliente = BuscaCliente(dwCodificador, iCdCliente, szNomeCliente, szEndereco, szCidade, zsFilial);
    if(!bExisteCliente){
        return;
    }

    // Se for um evento de setor complementa com a localização
    if(szSetor != ""){
        BuscaSetor(dwCodificador, szSetor, szLocalizacao);
    }

    // Salva o evento na logevento
    bSalvoComSucesso = SalvarEvento(wNrEvento, dwCodificador, szStatus, szReferencia, szDescricaoStatus,
        iTipoMonitor, iTipoIdentificacao, dtDataEHora, szNomeCliente, iCdCliente, szSetor,
        szLocalizacao, szEndereco, szCidade, zsFilial);

    if(bSalvoComSucesso){
        // Verifica se o evento gera ocorrência
        if(bGeraAlarme){
            SalvarOcorrencia(wNrEvento, dwCodificador, szStatus, szReferencia, szDescricaoStatus, dtDataEHora,
                iCdCliente, szSetor, szLocalizacao);
        }
        // Registra a data e hora no log da ctx para controlar a falta de comunicação da ctx
        SalvarUltimoEventoCTX();
    }
}

//---------------------------------------------------------------------------

bool __fastcall TFMonitor::BuscaCliente(DWORD dwCodificador, int &iCdCliente, AnsiString &szNomeCliente,
    AnsiString &szEndereco, AnsiString &szCidade, AnsiString &szFilial)
{
    try{
        AnsiString SQL_FILTRO =
            "SELECT C.CDCLIENTE, C.NMCLIENTE, O.ENDERECO_MON, O.CIDADE_MON, F.NMFILIAL "
            "FROM CLIENTE C INNER JOIN CONTRATO O ON C.CDCLIENTE = O.CDCLIENTE "
            "INNER JOIN FILIAL F ON C.CDFILIAL = F.CDFILIAL "
            "WHERE O.CDCODIFICADOR = :CDCODIFICADOR AND O.INATIVO = 0";

        bool blnLocalizouCliente = false;
        DModule->IBQConsCliente->SQL->Clear();
        DModule->IBQConsCliente->SQL->Text = SQL_FILTRO;
        DModule->IBQConsCliente->ParamByName("CDCODIFICADOR")->AsInteger = dwCodificador;
        DModule->IBQConsCliente->Open();

        if(DModule->IBQConsCliente->RecordCount > 0){
            iCdCliente = DModule->IBQConsCliente->FieldByName("CDCLIENTE")->AsInteger;
            szNomeCliente = DModule->IBQConsCliente->FieldByName("NMCLIENTE")->AsString;
            szEndereco = DModule->IBQConsCliente->FieldByName("ENDERECO_MON")->AsString;
            szCidade = DModule->IBQConsCliente->FieldByName("CIDADE_MON")->AsString;
            szFilial = DModule->IBQConsCliente->FieldByName("NMFILIAL")->AsString;
            blnLocalizouCliente = true;
        }else{
            iCdCliente = 0;
            szNomeCliente = "";
        }

        if(DModule->IBTConsCliente->InTransaction){
            DModule->IBTConsCliente->Commit();
        }

        DModule->IBQConsCliente->Close();
        return blnLocalizouCliente;

    }catch(Exception &excecao){
        AnsiString classe, erro, mensagem;
        classe = this->ClassName();
        erro = excecao.ClassName();
        mensagem = excecao.Message;
        sprintf(acBuffer,"%s : %s : %s : %s", classe, "BuscaCliente", erro, mensagem);
        TDModule::SalvaLog(acBuffer);
    }
}

//---------------------------------------------------------------------------

bool __fastcall TFMonitor::BuscaSetor(DWORD dwCodificador, AnsiString szSetor, AnsiString &szLocalizacao)
{
    try{
        AnsiString SQL_FILTRO =
            "SELECT S.NUMSETOR, S.LOCAL "
            "FROM SETOR S INNER JOIN CONTRATO C ON S.CDCONTRATO = C.CDCONTRATO "
            "INNER JOIN CONTRATO O ON C.CDCLIENTE = O.CDCLIENTE "
            "WHERE O.CDCODIFICADOR = :CDCODIFICADOR AND S.NUMSETOR = :NUMSETOR AND O.INATIVO = 0";

        // Retirar o caracter F antes de converter para decimal
        szSetor = StringReplace(szSetor, "F", "", TReplaceFlags() << rfReplaceAll);
            
        if(PARAMSISISTEMA_SETORIZACAO != NULL && PARAMSISISTEMA_SETORIZACAO == "DECIMAL"){
            // Converte o setor para decimal
            szSetor = IntToStr(StrToIntDef("0x"+szSetor, -1));
        }

        bool blnLocalizouSetor = false;
        DModule->IBQConsSetor->SQL->Clear();
        DModule->IBQConsSetor->SQL->Text = SQL_FILTRO;
        DModule->IBQConsSetor->ParamByName("CDCODIFICADOR")->AsInteger = dwCodificador;
        DModule->IBQConsSetor->ParamByName("NUMSETOR")->AsString = szSetor;
        DModule->IBQConsSetor->Open();

        if(DModule->IBQConsSetor->RecordCount > 0){
            szLocalizacao = DModule->IBQConsSetor->FieldByName("LOCAL")->AsString;
            blnLocalizouSetor = true;
        }else{
            szLocalizacao = "SETOR NÃO LOCALIZADO";
        }

        if(DModule->IBTConsSetor->InTransaction){
            DModule->IBTConsSetor->Commit();
        }

        DModule->IBQConsSetor->Close();
        return blnLocalizouSetor;

    }catch(Exception &excecao){
        AnsiString classe, erro, mensagem;
        classe = this->ClassName();
        erro = excecao.ClassName();
        mensagem = excecao.Message;
        sprintf(acBuffer,"%s : %s : %s : %s", classe, "BuscaSetor", erro, mensagem);
        TDModule::SalvaLog(acBuffer);
    }
}

//---------------------------------------------------------------------------

bool __fastcall TFMonitor::BuscaStatus(DWORD dwCodificador, AnsiString szStatus,
    AnsiString szReferencia, AnsiString &szDescricaoStatus, bool &bGeraAlarme,
    bool &bMostrarMensagem, int &iTipoMonitor, int &iTipoIdentificacao, int &iDefineSeOcTemSetor, AnsiString &szSetor)
{
    try{
        bool bLocalizouStatus = false;

        // Pesquisa o estatus do cliente
        DModule->CDSStatusCliente->Filter  = Format("CDCODIFICADOR=%s AND ESTATUS='%s' AND REFERENCIA1='%s'",
            ARRAYOFCONST((IntToStr(dwCodificador), szStatus, szReferencia)));
        DModule->CDSStatusCliente->Filtered = true;

        if(DModule->CDSStatusCliente->RecordCount > 0){
            szDescricaoStatus = DModule->CDSStatusClienteDESCRICAO->AsString;
            bGeraAlarme = (bool)DModule->CDSStatusClienteALARME->AsInteger;
            bMostrarMensagem = (bool)DModule->CDSStatusClienteMENSAGEM->AsInteger;
            iTipoMonitor = DModule->CDSStatusClienteMONITOR->AsInteger;
            iTipoIdentificacao = DModule->CDSStatusClienteIDENTIFICACAO->AsInteger;
            iDefineSeOcTemSetor = DModule->CDSStatusClienteOCORRENCIA->AsInteger;
            bLocalizouStatus = true;

            if(DModule->CDSStatusClienteSETOR->AsString != ""){
                szSetor = DModule->CDSStatusClienteSETOR->AsString;
            }else{
                szSetor = "";
            }
        }else{
            bLocalizouStatus = false;
        }

        if(!bLocalizouStatus){
           // Se não achou estatus do cliente usa o status padrão
            DModule->CDSStatus->Filter  = Format("ESTATUS='%s' AND REFERENCIA1='%s'",
                ARRAYOFCONST((szStatus, szReferencia)));
            DModule->CDSStatus->Filtered = true;

            if(DModule->CDSStatus->RecordCount > 0){
                szDescricaoStatus = DModule->CDSStatusDESCRICAO->AsString;
                bGeraAlarme = (bool)DModule->CDSStatusALARME->AsInteger;
                bMostrarMensagem = (bool)DModule->CDSStatusMENSAGEM->AsInteger;
                iTipoMonitor = DModule->CDSStatusMONITOR->AsInteger;
                iTipoIdentificacao = DModule->CDSStatusIDENTIFICACAO->AsInteger;
                iDefineSeOcTemSetor = DModule->CDSStatusOCORRENCIA->AsInteger;

                if(DModule->CDSStatusSETOR->AsString != ""){
                    szSetor = DModule->CDSStatusSETOR->AsString;
                }else{
                    szSetor = "";
                }
            }else{
                szDescricaoStatus = "STATUS NAO LOCALIZADO";
                bGeraAlarme = false;
                bMostrarMensagem = false;
                iTipoMonitor = 0;
                iTipoIdentificacao = 0;
                iDefineSeOcTemSetor = 0;
                szSetor = "";
            }
        }

    }catch(Exception &excecao){
        AnsiString classe, erro, mensagem;
        classe = this->ClassName();
        erro = excecao.ClassName();
        mensagem = excecao.Message;
        sprintf(acBuffer,"%s : %s : %s : %s", classe, "BuscaStatus", erro, mensagem);
        TDModule::SalvaLog(acBuffer);
    }
}

//---------------------------------------------------------------------------

bool __fastcall TFMonitor::SalvarEvento(WORD wNrEvento, DWORD dwCodificador, AnsiString szStatus,
    AnsiString szReferencia, AnsiString szDescricaoStatus, int iTipoMonitor, int iTipoIdentificacao, TDateTime dtDataEHora,
    AnsiString szNomeCliente, int iCdCliente, AnsiString szSetor, AnsiString szLocalizacao,
    AnsiString szEndereco, AnsiString szCidade, AnsiString szFilial)
{
    try{
        // Retirar o caracter F antes de converter para decimal
        szSetor = StringReplace(szSetor, "F", "", TReplaceFlags() << rfReplaceAll);

        if(PARAMSISISTEMA_SETORIZACAO != NULL && PARAMSISISTEMA_SETORIZACAO == "DECIMAL"){
            // Converte o setor para decimal
            szSetor = IntToStr(StrToIntDef("0x"+szSetor, -1));
        }

        DModule->IBQMonitor->ParamByName("CTX")->AsInteger = stCtx.wCodigoCtx;
        DModule->IBQMonitor->ParamByName("TIPOCTX")->AsString = stCtx.bConfiguracao;
        DModule->IBQMonitor->ParamByName("PORTACOM")->AsInteger = stCtx.bCom;
        DModule->IBQMonitor->ParamByName("NREVENTO")->AsInteger = wNrEvento;
        DModule->IBQMonitor->ParamByName("EQUIPAMENTO")->AsInteger = dwCodificador;
        DModule->IBQMonitor->ParamByName("STATUS")->AsString = szStatus;
        DModule->IBQMonitor->ParamByName("REFERENCIA")->AsString = szReferencia;
        DModule->IBQMonitor->ParamByName("DESTATUS")->AsString = szDescricaoStatus;
        DModule->IBQMonitor->ParamByName("MONITOR")->AsInteger = iTipoMonitor;
        DModule->IBQMonitor->ParamByName("IDENTIFICACAO")->AsInteger = iTipoIdentificacao;
        DModule->IBQMonitor->ParamByName("DATAEVENTO")->AsDateTime = dtDataEHora;
        DModule->IBQMonitor->ParamByName("CDCLIENTE")->AsInteger = iCdCliente;
        DModule->IBQMonitor->ParamByName("NMCLIENTE")->AsString = szNomeCliente;
        if(szSetor != ""){
            DModule->IBQMonitor->ParamByName("NUMSETOR")->AsString = szSetor;
        }
        DModule->IBQMonitor->ParamByName("LOCAL")->AsString = szLocalizacao;
        DModule->IBQMonitor->ParamByName("ENDERECO")->AsString = szEndereco;
        DModule->IBQMonitor->ParamByName("CIDADE")->AsString = szCidade;
        DModule->IBQMonitor->ParamByName("NMFILIAL")->AsString = szFilial;
        if(!DModule->IBQMonitor->Prepared)
            DModule->IBQMonitor->Prepare();
        DModule->IBQMonitor->ExecSQL();
        DModule->IBTMonitor->Commit();
        return true;

    }catch(Exception &excecao){
        AnsiString classe, erro, mensagem;
        classe = this->ClassName();
        erro = excecao.ClassName();
        mensagem = excecao.Message;
        sprintf(acBuffer,"%s : %s : %s : %s", classe, "SalvarEvento", erro, mensagem);
        TDModule::SalvaLog(acBuffer);
        return false;
    }
}

//---------------------------------------------------------------------------

bool __fastcall TFMonitor::SalvarOcorrencia(WORD wNrEvento, DWORD dwCodificador, AnsiString szStatus,
        AnsiString szReferencia, AnsiString szDescricaoStatus, TDateTime dtDataEHora, int iCdCliente,
        AnsiString szSetor, AnsiString szLocalizacao)
{
    try{

        // Retirar o caracter F antes de converter para decimal
        szSetor = StringReplace(szSetor, "F", "", TReplaceFlags() << rfReplaceAll);

        if(PARAMSISISTEMA_SETORIZACAO != NULL && PARAMSISISTEMA_SETORIZACAO == "DECIMAL"){
            // Converte o setor para decimal
            szSetor = IntToStr(StrToIntDef("0x"+szSetor, -1));
        }

        // Verifica se existe uma ocorrencia em aberto para este codificador
        // Caso exista insere a ocorrencia como uma ocorrencia filho
        int iOcorrenciaPai = 0;
        if(DModule->IBQOcorrenciaMaster->Active){
            DModule->IBQOcorrenciaMaster->Close();
        }

        DModule->IBQOcorrenciaMaster->ParamByName("EQUIPAMENTO")->AsInteger = dwCodificador;
        DModule->IBQOcorrenciaMaster->ParamByName("STATUS")->AsString = szStatus;
        DModule->IBQOcorrenciaMaster->ParamByName("REFERENCIA")->AsString = szReferencia;
        DModule->IBQOcorrenciaMaster->Open();
        if(DModule->IBQOcorrenciaMaster->RecordCount > 0){
            iOcorrenciaPai = DModule->IBQOcorrenciaMaster->FieldByName("CDOCORRENCIA")->AsInteger;
        }

        if(DModule->IBTOcorrenciaMaster->InTransaction){
            DModule->IBTOcorrenciaMaster->Commit();
        }

        DModule->IBQOcorrencia->ParamByName("CDOCORRENCIAPAI")->AsInteger = iOcorrenciaPai;
        DModule->IBQOcorrencia->ParamByName("CTX")->AsInteger = stCtx.wCodigoCtx;
        DModule->IBQOcorrencia->ParamByName("TIPOCTX")->AsString = stCtx.bConfiguracao;
        DModule->IBQOcorrencia->ParamByName("PORTACOM")->AsInteger = stCtx.bCom;
        DModule->IBQOcorrencia->ParamByName("NREVENTO")->AsInteger = wNrEvento;
        DModule->IBQOcorrencia->ParamByName("EQUIPAMENTO")->AsInteger = dwCodificador;
        DModule->IBQOcorrencia->ParamByName("STATUS")->AsString = szStatus;
        DModule->IBQOcorrencia->ParamByName("DESTATUS")->AsString = szDescricaoStatus;
        DModule->IBQOcorrencia->ParamByName("REFERENCIA")->AsString = szReferencia;
        DModule->IBQOcorrencia->ParamByName("DATAEVENTO")->AsDateTime = dtDataEHora;
        DModule->IBQOcorrencia->ParamByName("CDCLIENTE")->AsInteger = iCdCliente;
        if(szSetor != ""){
            DModule->IBQOcorrencia->ParamByName("NUMSETOR")->AsString = szSetor;
        }
        DModule->IBQOcorrencia->ParamByName("LOCAL")->AsString = szLocalizacao;
        DModule->IBQOcorrencia->ExecSQL();
        DModule->IBTOcorrencia->Commit();
        return true;

    }catch(Exception &excecao){
        AnsiString classe, erro, mensagem;
        classe = this->ClassName();
        erro = excecao.ClassName();
        mensagem = excecao.Message;
        sprintf(acBuffer,"%s : %s : %s : %s", classe, "SalvarOcorrencia", erro, mensagem);
        TDModule::SalvaLog(acBuffer);
        return false;
    }
}

//---------------------------------------------------------------------------

void __fastcall TFMonitor::SalvarCTX()
{
    try{
        DModule->IBQConsCtx->ParamByName("CTX")->AsInteger = stCtx.wCodigoCtx;
        DModule->IBQConsCtx->Open();

        if(DModule->IBQConsCtx->RecordCount > 0){
            DModule->IBTCtx->Commit();
            AnsiString SQL_UPDATE =
                "UPDATE LOGCTX SET DATACONEXAO = :DATACONEXAO WHERE CTX = :CTX";
            DModule->IBQCtx->SQL->Clear();
            DModule->IBQCtx->SQL->Text = SQL_UPDATE;
            DModule->IBQCtx->ParamByName("DATACONEXAO")->AsDateTime = DModule->RetornaDataHoraAtual();
            DModule->IBQCtx->ParamByName("CTX")->AsInteger = stCtx.wCodigoCtx;
            DModule->IBQCtx->Open();
            DModule->IBTCtx->Commit();
            return;
        }

        DModule->IBTCtx->Commit();
        AnsiString SQL_INSERT =
            "INSERT INTO LOGCTX(CTX, PORTACOM, TIPOCTX, DATACONEXAO) "
            "VALUES(:CTX, :PORTACOM, :TIPOCTX, :DATACONEXAO)";
        DModule->IBQCtx->SQL->Clear();
        DModule->IBQCtx->SQL->Text = SQL_INSERT;
        DModule->IBQCtx->ParamByName("CTX")->AsInteger = stCtx.wCodigoCtx;
        DModule->IBQCtx->ParamByName("TIPOCTX")->AsString = stCtx.bConfiguracao;
        DModule->IBQCtx->ParamByName("PORTACOM")->AsInteger = stCtx.bCom;
        DModule->IBQCtx->ParamByName("DATACONEXAO")->AsDateTime = DModule->RetornaDataHoraAtual();
        DModule->IBQCtx->ExecSQL();
        DModule->IBTCtx->Commit();

    }catch(Exception &excecao){
        AnsiString classe, erro, mensagem;
        classe = this->ClassName();
        erro = excecao.ClassName();
        mensagem = excecao.Message;
        sprintf(acBuffer,"%s : %s : %s : %s", classe, "SalvarCTX", erro, mensagem);
        TDModule::SalvaLog(acBuffer);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFMonitor::SalvarUltimoEventoCTX()
{
    try{
        AnsiString SQL_UPDATE =
            "UPDATE LOGCTX SET DATA_ULTIMOEVENTO = :DATA_ULTIMOEVENTO WHERE CTX = :CTX";
        DModule->IBQCtx->SQL->Clear();
        DModule->IBQCtx->SQL->Text = SQL_UPDATE;
        DModule->IBQCtx->ParamByName("DATA_ULTIMOEVENTO")->AsDateTime = DModule->RetornaDataHoraAtual();
        DModule->IBQCtx->ParamByName("CTX")->AsInteger = stCtx.wCodigoCtx;
        DModule->IBQCtx->Open();
        DModule->IBTCtx->Commit();

    }catch(Exception &excecao){
        AnsiString classe, erro, mensagem;
        classe = this->ClassName();
        erro = excecao.ClassName();
        mensagem = excecao.Message;
        sprintf(acBuffer,"%s : %s : %s : %s", classe, "SalvarUltimoEventoCTX", erro, mensagem);
        TDModule::SalvaLog(acBuffer);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFMonitor::btnConectarClick(TObject *Sender)
{
    Screen->Cursor = crHourGlass;
    AnsiString szPorta = Format("COM%s", ARRAYOFCONST((IntToStr(stCtx.bCom))));
    sprintf(acBuffer,"Encerrando a comunicação serial com a porta %s", szPorta);
    ApresentaLogNoMemo(acBuffer, true);
    if(InterpretaRetornoDll(stCtx.bEndNetwork())){
        ApresentaLogNoMemo("Comunicação serial encerrada com sucesso", true);
    }else{
        ApresentaLogNoMemo("Encerramento da comunicação serial falhou", true);
    }
    Screen->Cursor = crArrow;

    sprintf(acBuffer,"Reiniciando a comunicação serial com a porta %s", szPorta);
    ApresentaLogNoMemo(acBuffer, true);

    if(InterpretaRetornoDll(
        stCtx.bInitNetwork(Application->Handle, 0, szPorta.c_str(), NR_RETRANSMISSOES_CTX,
            ESPERA_RESPOSTA_CTX, PERIODO_TIMER, 0)!= BIBCOM_SEM_ERRO)){

        sprintf(acBuffer,"Porta de comunicação serial %s aberta, aguardando resposta da CTX", szPorta);
        ApresentaLogNoMemo(acBuffer, true);
    }else{
        sprintf(acBuffer,"Comunicação serial com a porta %s falhou", szPorta);
        ApresentaLogNoMemo(acBuffer, true);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFMonitor::BtnSolicitarEventosClick(TObject *Sender)
{
    stCtx.bReadAllEventsFrom(-1);
}

//---------------------------------------------------------------------------

bool __fastcall TFMonitor::InterpretaRetornoDll(BYTE erro)
{
    String MsgErro;

    switch(erro){
        case BIBCOM_ENDERECO_INVALIDO:
            MsgErro = "Erro de comunicação serial: CODERRO" + IntToStr(erro) + ".";
            MsgErro+= " Endereço inválido. ";
            break;
        case BIBCOM_SERVICO_NAO_EMPILHADO:
            MsgErro = "Erro de comunicação serial: CODERRO" + IntToStr(erro) + ".";
            MsgErro+= " Serviço não empilhado. ";
            break;
        case BIBCOM_PARAMETRO_INVALIDO:
            MsgErro = "Erro de comunicação serial: CODERRO" + IntToStr(erro) + ".";
            MsgErro+= " Parâmetro inválido. ";
            break;
        case BIBCOM_ERRO_INICIALIZACAO_REDE:
            MsgErro = "Erro de comunicação serial: CODERRO" + IntToStr(erro) + ".";
            MsgErro+= " Erro na inicialização da rede. ";
            break;
        case BIBCOM_ERRO_ENCERRAMENTO_REDE:
            MsgErro = "Erro de comunicação serial: CODERRO" + IntToStr(erro) + ".";
            MsgErro+= " Erro no encerramento da rede. ";
            break;
        case BIBCOM_ACESSO_NEGADO:
            MsgErro = "Erro de comunicação serial: CODERRO" + IntToStr(erro) + ".";
            MsgErro+= " Acesso negado. ";
            break;
        case BIBCOM_MENSAGEM_INVALIDA:
            MsgErro = "Erro de comunicação serial: CODERRO" + IntToStr(erro) + ".";
            MsgErro+= " Mensagem inválida. ";
            break;
    }

    if(erro > 0){
        DWORD erroAdicional;
        stCtx.bGetDllError(&erroAdicional);
        if(CheckBit(erroAdicional, DLL_SEM_ERRO)) MsgErro+= "Nenhum erro adicional reportado pela biblioteca";
        if(CheckBit(erroAdicional, DLL_ERRO_ABERTURA_PORTA_COMUNICACAO)) MsgErro+= "Erro na abertura da porta de comunicação";
        if(CheckBit(erroAdicional, DLL_ERRO_FECHAMENTO_PORTA_COMUNICACAO)) MsgErro+= "Erro no fechamento da porta de comunicação";
        if(CheckBit(erroAdicional, DLL_ERRO_CONFIGURACAO_PORTA_COMUNICACAO)) MsgErro+= "Erro na configuração da porta de comunicação";
        if(CheckBit(erroAdicional, DLL_ERRO_CRIACAO_EVENTO)) MsgErro+= "Erro na criação de evento";
        if(CheckBit(erroAdicional, DLL_ERRO_HABILITACAO_TRANSMISSOR)) MsgErro+= "Erro na habilitação de transmissor";
        if(CheckBit(erroAdicional, DLL_ERRO_DESABILITACAO_TRANSMISSOR)) MsgErro+= "Erro na desabilitação de transmissor";
        if(CheckBit(erroAdicional, DLL_ERRO_SERIAL_API_WINDOWS)) MsgErro+= "Erro na API Serial do Windows";
        if(CheckBit(erroAdicional, DLL_ERRO_HANDLE_INVALIDO)) MsgErro+= "Erro de handle inválido";
        if(CheckBit(erroAdicional, DLL_ERRO_NUMERO_ESTACOES_INVALIDO)) MsgErro+= "Erro de número de estações inválido";
        if(CheckBit(erroAdicional, DLL_ERRO_CRIACAO_MMTIMER)) MsgErro+= "Erro na criação do MMTIMER";
        if(CheckBit(erroAdicional, DLL_ERRO_SERVICO_EM_ANDAMENTO)) MsgErro+= "Erro de serviço em andamento";
        if(CheckBit(erroAdicional, DLL_ERRO_ALOCACAO_MEMORIA)) MsgErro+= "Erro de alocação de memória";
        ApresentaLogNoMemo(MsgErro, true);
        return false;
    }else{
        return true;
    }
}

//---------------------------------------------------------------------------

void __fastcall TFMonitor::FormShow(TObject *Sender)
{
    //ShowWindow(Application->Handle, SW_HIDE);
}

//---------------------------------------------------------------------------

void __fastcall TFMonitor::BtnFecharClick(TObject *Sender)
{
    Close();
}

//---------------------------------------------------------------------------

void __fastcall TFMonitor::TMRSetDataHoraTimer(TObject *Sender)
{
    struct time h;
    struct date d;

    getdate(&d);
    gettime(&h);

    sprintf(acBuffer,"bSetDateTime(%02u,%02u,%04u,%02u,%02u,%02u)",d.da_day,d.da_mon,d.da_year,h.ti_hour,h.ti_min,h.ti_sec);
    ApresentaLogNoMemo(acBuffer, true);
    stCtx.bSetDateTime(d.da_day,d.da_mon,d.da_year,h.ti_hour,h.ti_min,h.ti_sec);
}

//---------------------------------------------------------------------------

AnsiString __fastcall TFMonitor::GetValorParametro(int CdParametro)
{
    try{
        DModule->IBQParametro->Close();
        DModule->IBQParametro->ParamByName("CDPARAMSISTEMA")->AsInteger = CdParametro;
        DModule->IBQParametro->Open();
        AnsiString valorParam = DModule->IBQParametro->FieldByName("VALOR")->AsString;
        return valorParam;
    }catch(Exception &excecao){
        AnsiString classe, erro, mensagem;
        classe = this->ClassName();
        erro = excecao.ClassName();
        mensagem = excecao.Message;
        sprintf(acBuffer,"%s : %s : %s : %s", classe, "GetValorParametro", erro, mensagem);
        TDModule::SalvaLog(acBuffer);
    }
}

//---------------------------------------------------------------------------
