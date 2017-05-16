//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "CadSenhas.h"
#include "DMCliente.h"

//---------------------------------------------------------------------------

#pragma package(smart_init)
#pragma resource "*.dfm"
TFCadSenha *FCadSenha;

//---------------------------------------------------------------------------

__fastcall TFCadSenha::TFCadSenha(TComponent* Owner)
    : TForm(Owner)
{
}

//---------------------------------------------------------------------------

void __fastcall TFCadSenha::FormClose(TObject *Sender,
      TCloseAction &Action)
{
    Action = caFree;
}

//---------------------------------------------------------------------------

void __fastcall TFCadSenha::BtnNovoClick(TObject *Sender)
{
    DModuleCliente->CDSContato->Append();
}

//---------------------------------------------------------------------------

void __fastcall TFCadSenha::BtnGravarClick(TObject *Sender)
{
    DModuleCliente->CDSContato->ApplyUpdates(-1);
    DModuleCliente->CDSContato->Edit();
    Application->MessageBox("Cadastro realizado com sucesso",
        "Sucesso",MB_ICONINFORMATION|MB_OK);
}

//---------------------------------------------------------------------------

void __fastcall TFCadSenha::BtnDeletarClick(TObject *Sender)
{
    bool ConfirmaExclusao = Application->MessageBox("Deseja excluir o cadastro da senha?","Confirmar",
        MB_ICONINFORMATION|MB_YESNO) == IDYES;

    if(ConfirmaExclusao){
        if(!DModuleCliente->CDSContato->IsEmpty()){
            DModuleCliente->CDSContato->Delete();
            DModuleCliente->CDSContato->ApplyUpdates(-1);
        }
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadSenha::BtnCancelarClick(TObject *Sender)
{
    bool ConfirmaCancelamento = Application->MessageBox("Deseja cancelar as alterações realizadas no cadastro?","Confirmar",
        MB_ICONINFORMATION|MB_YESNO) == IDYES;

    if(ConfirmaCancelamento){
        DModuleCliente->CDSContato->CancelUpdates();
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadSenha::BtnFecharClick(TObject *Sender)
{
    Close();
}

//---------------------------------------------------------------------------

bool __fastcall TFCadSenha::ValidaSenha()
{
    try{
        String Usuario = DModuleCliente->CDSContatoNMCONTATO->AsString;
        String Senha = DModuleCliente->CDSContatoSENHA->AsString;
        String ContraSenha = DModuleCliente->CDSContatoCONTRASENHA->AsString;
        TDateTime DataNascimento = DModuleCliente->CDSContatoDATANASCIMENTO->AsDateTime;
        if(Usuario == ""){
            String CamposObrigatorios =
                "Para realizar o cadastro você deve informar pelo menos o nome do usuário.";
            Application->MessageBox(CamposObrigatorios.c_str(), "Atenção",MB_ICONERROR|MB_OK);
            return false;
        }
        return true;

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao validar o cadastro de senhas.\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------
