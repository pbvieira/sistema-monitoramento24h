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

TColor COLOR_HEADER_FORM;
TColor COLOR_GRID_SELECTED_ROW;
TColor COLOR_GRID_ALTERNATE_ROW;
TColor COLOR_FIELD_FORM_FOCUS;
TColor COLOR_FIELD_FORM_OCORRENCIA_FOCUS;

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

            // Temas visuais
            COLOR_HEADER_FORM = clPurple;
            COLOR_GRID_SELECTED_ROW = clHighlight;
            COLOR_GRID_ALTERNATE_ROW = 0x00FAE6E6;
            COLOR_FIELD_FORM_FOCUS = 0x00FFC4FF;
            COLOR_FIELD_FORM_OCORRENCIA_FOCUS = 0x00F2E5D6;

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

