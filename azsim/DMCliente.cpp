//---------------------------------------------------------------------------
#include <vcl.h>                            
#pragma hdrstop
#include "DMCliente.h"
#include "DMApp.h"
#include "CadContratoBasico.h"
#include "CadSenhas.h"
#include "CadOrdemServico.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

TDModuleCliente *DModuleCliente;

//---------------------------------------------------------------------------

__fastcall TDModuleCliente::TDModuleCliente(TComponent* Owner)
    : TDataModule(Owner)
{
}

//---------------------------------------------------------------------------
// VALIDAÇÕES
//---------------------------------------------------------------------------

void __fastcall TDModuleCliente::CDSProcedimentoBeforePost(
      TDataSet *DataSet)
{
    int Codigo = CDSProcedimentoCDPROCEDIMENTO->AsInteger;
    if(Codigo == NULL || Codigo == 0){
        GeraProcedimentoId();
    }
}

//---------------------------------------------------------------------------

void __fastcall TDModuleCliente::CDSClienteBeforePost(TDataSet *DataSet)
{
    if(!FCadCliente->ValidaCliente()){
        Abort();
    }

    int Codigo = CDSClienteCDCLIENTE->AsInteger;
    if(Codigo == NULL || Codigo == 0){
        GeraClienteId();
    }
}

//---------------------------------------------------------------------------

void __fastcall TDModuleCliente::CDSContatoBeforePost(TDataSet *DataSet)
{
    if(!FCadSenha->ValidaSenha()){
        Abort();
    }

    int Codigo = CDSContatoCDCLIENTECONTATO->AsInteger;
    if(Codigo == NULL || Codigo == 0){
        GeraContatoId();
    }
}

//---------------------------------------------------------------------------

void __fastcall TDModuleCliente::CDSContratoBeforePost(TDataSet *DataSet)
{
    if(!FCadContratoBasico->ValidaContrato()){
        Abort();
    }

    int Codigo = CDSContratoCDCONTRATO->AsInteger;
    if(Codigo == NULL || Codigo == 0){
        GeraContratoId();
    }
}

//---------------------------------------------------------------------------
// GENERATORS
//---------------------------------------------------------------------------

void __fastcall TDModuleCliente::GeraClienteId(void)
{
    try{
        IBSPGenIdCliente->ExecProc();
        int id = IBSPGenIdCliente->ParamByName("ID")->AsInteger;
        CDSClienteCDCLIENTE->AsInteger = id;
        IBTGenIdCliente->Commit();

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao gerar o código do cliente.\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

void __fastcall TDModuleCliente::GeraProcedimentoId(void)
{
    try{
        IBSPProcedimento->ExecProc();
        int id = IBSPProcedimento->ParamByName("ID")->AsInteger;
        CDSProcedimentoCDPROCEDIMENTO->AsInteger = id;
        IBTGenIdProcedimento->Commit();

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao gerar o código do procedimento.\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

void __fastcall TDModuleCliente::GeraContratoId(void)
{
    try{
        IBSPGenIdContrato->ExecProc();
        int id = IBSPGenIdContrato->ParamByName("ID")->AsInteger;
        CDSContratoCDCONTRATO->AsInteger = id;
        IBTGenIdContrato->Commit();

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao gerar o código do contrato.\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

void __fastcall TDModuleCliente::GeraContatoId(void)
{
    try{
        IBSPGenIdContato->ExecProc();
        int id = IBSPGenIdContato->ParamByName("ID")->AsInteger;
        CDSContatoCDCLIENTECONTATO->AsInteger = id;
        IBTGenIdContato->Commit();

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao gerar o código do contato.\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

void __fastcall TDModuleCliente::CDSContratoCDCLIENTEChange(TField *Sender)
{
    FCadContratoBasico->ConsultaCliente(Sender->AsInteger, true);    
}

//---------------------------------------------------------------------------



