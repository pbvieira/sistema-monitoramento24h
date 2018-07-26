//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "CadOrdemServico.h"
#include "DMCliente.h"
#include "DMApp.h"
#include "Home.h"
#include "ConsCliente.h"
#include "ConsOrdemServico.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFCadOrdemServico *FCadOrdemServico;
//---------------------------------------------------------------------------

__fastcall TFCadOrdemServico::TFCadOrdemServico(TComponent* Owner)
    : TForm(Owner)
{
}

//---------------------------------------------------------------------------

void __fastcall TFCadOrdemServico::FormCreate(TObject *Sender)
{
    ConfiguraEventosForm();
    ConfiguraCharCaseForm();
    this->ObjetoCodigoOS = NULL;
    this->ObjetoResumoOC = NULL;
}

//---------------------------------------------------------------------------

void __fastcall TFCadOrdemServico::CriarOrdemServicoOcorrencia(
    int CodigoCliente, int CodigoOperador, AnsiString DescricaoOrdemServico,
    AnsiString Estatus, TIntegerField *CampoCodigoOS, TStringField *CampoResumoOC)
{
    if(CDSOrdemServico->Active){
        CDSOrdemServico->Append();
        CDSOrdemServicoCDCLIENTE->AsInteger = CodigoCliente;
        CDSOrdemServicoCDOPERADORABERTURA->AsInteger = CodigoOperador;
        CDSOrdemServicoDEORDEMSERVICO->AsString = DescricaoOrdemServico;
        CDSOrdemServicoSTATUS->AsString = Estatus;

        this->ObjetoCodigoOS = CampoCodigoOS;
        this->ObjetoResumoOC = CampoResumoOC;

        ConfiguraConsultaAuxiliar();
        HabilitaBarraBotoes();
        HabilitaCamposFormulario(true);
        CmbOperadorAbertura->SetFocus();
        CDSOrdemServicoDATACADASTRO->AsDateTime = DModule->RetornaDataHoraAtual();
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadOrdemServico::ConsultaOrdemServico(int CodigoOS)
{
    AnsiString SQL_ORDEMSERVICO =
        "SELECT CDORDEMSERVICO, CDCLIENTE, DATACADASTRO, DATAENCERRAMENTO, DEORDEMSERVICO, ISRETRABALHO,"
            "OBSERVACAO, ISORDEMENCERRADA, CDOPERADORABERTURA, CDOPERADORENCERRAMENTO, "
            "CDTECNICO, DATAEXECUCAO, HORAINICIO, HORAFIM, STATUS "
        "FROM ORDEMSERVICO WHERE CDORDEMSERVICO = -1";

    AnsiString SQL_ORDEMSERVICO_PK =
        "SELECT CDORDEMSERVICO, CDCLIENTE, DATACADASTRO, DATAENCERRAMENTO, DEORDEMSERVICO, ISRETRABALHO,"
            "OBSERVACAO, ISORDEMENCERRADA, CDOPERADORABERTURA, CDOPERADORENCERRAMENTO, "
            "CDTECNICO, DATAEXECUCAO, HORAINICIO, HORAFIM, STATUS "
        "FROM ORDEMSERVICO WHERE CDORDEMSERVICO = :CDORDEMSERVICO";

    try{
        CDSOrdemServico->Active = false;
        IBQOrdemServico->SQL->Clear();
        if(CodigoOS > 0){
            IBQOrdemServico->SQL->Text = SQL_ORDEMSERVICO_PK;
            IBQOrdemServico->ParamByName("CDORDEMSERVICO")->AsInteger = CodigoOS;
        }else{
            IBQOrdemServico->SQL->Text = SQL_ORDEMSERVICO;
        }

        CDSOrdemServico->Active = true;
        if(IBTOrdemServico->InTransaction)
            IBTOrdemServico->Commit();

        ConfiguraConsultaAuxiliar();
        HabilitaBarraBotoes();
        HabilitaCamposFormulario(false);

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao abrir o formulário de OS."
            "\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadOrdemServico::ConfiguraCharCaseForm(void)
{
    for(int i=0; i < ComponentCount; i++){
        if(dynamic_cast <TDBEdit*> (Components[i]) != NULL){
            dynamic_cast <TDBEdit*> (Components[i])->CharCase = ecUpperCase;
        }
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadOrdemServico::ConfiguraEventosForm(void)
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

void __fastcall TFCadOrdemServico::ChangeEnter(TObject *Sender)
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

void __fastcall TFCadOrdemServico::ChangeExit(TObject *Sender)
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

void __fastcall TFCadOrdemServico::HabilitaBarraBotoes(void)
{
    BtnNovo->Enabled = !(DSOrdemServico->State == dsInsert && DSOrdemServico->State == dsEdit);
    BtnGravar->Enabled = (DSOrdemServico->State == dsInsert || DSOrdemServico->State == dsEdit);
    BtnEditar->Enabled = (DSOrdemServico->State == dsBrowse);
    BtnDeletar->Enabled = (DSOrdemServico->State == dsBrowse || DSOrdemServico->State == dsEdit);
    BtnCancelar->Enabled = (DSOrdemServico->State == dsInsert || DSOrdemServico->State == dsEdit);
    BtnLocalizarCliente->Enabled = (DSOrdemServico->State == dsInsert || DSOrdemServico->State == dsEdit);
}

//---------------------------------------------------------------------------

void __fastcall TFCadOrdemServico::HabilitaCamposFormulario(bool Status)
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
        }
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadOrdemServico::BtnFecharClick(TObject *Sender)
{
    Close();    
}

//---------------------------------------------------------------------------

void __fastcall TFCadOrdemServico::ConfiguraConsultaAuxiliar()
{
    AnsiString CdCliente = EdtCodCliente->Text;
    if(CdCliente == ""){
        EdtNomeCliente->Text = "";
        EdtEnderecoMon->Text = "";
        EdtBairroMon->Text = "";
        EdtCidadeMon->Text = "";
        EdtUfMon->Text = "";
        EdtCepMon->Text = "";
    }else{
        ConsultaCliente(StrToInt(CdCliente));
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadOrdemServico::EdtNomeClienteEnter(TObject *Sender)
{
    AnsiString Codigo = EdtCodCliente->Text;
    if(Codigo != "")
        ConsultaCliente(StrToInt(Codigo));
}

//---------------------------------------------------------------------------

void __fastcall TFCadOrdemServico::ConsultaCliente(int CdCliente)
{
    try{
        AnsiString SQL_FILTRO =
            "SELECT C.CDCLIENTE, C.ENDERECO, C.BAIRRO, C.CIDADE, C.UF, C.CEP, "
            "CASE WHEN C.NMFANTASIA IS NULL THEN C.NMCLIENTE ELSE C.NMFANTASIA END AS NOME, C.NMCLIENTE, C.NMFANTASIA "
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
                EdtNomeCliente->Text = DModule->IBQConsAuxCadastros->FieldByName("NOME")->AsString;
                EdtEnderecoMon->Text = DModule->IBQConsAuxCadastros->FieldByName("ENDERECO")->AsString;
                EdtBairroMon->Text = DModule->IBQConsAuxCadastros->FieldByName("BAIRRO")->AsString;
                EdtCidadeMon->Text = DModule->IBQConsAuxCadastros->FieldByName("CIDADE")->AsString;
                EdtUfMon->Text = DModule->IBQConsAuxCadastros->FieldByName("UF")->AsString;
                EdtCepMon->Text = DModule->IBQConsAuxCadastros->FieldByName("CEP")->AsString;
            }else{
                EdtNomeCliente->Text = "";
                EdtEnderecoMon->Text = "";
                EdtBairroMon->Text = "";
                EdtCidadeMon->Text = "";
                EdtUfMon->Text = "";
                EdtCepMon->Text = "";
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

void __fastcall TFCadOrdemServico::BtnNovoClick(TObject *Sender)
{
    CDSOrdemServico->Append();
    ConfiguraConsultaAuxiliar();
    HabilitaBarraBotoes();
    HabilitaCamposFormulario(true);
    CmbOperadorAbertura->SetFocus();
    CDSOrdemServicoDATACADASTRO->AsDateTime = DModule->RetornaDataHoraAtual();
}

//---------------------------------------------------------------------------

void __fastcall TFCadOrdemServico::BtnGravarClick(TObject *Sender)
{
    if(ValidaEncerramentoOrdemServico()){
        bool ConfirmaEncerramento = Application->MessageBox("Deseja encerrar esta ordem de serviço agora?","Confirmar", MB_ICONINFORMATION|MB_YESNO) == IDYES;
        if(ConfirmaEncerramento){
            CDSOrdemServicoISORDEMENCERRADA->AsInteger = 1;
            CDSOrdemServicoDATAENCERRAMENTO->AsDateTime = DModule->RetornaDataHoraAtual();
        }
    }

    CDSOrdemServico->Post();

    if(this->ObjetoCodigoOS != NULL && this->ObjetoResumoOC != NULL){
        this->ObjetoCodigoOS->AsInteger = CDSOrdemServicoCDORDEMSERVICO->AsInteger;
        AnsiString ResumoOcorrencia = Format(
            "ORDEM DE SERVIÇO CODIGO: %d - DATA ABERTURA: %s",
                ARRAYOFCONST((
                    CDSOrdemServicoCDORDEMSERVICO->AsInteger,
                    CDSOrdemServicoDATACADASTRO->AsString
                )));
        this->ObjetoResumoOC->AsString  = ResumoOcorrencia;
    }

    CDSOrdemServico->ApplyUpdates(0);
    Application->MessageBox("Cadastro realizado com sucesso", "Sucesso", MB_ICONINFORMATION|MB_OK);

    HabilitaBarraBotoes();
    HabilitaCamposFormulario(false);
}

//---------------------------------------------------------------------------

void __fastcall TFCadOrdemServico::BtnEditarClick(TObject *Sender)
{
    CDSOrdemServico->Edit();
    HabilitaBarraBotoes();
    HabilitaCamposFormulario(true);
    CmbOperadorAbertura->SetFocus();
}

//---------------------------------------------------------------------------

void __fastcall TFCadOrdemServico::BtnCancelarClick(TObject *Sender)
{
    bool ConfirmaCancelamento = Application->MessageBox("Deseja cancelar as alterações realizadas no cadastro?","Confirmar",
        MB_ICONINFORMATION|MB_YESNO) == IDYES;

    if(ConfirmaCancelamento){
        CDSOrdemServico->CancelUpdates();
        ConfiguraConsultaAuxiliar();
        HabilitaBarraBotoes();
        HabilitaCamposFormulario(false);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadOrdemServico::BtnDeletarClick(TObject *Sender)
{
    bool ConfirmaExclusao = Application->MessageBox("Deseja excluir o cadastro de Ordem Serviço?","Confirmar",
        MB_ICONINFORMATION|MB_YESNO) == IDYES;

    if(ConfirmaExclusao){
        if(!CDSOrdemServico->IsEmpty()){
            CDSOrdemServico->Delete();
            CDSOrdemServico->ApplyUpdates(-1);
            CDSOrdemServico->Refresh();
            ConfiguraConsultaAuxiliar();
            HabilitaBarraBotoes();
            HabilitaCamposFormulario(false);
        }
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadOrdemServico::FormClose(TObject *Sender,
      TCloseAction &Action)
{
    if(DSOrdemServico->State == dsInsert || DSOrdemServico->State == dsEdit) {
        Application->MessageBox("É necessário gravar ou cancelar antes de sair do formulário", "", MB_ICONINFORMATION|MB_OK);
        Action = caNone;
    }else{
        try{
            CDSOrdemServico->Active = false;
        }catch(Exception &excecao){
            AnsiString erro = excecao.Message;
            String ErroNaConexao =
                "Ocorreu um erro ao fechar o formulário de Ordem Serviço.\n\nDescrição do erro:\n" + erro;
            Application->MessageBox(ErroNaConexao.c_str(), "Atenção", MB_ICONERROR|MB_OK);
        }

        Action = caFree;
    }
}

//---------------------------------------------------------------------------

bool __fastcall TFCadOrdemServico::ValidaOrdemServico()
{
    try{
        String Cliente = EdtNomeCliente->Text;
        String OrdemServico = CDSOrdemServicoDEORDEMSERVICO->AsString;
        String OperadorAbertura = CDSOrdemServicoNMOPABERTURA->AsString;

        if(Cliente == "" || OrdemServico == "" || OperadorAbertura == ""){
            String CamposObrigatorios = "São obrigatórios os seguintes campos da Ordem de Serviço:\n"
                "Data Abertura, Operador Abertura, Código do Cliente e Ordem de Serviço";
            Application->MessageBox(CamposObrigatorios.c_str(), "Atenção", MB_ICONERROR|MB_OK);
            return false;
        }
        return true;

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao validar o cadastro da ordem de serviço.\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

bool __fastcall TFCadOrdemServico::ValidaEncerramentoOrdemServico()
{
    try{
        int OSEncerrada = CDSOrdemServicoISORDEMENCERRADA->AsInteger;
        String OperadoraEncerramento = CDSOrdemServicoNMOPENCERRAMENTO->AsString;
        String TecnicoResponsavel = CDSOrdemServicoNMTECNICO->AsString;
        String DataEncerramento = CDSOrdemServicoDATACADASTRO->AsString;
        String HoraInicio = CDSOrdemServicoHORAINICIO->AsString;
        String HoraFim = CDSOrdemServicoHORAFIM->AsString;
        // Se estiver já encerrada retorna false também.
        if(OSEncerrada > 0 || OperadoraEncerramento == "" || TecnicoResponsavel == "" ||
            DataEncerramento == "" || HoraInicio == "" || HoraFim == ""){
            return false;
        }
        return true;

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao validar o encerramento da ordem de serviço.\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadOrdemServico::CDSOrdemServicoBeforePost(TDataSet *DataSet)
{
    if(!ValidaOrdemServico()){
        Abort();
    }

    int Codigo = CDSOrdemServicoCDORDEMSERVICO->AsInteger;
    if(Codigo == NULL || Codigo == 0){
        GeraOrdemServicoId();
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadOrdemServico::GeraOrdemServicoId(void)
{
    try{
        IBSPGenIdOrdemServico->ExecProc();
        CDSOrdemServicoCDORDEMSERVICO->AsInteger = IBSPGenIdOrdemServico->ParamByName("ID")->AsInteger;
        IBTGenIdOrdemServico->Commit();
    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao = "Ocorreu um erro ao gerar o código da ordem de serviço.\n\n"
            "Descrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadOrdemServico::BtnLocalizarClienteClick(
      TObject *Sender)
{
    if(!FHome->FormEstaAberto("FConsCliente")){
        FConsCliente = new TFConsCliente(this);
    }

    FConsCliente->Width = 1010;
    FConsCliente->GrpEndereco->Visible = true;
    FConsCliente->GrpNomeSelecionado->Visible = true;
    FConsCliente->BtnTodos->Visible = false;
    FConsCliente->BtnAbrirClientes->Visible = false;
    FConsCliente->BtnAbrirContratos->Visible = false;
    FConsCliente->BtnRelatorioClientes->Visible = false;
    FConsCliente->BtnSelecionar->Visible = true;
    FConsCliente->ImgSelecionarCliente->Visible = true;
    FConsCliente->LblOR->Visible = false;
    FConsCliente->SetarObjetoCodigoCliente(CDSOrdemServicoCDCLIENTE);
    FConsCliente->Show();
}

//---------------------------------------------------------------------------

void __fastcall TFCadOrdemServico::CDSOrdemServicoCDCLIENTEChange(
      TField *Sender)
{
    ConsultaCliente(Sender->AsInteger);    
}

//---------------------------------------------------------------------------

void __fastcall TFCadOrdemServico::BtnConsultarClick(TObject *Sender)
{
    if(FHome->FormEstaAberto("FConsOrdemServico")){
        FConsOrdemServico->Show();
    }else{
        FConsOrdemServico = new TFConsOrdemServico(FHome);
        FConsOrdemServico->Show();
    }
}

//---------------------------------------------------------------------------
