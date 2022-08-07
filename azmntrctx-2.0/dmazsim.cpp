//---------------------------------------------------------------------------
#include <vcl.h>
#include <inifiles.hpp>
#pragma hdrstop
#include <stdio.h>
#include <stdlib.h>
#include <io.h>
#include <dos.h>
#include <share.h>
#include <string.h>
#include <Filectrl.hpp>
#include "dmazsim.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

#define ARQUIVO_INICIALIZACAO "./AZSIM.ini"
#define SECAO_BASE "Conex�o Base"

TDModule *DModule;
TStringList *LogSistema;

//---------------------------------------------------------------------------
__fastcall TDModule::TDModule(TComponent* Owner)
        : TDataModule(Owner)
{
    if (!DirectoryExists("./logs")){
        if (!CreateDir("./logs"))
            throw Exception("N�o foi poss�vel criar o diret�rio logs.");
    }

    if (!DirectoryExists("./logs/evento")){
        if (!CreateDir("./logs/evento"))
            throw Exception("N�o foi poss�vel criar o diret�rio logs/evento.");
    }

    if (!DirectoryExists("./logs/ctx")){
        if (!CreateDir("./logs/ctx"))
            throw Exception("N�o foi poss�vel criar o diret�rio logs/ctx.");
    }

    if (!DirectoryExists("./logs/app")){
        if (!CreateDir("./logs/app"))
            throw Exception("N�o foi poss�vel criar o diret�rio logs/app.");
    }
}

//---------------------------------------------------------------------------

void __fastcall TDModule::DataModuleCreate(TObject *Sender)
{
    try{
        LogSistema = new TStringList();

        TIniFile *ini = new TIniFile(ARQUIVO_INICIALIZACAO);
        String Servidor = ini->ReadString(SECAO_BASE,"BaseDeDados","");
        String Usuario = ini->ReadString(SECAO_BASE,"Usuario","");
        String Senha = ini->ReadString(SECAO_BASE,"Senha","");

        DModule->IBCONAzsim->LoginPrompt = false;
        DModule->IBCONAzsim->DatabaseName = Servidor;
        DModule->IBCONAzsim->SQLDialect = 3;
        DModule->IBCONAzsim->Connected = false;
        DModule->IBCONAzsim->Params->Clear();
        DModule->IBCONAzsim->Params->Add("user_name=" + Usuario);
        DModule->IBCONAzsim->Params->Add("password="  + Senha);
        DModule->IBCONAzsim->Params->Add("lc_ctype=WIN1252");
        DModule->IBCONAzsim->Connected = true;

    }catch(Exception &excecao){
        AnsiString classe, erro, mensagem;
        classe = this->ClassName();
        erro = excecao.ClassName();
        mensagem = excecao.Message;

        char acBuffer[1000];
        sprintf(acBuffer,"%s : %s : %s", classe, erro, mensagem);
        TDModule::SalvaLog(acBuffer);

        String ErroNaConexao =
            "AZSIM-MONITOR\n\nOcorreu um erro ao tentar abrir a conex�o com a base de dados. "
            "Verifique a configura��o no arquivo AZSIM.ini\n que encontra-se "
            "na pasta de instala��o do aplicativo e tente abrir novamente."
            "\n\nDescri��o do erro:\n" + mensagem;
        Application->MessageBox(ErroNaConexao.c_str(),"Aten��o",MB_ICONERROR|MB_OK);
        Application->Terminate();
    }
}

//---------------------------------------------------------------------------

void __fastcall TDModule::DataModuleDestroy(TObject *Sender)
{
    try{
        if (DModule->IBCONAzsim->Connected){
            DModule->IBCONAzsim->Connected = false;
        }
    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao tentar encerrar a conex�o com a base de dados."
            "\n\nDescri��o do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Aten��o",MB_ICONERROR|MB_OK);
        Application->Terminate();
    }
}

//---------------------------------------------------------------------------

TDateTime __fastcall TDModule::RetornaDataHoraAtual()
{
    SYSTEMTIME SystemTime;
    GetLocalTime(&SystemTime);
    return SystemTimeToDateTime(SystemTime);
}

//---------------------------------------------------------------------------

TDateTime __fastcall TDModule::SetaDataHora(AnsiString dataEHora)
{
    return StrToDateTime(dataEHora);
}

//---------------------------------------------------------------------------

void __fastcall TDModule::SalvaLog(AnsiString log)
{
    FILE *fp;
    struct time h;
    gettime(&h);

    AnsiString ArquivoLog = "./logs/app/A" + FormatDateTime("ddmmyyyy", Date()) + ".log";
    char LogCompleto[1024];
    sprintf(LogCompleto,"%02u:%02u:%02u - %s",h.ti_hour,h.ti_min,h.ti_sec,log.c_str());

    if ((fp = _fsopen(ArquivoLog.c_str(),"at",SH_DENYWR)) != NULL){
        fprintf(fp,"%s\n", LogCompleto);
        fclose(fp);
   }
}

//---------------------------------------------------------------------------

void __fastcall TDModule::SalvaCtxLog(AnsiString log)
{
    FILE *fp;
    struct time h;
    gettime(&h);

    AnsiString ArquivoLog = "./logs/ctx/C" + FormatDateTime("ddmmyyyy", Date()) + ".log";
    char LogCompleto[1024];
    sprintf(LogCompleto,"%02u:%02u:%02u - %s",h.ti_hour,h.ti_min,h.ti_sec,log.c_str());

    if ((fp = _fsopen(ArquivoLog.c_str(),"at",SH_DENYWR)) != NULL){
        fprintf(fp,"%s\n", LogCompleto);
        fclose(fp);
   }
}

//---------------------------------------------------------------------------

void __fastcall TDModule::SalvaEventoLog(AnsiString log)
{
    FILE *fp;
    AnsiString ArquivoLog = "./logs/evento/E" + FormatDateTime("ddmmyyyy", Date()) + ".log";
    if ((fp = _fsopen(ArquivoLog.c_str(),"at",SH_DENYWR)) != NULL){
        fprintf(fp,"%s\n", log.c_str());
        fclose(fp);
   }
}

//---------------------------------------------------------------------------

