//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "CadContrato.h"
#include "DMApp.h"
#include "DMCliente.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFCadContrato *FCadContrato;
//---------------------------------------------------------------------------
__fastcall TFCadContrato::TFCadContrato(TComponent* Owner)
    : TForm(Owner)
{
}

//---------------------------------------------------------------------------

void __fastcall TFCadContrato::FormCreate(TObject *Sender)
{
    ConfiguraEventosForm();
    ConfiguraCharCaseForm();
}

//---------------------------------------------------------------------------

void __fastcall TFCadContrato::ConsultaContrato(int CodigoContrato, int CodigoCliente)
{
    AnsiString SQL_CONTRATOS_CLIENTE =
        "SELECT BAIRRO_MON, CDCLIENTE, CDCODIFICADOR, CDCONTRATO, CDMOTIVOCANCEL, "
        "CDRECEITA, CDRECEITAITEM, CDTIPOCOBRANCA, CDTIPOCONTRATO, CEP_MON, CHAVE, "
        "CIDADE_MON, CONFCHAVE, CONFLOCACAO, DATAALTERACAO, DATAATIVACAO, DATACADASTRO, "
        "DATAFINAL, DATAINICIAL, DIAREVISAO, DIAVENCIMENTO, ENDERECO_MON, INATIVO, "
        "QTDPARCELAS, TOLERANCIA, UF_MON, VALORATUAL, VALORINICIAL, MODELOCENTRAL, "
        "LOCALINSTALCENTRAL, OBSCENTRAL FROM CONTRATO WHERE CDCLIENTE = :CDCLIENTE";

    try{
        DModuleCliente->CDSContrato->Active = false;
        DModuleCliente->IBQContrato->SQL->Clear();
        DModuleCliente->IBQContrato->SQL->Text = SQL_CONTRATOS_CLIENTE;
        DModuleCliente->IBQContrato->ParamByName("CDCLIENTE")->AsInteger = CodigoCliente;

        DModuleCliente->CDSContrato->Active = true;
        if(DModuleCliente->IBTContrato->InTransaction)
            DModuleCliente->IBTContrato->Commit();

        if(DModuleCliente->CDSContrato->RecordCount > 0 && CodigoContrato > 0){
            TLocateOptions Opts;
            Opts.Clear();
            Opts << loPartialKey;
            DModuleCliente->CDSContrato->Locate("CDCONTRATO", CodigoContrato, Opts);
        }

        ConfiguraConsultaAuxiliar();
        HabilitaBarraBotoes();
        HabilitaCamposFormulario(false);

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao abrir o formulário de contratos.\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadContrato::FormClose(TObject *Sender,
      TCloseAction &Action)
{
    if(DModuleCliente->DSContrato->State == dsInsert || DModuleCliente->DSContrato->State == dsEdit) {
        Application->MessageBox("É necessário gravar ou cancelar antes de sair do formulário","",MB_ICONINFORMATION|MB_OK);
        Action = caNone;
    }else{
        try{
            DModuleCliente->CDSContrato->Active = false;
            DModuleCliente->CDSTipoContrato->Active = false;
            DModuleCliente->CDSReceita->Active = false;
            DModuleCliente->CDSTipoCobranca->Active = false;

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

void __fastcall TFCadContrato::GeraContratoId(void)
{
    try{
        DModuleCliente->IBSPGenIdContrato->ExecProc();
        int id = DModuleCliente->IBSPGenIdContrato->ParamByName("ID")->AsInteger;
        DModuleCliente->CDSContratoCDCONTRATO->AsInteger = id;
        DModuleCliente->IBTGenIdContrato->Commit();

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao gerar o código do contrato."
            "\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadContrato::ChangeEnter(TObject *Sender)
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

void __fastcall TFCadContrato::ChangeExit(TObject *Sender)
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

void __fastcall TFCadContrato::HabilitaBarraBotoes(void)
{
    BtnNovo->Enabled = !(DModuleCliente->DSContrato->State == dsInsert && DModuleCliente->DSContrato->State == dsEdit);
    BtnGravar->Enabled = (DModuleCliente->DSContrato->State == dsInsert || DModuleCliente->DSContrato->State == dsEdit);
    BtnEditar->Enabled = (DModuleCliente->DSContrato->State == dsBrowse);
    BtnDeletar->Enabled = (DModuleCliente->DSContrato->State == dsBrowse || DModuleCliente->DSContrato->State == dsEdit);
    BtnCancelar->Enabled = (DModuleCliente->DSContrato->State == dsInsert || DModuleCliente->DSContrato->State == dsEdit);
    BtnPesquisa->Enabled = !(DModuleCliente->DSContrato->State == dsInsert && DModuleCliente->DSContrato->State == dsEdit);
}

//---------------------------------------------------------------------------

void __fastcall TFCadContrato::HabilitaCamposFormulario(bool Status)
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

        }/* else if(dynamic_cast <TDBNavigator*> (Components[i]) != NULL){
            dynamic_cast <TDBNavigator*> (Components[i])->Enabled = Status;

        } else if(dynamic_cast <TDBGrid*> (Components[i]) != NULL){
            dynamic_cast <TDBGrid*> (Components[i])->Enabled = Status;
        }*/
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadContrato::ConfiguraCharCaseForm(void)
{
    for(int i=0; i < ComponentCount; i++){
        if(dynamic_cast <TDBEdit*> (Components[i]) != NULL){
            dynamic_cast <TDBEdit*> (Components[i])->CharCase = ecUpperCase;
        }
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadContrato::ConfiguraEventosForm(void)
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

void __fastcall TFCadContrato::BtnNovoClick(TObject *Sender)
{
    DModuleCliente->CDSContrato->Append();

    ConfiguraConsultaAuxiliar();
    HabilitaBarraBotoes();
    HabilitaCamposFormulario(true);
}

//---------------------------------------------------------------------------

void __fastcall TFCadContrato::BtnGravarClick(TObject *Sender)
{
    int Codigo = DModuleCliente->CDSContratoCDCONTRATO->AsInteger;
    if(Codigo == NULL){
        GeraContratoId();
    }

    DModuleCliente->CDSContrato->Post();
    DModuleCliente->CDSContrato->ApplyUpdates(0);
    Application->MessageBox("Cadastro realizado com sucesso",
        "Sucesso",MB_ICONINFORMATION|MB_OK);

    HabilitaBarraBotoes();
    HabilitaCamposFormulario(false);
}

//---------------------------------------------------------------------------

void __fastcall TFCadContrato::BtnEditarClick(TObject *Sender)
{
    DModuleCliente->CDSContrato->Edit();

    HabilitaBarraBotoes();
    HabilitaCamposFormulario(true);
}

//---------------------------------------------------------------------------

void __fastcall TFCadContrato::BtnCancelarClick(TObject *Sender)
{
    bool ConfirmaCancelamento = Application->MessageBox("Deseja cancelar as alterações realizadas no cadastro?","Confirmar",
        MB_ICONINFORMATION|MB_YESNO) == IDYES;

    if(ConfirmaCancelamento){
        DModuleCliente->CDSContrato->CancelUpdates();

        ConfiguraConsultaAuxiliar();
        HabilitaBarraBotoes();
        HabilitaCamposFormulario(false);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadContrato::BtnDeletarClick(TObject *Sender)
{
    bool ConfirmaExclusao = Application->MessageBox("Deseja excluir o cadastro do contrato?","Confirmar",
        MB_ICONINFORMATION|MB_YESNO) == IDYES;

    if(ConfirmaExclusao){
        if(!DModuleCliente->CDSContrato->IsEmpty()){
            DModuleCliente->CDSContrato->Delete();
            DModuleCliente->CDSContrato->ApplyUpdates(-1);
            DModuleCliente->CDSContrato->Refresh();
            ConfiguraConsultaAuxiliar();
            HabilitaBarraBotoes();
            HabilitaCamposFormulario(false);
        }
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadContrato::BtnFecharClick(TObject *Sender)
{
    Close();
}

//---------------------------------------------------------------------------

void __fastcall TFCadContrato::EdtNomeClienteEnter(TObject *Sender)
{
    AnsiString Codigo = EdtCodCliente->Text;
    if(Codigo != "")
        ConsultaCliente(StrToInt(Codigo), true);
}

//---------------------------------------------------------------------------

void __fastcall TFCadContrato::EdtModeloCodificadorEnter(TObject *Sender)
{
    /*
    AnsiString Codificador = EdtCodCodificador->Text;
    if(Codificador != "")
        ConsultaCodificador(StrToInt(Codificador));
    */
}

//---------------------------------------------------------------------------

void __fastcall TFCadContrato::ConsultaCliente(int CdCliente, bool AtualizaEndereco)
{
    try{
        AnsiString SQL_FILTRO =
            "SELECT  CDCLIENTE, NMCLIENTE, ENDERECO, BAIRRO, CIDADE, UF, CEP "
            "FROM CLIENTE WHERE CDCLIENTE = :CDCLIENTE";

        AnsiString Nome;
        AnsiString Endereco;
        AnsiString Bairro;
        AnsiString Cidade;
        AnsiString Uf;
        AnsiString Cep;
        AnsiString EnderecoCob;
        AnsiString BairroCob;
        AnsiString CidadeCob;
        AnsiString UfCob;
        AnsiString CepCob;

        if(CdCliente > 0){
            DModule->IBQConsAuxCadastros->SQL->Clear();
            DModule->IBQConsAuxCadastros->SQL->Text = SQL_FILTRO;
            DModule->IBQConsAuxCadastros->ParamByName("CDCLIENTE")->AsInteger = CdCliente;
            DModule->IBQConsAuxCadastros->Open();

            if(DModule->IBQConsAuxCadastros->RecordCount > 0){
                Nome = DModule->IBQConsAuxCadastros->FieldByName("NMCLIENTE")->AsString;
                EnderecoCob = DModule->IBQConsAuxCadastros->FieldByName("ENDERECO")->AsString;
                BairroCob = DModule->IBQConsAuxCadastros->FieldByName("BAIRRO")->AsString;
                CidadeCob = DModule->IBQConsAuxCadastros->FieldByName("CIDADE")->AsString;
                UfCob = DModule->IBQConsAuxCadastros->FieldByName("UF")->AsString;
                CepCob = DModule->IBQConsAuxCadastros->FieldByName("CEP")->AsString;

                EdtNomeCliente->Text = Nome;

                if(AtualizaEndereco){
                    DModuleCliente->CDSContratoENDERECO_MON->Value = EnderecoCob;
                    DModuleCliente->CDSContratoBAIRRO_MON->Value = BairroCob;
                    DModuleCliente->CDSContratoCIDADE_MON->Value = CidadeCob;
                    DModuleCliente->CDSContratoUF_MON->Value = UfCob;
                    DModuleCliente->CDSContratoCEP_MON->Value = CepCob;
                }

            }else{
                EdtNomeCliente->Text = "";
                DModuleCliente->CDSContratoENDERECO_MON->Value = "";
                DModuleCliente->CDSContratoBAIRRO_MON->Value = "";
                DModuleCliente->CDSContratoCIDADE_MON->Value = "";
                DModuleCliente->CDSContratoUF_MON->Value = "";
                DModuleCliente->CDSContratoCEP_MON->Value = "";
            }

            DModule->IBQConsAuxCadastros->Close();

            if(DModule->IBTConsAuxCadastros->InTransaction){
                DModule->IBTConsAuxCadastros->Commit();
            }
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

void __fastcall TFCadContrato::ConsultaCodificador(int CdCodificador)
{
    /*
    try{
        AnsiString SQL_FILTRO =
            "SELECT CDCODIFICADOR, MODELO FROM CODIFICADOR WHERE CDCODIFICADOR = :CDCODIFICADOR";

        AnsiString Modelo;

        if(CdCodificador > 0){
            DModuleCliente->IBQConsulta->SQL->Clear();
            DModuleCliente->IBQConsulta->SQL->Text = SQL_FILTRO;
            DModuleCliente->IBQConsulta->ParamByName("CDCODIFICADOR")->AsInteger = CdCodificador;
            DModuleCliente->IBQConsulta->Open();

            if(DModuleCliente->IBQConsulta->RecordCount > 0){
                EdtModeloCodificador->Text = DModuleCliente->IBQConsulta->FieldByName("MODELO")->AsString;
            }else{
                EdtModeloCodificador->Text = "";
            }

            DModuleCliente->IBQConsulta->Close();
        }

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao consultar o cadastro do codifidor."
            "\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }
    */
}

//---------------------------------------------------------------------------

void __fastcall TFCadContrato::ConfiguraConsultaAuxiliar()
{
    AnsiString CdCliente = EdtCodCliente->Text;
    if(CdCliente == ""){
        EdtNomeCliente->Text = "";
    }else{
        ConsultaCliente(StrToInt(CdCliente), false);
    }
    /*
    AnsiString CdCodificador = EdtCodCodificador->Text;
    if(CdCodificador == ""){
        EdtModeloCodificador->Text = "";
    }else{
        ConsultaCodificador(StrToInt(CdCodificador));
    }
    */
}

//---------------------------------------------------------------------------

void __fastcall TFCadContrato::CkbInativoClick(TObject *Sender)
{
    if((DModuleCliente->DSContrato->State == dsInsert || DModuleCliente->DSContrato->State == dsEdit)){
        if(!CkbInativo->Checked){
             DModuleCliente->CDSContratoCDMOTIVOCANCEL->AsString = "";
        }
    }
}

//---------------------------------------------------------------------------

bool __fastcall TFCadContrato::ValidaContrato()
{
    try{
        int Codigo = DModuleCliente->CDSContratoCDCONTRATO->AsInteger;
        String Cliente = DModuleCliente->CDSContratoCDCLIENTE->AsString;
        String Endereco = DModuleCliente->CDSContratoENDERECO_MON->AsString;
        String Bairro = DModuleCliente->CDSContratoBAIRRO_MON->AsString;
        String Cidade = DModuleCliente->CDSContratoCIDADE_MON->AsString;
        String Uf = DModuleCliente->CDSContratoUF_MON->AsString;
        String Cep = DModuleCliente->CDSContratoCEP_MON->AsString;

        if(Cliente == "" || Endereco == "" ||  Bairro == "" || Cidade  == "" || Uf == "" || Cep == "" ){

            String CamposObrigatorios =
                "São obrigatórios os seguintes campos do contrato:\n"
                "Cliente, Tipo Contrato, Endereço Completo";
            Application->MessageBox(CamposObrigatorios.c_str(),
                "Atenção",MB_ICONERROR|MB_OK);
            return false;
        }

        return true;

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao validar o cadastro do contrato."
            "\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------
