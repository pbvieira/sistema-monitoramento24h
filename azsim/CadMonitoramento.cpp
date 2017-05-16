//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "CadMonitoramento.h"
#include "DMApp.h"
#include "Home.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFCadMonitoramento *FCadMonitoramento;

//---------------------------------------------------------------------------
__fastcall TFCadMonitoramento::TFCadMonitoramento(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TFCadMonitoramento::FormCreate(TObject *Sender)
{
    ConfiguraEventosForm();
    ConfiguraCharCaseForm();
    HabilitaBarraBotoes();
    HabilitaCamposFormulario(false);
    PCDiasSemana->ActivePageIndex = 0;
}

//---------------------------------------------------------------------------

void __fastcall TFCadMonitoramento::FormClose(TObject *Sender,
      TCloseAction &Action)
{
    Action = caFree;
}

//---------------------------------------------------------------------------

void __fastcall TFCadMonitoramento::ConsultaCliente(int CdCliente)
{
    try{
        AnsiString SQL_FILTRO =
            "SELECT  CDCLIENTE, NMCLIENTE FROM CLIENTE WHERE CDCLIENTE = :CDCLIENTE";

        AnsiString Nome;

        if(CdCliente > 0){
            DModule->IBQConsAuxCadastros->SQL->Clear();
            DModule->IBQConsAuxCadastros->SQL->Text = SQL_FILTRO;
            DModule->IBQConsAuxCadastros->ParamByName("CDCLIENTE")->AsInteger = CdCliente;
            DModule->IBQConsAuxCadastros->Open();

            if(DModule->IBQConsAuxCadastros->RecordCount > 0){
                Nome = DModule->IBQConsAuxCadastros->FieldByName("NMCLIENTE")->AsString;
                EdtNomeCliente->Text = Nome;
                ConsultaDiaSemana(CdCliente, 1);
                ConsultaDiaSemana(CdCliente, 2);
                ConsultaDiaSemana(CdCliente, 3);
                ConsultaDiaSemana(CdCliente, 4);
                ConsultaDiaSemana(CdCliente, 5);
                ConsultaDiaSemana(CdCliente, 6);
                ConsultaDiaSemana(CdCliente, 7);
            }else{
                EdtNomeCliente->Text = "";
                LimparCamposHorario(1);
                LimparCamposHorario(2);
                LimparCamposHorario(3);
                LimparCamposHorario(4);
                LimparCamposHorario(5);
                LimparCamposHorario(6);
                LimparCamposHorario(7);
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

void __fastcall TFCadMonitoramento::ConsultaDiaSemana(int CdCliente, int iDiaSemana)
{
    try{
        AnsiString SQL_FILTRO =
            "SELECT DIASEMANA, HORAINICIAL1, HORAFINAL1, "
            "HORAINICIAL2, HORAFINAL2, HORAINICIAL3, HORAFINAL3, ATIVO "
            "FROM MONITORAMENTO M WHERE M.CDCLIENTE = :CDCLIENTE AND M.DIASEMANA = :DIASEMANA "
            "AND TIPOMONITORAMENTO = 1";

        AnsiString HIni1;
        AnsiString HFim1;
        AnsiString HIni2;
        AnsiString HFim2;
        AnsiString HIni3;
        AnsiString HFim3;
        int iAtivo = false;

        if(CdCliente > 0){
            DModule->IBQConsAuxCadastros->SQL->Clear();
            DModule->IBQConsAuxCadastros->SQL->Text = SQL_FILTRO;
            DModule->IBQConsAuxCadastros->ParamByName("CDCLIENTE")->AsInteger = CdCliente;
            DModule->IBQConsAuxCadastros->ParamByName("DIASEMANA")->AsInteger = iDiaSemana;
            DModule->IBQConsAuxCadastros->Open();

            if(DModule->IBQConsAuxCadastros->RecordCount > 0){
                HIni1 = DModule->IBQConsAuxCadastros->FieldByName("HORAINICIAL1")->AsString;
                HFim1 = DModule->IBQConsAuxCadastros->FieldByName("HORAFINAL1")->AsString;
                HIni2 = DModule->IBQConsAuxCadastros->FieldByName("HORAINICIAL2")->AsString;
                HFim2 = DModule->IBQConsAuxCadastros->FieldByName("HORAFINAL2")->AsString;
                HIni3 = DModule->IBQConsAuxCadastros->FieldByName("HORAINICIAL3")->AsString;
                HFim3 = DModule->IBQConsAuxCadastros->FieldByName("HORAFINAL3")->AsString;
                iAtivo = DModule->IBQConsAuxCadastros->FieldByName("ATIVO")->AsInteger;
                PreenchaIntervaloHorario(iDiaSemana, HIni1, HFim1, HIni2, HFim2, HIni3, HFim3, iAtivo);
            }else{
                LimparCamposHorario(iDiaSemana);
            }

            DModule->IBQConsAuxCadastros->Close();
            if(DModule->IBTConsAuxCadastros->InTransaction){
                DModule->IBTConsAuxCadastros->Commit();
            }
        }

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao consultar os dias da semana."
            "\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

bool __fastcall TFCadMonitoramento::ExisteDiaSemana(int CdCliente, int iDiaSemana)
{
    try{

        try{
            AnsiString SQL_FILTRO =
                "SELECT DIASEMANA "
                "FROM MONITORAMENTO M WHERE M.CDCLIENTE = :CDCLIENTE AND M.DIASEMANA = :DIASEMANA "
                "AND TIPOMONITORAMENTO = 1";

            if(CdCliente > 0){
                DModule->IBQConsAuxCadastros->SQL->Clear();
                DModule->IBQConsAuxCadastros->SQL->Text = SQL_FILTRO;
                DModule->IBQConsAuxCadastros->ParamByName("CDCLIENTE")->AsInteger = CdCliente;
                DModule->IBQConsAuxCadastros->ParamByName("DIASEMANA")->AsInteger = iDiaSemana;
                DModule->IBQConsAuxCadastros->Open();

                if(DModule->IBQConsAuxCadastros->RecordCount > 0){
                    return true;
                }else{
                    return false;
                }
            }

        }catch(Exception &excecao){
            AnsiString erro = excecao.Message;
            String ErroNaConexao =
                "Ocorreu um erro ao consultar se configuração para o dia da semana."
                "\n\nDescrição do erro:\n" + erro;
            Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
        }

    } __finally {
        DModule->IBQConsAuxCadastros->Close();
        if(DModule->IBTConsAuxCadastros->InTransaction){
            DModule->IBTConsAuxCadastros->Commit();
        }
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadMonitoramento::HabilitaBarraBotoes(void)
{
    BtnNovo->Enabled = !(this->FormState == dsInsert && this->FormState == dsEdit);
    BtnGravar->Enabled = (this->FormState == dsInsert || this->FormState == dsEdit);
    BtnEditar->Enabled = (this->FormState == dsBrowse);
    BtnDeletar->Enabled = (this->FormState == dsBrowse || this->FormState == dsEdit);
    BtnCancelar->Enabled = (this->FormState == dsInsert || this->FormState == dsEdit);
    BtnPesquisa->Enabled = !(this->FormState == dsInsert && this->FormState == dsEdit);
}

//---------------------------------------------------------------------------

void __fastcall TFCadMonitoramento::LimpaCamposDoForm()
{
    for(int i=0; i < ComponentCount; i++){
        if(dynamic_cast <TEdit*> (Components[i]) != NULL){
            dynamic_cast <TEdit*> (Components[i])->Text = "";

        } else if(dynamic_cast <TMaskEdit*> (Components[i]) != NULL){
            dynamic_cast <TMaskEdit*> (Components[i])->Text = "";
        }
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadMonitoramento::HabilitaCamposFormulario(bool Status)
{
    for(int i=0; i < ComponentCount; i++){
        if(dynamic_cast <TEdit*> (Components[i]) != NULL){
            dynamic_cast <TEdit*> (Components[i])->Enabled = Status;

        } else if(dynamic_cast <TMaskEdit*> (Components[i]) != NULL){
            dynamic_cast <TMaskEdit*> (Components[i])->Enabled = Status;

        } else if(dynamic_cast <TCheckBox*> (Components[i]) != NULL){
            dynamic_cast <TCheckBox*> (Components[i])->Enabled = Status;
        }
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadMonitoramento::ChangeEnter(TObject *Sender)
{
    if(dynamic_cast <TEdit*> (Sender) != NULL){
        dynamic_cast <TEdit*> (Sender)->Color = 15138520;

    } else if(dynamic_cast <TMaskEdit*> (Sender) != NULL){
        dynamic_cast <TMaskEdit*> (Sender)->Color = 15138520;
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadMonitoramento::ChangeExit(TObject *Sender)
{
    if(dynamic_cast <TEdit*> (Sender) != NULL){
        TEdit *Edit = dynamic_cast <TEdit*> (Sender);
        Edit->Color = clWindow;

    }else if(dynamic_cast <TMaskEdit*> (Sender) != NULL){
        TMaskEdit *Edit = dynamic_cast <TMaskEdit*> (Sender);
        Edit->Color = clWindow;

    } else if(dynamic_cast <TComboBox*> (Sender) != NULL){
        TComboBox *Combo = dynamic_cast <TComboBox*> (Sender);
        Combo->Color = clWindow;
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadMonitoramento::ConfiguraEventosForm(void)
{
    for(int i=0; i < ComponentCount; i++){
        if(dynamic_cast <TEdit*> (Components[i]) != NULL){
            dynamic_cast <TEdit*> (Components[i])->OnEnter = ChangeEnter;
            dynamic_cast <TEdit*> (Components[i])->OnExit = ChangeExit;
        }

        if(dynamic_cast <TMaskEdit*> (Components[i]) != NULL){
            dynamic_cast <TMaskEdit*> (Components[i])->OnEnter = ChangeEnter;
            dynamic_cast <TMaskEdit*> (Components[i])->OnExit = ChangeExit;
        }

        if(dynamic_cast <TComboBox*> (Components[i]) != NULL){
            dynamic_cast <TComboBox*> (Components[i])->OnEnter = ChangeEnter;
            dynamic_cast <TComboBox*> (Components[i])->OnExit = ChangeExit;
        }
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadMonitoramento::ConfiguraCharCaseForm(void)
{
    for(int i=0; i < ComponentCount; i++){
        if(dynamic_cast <TEdit*> (Components[i]) != NULL){
            dynamic_cast <TEdit*> (Components[i])->CharCase = ecUpperCase;
        }
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadMonitoramento::BtnNovoClick(TObject *Sender)
{
    //bool ConfirmaNovoRegistro = Application->MessageBox("Deseja inserir novo cadastro?","Confirmar",
    //    MB_ICONINFORMATION|MB_YESNO) == IDYES;

    //if(ConfirmaNovoRegistro){
        this->FormState = dsEdit;
        HabilitaBarraBotoes();
        LimpaCamposDoForm();
        HabilitaCamposFormulario(true);
        this->EdtCodCliente->SetFocus();
        this->CkbMonitorAtivo->Checked = true;
    //}
}

//---------------------------------------------------------------------------

void __fastcall TFCadMonitoramento::BtnCancelarClick(TObject *Sender)
{
    bool ConfirmaNovoRegistro = Application->MessageBox("Deseja cancelar cadastro?","Confirmar",
        MB_ICONINFORMATION|MB_YESNO) == IDYES;

    if(ConfirmaNovoRegistro){
        this->FormState = dsInactive;
        LimpaCamposDoForm();
        HabilitaBarraBotoes();
        HabilitaCamposFormulario(false);
        this->CkbMonitorAtivo->Checked = false;
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadMonitoramento::BtnFecharClick(TObject *Sender)
{
    Close();
}

//---------------------------------------------------------------------------

void __fastcall TFCadMonitoramento::EdtCodClienteKeyUp(TObject *Sender,
      WORD &Key, TShiftState Shift)
{
    AnsiString Codigo = EdtCodCliente->Text;
    if(Codigo != "")
        ConsultaCliente(StrToInt(Codigo));
}

//---------------------------------------------------------------------------

void __fastcall TFCadMonitoramento::BtnPesquisaClick(TObject *Sender)
{
    if(FHome->FormEstaAberto("FConsCliente")){
        FConsCliente->Show();
    }else{
        FConsCliente = new TFConsCliente(FHome);
        FConsCliente->Show();
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadMonitoramento::PreenchaIntervaloHorario(int iDiaSemana,
    AnsiString HIni1, AnsiString HFim1, AnsiString HIni2, AnsiString HFim2,
    AnsiString HIni3, AnsiString HFim3, int iAtivo)
{
    switch(iDiaSemana) {
        case 1:
            // Realiza esta verificação uma vez, pois o valor desse check sempre é replicado para todos os dias
            if(iAtivo){
                CkbMonitorAtivo->Checked = true;
            }else{
                CkbMonitorAtivo->Checked = false;
            }

            EdtHIni1Domingo->Text = HIni1.SubString(0, 5);
            EdtHFim1Domingo->Text = HFim1.SubString(0, 5);

            EdtHIni2Domingo->Text = HIni2.SubString(0, 5);
            EdtHFim2Domingo->Text = HFim2.SubString(0, 5);

            EdtHIni3Domingo->Text = HIni3.SubString(0, 5);
            EdtHFim3Domingo->Text = HFim3.SubString(0, 5);
        break;

        case 2:
            EdtHIni1Segunda->Text = HIni1.SubString(0, 5);
            EdtHFim1Segunda->Text = HFim1.SubString(0, 5);

            EdtHIni2Segunda->Text = HIni2.SubString(0, 5);
            EdtHFim2Segunda->Text = HFim2.SubString(0, 5);

            EdtHIni3Segunda->Text = HIni3.SubString(0, 5);
            EdtHFim3Segunda->Text = HFim3.SubString(0, 5);
        break;

        case 3:
            EdtHIni1Terca->Text = HIni1.SubString(0, 5);
            EdtHFim1Terca->Text = HFim1.SubString(0, 5);

            EdtHIni2Terca->Text = HIni2.SubString(0, 5);
            EdtHFim2Terca->Text = HFim2.SubString(0, 5);

            EdtHIni3Terca->Text = HIni3.SubString(0, 5);
            EdtHFim3Terca->Text = HFim3.SubString(0, 5);
        break;

        case 4:
            EdtHIni1Quarta->Text = HIni1.SubString(0, 5);
            EdtHFim1Quarta->Text = HFim1.SubString(0, 5);

            EdtHIni2Quarta->Text = HIni2.SubString(0, 5);
            EdtHFim2Quarta->Text = HFim2.SubString(0, 5);

            EdtHIni3Quarta->Text = HIni3.SubString(0, 5);
            EdtHFim3Quarta->Text = HFim3.SubString(0, 5);
        break;

        case 5:
            EdtHIni1Quinta->Text = HIni1.SubString(0, 5);
            EdtHFim1Quinta->Text = HFim1.SubString(0, 5);

            EdtHIni2Quinta->Text = HIni2.SubString(0, 5);
            EdtHFim2Quinta->Text = HFim2.SubString(0, 5);

            EdtHIni3Quinta->Text = HIni3.SubString(0, 5);
            EdtHFim3Quinta->Text = HFim3.SubString(0, 5);
        break;

        case 6:
            EdtHIni1Sexta->Text = HIni1.SubString(0, 5);
            EdtHFim1Sexta->Text = HFim1.SubString(0, 5);

            EdtHIni2Sexta->Text = HIni2.SubString(0, 5);
            EdtHFim2Sexta->Text = HFim2.SubString(0, 5);

            EdtHIni3Sexta->Text = HIni3.SubString(0, 5);
            EdtHFim3Sexta->Text = HFim3.SubString(0, 5);
        break;

        case 7:
            EdtHIni1Sabado->Text = HIni1.SubString(0, 5);
            EdtHFim1Sabado->Text = HFim1.SubString(0, 5);

            EdtHIni2Sabado->Text = HIni2.SubString(0, 5);
            EdtHFim2Sabado->Text = HFim2.SubString(0, 5);

            EdtHIni3Sabado->Text = HIni3.SubString(0, 5);
            EdtHFim3Sabado->Text = HFim3.SubString(0, 5);
        break;
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadMonitoramento::LimparCamposHorario(int iDiaSemana)
{
    switch(iDiaSemana) {
        case 1:
            EdtHIni1Domingo->Text = "";
            EdtHFim1Domingo->Text = "";

            EdtHIni2Domingo->Text = "";
            EdtHFim2Domingo->Text = "";

            EdtHIni3Domingo->Text = "";
            EdtHFim3Domingo->Text = "";
        break;

        case 2:
            EdtHIni1Segunda->Text = "";
            EdtHFim1Segunda->Text = "";

            EdtHIni2Segunda->Text = "";
            EdtHFim2Segunda->Text = "";

            EdtHIni3Segunda->Text = "";
            EdtHFim3Segunda->Text = "";
        break;

        case 3:
            EdtHIni1Terca->Text = "";
            EdtHFim1Terca->Text = "";

            EdtHIni2Terca->Text = "";
            EdtHFim2Terca->Text = "";

            EdtHIni3Terca->Text = "";
            EdtHFim3Terca->Text = "";
        break;

        case 4:
            EdtHIni1Quarta->Text = "";
            EdtHFim1Quarta->Text = "";

            EdtHIni2Quarta->Text = "";
            EdtHFim2Quarta->Text = "";

            EdtHIni3Quarta->Text = "";
            EdtHFim3Quarta->Text = "";
        break;

        case 5:
            EdtHIni1Quinta->Text = "";
            EdtHFim1Quinta->Text = "";

            EdtHIni2Quinta->Text = "";
            EdtHFim2Quinta->Text = "";

            EdtHIni3Quinta->Text = "";
            EdtHFim3Quinta->Text = "";
        break;

        case 6:
            EdtHIni1Sexta->Text = "";
            EdtHFim1Sexta->Text = "";

            EdtHIni2Sexta->Text = "";
            EdtHFim2Sexta->Text = "";

            EdtHIni3Sexta->Text = "";
            EdtHFim3Sexta->Text = "";
        break;

        case 7:
            EdtHIni1Sabado->Text = "";
            EdtHFim1Sabado->Text = "";

            EdtHIni2Sabado->Text = "";
            EdtHFim2Sabado->Text = "";

            EdtHIni3Sabado->Text = "";
            EdtHFim3Sabado->Text = "";
        break;
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadMonitoramento::BtnCancelarDomingoClick(
      TObject *Sender)
{
    LimparCamposHorario(1);
}

//---------------------------------------------------------------------------

void __fastcall TFCadMonitoramento::BtnCancelarSegundaClick(
      TObject *Sender)
{
    LimparCamposHorario(2);
}

//---------------------------------------------------------------------------

void __fastcall TFCadMonitoramento::BtnCancelarTercaClick(TObject *Sender)
{
    LimparCamposHorario(3);
}

//---------------------------------------------------------------------------

void __fastcall TFCadMonitoramento::BtnCancelarQuartaClick(TObject *Sender)
{
    LimparCamposHorario(4);
}

//---------------------------------------------------------------------------

void __fastcall TFCadMonitoramento::BtnCancelarQuintaClick(TObject *Sender)
{
    LimparCamposHorario(5);
}

//---------------------------------------------------------------------------

void __fastcall TFCadMonitoramento::BtnCancelarSextaClick(TObject *Sender)
{
    LimparCamposHorario(6);
}

//---------------------------------------------------------------------------

void __fastcall TFCadMonitoramento::BtnCancelarSabadoClick(TObject *Sender)
{
    LimparCamposHorario(7);
}

//---------------------------------------------------------------------------


void __fastcall TFCadMonitoramento::BtnGravarClick(TObject *Sender)
{
    int CdCliente = StrToInt(EdtCodCliente->Text);
    int iAtivo = CkbMonitorAtivo->Checked ? 1 : 0;
    bool bValidacaoOK = true;
    bool bCadastroRealizado = false;

    AnsiString HIni1;
    AnsiString HFim1;
    AnsiString HIni2;
    AnsiString HFim2;
    AnsiString HIni3;
    AnsiString HFim3;

    HIni1 = EdtHIni1Domingo->Text;
    HFim1 = EdtHFim1Domingo->Text;
    HIni2 = EdtHIni2Domingo->Text;
    HFim2 = EdtHFim2Domingo->Text;
    HIni3 = EdtHIni3Domingo->Text;
    HFim3 = EdtHFim3Domingo->Text;

    if(ValidaIntervaloHora(1, "Domingo", HIni1, HFim1, HIni2, HFim2, HIni3, HFim3)){
        if(GravaMonitoramento(CdCliente, "Domingo", 1, HIni1, HFim1, HIni2, HFim2, HIni3, HFim3, iAtivo)){
            bCadastroRealizado = true;
        }
    }

    HIni1 = EdtHIni1Segunda->Text;
    HFim1 = EdtHFim1Segunda->Text;
    HIni2 = EdtHIni2Segunda->Text;
    HFim2 = EdtHFim2Segunda->Text;
    HIni3 = EdtHIni3Segunda->Text;
    HFim3 = EdtHFim3Segunda->Text;

    if(ValidaIntervaloHora(2, "Segunda", HIni1, HFim1, HIni2, HFim2, HIni3, HFim3)){
        if(GravaMonitoramento(CdCliente, "Segunda", 2, HIni1, HFim1, HIni2, HFim2, HIni3, HFim3, iAtivo)){
            bCadastroRealizado = true;
        }
    }

    HIni1 = EdtHIni1Terca->Text;
    HFim1 = EdtHFim1Terca->Text;
    HIni2 = EdtHIni2Terca->Text;
    HFim2 = EdtHFim2Terca->Text;
    HIni3 = EdtHIni3Terca->Text;
    HFim3 = EdtHFim3Terca->Text;

    if(ValidaIntervaloHora(3, "Terça", HIni1, HFim1, HIni2, HFim2, HIni3, HFim3)){
        if(GravaMonitoramento(CdCliente, "Terça", 3, HIni1, HFim1, HIni2, HFim2, HIni3, HFim3, iAtivo)){
            bCadastroRealizado = true;
        }
    }

    HIni1 = EdtHIni1Quarta->Text;
    HFim1 = EdtHFim1Quarta->Text;
    HIni2 = EdtHIni2Quarta->Text;
    HFim2 = EdtHFim2Quarta->Text;
    HIni3 = EdtHIni3Quarta->Text;
    HFim3 = EdtHFim3Quarta->Text;

    if(ValidaIntervaloHora(4, "Quarta", HIni1, HFim1, HIni2, HFim2, HIni3, HFim3)){
        if(GravaMonitoramento(CdCliente, "Quarta", 4, HIni1, HFim1, HIni2, HFim2, HIni3, HFim3, iAtivo)){
            bCadastroRealizado = true;
        }
    }

    HIni1 = EdtHIni1Quinta->Text;
    HFim1 = EdtHFim1Quinta->Text;
    HIni2 = EdtHIni2Quinta->Text;
    HFim2 = EdtHFim2Quinta->Text;
    HIni3 = EdtHIni3Quinta->Text;
    HFim3 = EdtHFim3Quinta->Text;

    if(ValidaIntervaloHora(5, "Quinta", HIni1, HFim1, HIni2, HFim2, HIni3, HFim3)){
        if(GravaMonitoramento(CdCliente, "Quinta", 5, HIni1, HFim1, HIni2, HFim2, HIni3, HFim3, iAtivo)){
            bCadastroRealizado = true;
        }
    }

    HIni1 = EdtHIni1Sexta->Text;
    HFim1 = EdtHFim1Sexta->Text;
    HIni2 = EdtHIni2Sexta->Text;
    HFim2 = EdtHFim2Sexta->Text;
    HIni3 = EdtHIni3Sexta->Text;
    HFim3 = EdtHFim3Sexta->Text;

    if(ValidaIntervaloHora(6, "Sexta", HIni1, HFim1, HIni2, HFim2, HIni3, HFim3)){
        if(GravaMonitoramento(CdCliente, "Sexta", 6, HIni1, HFim1, HIni2, HFim2, HIni3, HFim3, iAtivo)){
            bCadastroRealizado = true;
        }
    }

    HIni1 = EdtHIni1Sabado->Text;
    HFim1 = EdtHFim1Sabado->Text;
    HIni2 = EdtHIni2Sabado->Text;
    HFim2 = EdtHFim2Sabado->Text;
    HIni3 = EdtHIni3Sabado->Text;
    HFim3 = EdtHFim3Sabado->Text;

    if(ValidaIntervaloHora(7, "Sabado", HIni1, HFim1, HIni2, HFim2, HIni3, HFim3)){
        if(GravaMonitoramento(CdCliente, "Sabado", 7, HIni1, HFim1, HIni2, HFim2, HIni3, HFim3, iAtivo)){
            bCadastroRealizado = true;
        }
    }

    if(bCadastroRealizado){
        Application->MessageBox("Cadastro realizado com sucesso", "Sucesso", MB_ICONINFORMATION|MB_OK);
    }else{
        Application->MessageBox("Nenhum intervalo foi preenchido", "Aviso",  MB_ICONINFORMATION|MB_OK);
    }
}

//---------------------------------------------------------------------------


bool __fastcall TFCadMonitoramento::GravaMonitoramento(int CdCliente, AnsiString szDiaSemana, int iDiaSemana,
        AnsiString HIni1, AnsiString HFim1, AnsiString HIni2, AnsiString HFim2,
        AnsiString HIni3, AnsiString HFim3, int iAtivo)
{
    if(ExisteDiaSemana(CdCliente, iDiaSemana)){
        try{
            DModule->IBQAtualizaMonitoramento->ParamByName("CDCLIENTE")->AsInteger = CdCliente;
            DModule->IBQAtualizaMonitoramento->ParamByName("DIASEMANA")->AsString = iDiaSemana;
            DModule->IBQAtualizaMonitoramento->ParamByName("ATIVO")->AsInteger = iAtivo;

            if(ValidaHora(HIni1)){
                DModule->IBQAtualizaMonitoramento->ParamByName("HORAINICIAL1")->AsTime = HIni1;
            }

            if(ValidaHora(HFim1)){
                DModule->IBQAtualizaMonitoramento->ParamByName("HORAFINAL1")->AsTime = HFim1;
            }

            if(ValidaHora(HIni2)){
                DModule->IBQAtualizaMonitoramento->ParamByName("HORAINICIAL2")->AsTime = HIni2;
            }

            if(ValidaHora(HFim2)){
                DModule->IBQAtualizaMonitoramento->ParamByName("HORAFINAL2")->AsTime = HFim2;
            }

            if(ValidaHora(HIni3)){
                DModule->IBQAtualizaMonitoramento->ParamByName("HORAINICIAL3")->AsTime = HIni3;
            }

            if(ValidaHora(HFim3)){
                DModule->IBQAtualizaMonitoramento->ParamByName("HORAFINAL3")->AsTime = HFim3;
            }

            DModule->IBQAtualizaMonitoramento->ExecSQL();
            DModule->IBTMonitaramento->Commit();
            return true;

        }catch(Exception &excecao){
            AnsiString erro = excecao.Message;
            String ErroNaConexao =
                "Ocorreu um erro ao salvar a configuração de " + szDiaSemana + "."
                "\n\nDescrição do erro:\n" + erro;
            Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
            return false;
        }

    }else{
        try{
            DModule->IBQInsereMonitoramento->ParamByName("CDCLIENTE")->AsInteger = CdCliente;
            DModule->IBQInsereMonitoramento->ParamByName("DIASEMANA")->AsString = iDiaSemana;
            DModule->IBQInsereMonitoramento->ParamByName("ATIVO")->AsInteger = iAtivo;

            if(ValidaHora(HIni1)){
                DModule->IBQInsereMonitoramento->ParamByName("HORAINICIAL1")->AsTime = HIni1;
            }

            if(ValidaHora(HFim1)){
                DModule->IBQInsereMonitoramento->ParamByName("HORAFINAL1")->AsTime = HFim1;
            }

            if(ValidaHora(HIni2)){
                DModule->IBQInsereMonitoramento->ParamByName("HORAINICIAL2")->AsTime = HIni2;
            }

            if(ValidaHora(HFim2)){
                DModule->IBQInsereMonitoramento->ParamByName("HORAFINAL2")->AsTime = HFim2;
            }

            if(ValidaHora(HIni3)){
                DModule->IBQInsereMonitoramento->ParamByName("HORAINICIAL3")->AsTime = HIni3;
            }

            if(ValidaHora(HFim3)){
                DModule->IBQInsereMonitoramento->ParamByName("HORAFINAL3")->AsTime = HFim3;
            }

            DModule->IBQInsereMonitoramento->ExecSQL();
            DModule->IBTMonitaramento->Commit();
            return true;

        }catch(Exception &excecao){
            AnsiString erro = excecao.Message;
            String ErroNaConexao =
                "Ocorreu um erro ao salvar a configuração de " + szDiaSemana + "."
                "\n\nDescrição do erro:\n" + erro;
            Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
            return false;
        }
    }
}

//---------------------------------------------------------------------------

bool __fastcall TFCadMonitoramento::ValidaHora(AnsiString szHorario)
{
    AnsiString szHoraVazia = "  :  ";
    if(szHorario == szHoraVazia){
        return false;
    }

    return true;
}

//---------------------------------------------------------------------------

bool __fastcall TFCadMonitoramento::ValidaIntervaloHora(int iDiaSemana, AnsiString szDiaSemana, AnsiString HIni1, AnsiString HFim1,
    AnsiString HIni2, AnsiString HFim2, AnsiString HIni3, AnsiString HFim3)
{
    AnsiString szHoraVazia = "  :  ";

    // Nenhuma informação foi preenchida
    if(HIni1 == szHoraVazia && HFim1 == szHoraVazia && HIni2 == szHoraVazia && HFim2 == szHoraVazia && HIni3 == szHoraVazia && HFim3 == szHoraVazia){
        return false;
    }

    if((HIni1 != szHoraVazia && HFim1 == szHoraVazia) || (HIni1 == szHoraVazia && HFim1 != szHoraVazia)){
        SetaFocoNaAba(iDiaSemana);
        Application->MessageBox(("Intervalo 1 de " + szDiaSemana + " está incompleto").c_str(), "Atenção", MB_ICONINFORMATION|MB_OK);
        return false;
    }

    if((HIni2 != szHoraVazia && HFim2 == szHoraVazia) || (HIni2 == szHoraVazia && HFim2 != szHoraVazia)){
        SetaFocoNaAba(iDiaSemana);
        Application->MessageBox(("Intervalo 2 de " + szDiaSemana + " está incompleto").c_str(), "Atenção", MB_ICONINFORMATION|MB_OK);
        return false;
    }

    if((HIni3 != szHoraVazia && HFim3 == szHoraVazia) || (HIni3 == szHoraVazia && HFim3 != szHoraVazia)){
        SetaFocoNaAba(iDiaSemana);
        Application->MessageBox(("Intervalo 3 de " + szDiaSemana + " está incompleto").c_str(), "Atenção", MB_ICONINFORMATION|MB_OK);
        return false;
    }

    // DnlSalerno
}

//---------------------------------------------------------------------------

void __fastcall TFCadMonitoramento::SetaFocoNaAba(int iDiaSemana)
{
    switch(iDiaSemana) {
        case 1:
            PCDiasSemana->ActivePageIndex = 6;
        break;

        case 2:
            PCDiasSemana->ActivePageIndex = 1;
        break;

        case 3:
            PCDiasSemana->ActivePageIndex = 2;
        break;

        case 4:
            PCDiasSemana->ActivePageIndex = 3;
        break;

        case 5:
            PCDiasSemana->ActivePageIndex = 4;
        break;

        case 6:
            PCDiasSemana->ActivePageIndex = 5;
        break;

        case 7:
            PCDiasSemana->ActivePageIndex = 6;
        break;
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadMonitoramento::BtnDeletarClick(TObject *Sender)
{
    bool ConfirmaExcluirRegistro = Application->MessageBox("Deseja excluir cadastro?","Confirmar",
        MB_ICONINFORMATION|MB_YESNO) == IDYES;

    if(ConfirmaExcluirRegistro){
        AnsiString Codigo = EdtCodCliente->Text;
        if(Codigo != "")
            ExcluirMonitoramento(StrToInt(Codigo));
    }
}

//---------------------------------------------------------------------------

void __fastcall TFCadMonitoramento::ExcluirMonitoramento(int CdCliente)
{
    this->FormState = dsInactive;
    LimpaCamposDoForm();
    HabilitaBarraBotoes();
    HabilitaCamposFormulario(false);
    this->CkbMonitorAtivo->Checked = false;

    try{
        AnsiString SQL_FILTRO =
            "DELETE FROM MONITORAMENTO M WHERE M.CDCLIENTE = :CDCLIENTE AND TIPOMONITORAMENTO = 1";

        if(CdCliente > 0){
            DModule->IBQConsAuxCadastros->SQL->Clear();
            DModule->IBQConsAuxCadastros->SQL->Text = SQL_FILTRO;
            DModule->IBQConsAuxCadastros->ParamByName("CDCLIENTE")->AsInteger = CdCliente;
            DModule->IBQConsAuxCadastros->ExecSQL();

            DModule->IBQConsAuxCadastros->Close();
            if(DModule->IBTConsAuxCadastros->InTransaction){
                DModule->IBTConsAuxCadastros->Commit();
            }
        }

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao excluir a configuração."
            "\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------
