//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "Login.h"
#include "DMApp.h"
#include "Home.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

int CDUSUARIO;
AnsiString NMUSUARIO;
AnsiString USUARIO;
bool ISADMINISTRADOR;
bool ATENDEROCORRENCIAS;

TFLogin *FLogin;
//---------------------------------------------------------------------------
__fastcall TFLogin::TFLogin(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFLogin::BtnEntrarClick(TObject *Sender)
{
    try{
        DModule->IBQLogin->ParamByName("LOGIN")->AsString = EdtLogin->Text;
        DModule->IBQLogin->ParamByName("SENHA")->AsString = EdtSenha->Text;
        DModule->IBQLogin->Active = true;

        if(DModule->IBQLogin->RecordCount <= 0){
            Application->MessageBox("Usuário ou senha inválidos.", "Atenção", MB_ICONERROR|MB_OK);
            EdtLogin->SetFocus();
        }else{
            CDUSUARIO = DModule->IBQLoginCDUSUARIO->AsInteger;
            NMUSUARIO = DModule->IBQLoginLOGIN->AsString;
            USUARIO = DModule->IBQLoginLOGIN->AsString;
            ISADMINISTRADOR = DModule->IBQLoginISADMIN->AsInteger > 0;
            ATENDEROCORRENCIAS = CkbAtenderOC->Checked;
            FHome = new TFHome(this);
            FHome->Show();
            this->Visible = false;
        }

        if(DModule->IBTLogin->InTransaction)
            DModule->IBTLogin->Commit();

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao abrir o sistema.\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(), "Atenção", MB_ICONERROR|MB_OK);
        Close();
    }
}
//---------------------------------------------------------------------------
void __fastcall TFLogin::FormShow(TObject *Sender)
{
    EdtLogin->SetFocus();    
}
//---------------------------------------------------------------------------

