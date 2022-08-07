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
//-----------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

#define VALOR_INICIAL             1
#define RETARDA_SALVAMENTO        (VALOR_INICIAL + 50)
#define NR_MAX_FRAMES             1000
#define ARQUIVO_INICIALIZACAO     "./AZSIM.ini"
#define SECAO_BASE                "Unidade Monitoramento"
#define DELIMITADOR               "--------------------------------------------------"


TFMonitor *FMonitor;
TClientDataSet *dsEventos;
HWND apphwnd;

String unidade;
int ULTIMO_EVENTO_LIDO = 0;
static AnsiString ArquivoLogCtf;
static char  acBufferAux[TAM_BUFFER];
static char* acParametros[PRM_NR_PARAMETROS] =
{
    "Modelo = ",
    "Assinatura = ",
    "C�digo = ",
    "Configura��o = ",
    "Estado = ",
    "Data/Hor�rio = ",
    "Cliente = ",
    "Cabe�alho = ",
    "Evento:",
    "Relat�rio:",
    "Aviso:",
    "Telefone = ",
    "Comandos telefone = ",
    "Configura��o da conex�o telef�nica: ",
    "Estado da conex�o telef�nica: ",
    "Conex�o telef�nica aberta: MTA = ",
    "Conex�o telef�nica fechada = ",
    "Prazo de validade = ",
    "Habilita��o automato = ",
    "Configura��o tom:",
    "Estado tom:",
    "Buffer DTMF RX = ",
    "Buffer DTMF TX = ",
    "Configura��o CTA:",
    "Estado CTA:",
    "Configura��o CTD:",
    "Estado CTD:",
    "Configura��o fonte:",
    "Estado fonte:",
    "Configura��o impress�o:",
    "Estado impress�o:",
    "Buffer impress�o = ",
    "Sa�das = ",
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
        PrintCtxLog("Iniciando o monitor serial Vers�o 2.0");

        TIniFile *ini = new TIniFile(ARQUIVO_INICIALIZACAO);
        unidade = ini->ReadString(SECAO_BASE,"unidade","");

        sprintf(acBuffer,"Unidade de monitoramento %s", unidade);
        PrintCtxLog(acBuffer);

        //dsEventos = new TClientDataSet(this);
        //dsEventos->LoadFromFile(".\\dados\\tabela-eventos.xml");

        ClientDataSet1->Open();

        ClientDataSet1->Append();
        ClientDataSet1->FieldValues["NREVENTO"] = 15;
        ClientDataSet1->FieldValues["ISPUBLICADO"] = 1;

        ClientDataSet1->Append();
        ClientDataSet1->FieldValues["NREVENTO"] = 25;
        ClientDataSet1->FieldValues["ISPUBLICADO"] = 1;

        ClientDataSet1->Append();
        ClientDataSet1->FieldValues["NREVENTO"] = 35;
        ClientDataSet1->FieldValues["ISPUBLICADO"] = 1;

        ClientDataSet1->Append();
        ClientDataSet1->FieldValues["NREVENTO"] = 45;
        ClientDataSet1->FieldValues["ISPUBLICADO"] = 0;

        ClientDataSet1->Append();
        ClientDataSet1->FieldValues["NREVENTO"] = 56;
        ClientDataSet1->FieldValues["ISPUBLICADO"] = 0;

        ClientDataSet1->Append();
        ClientDataSet1->FieldValues["NREVENTO"] = 67;
        ClientDataSet1->FieldValues["ISPUBLICADO"] = 0;


        ClientDataSet1->First();

        while(!ClientDataSet1->Eof) {
            if(ClientDataSet1->FieldByName("ISPUBLICADO")->AsInteger == 1) {
               ClientDataSet1->Delete();
            }
            ClientDataSet1->Next();
        }

        ClientDataSet1->SaveToFile(".\\dados\\tabela-eventos.xml", dfXML);
        ClientDataSet1->Close();

        /*
        TFieldDefs *pDefs = dsEventos->FieldDefs;
        TFieldDef *pDef = pDefs->AddFieldDef();
        pDef->DataType = ftInteger;
        pDef->Name = "NREVENTO";

        TFieldDefs *pDefs = dsEventos->FieldDefs;
        TFieldDef *pDef = pDefs->AddFieldDef();
        pDef->DataType = ftInteger;
        pDef->Name = "PORTACOM";

        pDef = pDefs->AddFieldDef();
        pDef->DataType = ftString;
        pDef->Size = 3;
        pDef->Name = "TIPOCTX";

        TFieldDef *pDef = pDefs->AddFieldDef();
        pDef->DataType = ftInteger;
        pDef->Name = "CTX";

        TFieldDef *pDef = pDefs->AddFieldDef();
        pDef->DataType = ftInteger;
        pDef->Name = "CODIFICADOR";

        pDef = pDefs->AddFieldDef();
        pDef->DataType = ftString;
        pDef->Size = 1;
        pDef->Name = "STATUS";

        pDef = pDefs->AddFieldDef();
        pDef->DataType = ftString;
        pDef->Size = 2;
        pDef->Name = "REFERENCIA";

        TFieldDef *pDef = pDefs->AddFieldDef();
        pDef->DataType = ftInteger;
        pDef->Name = "CODIFICADOR";

        pDef = pDefs->AddFieldDef();
        pDef->DataType = ftString;
        pDef->Size = 10;
        pDef->Name = "DATAEVENTO";

        TFieldDef *pDef = pDefs->AddFieldDef();
        pDef->DataType = ftInteger;
        pDef->Name = "ISPUBLICADO";

        TIndexDef *pIDef = ClientDataSet1->IndexDefs->AddIndexDef();
        pIDef->Fields = "ISPUBLICADO";
        pIDef->Name = "IND_ISPUBLICADO";

        dsEventos->CreateDataSet();
        */

        AnsiString URL = "http://192.168.3.116:8080/azsim/monitor/azmonitoramento";
        TStringList *params = new TStringList;
        params->Add("{\"nome\":\"CONTACTID\"}");
        AnsiString content;
        TStringStream *response = new TStringStream(content);
        httpEventosClient->Request->ContentType = "application/json";
        httpEventosClient->Post(URL, dynamic_cast <TStrings*>(params), response);
        //httpEventosClient->Get(URL, response);
        PrintCtxLog(response->DataString );


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
                PrintCtxLog(acBuffer);
                stCtx.hiDll = LoadLibrary(szDll.c_str());
                if(CarregaMetodosDll()){
                    sprintf(acBuffer,"Iniciando a comunica��o serial com a porta %s", szPorta);
                    PrintCtxLog(acBuffer);
                    if(InterpretaRetornoDll(
                        stCtx.bInitNetwork(Application->Handle, 0, szPorta.c_str(), NR_RETRANSMISSOES_CTX,
                            ESPERA_RESPOSTA_CTX, PERIODO_TIMER, 0)!= BIBCOM_SEM_ERRO)){
                        sprintf(acBuffer,"Porta de comunica��o serial %s aberta, aguardando resposta da CTX", szPorta);
                        PrintCtxLog(acBuffer);
                    }else{
                        sprintf(acBuffer,"Comunica��o serial com a porta %s falhou", szPorta);
                        PrintCtxLog(acBuffer);
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
        ClientDataSet1->Close();
    }
}

//---------------------------------------------------------------------------

void __fastcall TFMonitor::FormClose(TObject *Sender, TCloseAction &Action)
{
    if (stCtx.hiDll != NULL){
        if(InterpretaRetornoDll(stCtx.bEndNetwork())){
            PrintCtxLog("Comunica��o serial encerrada com sucesso");
        }else{
            PrintCtxLog("Encerramento da comunica��o serial falhou");
        }
    }
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
        PrintCtxLog("Validando a integridade da dll");

        stCtx.bEndNetwork = (BYTE (__stdcall*)(void)) GetProcAddress(stCtx.hiDll, "bEndNetwork");
        if (stCtx.bEndNetwork == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bEndNetwork()");
            retorno = false;
        }

        stCtx.bGetDllError = (BYTE (__stdcall*)(DWORD*)) GetProcAddress(stCtx.hiDll, "bGetDllError");
        if (stCtx.bGetDllError == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bGetDllError()");
            retorno = false;
        }

        stCtx.bGetDllVersion = (BYTE (__stdcall*)(WORD*, char*, char*)) GetProcAddress(stCtx.hiDll, "bGetDllVersion");
        if (stCtx.bGetDllVersion == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bGetDllVersion()");
            retorno = false;
        }

        stCtx.bInitNetwork = (BYTE (__stdcall*)(HWND, WORD, char*, BYTE, WORD, BYTE, BYTE)) GetProcAddress(stCtx.hiDll, "bInitNetwork");
        if (stCtx.bInitNetwork == NULL)	{
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bInitNetwork()");
            retorno = false;
        }

        stCtx.bReadCounter = (BYTE (__stdcall*)(WORD*)) GetProcAddress(stCtx.hiDll, "bReadCounter");
        if (stCtx.bReadCounter == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bReadCounter()");
            retorno = false;
        }

        stCtx.bWaitResponse = (BYTE (__stdcall*)(void)) GetProcAddress(stCtx.hiDll, "bWaitResponse");
        if (stCtx.bWaitResponse == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bWaitResponse()");
            retorno = false;
        }

        stCtx.bLoadConfiguration = (BYTE (__stdcall*)(void)) GetProcAddress(stCtx.hiDll, "bLoadConfiguration");
        if (stCtx.bLoadConfiguration == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bLoadConfiguration()");
            retorno = false;
        }

        stCtx.bOpenTelephoneConnection = (BYTE (__stdcall*)(void)) GetProcAddress(stCtx.hiDll, "bOpenTelephoneConnection");
        if (stCtx.bOpenTelephoneConnection == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bOpenTelephoneConnection()");
            retorno = false;
        }

        stCtx.bPrintString = (BYTE (__stdcall*)(char*)) GetProcAddress(stCtx.hiDll, "bPrintString");
        if (stCtx.bPrintString == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bPrintString()");
            retorno = false;
        }

        stCtx.bPutEvent = (BYTE (__stdcall*)(DWORD, BYTE, BYTE)) GetProcAddress(stCtx.hiDll, "bPutEvent");
        if (stCtx.bPutEvent == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bPutEvent()");
            retorno = false;
        }

        stCtx.bPutLog = (BYTE (__stdcall*)(DWORD, BYTE, BYTE, BYTE*)) GetProcAddress(stCtx.hiDll, "bPutLog");
        if (stCtx.bPutLog == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bPutLog()");
            retorno = false;
        }

        stCtx.bReadAllEventsFrom = (BYTE (__stdcall*)(short int)) GetProcAddress(stCtx.hiDll, "bReadAllEventsFrom");
        if (stCtx.bReadAllEventsFrom == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bReadAllEventsFrom()");
            retorno = false;
        }

        stCtx.bReadAllLogsFrom = (BYTE (__stdcall*)(short int)) GetProcAddress(stCtx.hiDll, "bReadAllLogsFrom");
        if (stCtx.bReadAllLogsFrom == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bReadAllLogsFrom()");
            retorno = false;
        }

        stCtx.bReadParameter = (BYTE (__stdcall*)(BYTE)) GetProcAddress(stCtx.hiDll, "bReadParameter");
        if (stCtx.bReadParameter == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bReadParameter()");
            retorno = false;
        }

        stCtx.bResetCTX = (BYTE (__stdcall*)(BYTE)) GetProcAddress(stCtx.hiDll, "bResetCTX");
        if (stCtx.bResetCTX == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bResetCTX()");
            retorno = false;
        }

        stCtx.bResetOutputs = (BYTE (__stdcall*)(BYTE)) GetProcAddress(stCtx.hiDll, "bResetOutputs");
        if (stCtx.bResetOutputs == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bResetOutputs()");
            retorno = false;
        }

        stCtx.bSaveConfiguration = (BYTE (__stdcall*)(void)) GetProcAddress(stCtx.hiDll, "bSaveConfiguration");
        if (stCtx.bSaveConfiguration == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bSaveConfiguration()");
            retorno = false;
        }

        stCtx.bSendDTMFMessage = (BYTE (__stdcall*)(char*)) GetProcAddress(stCtx.hiDll, "bSendDTMFMessage");
        if (stCtx.bSendDTMFMessage == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bSendDTMFMessage()");
            retorno = false;
        }

        stCtx.bSetDateTime = (BYTE (__stdcall*)(BYTE, BYTE, WORD, BYTE, BYTE, BYTE)) GetProcAddress(stCtx.hiDll, "bSetDateTime");
        if (stCtx.bSetDateTime == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bSetDateTime()");
            retorno = false;
        }

        stCtx.bSetOutputs = (BYTE (__stdcall*)(BYTE)) GetProcAddress(stCtx.hiDll, "bSetOutputs");
        if (stCtx.bSetOutputs == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bSetOutputs()");
            retorno = false;
        }

        stCtx.bSetSignature = (BYTE (__stdcall*)(BYTE, BYTE, WORD)) GetProcAddress(stCtx.hiDll, "bSetSignature");
        if (stCtx.bSetSignature == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bSetSignature()");
            retorno = false;
        }

        stCtx.bSetTelephoneCommands = (BYTE (__stdcall*)(char*)) GetProcAddress(stCtx.hiDll, "bSetTelephoneCommands");
        if (stCtx.bSetTelephoneCommands == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bSetTelephoneCommands()");
            retorno = false;
        }

        stCtx.bWriteParameter = (BYTE (__stdcall*)(BYTE, VALPAR*)) GetProcAddress(stCtx.hiDll, "bWriteParameter");
        if (stCtx.bWriteParameter == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bWriteParameter()");
            retorno = false;
        }

        stCtx.bBufferToCTAConfig = (BYTE (__stdcall*)(BYTE*, BYTE*, BYTE*, BYTE*, BYTE*, WORD*)) GetProcAddress(stCtx.hiDll, "bBufferToCTAConfig");
        if (stCtx.bBufferToCTAConfig == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bBufferToCTAConfig()");
            retorno = false;
        }

        stCtx.bBufferToCTAStatus = (BYTE (__stdcall*)(BYTE*, BYTE*, BYTE*, WORD*)) GetProcAddress(stCtx.hiDll, "bBufferToCTAStatus");
        if (stCtx.bBufferToCTAStatus == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bBufferToCTAStatus()");
            retorno = false;
        }

        stCtx.bBufferToCTDConfig = (BYTE (__stdcall*)(BYTE*, BYTE*, BYTE*, BYTE*, BYTE*, WORD*, WORD*, WORD*)) GetProcAddress(stCtx.hiDll, "bBufferToCTDConfig");
        if (stCtx.bBufferToCTDConfig == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bBufferToCTDConfig()");
            retorno = false;
        }

        stCtx.bBufferToCTDStatus = (BYTE (__stdcall*)(BYTE*, BYTE*, BYTE*, WORD*)) GetProcAddress(stCtx.hiDll, "bBufferToCTDStatus");
        if (stCtx.bBufferToCTDStatus == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bBufferToCTDStatus()");
            retorno = false;
        }

        stCtx.bBufferToCTFConfig = (BYTE (__stdcall*)(BYTE*, BYTE*, BYTE*, BYTE*, BYTE*)) GetProcAddress(stCtx.hiDll, "bBufferToCTFConfig");
        if (stCtx.bBufferToCTFConfig == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bBufferToCTFConfig()");
            retorno = false;
        }

        stCtx.bBufferToCTFStatus = (BYTE (__stdcall*)(BYTE*, BYTE*, BYTE*, BYTE*, BYTE*, BYTE*)) GetProcAddress(stCtx.hiDll, "bBufferToCTFStatus");
        if (stCtx.bBufferToCTFStatus == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bBufferToCTFStatus()");
            retorno = false;
        }

        stCtx.bBufferToCTXCode = (BYTE (__stdcall*)(BYTE*, WORD*)) GetProcAddress(stCtx.hiDll, "bBufferToCTXCode");
        if (stCtx.bBufferToCTXCode == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bBufferToCTXCode()");
            retorno = false;
        }

        stCtx.bBufferToCTXConfig = (BYTE (__stdcall*)(BYTE*, BYTE*)) GetProcAddress(stCtx.hiDll, "bBufferToCTXConfig");
        if (stCtx.bBufferToCTXConfig == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bBufferToCTXConfig()");
            retorno = false;
        }

        stCtx.bBufferToCTXStatus = (BYTE (__stdcall*)(BYTE*, BYTE*)) GetProcAddress(stCtx.hiDll, "bBufferToCTXStatus");
        if (stCtx.bBufferToCTXStatus == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bBufferToCTXStatus()");
            retorno = false;
        }

        stCtx.bBufferToDateTime = (BYTE (__stdcall*)(BYTE*, BYTE*, BYTE*, WORD*, BYTE*, BYTE*, BYTE*)) GetProcAddress(stCtx.hiDll, "bBufferToDateTime");
        if (stCtx.bBufferToDateTime == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bBufferToDateTime()");
            retorno = false;
        }

        stCtx.bBufferToError = (BYTE (__stdcall*)(BYTE*, BYTE*, char*)) GetProcAddress(stCtx.hiDll, "bBufferToError");
        if (stCtx.bBufferToError == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bBufferToError()");
            retorno = false;
        }

        stCtx.bBufferToEvent = (BYTE (__stdcall*)(BYTE*, WORD*, DWORD*, BYTE*, BYTE*)) GetProcAddress(stCtx.hiDll, "bBufferToEvent");
        if (stCtx.bBufferToEvent == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bBufferToEvent()");
            retorno = false;
        }

        stCtx.bBufferToExpirationTime = (BYTE (__stdcall*)(BYTE*, BYTE*)) GetProcAddress(stCtx.hiDll, "bBufferToExpirationTime");
        if (stCtx.bBufferToExpirationTime == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bBufferToExpirationTime()");
            retorno = false;
        }

        stCtx.bBufferToKey = (BYTE (__stdcall*)(BYTE*, char*)) GetProcAddress(stCtx.hiDll, "bBufferToKey");
        if (stCtx.bBufferToKey == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bBufferToKey()");
            retorno = false;
        }

        stCtx.bBufferToLog = (BYTE (__stdcall*)(BYTE*, WORD*, DWORD*, BYTE*, BYTE*, BYTE*)) GetProcAddress(stCtx.hiDll, "bBufferToLog");
        if (stCtx.bBufferToLog == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bBufferToLog()");
            retorno = false;
        }

        stCtx.bBufferToMessage = (BYTE (__stdcall *)(BYTE*, BYTE*, char*, DWORD*)) GetProcAddress(stCtx.hiDll, "bBufferToMessage");
        if (stCtx.bBufferToMessage == NULL)	{
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bBufferToMessage()");
            retorno = false;
        }

        stCtx.bBufferToMTACode = (BYTE (__stdcall *)(BYTE*, DWORD*)) GetProcAddress(stCtx.hiDll, "bBufferToMTACode");
        if (stCtx.bBufferToMTACode == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bBufferToMTACode()");
            retorno = false;
        }

        stCtx.bBufferToOutputs = (BYTE (__stdcall *)(BYTE*, BYTE*)) GetProcAddress(stCtx.hiDll, "bBufferToOutputs");
        if (stCtx.bBufferToOutputs == NULL)	{
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bBufferToOutputs()");
            retorno = false;
        }

        stCtx.bBufferToPowerConfig = (BYTE (__stdcall *)(BYTE*, WORD*, BYTE*, BYTE*, BYTE*)) GetProcAddress(stCtx.hiDll, "bBufferToPowerConfig");
        if (stCtx.bBufferToPowerConfig == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bBufferToPowerConfig()");
            retorno = false;
        }

        stCtx.bBufferToPowerStatus = (BYTE (__stdcall *)(BYTE*, BYTE*, BYTE*, WORD*)) GetProcAddress(stCtx.hiDll, "bBufferToPowerStatus");
        if (stCtx.bBufferToPowerStatus == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bBufferToPowerStatus()");
            retorno = false;
        }

        stCtx.bBufferToPrintConfig = (BYTE (__stdcall *)(BYTE*, BYTE*, BYTE*, BYTE*)) GetProcAddress(stCtx.hiDll, "bBufferToPrintConfig");
        if (stCtx.bBufferToPrintConfig == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bBufferToPrintConfig()");
            retorno = false;
        }

        stCtx.bBufferToPrintStatus = (BYTE (__stdcall *)(BYTE*, short int*, short int*, BYTE*, BYTE*, BYTE*)) GetProcAddress(stCtx.hiDll, "bBufferToPrintStatus");
        if (stCtx.bBufferToPrintStatus == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bBufferToPrintStatus()");
            retorno = false;
        }

        stCtx.bBufferToSignature = (BYTE (__stdcall *)(BYTE*, DWORD*)) GetProcAddress(stCtx.hiDll, "bBufferToSignature");
        if (stCtx.bBufferToSignature == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bBufferToSignature()");
            retorno = false;
        }

        stCtx.bBufferToString = (BYTE (__stdcall *)(BYTE*, char*)) GetProcAddress(stCtx.hiDll, "bBufferToString");
        if (stCtx.bBufferToString == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bBufferToString()");
            retorno = false;
        }

        stCtx.bBufferToToneConfig = (BYTE (__stdcall *)(BYTE*, WORD*, WORD*, WORD*, WORD*, WORD*, WORD*)) GetProcAddress(stCtx.hiDll, "bBufferToToneConfig");
        if (stCtx.bBufferToToneConfig == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bBufferToToneConfig()");
            retorno = false;
        }

        stCtx.bBufferToToneStatus = (BYTE (__stdcall *)(BYTE*, BYTE*, BYTE*)) GetProcAddress(stCtx.hiDll, "bBufferToToneStatus");
        if (stCtx.bBufferToToneStatus == NULL){
            PrintCtxLog("N�o foi poss�vel encontrar a fun��o bBufferToToneStatus()");
            retorno = false;
        }

        return retorno;

    }else{
        PrintCtxLog("N�o foi poss�vel carregar a dll");
        stCtx.bCom = 0;
        return false;
    }
}

