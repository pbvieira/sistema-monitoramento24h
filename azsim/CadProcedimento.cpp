//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "CadProcedimento.h"
#include "DMApp.h"
#include "DMCliente.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFCadProcedimento *FCadProcedimento;
//---------------------------------------------------------------------------
__fastcall TFCadProcedimento::TFCadProcedimento(TComponent* Owner)
    : TForm(Owner)
{
    try{
        DModuleCliente->CDSProcedimento->Active = true;
        if(DModuleCliente->IBTProcedimento->InTransaction)
            DModuleCliente->IBTProcedimento->Commit();
    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao abrir o formulário de clientes.\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
        Close();
    }
}
//---------------------------------------------------------------------------
void __fastcall TFCadProcedimento::FormClose(TObject *Sender,
      TCloseAction &Action)
{
    try{
        DModuleCliente->CDSProcedimento->Active = false;
    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao fechar o formulário de procedimentos.\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }

    Action = caFree;
}
//---------------------------------------------------------------------------
void __fastcall TFCadProcedimento::BtnGravarClick(TObject *Sender)
{
    DModuleCliente->CDSProcedimento->ApplyUpdates(-1);
    DModuleCliente->CDSProcedimento->Edit();
    Application->MessageBox("Cadastro realizado com sucesso",
        "Sucesso",MB_ICONINFORMATION|MB_OK);
}
//---------------------------------------------------------------------------

void __fastcall TFCadProcedimento::BtnFecharClick(TObject *Sender)
{
    Close();
}
//---------------------------------------------------------------------------
void __fastcall TFCadProcedimento::BtnCancelarClick(TObject *Sender)
{
    bool ConfirmaCancelamento = Application->MessageBox("Deseja cancelar as alterações realizadas no cadastro?","Confirmar",
        MB_ICONINFORMATION|MB_YESNO) == IDYES;

    if(ConfirmaCancelamento){
        DModuleCliente->CDSProcedimento->CancelUpdates();
    }
}
//---------------------------------------------------------------------------
void __fastcall TFCadProcedimento::BtnNovoClick(TObject *Sender)
{
    DModuleCliente->CDSProcedimento->Append();
}
//---------------------------------------------------------------------------
void __fastcall TFCadProcedimento::BtnDeletarClick(TObject *Sender)
{
    bool ConfirmaExclusao = Application->MessageBox("Deseja excluir o cadastro do procedimento?","Confirmar",
        MB_ICONINFORMATION|MB_YESNO) == IDYES;

    if(ConfirmaExclusao){
        if(!DModuleCliente->CDSProcedimento->IsEmpty()){
            DModuleCliente->CDSProcedimento->Delete();
            DModuleCliente->CDSProcedimento->ApplyUpdates(-1);
        }
    }
}
//---------------------------------------------------------------------------

void __fastcall TFCadProcedimento::DBGProcedimentoDrawColumnCell(
      TObject *Sender, const TRect &Rect, int DataCol, TColumn *Column,
      TGridDrawState State)
{
    if(DModuleCliente->CDSProcedimento->RecNo % 2){
        DBGProcedimento->Canvas->Brush->Color = clCream;
    }else{
        DBGProcedimento->Canvas->Brush->Color = clWindow;
    }
    if(State.Contains(gdSelected)){
        DBGProcedimento->Canvas->Brush->Color = clMoneyGreen;
    }
    DBGProcedimento->DefaultDrawColumnCell(Rect, DataCol, Column, State);
}

//---------------------------------------------------------------------------

