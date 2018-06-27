//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "CadBase.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFCadBase *FCadBase;
//---------------------------------------------------------------------------

__fastcall TFCadBase::TFCadBase(TComponent* Owner)
    : TForm(Owner)
{
}

//---------------------------------------------------------------------------

void __fastcall TFCadBase::FormCreate(TObject *Sender)
{
    ConfiguraEventosForm();
    ConfiguraCharCaseForm();
}

//---------------------------------------------------------------------------

void __fastcall TFCadBase::ChangeEnter(TObject * Sender)
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

void __fastcall TFCadBase::ChangeExit(TObject *Sender)
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

void __fastcall TFCadBase::HabilitaBarraBotoes(void)
{
    BtnNovo->Enabled     = !(this->FDataSetBase->State == dsInsert && this->FDataSetBase->State == dsEdit);
    BtnGravar->Enabled   = (this->FDataSetBase->State  == dsInsert || this->FDataSetBase->State == dsEdit);
    BtnEditar->Enabled   = (this->FDataSetBase->State  == dsBrowse);
    BtnDeletar->Enabled  = (this->FDataSetBase->State  == dsBrowse || this->FDataSetBase->State == dsEdit);
    BtnCancelar->Enabled = (this->FDataSetBase->State  == dsInsert || this->FDataSetBase->State == dsEdit);
}

//---------------------------------------------------------------------------

void __fastcall TFCadBase::HabilitaCamposFormulario(bool Status)
{
    for(int i=0; i < ComponentCount; i++){
        if(dynamic_cast <TDBEdit*> (Components[i]) != NULL){
            dynamic_cast <TDBEdit*> (Components[i])->Enabled = Status;

        } else if(dynamic_cast <TEdit*> (Components[i]) != NULL){
            dynamic_cast <TEdit*> (Components[i])->Enabled = Status;

        } else if(dynamic_cast <TDBLookupComboBox*> (Components[i]) != NULL){
            dynamic_cast <TDBLookupComboBox*> (Components[i])->Enabled = Status;

        } else if(dynamic_cast <TDBComboBox*> (Components[i]) != NULL){
            dynamic_cast <TDBComboBox*> (Components[i])->Enabled = Status;

        } else if(dynamic_cast <TDBMemo*> (Components[i]) != NULL){
            dynamic_cast <TDBMemo*> (Components[i])->Enabled = Status;

        } else if(dynamic_cast <TDBCheckBox*> (Components[i]) != NULL){
            dynamic_cast <TDBCheckBox*> (Components[i])->Enabled = Status;

        } else if(dynamic_cast <TDBGrid*> (Components[i]) != NULL){
            dynamic_cast <TDBGrid*> (Components[i])->Enabled = Status;
        }
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadBase::ConfiguraCharCaseForm(void)
{
    for(int i=0; i < ComponentCount; i++){
        if(dynamic_cast <TDBEdit*> (Components[i]) != NULL){
            dynamic_cast <TDBEdit*> (Components[i])->CharCase = ecUpperCase;
        }
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadBase::ConfiguraEventosForm(void)
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

void __fastcall TFCadBase::BtnNovoClick(TObject *Sender)
{
    FDataSetBase->Append();
    HabilitaBarraBotoes();
    HabilitaCamposFormulario(true);
}

//---------------------------------------------------------------------------

void __fastcall TFCadBase::SetDataSetBase(TClientDataSet* ClientDS)
{
    if(this->FDataSetBase != ClientDS) {
        this->FDataSetBase = ClientDS;
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadBase::BtnGravarClick(TObject *Sender)
{
    this->FDataSetBase->Post();
    this->FDataSetBase->ApplyUpdates(-1);
    Application->MessageBox("Cadastro realizado com sucesso", "Sucesso", MB_ICONINFORMATION|MB_OK);

    HabilitaBarraBotoes();
    HabilitaCamposFormulario(false);
}

//---------------------------------------------------------------------------

void __fastcall TFCadBase::BtnEditarClick(TObject *Sender)
{
    this->FDataSetBase->Edit();
    HabilitaBarraBotoes();
    HabilitaCamposFormulario(true);
}

//---------------------------------------------------------------------------

void __fastcall TFCadBase::BtnCancelarClick(TObject *Sender)
{
    bool ConfirmaCancelamento = Application->MessageBox("Deseja cancelar as alterações realizadas no cadastro?","Confirmar",
        MB_ICONINFORMATION|MB_YESNO) == IDYES;

    if(ConfirmaCancelamento){
        this->FDataSetBase->CancelUpdates();
        HabilitaBarraBotoes();
        HabilitaCamposFormulario(false);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadBase::BtnDeletarClick(TObject *Sender)
{
    bool ConfirmaExclusao = Application->MessageBox("Deseja excluir o cadastro?", "Confirmar",
        MB_ICONINFORMATION|MB_YESNO) == IDYES;

    if(ConfirmaExclusao){
        if(!this->FDataSetBase->IsEmpty()){
            this->FDataSetBase->Delete();
            this->FDataSetBase->ApplyUpdates(0);
            this->FDataSetBase->Refresh();
            HabilitaBarraBotoes();
            HabilitaCamposFormulario(false);
        }
    }    
}

//---------------------------------------------------------------------------

void __fastcall TFCadBase::BtnFecharClick(TObject *Sender)
{
    Close();    
}

//---------------------------------------------------------------------------

void __fastcall TFCadBase::FormClose(TObject *Sender, TCloseAction &Action)
{
    if(this->FDataSetBase->State == dsInsert || this->FDataSetBase->State == dsEdit) {
        Application->MessageBox("É necessário gravar ou cancelar antes de sair do formulário", "", MB_ICONINFORMATION|MB_OK);
        Action = caNone;
    }else{
        try{
            this->FDataSetBase->Active = false;
        }catch(Exception &excecao){
            AnsiString erro = excecao.Message;
            String ErroNaConexao =
                "Ocorreu um erro ao fechar o formulário.\n\nDescrição do erro:\n" + erro;
            Application->MessageBox(ErroNaConexao.c_str(), "Atenção", MB_ICONERROR|MB_OK);
        }
        Action = caFree;
    }
}

//---------------------------------------------------------------------------

