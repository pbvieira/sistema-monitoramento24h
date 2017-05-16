//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "CadClienteProcedimento.h"
#include "DMCliente.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFCadClienteProcedimento *FCadClienteProcedimento;
//---------------------------------------------------------------------------
__fastcall TFCadClienteProcedimento::TFCadClienteProcedimento(TComponent* Owner)
    : TForm(Owner)
{
}

//---------------------------------------------------------------------------

void __fastcall TFCadClienteProcedimento::FormCreate(TObject *Sender)
{
    ConfiguraEventosForm();
}
//---------------------------------------------------------------------------

void __fastcall TFCadClienteProcedimento::BtnFecharClick(TObject *Sender)
{
    Close();    
}

//---------------------------------------------------------------------------

void __fastcall TFCadClienteProcedimento::BtnSelecionarClick(
      TObject *Sender)
{
    if(CmbProcedimento->Text != ""){
        MmProcedimentos->Lines->Append(DModuleCliente->CDSProcedimentoDEPROCEDIMENTO->AsString);
        DModuleCliente->CDSClientePROCEDIMENTOS->AsString = MmProcedimentos->Lines->GetText();
    }    
}

//---------------------------------------------------------------------------

void __fastcall TFCadClienteProcedimento::ConfiguraEventosForm(void)
{
    for(int i=0; i < ComponentCount; i++){
        if(dynamic_cast <TDBEdit*> (Components[i]) != NULL){
            dynamic_cast <TDBEdit*> (Components[i])->OnEnter = ChangeEnter;
            dynamic_cast <TDBEdit*> (Components[i])->OnExit = ChangeExit;
        }

        /*if(dynamic_cast <TEdit*> (Components[i]) != NULL){
            dynamic_cast <TEdit*> (Components[i])->OnEnter = ChangeEnter;
            dynamic_cast <TEdit*> (Components[i])->OnExit = ChangeExit;
        }*/

        if(dynamic_cast <TDBLookupComboBox*> (Components[i]) != NULL){
            dynamic_cast <TDBLookupComboBox*> (Components[i])->OnEnter = ChangeEnter;
            dynamic_cast <TDBLookupComboBox*> (Components[i])->OnExit = ChangeExit;
        }

        if(dynamic_cast <TDBComboBox*> (Components[i]) != NULL){
            dynamic_cast <TDBComboBox*> (Components[i])->OnEnter = ChangeEnter;
            dynamic_cast <TDBComboBox*> (Components[i])->OnExit = ChangeExit;
        }

        if(dynamic_cast <TDBMemo*> (Components[i]) != NULL){
            dynamic_cast <TDBMemo*> (Components[i])->OnEnter = ChangeEnter;
            dynamic_cast <TDBMemo*> (Components[i])->OnExit = ChangeExit;
        }
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadClienteProcedimento::ChangeEnter(TObject * Sender)
{
    if(dynamic_cast <TDBEdit*> (Sender) != NULL){
        dynamic_cast <TDBEdit*> (Sender)->Color = 15138520;

    } else if(dynamic_cast <TEdit*> (Sender) != NULL){
        dynamic_cast <TEdit*> (Sender)->Color = 15138520;

    } else if(dynamic_cast <TDBLookupComboBox*> (Sender) != NULL){
        dynamic_cast <TDBLookupComboBox*> (Sender)->Color = 15138520;

    } else if(dynamic_cast <TDBComboBox*> (Sender) != NULL){
        dynamic_cast <TDBComboBox*> (Sender)->Color = 15138520;

    } else if(dynamic_cast <TDBMemo*> (Sender) != NULL){
        dynamic_cast <TDBMemo*> (Sender)->Color = 15138520;
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadClienteProcedimento::ChangeExit(TObject *Sender)
{
    if(dynamic_cast <TDBEdit*> (Sender) != NULL){
        TDBEdit *Edit = dynamic_cast <TDBEdit*> (Sender);
        Edit->Color = clWindow;

    }else if(dynamic_cast <TEdit*> (Sender) != NULL){
        TEdit *Edit = dynamic_cast <TEdit*> (Sender);
        Edit->Color = clWindow;

    } else if(dynamic_cast <TDBLookupComboBox*> (Sender) != NULL){
        TDBLookupComboBox *Combo = dynamic_cast <TDBLookupComboBox*> (Sender);
        Combo->Color = clWindow;

    } else if(dynamic_cast <TDBComboBox*> (Sender) != NULL){
        TDBComboBox *Combo = dynamic_cast <TDBComboBox*> (Sender);
        Combo->Color = clWindow;

    } else if(dynamic_cast <TDBMemo*> (Sender) != NULL){
        TDBMemo *Memo = dynamic_cast <TDBMemo*> (Sender);
        Memo->Color = clWindow;
    }
}

//---------------------------------------------------------------------------