//---------------------------------------------------------------------------

void __fastcall TFMonitor::OnWMCopyData(TWMCopyData &Msg){
    COPYDATASTRUCT * pCds;
    pCds = (COPYDATASTRUCT *)Msg.CopyDataStruct;
    PrintCtxLog((char *)pCds->lpData);
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
                PrintCtxLog("CTX conectado");
                PrintCtxLog("bReadParameter(PRM_CONFIGURACAO_CTX)");
                stCtx.bReadParameter(PRM_CONFIGURACAO_CTX);

                PrintCtxLog("bReadParameter(PRM_CODIGO_CTX)");
                stCtx.bReadParameter(PRM_CODIGO_CTX);

                sprintf(acBuffer,"bSetDateTime(%02u,%02u,%04u,%02u,%02u,%02u)",d.da_day,d.da_mon,d.da_year,h.ti_hour,h.ti_min,h.ti_sec);
                PrintCtxLog(acBuffer);
                stCtx.bSetDateTime(d.da_day,d.da_mon,d.da_year,h.ti_hour,h.ti_min,h.ti_sec);
                TMRSetDataHora->Enabled = true;
                Handled = true;
                break;

            case WM_CTX_DESCONECTADO:
                sprintf(acBuffer,"CTX = %5u desconectado",stCtx.wCodigoCtx);
                PrintCtxLog(acBuffer);
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
                PrintCtxLog(acBuffer);
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
                PrintCtxLog(acBuffer);
                Handled = true;
                break;
            case WM_ASSINATURA:
                {
                BYTE dia, mes, hora, minuto, segundo;
                WORD ano;

                stCtx.bBufferToSignature(mensagem,&stCtx.dwAssinatura);
                stCtx.bBufferToDateTime(mensagem,&dia,&mes,&ano,&hora,&minuto,&segundo);
                sprintf(acBuffer,"CTX = %5u, %s%u (%02u/%02u/%4u)",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO],stCtx.dwAssinatura,dia,mes,ano);
                PrintCtxLog(acBuffer);
                Handled = true;
                }
                break;
            case WM_CODIGO_CTX:
                stCtx.bBufferToCTXCode(mensagem,&stCtx.wCodigoCtx);
                sprintf(acBuffer,"%s%u",acParametros[Msg.message-WM_IDENTIFICACAO],stCtx.wCodigoCtx);
                PrintCtxLog(acBuffer);
                Handled = true;
                break;
            case WM_CONFIGURACAO_CTX:
                stCtx.bBufferToCTXConfig(mensagem,&stCtx.bConfiguracao);
                switch (stCtx.bConfiguracao)
                {
                    case 0:
                        PrintCtxLog("Configuracao CTX = CTA");
                    break;
                    case 1:
                        PrintCtxLog("Configuracao CTX = CTF");
                    break;
                    case 2:
                        PrintCtxLog("Configuracao CTX = CTD");
                    break;
                }

                Handled = true;
                break;
            case WM_ESTADO_CTX:
                stCtx.bBufferToCTXStatus(mensagem,&stCtx.bStatus);
                sprintf(acBuffer,"CTX = %5u, %s%04x",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO],stCtx.bStatus);
                PrintCtxLog(acBuffer);
                Handled = true;
                break;
            case WM_DATA_HORARIO:
                stCtx.bBufferToDateTime(mensagem,&stCtx.bDia,&stCtx.bMes,&stCtx.wAno,&stCtx.bHora,&stCtx.bMinuto,&stCtx.bSegundo);
                sprintf(acBuffer,"%CTX = %5u, %s%02u/%02u/%4u, %02u:%02u:%02u",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO],stCtx.bDia,stCtx.bMes,stCtx.wAno,stCtx.bHora,stCtx.bMinuto,stCtx.bSegundo);
                PrintCtxLog(acBuffer);
                Handled = true;
                break;
            case WM_EVENTO:
                {
                    DWORD dwCodificador = NULL;
                    BYTE bStatus, bReferencia = NULL;
                    BYTE dia, mes, hora, minuto, segundo = NULL;
                    WORD ano, wNrEvento = NULL;

                    BYTE bRetorno = stCtx.bBufferToEvent(mensagem, &wNrEvento, &dwCodificador, &bStatus, &bReferencia);

                    if(bRetorno == BIBCOM_SEM_ERRO){
                      stCtx.bBufferToDateTime(mensagem, &dia, &mes, &ano, &hora, &minuto, &segundo);
                      sprintf(acBuffer,"%02u/%02u/%4u %02u:%02u:%02u",dia,mes,ano,hora,minuto,segundo);

                      if(AdicionarEvento(wNrEvento, dwCodificador, IntToHex(bStatus, 1),
                                IntToHex(bReferencia, 2), StrToDateTime(acBuffer))){
                        sprintf(acBuffer,"S - %02u:%02u:%02u - CTX %5u - N�mero do Evento %u - Codificador %u - Status/Refer�ncia = %x.%02x",
                          hora, minuto, segundo, stCtx.wCodigoCtx, wNrEvento, dwCodificador, bStatus, bReferencia);
                        PrintEventoLog(acBuffer);
                      }else{
                        sprintf(acBuffer,"D - %02u:%02u:%02u - CTX %5u - N�mero do Evento %u - Codificador %u - Status/Refer�ncia = %x.%02x",
                          hora, minuto, segundo, stCtx.wCodigoCtx, wNrEvento, dwCodificador, bStatus, bReferencia);
                        PrintEventoLog(acBuffer);
                      }

                      sprintf(acBuffer,"CTX = %5u, %s",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO]);
                      PrintCtxLog(acBuffer);
                      sprintf(acBuffer,"  N�mero do Evento = %u",wNrEvento);
                      PrintCtxLog(acBuffer);
                      sprintf(acBuffer,"  C�digo do equipamento = %05lu.%u",dwCodificador/10,(WORD)(dwCodificador%10));
                      PrintCtxLog(acBuffer);
                      sprintf(acBuffer,"  Status/Refer�ncia = %x.%02x",bStatus,bReferencia);
                      PrintCtxLog(acBuffer);
                      sprintf(acBuffer,"  Data/Hor�rio = %02u/%02u/%4u %02u:%02u:%02u",dia,mes,ano,hora,minuto,segundo);
                      PrintCtxLog(acBuffer);
                    }else{
                      sprintf(acBuffer,"E - %02u:%02u:%02u - CTX %5u - N�mero do Evento %u - Codificador %u - Status/Refer�ncia = %x.%02x",
                        hora, minuto, segundo, stCtx.wCodigoCtx, wNrEvento, dwCodificador, bStatus, bReferencia);
                      PrintEventoLog(acBuffer);
                    }
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
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  N�mero do Relat�rio = %u",stCtx.wNrRelatorio);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  C�digo do equipamento = %04u.%u",(WORD)(codigo/10),codigo%10);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Status/Refer�ncia = %x.%02x",tipo,referencia);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Data/Hor�rio = %02u/%02u/%4u %02u:%02u:%02u",dia,mes,ano,hora,minuto,segundo);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Dados =  %02x%02x%02x %02x%02x%02x",geral[0],geral[1],geral[2],geral[3],geral[4],geral[5]);
              PrintCtxLog(acBuffer);
              Handled = true;
              }
              break;
            case WM_CONFIGURACAO_CTF:
              stCtx.bBufferToCTFConfig(mensagem,&stCtx.bHabilitacao,&stCtx.bNrToques,&stCtx.bNrMaxTentativas,&stCtx.bSemLinha);
              sprintf(acBuffer,"CTX = %5u, %s",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO]);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Habilita��o = %02x",stCtx.bHabilitacao);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  N�mero de toques = %u",stCtx.bNrToques);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  N�mero de tentativas = %u",stCtx.bNrMaxTentativas);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Tempo sem linha = %umin",stCtx.bSemLinha);
              PrintCtxLog(acBuffer);
              Handled = true;
              break;
            case WM_ESTADO_CTF:
              stCtx.bBufferToCTFStatus(mensagem,&stCtx.bStatusCTF,&stCtx.bEstadoCTF,&stCtx.bEstadoDiscar,&stCtx.bNrTentativas,&stCtx.bTempo);
              sprintf(acBuffer,"CTX = %5u, %s",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO]);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Status = %02x",stCtx.bStatusCTF);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Estado = %u",stCtx.bEstadoCTF);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Estado Discar = %u",stCtx.bEstadoDiscar);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  N�mero de tentativas = %u",stCtx.bNrTentativas);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Tempo transcorrido sem linha = %umin",stCtx.bTempo);
              PrintCtxLog(acBuffer);
              Handled = true;
              break;
            case WM_CONEXAO_ABERTA:
              {
              DWORD codigo;

              stCtx.bBufferToMTACode(mensagem,&codigo);
              sprintf(acBuffer,"CTX = %5u, %s%u",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO],codigo);
              PrintCtxLog(acBuffer);
              Handled = true;
              }
              break;
            case WM_CONEXAO_FECHADA:
              {
              BYTE status;

              stCtx.bBufferToCTFStatus(mensagem,&status,NULL,NULL,NULL,NULL);
              sprintf(acBuffer,"CTX = %5u, %s%u",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO],status);
              PrintCtxLog(acBuffer);
              Handled = true;
              }
              break;
            case WM_PRAZO_VALIDADE:
              stCtx.bBufferToExpirationTime(mensagem,&stCtx.bValidade);
              sprintf(acBuffer,"CTX = %5u, %s%u dias",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO],stCtx.bValidade);
              PrintCtxLog(acBuffer);
              Handled = true;
              break;
            case WM_HABILITACAO_AUTOMATO:
              stCtx.bBufferToCTXConfig(mensagem,&stCtx.bHabAutomato);
              sprintf(acBuffer,"CTX = %5u, %s%02xh",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO],stCtx.bHabAutomato);
              PrintCtxLog(acBuffer);
              Handled = true;
              break;
            case WM_CONFIGURACAO_TOM:
              stCtx.bBufferToToneConfig(mensagem,&stCtx.wPreambulo,&stCtx.wTomInicial,&stCtx.wTom,&stCtx.wGuardaTx,&stCtx.wGuardaRx,&stCtx.wTimeOut);
              sprintf(acBuffer,"CTX = %5u, %s",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO]);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Pre�mbulo = %ums",stCtx.wPreambulo);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Dura��o do tom inicial = %ums",stCtx.wTomInicial);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Dura��o dos demais tons = %ums",stCtx.wTom);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Tempo entre dois tons transmitidos = %ums",stCtx.wGuardaTx);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Tempo m�nimo entre dois tons recebidos = %ums",stCtx.wGuardaRx);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Tempo para detectar final de mensagem = %ums",stCtx.wTimeOut);
              PrintCtxLog(acBuffer);
              Handled = true;
              break;
            case WM_ESTADO_TOM:
              stCtx.bBufferToToneStatus(mensagem,&stCtx.bEstadoTom,&stCtx.bNrTons);
              sprintf(acBuffer,"CTX = %5u, %s",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO]);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Estado atual = %u",stCtx.bEstadoTom);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  N� de tons recebidos = %u tons",stCtx.bNrTons);
              PrintCtxLog(acBuffer);
              Handled = true;
              break;
            case WM_CONFIGURACAO_CTA:
              stCtx.bBufferToCTAConfig(mensagem,&stCtx.bHabCTX,&stCtx.bArea,&stCtx.bMilharDV,&stCtx.bReservado,&stCtx.wTempoMaxPortadora);
              sprintf(acBuffer,"CTX = %5u, %s",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO]);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Habilita��o = %02xh",stCtx.bHabCTX);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  �rea do CTA = %u",stCtx.bArea);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Milhar sem consist�ncia do DV = %u",stCtx.bMilharDV);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Reservado = %02xh",stCtx.bReservado);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Tempo m�ximo com portadora = %us",stCtx.wTempoMaxPortadora);
              PrintCtxLog(acBuffer);
              Handled = true;
              break;
            case WM_ESTADO_CTA:
              stCtx.bBufferToCTAStatus(mensagem,&stCtx.bStatusCTX,&stCtx.bReservado,&stCtx.wTempoPortadora);
              sprintf(acBuffer,"CTX = %5u, %s",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO]);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Estado = %02xh",stCtx.bStatusCTX);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Reservado = %02xh",stCtx.bReservado);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Tempo com portadora = %us",stCtx.wTempoPortadora);
              PrintCtxLog(acBuffer);
              Handled = true;
              break;
            case WM_CONFIGURACAO_CTD:
              stCtx.bBufferToCTDConfig(mensagem,&stCtx.bHabCTX,&stCtx.bArea,&stCtx.bMilharDV,&stCtx.bAreaRtx,&stCtx.wAtrasoEvento,&stCtx.wAtrasoRelatorio,&stCtx.wTempoMaxPortadora);
              sprintf(acBuffer,"CTX = %5u, %s",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO]);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Habilita��o = %02xh",stCtx.bHabCTX);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  �rea do CTD = %u",stCtx.bArea);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Milhar sem consist�ncia do DV = %u",stCtx.bMilharDV);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  �rea de retransmiss�o do CTD = %u",stCtx.bAreaRtx);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Atraso Retransmiss�o de Evento = %ums",stCtx.wAtrasoEvento);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Atraso Retransmiss�o de Relat�rio = %ums",stCtx.wAtrasoRelatorio);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Tempo m�ximo com portadora = %us",stCtx.wTempoMaxPortadora);
              PrintCtxLog(acBuffer);
              Handled = true;
              break;
            case WM_ESTADO_CTD:
              stCtx.bBufferToCTDStatus(mensagem,&stCtx.bStatusCTX,&stCtx.bReservado,&stCtx.wTempoPortadora);
              sprintf(acBuffer,"CTX = %5u, %s",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO]);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Estado = %02xh",stCtx.bStatusCTX);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Reservado = %02xh",stCtx.bReservado);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Tempo com portadora = %us",stCtx.wTempoPortadora);
              PrintCtxLog(acBuffer);
              Handled = true;
              break;
            case WM_CONFIGURACAO_FONTE:
              stCtx.bBufferToPowerConfig(mensagem,&stCtx.wTempoMaxFaltaAC,&stCtx.bTensaoBaixaBat,&stCtx.bTensaoCriticaBat,&stCtx.bIntervTestes);
              sprintf(acBuffer,"CTX = %5u, %s",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO]);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Tempo m�ximo com falta de energia = %us",stCtx.wTempoMaxFaltaAC);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Limiar de tens�o baixa na bateria = %u.%u V",stCtx.bTensaoBaixaBat/10,stCtx.bTensaoBaixaBat%10);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Limiar de tens�o cr�tica na bateria = %u.%u V",stCtx.bTensaoCriticaBat/10,stCtx.bTensaoCriticaBat%10);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Intervalo entre testes de bateria = %uh",stCtx.bIntervTestes);
              PrintCtxLog(acBuffer);
              Handled = true;
              break;
            case WM_ESTADO_FONTE:
              stCtx.bBufferToPowerStatus(mensagem,&stCtx.bEstadoBat,&stCtx.bTensaoBat,&stCtx.wTempoFaltaAC);
              sprintf(acBuffer,"CTX = %5u, %s",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO]);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Estado bateria = %02u",stCtx.bEstadoBat);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Tens�o bateria = %u.%u V",stCtx.bTensaoBat/10,stCtx.bTensaoBat%10);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Tempo de falta de energia = %u s",stCtx.wTempoFaltaAC);
              PrintCtxLog(acBuffer);
              Handled = true;
              break;
            case WM_CONFIGURACAO_IMPRESSAO:
              stCtx.bBufferToPrintConfig(mensagem,&stCtx.bHabImp,&stCtx.bMargem,&stCtx.bLinhasPagina);
              sprintf(acBuffer,"CTX = %5u, %s",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO]);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Habilita��o = %02xh",stCtx.bHabImp);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Margem = %u espa�os",stCtx.bMargem);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Linhas na p�gina = %u linhas",stCtx.bLinhasPagina);
              PrintCtxLog(acBuffer);
              Handled = true;
              break;
            case WM_ESTADO_IMPRESSAO:
              stCtx.bBufferToPrintStatus(mensagem,(short int*)&stCtx.wNrEventoImp,(short int*)&stCtx.wNrRelatorioImp,&stCtx.bStatusImp,&stCtx.bLinhaAtual,&stCtx.bNrCaracteres);
              sprintf(acBuffer,"CTX = %5u, %s",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO]);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  �ltimo evento impresso = %u",stCtx.wNrEventoImp);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  �ltimo relat�rio impresso = %u",stCtx.wNrRelatorioImp);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  Status = %02x",stCtx.bStatusImp);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  N� da linha atual = %u",stCtx.bLinhaAtual);
              PrintCtxLog(acBuffer);
              sprintf(acBuffer,"  N� de caracteres no buffer = %u",stCtx.bNrCaracteres);
              PrintCtxLog(acBuffer);
              Handled = true;
              break;
            case WM_SAIDAS:
              stCtx.bBufferToOutputs(mensagem,&stCtx.bSaidas);
              sprintf(acBuffer,"CTX = %5u, %s%02xh",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO],stCtx.bSaidas);
              PrintCtxLog(acBuffer);
              Handled = true;
              break;
            case WM_TECLA:
              stCtx.bBufferToKey(mensagem,&stCtx.cTecla);
              sprintf(acBuffer,"CTX = %5u, %s%c",stCtx.wCodigoCtx,acParametros[Msg.message-WM_IDENTIFICACAO],(stCtx.cTecla==-1? ' ': stCtx.cTecla));
              PrintCtxLog(acBuffer);
              Handled = true;
              break;
            }

    }catch(Exception &excecao) {
        AnsiString classe, erro, mensagem;
        classe = this->ClassName();
        erro = excecao.ClassName();
        mensagem = excecao.Message;
        sprintf(acBuffer,"%s : %s : %s : %s", classe, "AppMessage", erro, mensagem);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFMonitor::PrintCtxLog(AnsiString log)
{
    char MensagemLog[TAM_BUFFER];
    struct time h;
    struct date d;

    getdate(&d);
    gettime(&h);

    if(mmComunicacaoCtx->Lines->Count > TAM_BUFFER){
        mmComunicacaoCtx->Lines->Clear();
    }

    sprintf(MensagemLog,"%02u:%02u:%02u> %s.",h.ti_hour,h.ti_min,h.ti_sec,log);
    mmComunicacaoCtx->Lines->Add(MensagemLog);
}

//---------------------------------------------------------------------------

void __fastcall TFMonitor::PrintEventoLog(AnsiString log)
{
    char MensagemLog[TAM_BUFFER];
    struct time h;
    struct date d;

    getdate(&d);
    gettime(&h);

    if(mmEventos->Lines->Count > TAM_BUFFER){
        mmEventos->Lines->Clear();
    }
    mmEventos->Lines->Add(log);
}

//---------------------------------------------------------------------------

bool __fastcall TFMonitor::AdicionarEvento(WORD wNrEvento, DWORD dwCodificador, AnsiString szStatus,
    AnsiString szReferencia, TDateTime dtDataEHora)
{
    /*
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
    */

    return true;
}


//---------------------------------------------------------------------------

void __fastcall TFMonitor::btnConectarClick(TObject *Sender)
{
    Screen->Cursor = crHourGlass;
    AnsiString szPorta = Format("COM%s", ARRAYOFCONST((IntToStr(stCtx.bCom))));
    sprintf(acBuffer,"Encerrando a comunica��o serial com a porta %s", szPorta);
    PrintCtxLog(acBuffer);
    if(InterpretaRetornoDll(stCtx.bEndNetwork())){
        PrintCtxLog("Comunica��o serial encerrada com sucesso");
    }else{
        PrintCtxLog("Encerramento da comunica��o serial falhou");
    }
    Screen->Cursor = crArrow;

    sprintf(acBuffer,"Reiniciando a comunica��o serial com a porta %s", szPorta);
    PrintCtxLog(acBuffer);

    if(InterpretaRetornoDll(
        stCtx.bInitNetwork(Application->Handle, 0, szPorta.c_str(), NR_RETRANSMISSOES_CTX,
            ESPERA_RESPOSTA_CTX, PERIODO_TIMER, 0)!= BIBCOM_SEM_ERRO)){

        sprintf(acBuffer,"Porta de comunica��o serial %s aberta, aguardando resposta da CTX", szPorta);
        PrintCtxLog(acBuffer);
    }else{
        sprintf(acBuffer,"Comunica��o serial com a porta %s falhou", szPorta);
        PrintCtxLog(acBuffer);
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
            MsgErro = "Erro de comunica��o serial: CODERRO" + IntToStr(erro) + ".";
            MsgErro+= " Endere�o inv�lido. ";
            break;
        case BIBCOM_SERVICO_NAO_EMPILHADO:
            MsgErro = "Erro de comunica��o serial: CODERRO" + IntToStr(erro) + ".";
            MsgErro+= " Servi�o n�o empilhado. ";
            break;
        case BIBCOM_PARAMETRO_INVALIDO:
            MsgErro = "Erro de comunica��o serial: CODERRO" + IntToStr(erro) + ".";
            MsgErro+= " Par�metro inv�lido. ";
            break;
        case BIBCOM_ERRO_INICIALIZACAO_REDE:
            MsgErro = "Erro de comunica��o serial: CODERRO" + IntToStr(erro) + ".";
            MsgErro+= " Erro na inicializa��o da rede. ";
            break;
        case BIBCOM_ERRO_ENCERRAMENTO_REDE:
            MsgErro = "Erro de comunica��o serial: CODERRO" + IntToStr(erro) + ".";
            MsgErro+= " Erro no encerramento da rede. ";
            break;
        case BIBCOM_ACESSO_NEGADO:
            MsgErro = "Erro de comunica��o serial: CODERRO" + IntToStr(erro) + ".";
            MsgErro+= " Acesso negado. ";
            break;
        case BIBCOM_MENSAGEM_INVALIDA:
            MsgErro = "Erro de comunica��o serial: CODERRO" + IntToStr(erro) + ".";
            MsgErro+= " Mensagem inv�lida. ";
            break;
    }

    if(erro > 0){
        DWORD erroAdicional;
        stCtx.bGetDllError(&erroAdicional);
        if(CheckBit(erroAdicional, DLL_SEM_ERRO)) MsgErro+= "Nenhum erro adicional reportado pela biblioteca";
        if(CheckBit(erroAdicional, DLL_ERRO_ABERTURA_PORTA_COMUNICACAO)) MsgErro+= "Erro na abertura da porta de comunica��o";
        if(CheckBit(erroAdicional, DLL_ERRO_FECHAMENTO_PORTA_COMUNICACAO)) MsgErro+= "Erro no fechamento da porta de comunica��o";
        if(CheckBit(erroAdicional, DLL_ERRO_CONFIGURACAO_PORTA_COMUNICACAO)) MsgErro+= "Erro na configura��o da porta de comunica��o";
        if(CheckBit(erroAdicional, DLL_ERRO_CRIACAO_EVENTO)) MsgErro+= "Erro na cria��o de evento";
        if(CheckBit(erroAdicional, DLL_ERRO_HABILITACAO_TRANSMISSOR)) MsgErro+= "Erro na habilita��o de transmissor";
        if(CheckBit(erroAdicional, DLL_ERRO_DESABILITACAO_TRANSMISSOR)) MsgErro+= "Erro na desabilita��o de transmissor";
        if(CheckBit(erroAdicional, DLL_ERRO_SERIAL_API_WINDOWS)) MsgErro+= "Erro na API Serial do Windows";
        if(CheckBit(erroAdicional, DLL_ERRO_HANDLE_INVALIDO)) MsgErro+= "Erro de handle inv�lido";
        if(CheckBit(erroAdicional, DLL_ERRO_NUMERO_ESTACOES_INVALIDO)) MsgErro+= "Erro de n�mero de esta��es inv�lido";
        if(CheckBit(erroAdicional, DLL_ERRO_CRIACAO_MMTIMER)) MsgErro+= "Erro na cria��o do MMTIMER";
        if(CheckBit(erroAdicional, DLL_ERRO_SERVICO_EM_ANDAMENTO)) MsgErro+= "Erro de servi�o em andamento";
        if(CheckBit(erroAdicional, DLL_ERRO_ALOCACAO_MEMORIA)) MsgErro+= "Erro de aloca��o de mem�ria";
        PrintCtxLog(MsgErro);
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
    PrintCtxLog(acBuffer);
    stCtx.bSetDateTime(d.da_day,d.da_mon,d.da_year,h.ti_hour,h.ti_min,h.ti_sec);
}

//---------------------------------------------------------------------------


