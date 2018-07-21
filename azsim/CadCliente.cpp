//---------------------------------------------------------------------------
#include <vcl.h>
#include <typeinfo.h>
#include <stdio.h>
#pragma hdrstop

#include "CadCliente.h"
#include "DMApp.h"
#include "Home.h"
#include "DMCliente.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

#define FORM_CLIENTE    0
#define FORM_CONTATO    1

TFCadCliente *FCadCliente;

//---------------------------------------------------------------------------

__fastcall TFCadCliente::TFCadCliente(TComponent* Owner)
    : TForm(Owner)
{
}

//---------------------------------------------------------------------------

void __fastcall TFCadCliente::FormCreate(TObject *Sender)
{
    ConfiguraEventosForm();
    ConfiguraCharCaseForm();
}

//---------------------------------------------------------------------------

void __fastcall TFCadCliente::ConsultaCliente(int CodigoCliente)
{
    AnsiString SQL_ULTIMO_CLIENTE =
        "SELECT  CDCLIENTE, CDFILIAL, BAIRRO, CEP, CIDADE, "
        "DOCUMENTO, ENDERECO, INSCMUNICIPAL, NMCLIENTE, NMFANTASIA, TPPESSOA, UF, "
        "OBSERVACAO, PROCEDIMENTOS, PONTOREF, KMBASE, CHAVE, DATACADASTRO, DATAALTERACAO, "
        "FONE1, FONEOBS1, FONE2, FONEOBS2, FONE3, FONEOBS3, FONE4, FONEOBS4, FONE5, FONEOBS5, FONE6, FONEOBS6, "
        "FONE7, FONEOBS7, FONE8, FONEOBS8 "
        "FROM CLIENTE WHERE CDCLIENTE = -1"; //(SELECT MAX(CDCLIENTE) FROM CLIENTE)

    AnsiString SQL_CLIENTE =
        "SELECT  CDCLIENTE, CDFILIAL, BAIRRO, CEP, CIDADE, "
        "DOCUMENTO, ENDERECO, INSCMUNICIPAL, NMCLIENTE, NMFANTASIA, TPPESSOA, UF, "
        "OBSERVACAO, PROCEDIMENTOS, PONTOREF, KMBASE, CHAVE, DATACADASTRO, DATAALTERACAO, "
        "FONE1, FONEOBS1, FONE2, FONEOBS2, FONE3, FONEOBS3, FONE4, FONEOBS4, FONE5, FONEOBS5, FONE6, FONEOBS6, "
        "FONE7, FONEOBS7, FONE8, FONEOBS8 "
        "FROM CLIENTE WHERE CDCLIENTE = :CDCLIENTE";

    try{
        // Fecha os CDS para os casos da tela já estar aberta (Consulta de cliente)
        DModuleCliente->CDSCliente->Active = false;
        DModuleCliente->CDSContato->Active = false;
        DModule->CDSFilial->Active = false;
        DModuleCliente->CDSTipoContato->Active = false;
        DModuleCliente->CDSProcedimento->Active = false;

        DModuleCliente->IBQCliente->SQL->Clear();
        if(CodigoCliente > 0){
            DModuleCliente->IBQCliente->SQL->Text = SQL_CLIENTE;
            DModuleCliente->IBQCliente->ParamByName("CDCLIENTE")->AsInteger = CodigoCliente;
        }else{
            DModuleCliente->IBQCliente->SQL->Text = SQL_ULTIMO_CLIENTE;
        }

        DModuleCliente->CDSCliente->Active = true;
        DModuleCliente->CDSContato->Active = true;
        DModule->CDSFilial->Active = true;
        DModuleCliente->CDSTipoContato->Active = true;
        DModuleCliente->CDSProcedimento->Active = true;

        if(DModuleCliente->IBTCliente->InTransaction)
            DModuleCliente->IBTCliente->Commit();

        if(DModule->IBTFilial->InTransaction)
            DModule->IBTFilial->Commit();

        if(DModuleCliente->IBTTipoContato->InTransaction)
            DModuleCliente->IBTTipoContato->Commit();

        if(DModuleCliente->IBTProcedimento->InTransaction)
            DModuleCliente->IBTProcedimento->Commit();

        HabilitaBarraBotoes();
        HabilitaCamposFormulario(false, true);

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao abrir o formulário de clientes.\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
        Close();
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadCliente::FormClose(TObject *Sender,
      TCloseAction &Action)
{
    if(DModuleCliente->DSCliente->State == dsInsert || DModuleCliente->DSCliente->State == dsEdit) {
        Application->MessageBox("É necessário gravar ou cancelar antes de sair do formulário","",MB_ICONINFORMATION|MB_OK);
        Action = caNone;
    }else{
        try{
            DModuleCliente->CDSCliente->Active = false;
            DModule->CDSFilial->Active = false;
            DModuleCliente->CDSTipoContato->Active = false;
        }catch(Exception &excecao){
            AnsiString erro = excecao.Message;
            String ErroNaConexao =
                "Ocorreu um erro ao fechar o formulário de clientes."
                "\n\nDescrição do erro:\n" + erro;
            Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
        }
        Action = caFree;
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadCliente::GeraClienteId(void)
{
    try{
        DModuleCliente->IBSPGenIdCliente->ExecProc();
        int id = DModuleCliente->IBSPGenIdCliente->ParamByName("ID")->AsInteger;
        DModuleCliente->CDSClienteCDCLIENTE->AsInteger = id;
        DModuleCliente->IBTGenIdCliente->Commit();

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao gerar o código do cliente."
            "\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadCliente::BtnFecharClick(TObject *Sender)
{
    Close();
}

//---------------------------------------------------------------------------

void __fastcall TFCadCliente::BtnNovoClick(TObject *Sender)
{
    DModuleCliente->CDSCliente->Append();
    HabilitaBarraBotoes();
    HabilitaCamposFormulario(true, false);
    CmbFilial->SetFocus();
}

//---------------------------------------------------------------------------

void __fastcall TFCadCliente::BtnGravarClick(TObject *Sender)
{
    DModuleCliente->CDSCliente->Post();
    DModuleCliente->CDSCliente->ApplyUpdates(-1);
    Application->MessageBox("Cadastro realizado com sucesso", "Sucesso", MB_ICONINFORMATION|MB_OK);
    HabilitaBarraBotoes();
    HabilitaCamposFormulario(false, true);
}

//---------------------------------------------------------------------------

void __fastcall TFCadCliente::BtnEditarClick(TObject *Sender)
{
    DModuleCliente->CDSCliente->Edit();
    HabilitaBarraBotoes();
    HabilitaCamposFormulario(true, false);
    CmbFilial->SetFocus();
}

//---------------------------------------------------------------------------

void __fastcall TFCadCliente::BtnCancelarClick(TObject *Sender)
{
    bool ConfirmaCancelamento = Application->MessageBox("Deseja cancelar as alterações realizadas no cadastro?","Confirmar",
        MB_ICONINFORMATION|MB_YESNO) == IDYES;

    if(ConfirmaCancelamento){
        DModuleCliente->CDSCliente->CancelUpdates();
        HabilitaBarraBotoes();
        HabilitaCamposFormulario(false, true);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadCliente::BtnDeletarClick(TObject *Sender)
{
    bool ConfirmaExclusao = Application->MessageBox("Deseja excluir o cadastro do cliente?","Confirmar",
        MB_ICONINFORMATION|MB_YESNO) == IDYES;

    if(ConfirmaExclusao){
        if(!DModuleCliente->CDSCliente->IsEmpty()){
            DModuleCliente->CDSCliente->Delete();
            DModuleCliente->CDSCliente->ApplyUpdates(-1);
            DModuleCliente->CDSCliente->Refresh();
            HabilitaBarraBotoes();
            HabilitaCamposFormulario(false, true);
        }
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadCliente::ChangeEnter(TObject *Sender)
{
    if(dynamic_cast <TDBEdit*> (Sender) != NULL){
        dynamic_cast <TDBEdit*> (Sender)->Color = COLOR_FIELD_FORM_FOCUS;

    } else if(dynamic_cast <TDBLookupComboBox*> (Sender) != NULL){
        dynamic_cast <TDBLookupComboBox*> (Sender)->Color = COLOR_FIELD_FORM_FOCUS;

    } else if(dynamic_cast <TDBComboBox*> (Sender) != NULL){
        dynamic_cast <TDBComboBox*> (Sender)->Color = COLOR_FIELD_FORM_FOCUS;

    } else if(dynamic_cast <TDBMemo*> (Sender) != NULL){
        dynamic_cast <TDBMemo*> (Sender)->Color = COLOR_FIELD_FORM_FOCUS;
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadCliente::ChangeExit(TObject *Sender)
{
    if(dynamic_cast <TDBEdit*> (Sender) != NULL){
        TDBEdit *Edit = dynamic_cast <TDBEdit*> (Sender);
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

void __fastcall TFCadCliente::HabilitaBarraBotoes(void)
{
    BtnNovo->Enabled = !(DModuleCliente->DSCliente->State == dsInsert && DModuleCliente->DSCliente->State == dsEdit);
    BtnGravar->Enabled = (DModuleCliente->DSCliente->State == dsInsert || DModuleCliente->DSCliente->State == dsEdit);
    BtnEditar->Enabled = (DModuleCliente->DSCliente->State == dsBrowse);
    BtnDeletar->Enabled = (DModuleCliente->DSCliente->State == dsBrowse || DModuleCliente->DSCliente->State == dsEdit);
    BtnCancelar->Enabled = (DModuleCliente->DSCliente->State == dsInsert || DModuleCliente->DSCliente->State == dsEdit);
    BtnPesquisa->Enabled = !(DModuleCliente->DSCliente->State == dsInsert && DModuleCliente->DSCliente->State == dsEdit);

    BtnProcedimentos->Enabled = (DModuleCliente->DSCliente->State == dsInsert || DModuleCliente->DSCliente->State == dsEdit);
    BtnSenhas->Enabled = (DModuleCliente->DSCliente->State == dsInsert || DModuleCliente->DSCliente->State == dsEdit);
    BtnContratos->Enabled = (DModuleCliente->DSCliente->State == dsInsert || DModuleCliente->DSCliente->State == dsEdit);    
}

//---------------------------------------------------------------------------

void __fastcall TFCadCliente::HabilitaCamposFormulario(bool Status, bool Todos)
{
    HabilitaCamposFormulario(Status, Todos, (int)FORM_CLIENTE);
}

//---------------------------------------------------------------------------

void __fastcall TFCadCliente::HabilitaCamposFormulario(bool Status, bool Todos, int IndiceDaTab)
{
    for(int i=0; i < ComponentCount; i++){
        if(dynamic_cast <TDBEdit*> (Components[i]) != NULL){
            dynamic_cast <TDBEdit*> (Components[i])->Enabled = Status;

        } else if(dynamic_cast <TDBLookupComboBox*> (Components[i]) != NULL){
            dynamic_cast <TDBLookupComboBox*> (Components[i])->Enabled = Status;

        } else if(dynamic_cast <TDBComboBox*> (Components[i]) != NULL){
            dynamic_cast <TDBComboBox*> (Components[i])->Enabled = Status;

        } else if(dynamic_cast <TDBMemo*> (Components[i]) != NULL){
            dynamic_cast <TDBMemo*> (Components[i])->Enabled = Status;

        } else if(dynamic_cast <TCheckBox*> (Components[i]) != NULL){
            dynamic_cast <TCheckBox*> (Components[i])->Enabled = Status;

        } else if(dynamic_cast <TButton*> (Components[i]) != NULL){
            dynamic_cast <TButton*> (Components[i])->Enabled = Status;

        } else if(dynamic_cast <TDBGrid*> (Components[i]) != NULL){
            dynamic_cast <TDBGrid*> (Components[i])->Enabled = Status;
        }
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadCliente::ConfiguraCharCaseForm(void)
{
    for(int i=0; i < ComponentCount; i++){
        if(dynamic_cast <TDBEdit*> (Components[i]) != NULL){
            dynamic_cast <TDBEdit*> (Components[i])->CharCase = ecUpperCase;
        }
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadCliente::ConfiguraEventosForm(void)
{
    for(int i=0; i < ComponentCount; i++){
        if(dynamic_cast <TDBEdit*> (Components[i]) != NULL){
            dynamic_cast <TDBEdit*> (Components[i])->OnEnter = ChangeEnter;
            dynamic_cast <TDBEdit*> (Components[i])->OnExit = ChangeExit;
        }

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

void __fastcall TFCadCliente::CkbMesmoEnderContatoClick(TObject *Sender)
{
    /*
    if(CkbMesmoEnderContato->Checked){
        DModuleCliente->CDSContatoNMCONTATO->AsString = DModuleCliente->CDSClienteNMCLIENTE->AsString;
        DModuleCliente->CDSContatoENDERECO->AsString = DModuleCliente->CDSClienteENDERECO->AsString;
        DModuleCliente->CDSContatoBAIRRO->AsString = DModuleCliente->CDSClienteBAIRRO->AsString;
        DModuleCliente->CDSContatoCIDADE->AsString = DModuleCliente->CDSClienteCIDADE->AsString;
        DModuleCliente->CDSContatoUF->AsString = DModuleCliente->CDSClienteUF->AsString;
        DModuleCliente->CDSContatoCEP->AsString = DModuleCliente->CDSClienteCEP->AsString;

    }else{
        bool ConfirmaExclusao = Application->MessageBox("Deseja apagar os dados copiados do cadastro do cliente?","Confirmar",
            MB_ICONINFORMATION|MB_YESNO) == IDYES;

        if(ConfirmaExclusao){
            DModuleCliente->CDSContatoNMCONTATO->AsString = "";
            DModuleCliente->CDSContatoENDERECO->AsString = "";
            DModuleCliente->CDSContatoBAIRRO->AsString = "";
            DModuleCliente->CDSContatoCIDADE->AsString = "";
            DModuleCliente->CDSContatoUF->AsString = "";
            DModuleCliente->CDSContatoCEP->AsString = "";
        }
    }
    */
}

//---------------------------------------------------------------------------

bool __fastcall TFCadCliente::ValidaCliente()
{
    try{
        String Filial = DModuleCliente->CDSClienteCDFILIAL->AsString;
        String Natureza = DModuleCliente->CDSClienteTPPESSOA->AsString;
        String Documento =  DModuleCliente->CDSClienteDOCUMENTO->AsString;
        String Nome =  DModuleCliente->CDSClienteNMCLIENTE->AsString;
        String Endereco = DModuleCliente->CDSClienteENDERECO->AsString;
        String Bairro = DModuleCliente->CDSClienteBAIRRO->AsString;
        String Cidade = DModuleCliente->CDSClienteCIDADE->AsString;
        String Uf = DModuleCliente->CDSClienteUF->AsString;
        String Cep = DModuleCliente->CDSClienteCEP->AsString;

        if(Filial     == "" || Natureza == "" ||
            Documento == "" || Nome     == "" ||
            Endereco  == "" || Bairro   == "" ||
            Cidade    == "" || Uf       == "" ||
            Cep       == ""){

            String CamposObrigatorios =
            "Para realizar o cadastro você deve informar os campos "
            "obrigatórios do cliente:\n"
            "Filial, Natureza, Cpf/Cnpj, Nome/Razão Social, Endereço Completo, CEP.";

            Application->MessageBox(CamposObrigatorios.c_str(), "Atenção",MB_ICONERROR|MB_OK);
            return false;
        }
        return true;

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao validar o cadastro do cliente.\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------
 
void __fastcall TFCadCliente::BtnProcedimentosClick(TObject *Sender)
{
    if(FHome->FormEstaAberto("FCadClienteProcedimento")){
        FCadClienteProcedimento->Show();
    }else{
        FCadClienteProcedimento = new TFCadClienteProcedimento(FHome);
        FCadClienteProcedimento->Show();
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadCliente::BtnSenhasClick(TObject *Sender)
{
    if(FHome->FormEstaAberto("FCadSenha")){
        FCadSenha->Show();
    }else{
        FCadSenha = new TFCadSenha(FHome);
        FCadSenha->Show();
    }   
}

//---------------------------------------------------------------------------

void __fastcall TFCadCliente::BtnPesquisaClick(TObject *Sender)
{
    if(FHome->FormEstaAberto("FConsCliente")){
        FConsCliente->Show();
    }else{
        FConsCliente = new TFConsCliente(FHome);
        FConsCliente->Show();
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadCliente::BtnContratosClick(TObject *Sender)
{
    if(FHome->FormEstaAberto("FCadContratoBasico")){
        FCadContratoBasico->Show();
    }else{
        int CodigoCliente = DModuleCliente->CDSClienteCDCLIENTE->AsInteger;
        FCadContratoBasico = new TFCadContratoBasico(this);
        FCadContratoBasico->ConsultaContrato(0, CodigoCliente);
        FCadContratoBasico->Show();
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadCliente::FormShow(TObject *Sender)
{
    pnlTituloForm->Color = COLOR_HEADER_FORM;    
}
//---------------------------------------------------------------------------

