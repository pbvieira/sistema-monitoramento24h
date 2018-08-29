//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "CadContratoBasico.h"
#include "DMApp.h"
#include "DMCliente.h"
#include "Home.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFCadContratoBasico *FCadContratoBasico;

//---------------------------------------------------------------------------

__fastcall TFCadContratoBasico::TFCadContratoBasico(TComponent* Owner)
    : TForm(Owner)
{
}

//---------------------------------------------------------------------------

void __fastcall TFCadContratoBasico::FormCreate(TObject *Sender)
{
    pnlTituloForm->Color = COLOR_HEADER_FORM;
    PgcContrato->ActivePageIndex = 0;
    ConfiguraEventosForm();
    ConfiguraCharCaseForm();
}

//---------------------------------------------------------------------------

void __fastcall TFCadContratoBasico::ConsultaContrato(int CodigoContrato, int CodigoCliente)
{
    AnsiString SQL_CONTRATOS_CLIENTE =
        "SELECT BAIRRO_MON, CDCLIENTE, CDCODIFICADOR, CDCONTRATO, CDMOTIVOCANCEL, "
        "CDRECEITA, CDRECEITAITEM, CDTIPOCOBRANCA, CDTIPOCONTRATO, CEP_MON, CHAVE, "
        "CIDADE_MON, CONFCHAVE, CONFLOCACAO, DATAALTERACAO, DATAATIVACAO, DATACADASTRO, "
        "DATAFINAL, DATAINICIAL, DIAREVISAO, DIAVENCIMENTO, ENDERECO_MON, INATIVO, "
        "QTDPARCELAS, TOLERANCIA, UF_MON, VALORATUAL, VALORINICIAL, MODELOCENTRAL, "
        "LOCALINSTALCENTRAL, OBSCENTRAL FROM CONTRATO WHERE CDCLIENTE = :CDCLIENTE";

    try{
        if(CodigoContrato > 0  || CodigoCliente > 0){
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

void __fastcall TFCadContratoBasico::FormClose(TObject *Sender,
      TCloseAction &Action)
{
    if(DModuleCliente->DSContrato->State == dsInsert || DModuleCliente->DSContrato->State == dsEdit) {
        Application->MessageBox("É necessário gravar ou cancelar antes de sair do formulário", "", MB_ICONINFORMATION|MB_OK);
        Action = caNone;
    }else{
        try{
            DModuleCliente->CDSContrato->Active = false;
        }catch(Exception &excecao){
            AnsiString erro = excecao.Message;
            String ErroNaConexao =
                "Ocorreu um erro ao fechar o formulário de contratos.\n\nDescrição do erro:\n" + erro;
            Application->MessageBox(ErroNaConexao.c_str(), "Atenção", MB_ICONERROR|MB_OK);
        }

        Action = caFree;
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadContratoBasico::ChangeEnter(TObject * Sender)
{
    if(dynamic_cast <TDBEdit*> (Sender) != NULL){
        dynamic_cast <TDBEdit*> (Sender)->Color = COLOR_FIELD_FORM_FOCUS;

    } else if(dynamic_cast <TEdit*> (Sender) != NULL){
        dynamic_cast <TEdit*> (Sender)->Color = COLOR_FIELD_FORM_FOCUS;

    } else if(dynamic_cast <TDBLookupComboBox*> (Sender) != NULL){
        dynamic_cast <TDBLookupComboBox*> (Sender)->Color = COLOR_FIELD_FORM_FOCUS;

    } else if(dynamic_cast <TDBComboBox*> (Sender) != NULL){
        dynamic_cast <TDBComboBox*> (Sender)->Color = COLOR_FIELD_FORM_FOCUS;

    } else if(dynamic_cast <TDBMemo*> (Sender) != NULL){
        dynamic_cast <TDBMemo*> (Sender)->Color = COLOR_FIELD_FORM_FOCUS;
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadContratoBasico::ChangeExit(TObject *Sender)
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

void __fastcall TFCadContratoBasico::HabilitaBarraBotoes(void)
{
    BtnNovo->Enabled = !(DModuleCliente->DSContrato->State == dsInsert && DModuleCliente->DSContrato->State == dsEdit);
    BtnGravar->Enabled = (DModuleCliente->DSContrato->State == dsInsert || DModuleCliente->DSContrato->State == dsEdit);
    BtnEditar->Enabled = (DModuleCliente->DSContrato->State == dsBrowse);
    BtnDeletar->Enabled = (DModuleCliente->DSContrato->State == dsBrowse || DModuleCliente->DSContrato->State == dsEdit);
    BtnCancelar->Enabled = (DModuleCliente->DSContrato->State == dsInsert || DModuleCliente->DSContrato->State == dsEdit);
    BtnLocalizarCliente->Enabled = (DModuleCliente->DSContrato->State == dsInsert || DModuleCliente->DSContrato->State == dsEdit);
    BtnVoltar->Enabled = (DModuleCliente->DSContrato->State == dsBrowse);
    BtnAvancar->Enabled = (DModuleCliente->DSContrato->State == dsBrowse);    
}

//---------------------------------------------------------------------------

void __fastcall TFCadContratoBasico::HabilitaCamposFormulario(bool Status)
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

void __fastcall TFCadContratoBasico::ConfiguraCharCaseForm(void)
{
    for(int i=0; i < ComponentCount; i++){
        if(dynamic_cast <TDBEdit*> (Components[i]) != NULL){
            dynamic_cast <TDBEdit*> (Components[i])->CharCase = ecUpperCase;
        }
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadContratoBasico::ConfiguraEventosForm(void)
{
    for(int i=0; i < ComponentCount; i++){
        if(dynamic_cast <TDBEdit*> (Components[i]) != NULL){
            dynamic_cast <TDBEdit*> (Components[i])->OnEnter = ChangeEnter;
            dynamic_cast <TDBEdit*> (Components[i])->OnExit = ChangeExit;

        }

        if(dynamic_cast <TEdit*> (Components[i]) != NULL){
            dynamic_cast <TEdit*> (Components[i])->OnEnter = ChangeEnter;
            dynamic_cast <TEdit*> (Components[i])->OnExit = ChangeExit;
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

void __fastcall TFCadContratoBasico::BtnNovoClick(TObject *Sender)
{
    if(!DModuleCliente->CDSContrato->Active){
        DModuleCliente->CDSContrato->Active = true;
    }

    DModuleCliente->CDSContrato->Append();

    ConfiguraConsultaAuxiliar();
    HabilitaBarraBotoes();
    HabilitaCamposFormulario(true);
    if(PgcContrato->ActivePageIndex == 0){
        EdtCodigo->SetFocus();
    }else{
        EdtInfoTecnica->SetFocus();
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadContratoBasico::BtnGravarClick(TObject *Sender)
{
    DModuleCliente->CDSContrato->Post();
    DModuleCliente->CDSContrato->ApplyUpdates(-1);
    Application->MessageBox("Cadastro realizado com sucesso", "Sucesso",MB_ICONINFORMATION|MB_OK);

    HabilitaBarraBotoes();
    HabilitaCamposFormulario(false);
}

//---------------------------------------------------------------------------

void __fastcall TFCadContratoBasico::BtnEditarClick(TObject *Sender)
{
    DModuleCliente->CDSContrato->Edit();
    HabilitaBarraBotoes();
    HabilitaCamposFormulario(true);
    if(PgcContrato->ActivePageIndex == 0){
        EdtCodigo->SetFocus();
    }else{
        EdtInfoTecnica->SetFocus();
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadContratoBasico::BtnCancelarClick(TObject *Sender)
{
    bool ConfirmaCancelamento = Application->MessageBox("Deseja cancelar as alterações realizadas no cadastro?","Confirmar",
        MB_ICONINFORMATION|MB_YESNO) == IDYES;

    if(ConfirmaCancelamento){
        DModuleCliente->CDSContrato->CancelUpdates();
        if(DModuleCliente->DSContrato->State == dsInsert){
            DModuleCliente->CDSContrato->Active = false;
        }
        ConfiguraConsultaAuxiliar();
        HabilitaBarraBotoes();
        HabilitaCamposFormulario(false);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadContratoBasico::BtnDeletarClick(TObject *Sender)
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

void __fastcall TFCadContratoBasico::BtnFecharClick(TObject *Sender)
{
    Close();
}

//---------------------------------------------------------------------------

void __fastcall TFCadContratoBasico::EdtNomeClienteEnter(TObject *Sender)
{
//    AnsiString Codigo = EdtCodCliente->Text;
//    if(Codigo != "")
//        ConsultaCliente(StrToInt(Codigo), true);
}

//---------------------------------------------------------------------------

void __fastcall TFCadContratoBasico::ConsultaCliente(int CdCliente, bool AtualizaEndereco)
{
    try{
        AnsiString SQL_FILTRO =
            "SELECT C.CDCLIENTE, CASE WHEN C.NMFANTASIA IS NULL THEN C.NMCLIENTE ELSE C.NMFANTASIA END AS NOME, "
            "C.NMCLIENTE, C.NMFANTASIA, C.ENDERECO, C.BAIRRO, C.CIDADE, C.UF, C.CEP "
            "FROM CLIENTE C WHERE C.CDCLIENTE = :CDCLIENTE";

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
                Nome = DModule->IBQConsAuxCadastros->FieldByName("NOME")->AsString;
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
            "Ocorreu um erro ao consultar o cadastro do cliente.\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadContratoBasico::ConfiguraConsultaAuxiliar()
{
    AnsiString CdCliente = EdtCodCliente->Text;
    if(CdCliente == ""){
        EdtNomeCliente->Text = "";
    }else{
        ConsultaCliente(StrToInt(CdCliente), false);
    }
}

//---------------------------------------------------------------------------

bool __fastcall TFCadContratoBasico::ValidaContrato()
{
    try{
        String Cliente = DModuleCliente->CDSContratoCDCLIENTE->AsString;
        String Codificador = DModuleCliente->CDSContratoCDCODIFICADOR->AsString;
        if(Cliente == "" || Codificador == "" || StrToInt(Codificador) == 0 || EdtNomeCliente->Text == ""){
            String CamposObrigatorios = "São obrigatórios os seguintes campos do contrato:\nCódigo do Cliente e Codificador";
            Application->MessageBox(CamposObrigatorios.c_str(), "Atenção", MB_ICONERROR|MB_OK);
            return false;
        }
        return true;
    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao validar o cadastro do contrato.\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadContratoBasico::BtnVoltarClick(TObject *Sender)
{
    DModuleCliente->CDSContrato->Prior();
}
//---------------------------------------------------------------------------

void __fastcall TFCadContratoBasico::BtnAvancarClick(TObject *Sender)
{
    DModuleCliente->CDSContrato->Next();
}
//---------------------------------------------------------------------------

void __fastcall TFCadContratoBasico::DBGSetorDrawColumnCell(
      TObject *Sender, const TRect &Rect, int DataCol, TColumn *Column,
      TGridDrawState State)
{
    if(DModuleCliente->CDSSetor->RecNo % 2){
        (dynamic_cast <TDBGrid*> (Sender))->Canvas->Brush->Color = COLOR_GRID_ALTERNATE_ROW;
    }else{
        (dynamic_cast <TDBGrid*> (Sender))->Canvas->Brush->Color = clWindow;
    }

    if(State.Contains(gdSelected)){
        DBGSetor->Canvas->Brush->Color = COLOR_GRID_SELECTED_ROW;
    }
    DBGSetor->DefaultDrawColumnCell(Rect, DataCol, Column, State);
}

//---------------------------------------------------------------------------

void __fastcall TFCadContratoBasico::BtnLocalizarClienteClick(
      TObject *Sender)
{
    if(!FHome->FormEstaAberto("FConsCliente")){
        FConsCliente = new TFConsCliente(this);
    }

    FConsCliente->Width = 1010;
    FConsCliente->GrpEndereco->Visible = true;
    FConsCliente->GrpNomeSelecionado->Visible = true;
    FConsCliente->BtnAbrirClientes->Visible = false;
    FConsCliente->BtnAbrirContratos->Visible = false;
    FConsCliente->BtnRelatorioClientes->Visible = false;
    FConsCliente->BtnSelecionar->Visible = true;
    FConsCliente->ImgSelecionarCliente->Visible = true;
    FConsCliente->SetarObjetoCodigoCliente(DModuleCliente->CDSContratoCDCLIENTE);
    FConsCliente->Show();
}

//---------------------------------------------------------------------------


