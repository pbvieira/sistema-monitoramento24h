//---------------------------------------------------------------------------
#include <vcl.h>
#include <inifiles.hpp>
#include "dos.h"
#include "stdio.h"
#pragma hdrstop

#include "DMApp.h"
#include "CadUsuario.h"
#include "Home.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

TDModule *DModule;
TStringList *LogSistema;

//---------------------------------------------------------------------------

__fastcall TDModule::TDModule(TComponent* Owner)
    : TDataModule(Owner)
{
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
        delete ini;

        IBCONAzsim->Connected = false;
        IBCONAzsim->LoginPrompt = false;
        IBCONAzsim->DatabaseName = Servidor;
        IBCONAzsim->SQLDialect = 3;
        IBCONAzsim->Params->Clear();
        IBCONAzsim->Params->Add("user_name=" + Usuario);
        IBCONAzsim->Params->Add("password="  + Senha);
        IBCONAzsim->Params->Add("lc_ctype=WIN1252");
        IBCONAzsim->Connected = true;

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "AZSIM - Sistema Integrado de Monitoramento\n\nOcorreu um erro ao tentar abrir a conexão com a base de dados. "
            "Verifique a configuração no arquivo AZSIM.ini\n que encontra-se "
            "na pasta de instalação do aplicativo e tente abrir novamente."
            "\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção", MB_ICONERROR|MB_OK);
        Application->Terminate();
    }
}

//---------------------------------------------------------------------------

void __fastcall TDModule::DataModuleDestroy(TObject *Sender)
{
    try{
        if (IBCONAzsim->Connected){
            IBCONAzsim->Connected = false;
        }

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao tentar encerrar a conexão com a base de dados."
            "\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

void __fastcall TDModule::SalvaLog(AnsiString log)
{
    struct time h;
    gettime(&h);
    AnsiString ArquivoLog = "./log/" + FormatDateTime("ddmmmyyyy", Date()) + ".log";
    char LogCompleto[2048];
    sprintf(LogCompleto,"%02u:%02u:%02u - %s",h.ti_hour,h.ti_min,h.ti_sec,log.c_str());

    if (FileExists(ArquivoLog) == true)
        LogSistema->LoadFromFile(ArquivoLog);
    LogSistema->Add(LogCompleto);
    LogSistema->SaveToFile(ArquivoLog);
}

//---------------------------------------------------------------------------

TDateTime __fastcall TDModule::RetornaDataHoraAtual()
{
    SYSTEMTIME SystemTime;
    GetLocalTime(&SystemTime);
    return SystemTimeToDateTime(SystemTime);
}

//---------------------------------------------------------------------------

void __fastcall TDModule::CDSUsuarioBeforePost(TDataSet *DataSet)
{
    if(!FCadUsuario->ValidaUsuario()){
        Abort();
    }
}

//---------------------------------------------------------------------------

void __fastcall TDModule::CDSFilialBeforePost(TDataSet *DataSet)
{
    int Codigo = DModule->CDSFilialCDFILIAL->AsInteger;
    if(Codigo == 0){
        GeraFilialId();
    }
}

//---------------------------------------------------------------------------

void TDModule::GeraFilialId(void)
{
    try{
        IBSPFilial->ExecProc();
        int id = DModule->IBSPFilial->ParamByName("ID")->AsInteger;
        CDSFilialCDFILIAL->AsInteger = id;
        IBTGenIdFilial->Commit();

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao gerar o código do procedimento."
            "\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

