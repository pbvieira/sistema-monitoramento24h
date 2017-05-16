//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "CadFilial.h"
#include "DMApp.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFCadFilial *FCadFilial;
//---------------------------------------------------------------------------
__fastcall TFCadFilial::TFCadFilial(TComponent* Owner)
    : TForm(Owner)
{
    try{
        DModule->CDSFilial->Active = true;
        if(DModule->IBTFilial->InTransaction)
            DModule->IBTFilial->Commit();

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao abrir o formulário de filiais."
            "\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);

        Close();
    }
}
//---------------------------------------------------------------------------
void __fastcall TFCadFilial::FormClose(TObject *Sender,
      TCloseAction &Action)
{
    try{
        DModule->CDSFilial->Active = false;
    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao fechar o formulário de filiais."
            "\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }

    Action = caFree;
}
//---------------------------------------------------------------------------
void __fastcall TFCadFilial::BtnGravarClick(TObject *Sender)
{
    DModule->CDSFilial->ApplyUpdates(-1);
    DModule->CDSFilial->Edit();
    Application->MessageBox("Cadastro realizado com sucesso",
        "Sucesso",MB_ICONINFORMATION|MB_OK);
}
//---------------------------------------------------------------------------
void __fastcall TFCadFilial::BtnNovoClick(TObject *Sender)
{
    DModule->CDSFilial->Append();
}
//---------------------------------------------------------------------------
void __fastcall TFCadFilial::BtnCancelarClick(TObject *Sender)
{
    bool ConfirmaCancelamento = Application->MessageBox("Deseja cancelar as alterações realizadas no cadastro?","Confirmar",
        MB_ICONINFORMATION|MB_YESNO) == IDYES;

    if(ConfirmaCancelamento){
        DModule->CDSFilial->CancelUpdates();
    }

}
//---------------------------------------------------------------------------
void __fastcall TFCadFilial::BtnDeletarClick(TObject *Sender)
{
    bool ConfirmaExclusao = Application->MessageBox("Deseja excluir o cadastro da filial?","Confirmar",
        MB_ICONINFORMATION|MB_YESNO) == IDYES;

    if(ConfirmaExclusao){
        if(!DModule->CDSFilial->IsEmpty()){
            DModule->CDSFilial->Delete();
            DModule->CDSFilial->ApplyUpdates(-1);
        }
    }    
}
//---------------------------------------------------------------------------
void __fastcall TFCadFilial::BtnFecharClick(TObject *Sender)
{
    Close();    
}
//---------------------------------------------------------------------------

void __fastcall TFCadFilial::DBGFilialDrawColumnCell(TObject *Sender,
      const TRect &Rect, int DataCol, TColumn *Column,
      TGridDrawState State)
{
    if(DModule->CDSFilial->RecNo % 2){
        DBGFilial->Canvas->Brush->Color = clCream;
    }else{
        DBGFilial->Canvas->Brush->Color = clWindow;
    }
    if(State.Contains(gdSelected)){
        DBGFilial->Canvas->Brush->Color = clMoneyGreen;
    }
    DBGFilial->DefaultDrawColumnCell(Rect, DataCol, Column, State);
}
//---------------------------------------------------------------------------

