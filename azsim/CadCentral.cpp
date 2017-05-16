//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "CadCentral.h"
#include "DMApp.h"
#include "DMCliente.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFCadCentral *FCadCentral;
//---------------------------------------------------------------------------
__fastcall TFCadCentral::TFCadCentral(TComponent* Owner)
    : TForm(Owner)
{
}

//---------------------------------------------------------------------------

void __fastcall TFCadCentral::FormCreate(TObject *Sender)
{
    ConfiguraEventosForm();
    ConfiguraCharCaseForm();
}

//---------------------------------------------------------------------------

void __fastcall TFCadCentral::ConsultaCentral(int CodigoCentral)
{
    AnsiString SQL_CENTRAL =
        "SELECT CDCENTRAL, CDCLIENTE, OBSCOMERCIAL, LOCALINSTALACACAO, OBSTECNICA "
        "FROM CENTRAL WHERE CDCENTRAL = :CDCENTRAL";
    try{
        DModuleCliente->CDSCentral->Active = false;
        DModuleCliente->IBQCentral->SQL->Clear();
        DModuleCliente->IBQCentral->SQL->Text = SQL_CENTRAL;
        if(CodigoCentral > 0){
            DModuleCliente->IBQCentral->ParamByName("CDCENTRAL")->AsInteger = CodigoCentral;
        }else{
            DModuleCliente->IBQCentral->ParamByName("CDCENTRAL")->AsInteger = -1;
        }

        DModuleCliente->CDSCentral->Active = true;
        if(DModuleCliente->IBTCentral->InTransaction)
            DModuleCliente->IBTCentral->Commit();

        if(this->CodigoCliente > 0 ||
            DModuleCliente->CDSCentral->RecordCount <= 0){

            DModuleCliente->CDSCentral->Append();
            DModuleCliente->CDSCentralCDCENTRAL->AsInteger = 0;
            DModuleCliente->CDSCentralCDCLIENTE->AsInteger = this->CodigoCliente;
        }

        ConfiguraConsultaAuxiliar();
        HabilitaBarraBotoes();
        HabilitaCamposFormulario(false);

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao abrir o formulário de centrais."
            "\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadCentral::FormClose(TObject *Sender,
      TCloseAction &Action)
{
    if(DModuleCliente->DSCentral->State == dsInsert || DModuleCliente->DSCentral->State == dsEdit) {
        Application->MessageBox("É necessário gravar ou cancelar antes de sair do formulário","",MB_ICONINFORMATION|MB_OK);
        Action = caNone;
    }else{
        try{
            DModuleCliente->CDSCentral->Active = false;
        }catch(Exception &excecao){
            AnsiString erro = excecao.Message;
            String ErroNaConexao =
                "Ocorreu um erro ao fechar o formulário de contratos."
                "\n\nDescrição do erro:\n" + erro;
            Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
        }
        Action = caFree;
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadCentral::ChangeEnter(TObject *Sender)
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

void __fastcall TFCadCentral::ChangeExit(TObject *Sender)
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

void __fastcall TFCadCentral::HabilitaBarraBotoes(void)
{
    BtnNovo->Enabled     = !(DModuleCliente->DSCentral->State == dsInsert && DModuleCliente->DSCentral->State == dsEdit);
    BtnGravar->Enabled   = (DModuleCliente->DSCentral->State  == dsInsert || DModuleCliente->DSCentral->State == dsEdit);
    BtnEditar->Enabled   = (DModuleCliente->DSCentral->State  == dsBrowse);
    BtnDeletar->Enabled  = (DModuleCliente->DSCentral->State  == dsBrowse || DModuleCliente->DSCentral->State == dsEdit);
    BtnCancelar->Enabled = (DModuleCliente->DSCentral->State  == dsInsert || DModuleCliente->DSCentral->State == dsEdit);
    BtnPesquisa->Enabled = !(DModuleCliente->DSCentral->State == dsInsert && DModuleCliente->DSCentral->State == dsEdit);
}

//---------------------------------------------------------------------------

void __fastcall TFCadCentral::HabilitaCamposFormulario(bool Status)
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

        } else if(dynamic_cast <TDBNavigator*> (Components[i]) != NULL){
            dynamic_cast <TDBNavigator*> (Components[i])->Enabled = Status;

        } else if(dynamic_cast <TDBGrid*> (Components[i]) != NULL){
            dynamic_cast <TDBGrid*> (Components[i])->Enabled = Status;
        }
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadCentral::ConfiguraCharCaseForm(void)
{
    for(int i=0; i < ComponentCount; i++){
        if(dynamic_cast <TDBEdit*> (Components[i]) != NULL){
            dynamic_cast <TDBEdit*> (Components[i])->CharCase = ecUpperCase;
        }
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadCentral::ConfiguraEventosForm(void)
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

bool __fastcall TFCadCentral::ValidaCentral()
{
    String CodigoCliente = DModuleCliente->CDSCentralCDCLIENTE->AsString;
    String Local = DModuleCliente->CDSCentralLOCALINSTALACACAO->AsString;
    String Modelo = DModuleCliente->CDSCentralOBSTECNICA->AsString;

    if(CodigoCliente  == "" || Local == "" || Modelo == ""){
        String CamposObrigatorios =
            "São obrigatórios os seguintes campos da central:\n"
            "Número do Cliente, Local da Instalação e Modelo da Central";
        Application->MessageBox(CamposObrigatorios.c_str(),"Atenção", MB_ICONERROR|MB_OK);
        return false;
    }

    return true;
}

//---------------------------------------------------------------------------

void __fastcall TFCadCentral::BtnNovoClick(TObject *Sender)
{
    DModuleCliente->CDSCentral->Append();
    DModuleCliente->CDSCentralCDCENTRAL->AsInteger = 0;
    ConfiguraConsultaAuxiliar();
    HabilitaBarraBotoes();
    HabilitaCamposFormulario(true);
    EdtCodigo->SetFocus();
}

//---------------------------------------------------------------------------

void __fastcall TFCadCentral::BtnGravarClick(TObject *Sender)
{
    DModuleCliente->CDSCentral->Post();
    DModuleCliente->CDSCentral->ApplyUpdates(1);
    Application->MessageBox("Cadastro realizado com sucesso","Sucesso",MB_ICONINFORMATION|MB_OK);
    HabilitaBarraBotoes();
    HabilitaCamposFormulario(false);
}

//---------------------------------------------------------------------------

void __fastcall TFCadCentral::BtnEditarClick(TObject *Sender)
{
    DModuleCliente->CDSCentral->Edit();
    HabilitaBarraBotoes();
    HabilitaCamposFormulario(true);
    EdtCodigo->SetFocus();
}

//---------------------------------------------------------------------------

void __fastcall TFCadCentral::BtnCancelarClick(TObject *Sender)
{
    bool ConfirmaCancelamento = Application->MessageBox("Deseja cancelar as alterações realizadas no cadastro?","Confirmar",
        MB_ICONINFORMATION|MB_YESNO) == IDYES;

    if(ConfirmaCancelamento){
        DModuleCliente->CDSCentral->CancelUpdates();
        ConfiguraConsultaAuxiliar();
        HabilitaBarraBotoes();
        HabilitaCamposFormulario(false);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadCentral::BtnDeletarClick(TObject *Sender)
{
    bool ConfirmaExclusao = Application->MessageBox("Deseja excluir o cadastro da central?","Confirmar",
        MB_ICONINFORMATION|MB_YESNO) == IDYES;

    if(ConfirmaExclusao){
        if(!DModuleCliente->CDSCentral->IsEmpty()){
            DModuleCliente->CDSCentral->Delete();
            DModuleCliente->CDSCentral->ApplyUpdates(-1);
            DModuleCliente->CDSCentral->Refresh();
            ConfiguraConsultaAuxiliar();
            HabilitaBarraBotoes();
            HabilitaCamposFormulario(false);
        }
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadCentral::BtnFecharClick(TObject *Sender)
{
    Close();
}

//---------------------------------------------------------------------------

void __fastcall TFCadCentral::ConsultaCliente(int CdCliente)
{
    try{
        AnsiString SQL_FILTRO = "SELECT NMCLIENTE FROM CLIENTE WHERE CDCLIENTE = :CDCLIENTE";

        if(CdCliente > 0){
            DModule->IBQConsAuxCadastros->SQL->Clear();
            DModule->IBQConsAuxCadastros->SQL->Text = SQL_FILTRO;
            DModule->IBQConsAuxCadastros->ParamByName("CDCLIENTE")->AsInteger = CdCliente;
            DModule->IBQConsAuxCadastros->Open();

            if(DModule->IBQConsAuxCadastros->RecordCount > 0){
                EdtNomeCliente->Text = DModule->IBQConsAuxCadastros->FieldByName("NMCLIENTE")->AsString;;
            }else{
                EdtNomeCliente->Text = "";
                String ClienteInexistente = "O código de cliente informado não existe!";
                Application->MessageBox(ClienteInexistente.c_str(),
                    "Atenção",MB_ICONINFORMATION|MB_OK);
            }

            DModule->IBQConsAuxCadastros->Close();
        }else{
            EdtNomeCliente->Text = "";
        }

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao consultar o cadastro do cliente."
            "\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadCentral::EdtNomeClienteEnter(TObject *Sender)
{
    AnsiString Codigo = EdtCodigo->Text;
    if(Codigo != "")
        ConsultaCliente(StrToInt(Codigo));
}

//---------------------------------------------------------------------------

void __fastcall TFCadCentral::ConfiguraConsultaAuxiliar()
{
    AnsiString Codigo = EdtCodigo->Text;
    if(Codigo == ""){
        EdtNomeCliente->Text = "";
    }else{
        ConsultaCliente(StrToInt(Codigo));
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadCentral::DBGSetorDrawColumnCell(TObject *Sender,
      const TRect &Rect, int DataCol, TColumn *Column,
      TGridDrawState State)
{
    if(DModuleCliente->CDSSetor->RecNo % 2){
        DBGSetor->Canvas->Brush->Color = 15138520;
    }else{
        DBGSetor->Canvas->Brush->Color = clWindow;
    }

    if(State.Contains(gdSelected)){
        DBGSetor->Canvas->Brush->Color = clTeal;
    }

    DBGSetor->DefaultDrawColumnCell(Rect, DataCol, Column, State);
}

//---------------------------------------------------------------------------

