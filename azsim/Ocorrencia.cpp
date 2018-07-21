//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "Ocorrencia.h"
#include "CadOrdemServico.h"
#include "DMOcorrencia.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

TFOcorrencia *FOcorrencia;
//---------------------------------------------------------------------------
__fastcall TFOcorrencia::TFOcorrencia(TComponent* Owner)
    : TForm(Owner)
{
    fdmOcorrencia->CDSOcorrenciaCDCLIENTE->OnChange = CDSOcorrenciaCDCLIENTEChange;
    fdmOcorrencia->CDSOcorrenciaCDSUBTIPOOCORRENCIA->OnChange = CDSOcorrenciaCDSUBTIPOOCORRENCIAChange;
    fdmOcorrencia->CDSOcorrenciaTIPOCTX->OnGetText = CDSOcorrenciaTIPOCTXGetText;
}

//---------------------------------------------------------------------------

void __fastcall TFOcorrencia::FormShow(TObject *Sender)
{
    PCGrids->ActivePageIndex = 0;
    if(this->FOcorrenciaId > 0){
        CmbTipoOcorrencia->SetFocus();
    }
}

//---------------------------------------------------------------------------

void __fastcall TFOcorrencia::GeraOcorrenciaId()
{
    try{
        fdmOcorrencia->IBSPGenIdOcorrencia->ExecProc();
        int id = fdmOcorrencia->IBSPGenIdOcorrencia->ParamByName("ID")->AsInteger;
        fdmOcorrencia->CDSOcorrenciaCDOCORRENCIA->AsInteger = id;
        fdmOcorrencia->IBTGenIdOcorrencia->Commit();

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao gerar o código da ocorrência.\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFOcorrencia::AbrirManualmente()
{
     try{
        EdtNomeFantasia->Width = 220;
        BtnLocalizarCliente->Visible = true;

        fdmOcorrencia->CDSAgente->Active = true;
        if(fdmOcorrencia->IBTAgente->InTransaction)
            fdmOcorrencia->IBTAgente->Commit();

        fdmOcorrencia->CDSOperador->Active = true;
        if(fdmOcorrencia->IBTOperador->InTransaction)
            fdmOcorrencia->IBTOperador->Commit();

        fdmOcorrencia->CDSTipoOcorrencia->Active = true;
        if(fdmOcorrencia->IBTTipoOcorrencia->InTransaction)
            fdmOcorrencia->IBTTipoOcorrencia->Commit();

        fdmOcorrencia->CDSSubTipoOcorrencia->Active = true;
        if(fdmOcorrencia->IBTSubTipoOcorrencia->InTransaction)
            fdmOcorrencia->IBTSubTipoOcorrencia->Commit();

        fdmOcorrencia->IBQOcorrencia->ParamByName("CDOCORRENCIA")->AsInteger = 0;
        fdmOcorrencia->CDSOcorrencia->Active = true;
        if(fdmOcorrencia->IBTOcorrencia->InTransaction)
            fdmOcorrencia->IBTOcorrencia->Commit();

        fdmOcorrencia->CDSOcorrencia->Edit();
        GeraOcorrenciaId();

        // Realiza um filtro para o combo de subtipos
        fdmOcorrencia->CDSSubTipoOcorrencia->Filter = Format("CDTIPOOCORRENCIA=%d",
                ARRAYOFCONST((fdmOcorrencia->CDSOcorrenciaCDTIPOOCORRENCIA->AsInteger)));
        fdmOcorrencia->CDSSubTipoOcorrencia->Filtered = true;

        // Uma vez que um operador abrir a ocorrência seu nome ficará registrado como operador de abertura
        if(fdmOcorrencia->CDSOcorrenciaCDOPERADORABERTURA->AsInteger == 0){
            fdmOcorrencia->CDSOcorrenciaCDOPERADORABERTURA->AsInteger = CDUSUARIO;
        }

        // Todo usuário que abrir a tela ficará registrado como usuário de encerramento
        if(fdmOcorrencia->CDSOcorrenciaISOCORRENCIAENCERRADA->AsInteger == 0){
            fdmOcorrencia->CDSOcorrenciaCDOPERADORENCERRAMENTO->AsInteger = CDUSUARIO;
        }

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao abrir o formulário de ocorrências.\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFOcorrencia::ConsultaOcorrencia(int iCodigoOcorrencia)
{
     try{
        EdtNomeFantasia->Width = 247;
        BtnLocalizarCliente->Visible = false;

        fdmOcorrencia->CDSAgente->Active = true;
        if(fdmOcorrencia->IBTAgente->InTransaction)
            fdmOcorrencia->IBTAgente->Commit();

        fdmOcorrencia->CDSOperador->Active = true;
        if(fdmOcorrencia->IBTOperador->InTransaction)
            fdmOcorrencia->IBTOperador->Commit();

        fdmOcorrencia->CDSTipoOcorrencia->Active = true;
        if(fdmOcorrencia->IBTTipoOcorrencia->InTransaction)
            fdmOcorrencia->IBTTipoOcorrencia->Commit();

        fdmOcorrencia->CDSSubTipoOcorrencia->Active = true;
        if(fdmOcorrencia->IBTSubTipoOcorrencia->InTransaction)
            fdmOcorrencia->IBTSubTipoOcorrencia->Commit();

        fdmOcorrencia->IBQOcorrencia->ParamByName("CDOCORRENCIA")->AsInteger = iCodigoOcorrencia;
        fdmOcorrencia->CDSOcorrencia->Active = true;
        if(fdmOcorrencia->IBTOcorrencia->InTransaction)
            fdmOcorrencia->IBTOcorrencia->Commit();

        fdmOcorrencia->IBQCliente->ParamByName("CDCLIENTE")->AsInteger = fdmOcorrencia->CDSOcorrenciaCDCLIENTE->AsInteger;
        fdmOcorrencia->CDSCliente->Active = true;
        fdmOcorrencia->CDSContato->Active = true;
        if(fdmOcorrencia->IBTCliente->InTransaction)
            fdmOcorrencia->IBTCliente->Commit();

       if(fdmOcorrencia->CDSCliente->RecordCount == 0){
            String ErroNaConsulta = "Não foi possível consultar o cliente, verifique "
            " se houve mudança de codificador\ne corrija o cadastro de contratos do cliente.";
            Application->MessageBox(ErroNaConsulta.c_str(),"Atenção",MB_ICONERROR|MB_OK);
            Close();
        }

        // Realiza um filtro para o combo de subtipos
        fdmOcorrencia->CDSSubTipoOcorrencia->Filter = Format("CDTIPOOCORRENCIA=%d",
                ARRAYOFCONST((fdmOcorrencia->CDSOcorrenciaCDTIPOOCORRENCIA->AsInteger)));
        fdmOcorrencia->CDSSubTipoOcorrencia->Filtered = true;

        // Lista os setores
        fdmOcorrencia->IBQSetores->ParamByName("CDCODIFICADOR")->AsInteger = fdmOcorrencia->CDSOcorrenciaEQUIPAMENTO->AsInteger;
        fdmOcorrencia->CDSSetores->Active = true;
        if(fdmOcorrencia->IBTSetores->InTransaction)
            fdmOcorrencia->IBTSetores->Commit();

        // Campo memo dos procedimentos do cliente
        fdmOcorrencia->IBQProcedimeto->ParamByName("CDCLIENTE")->AsInteger = fdmOcorrencia->CDSOcorrenciaCDCLIENTE->AsInteger;
        fdmOcorrencia->CDSProcedimento->Active = true;
        if(fdmOcorrencia->IBTProcedimento->InTransaction)
            fdmOcorrencia->IBTProcedimento->Commit();

        // Coloca os dois clients datasets em modo de edição
        fdmOcorrencia->CDSOcorrencia->Edit();
        fdmOcorrencia->CDSProcedimento->Edit();

        // Bloqueia a edição das datas OC e Atendimento
        EdtDataEvento->ReadOnly = true;
        EdtDataAberturaOcorrencia->ReadOnly = true;
        fdmOcorrencia->CDSOcorrenciaDATAEVENTO->ReadOnly = true;
        fdmOcorrencia->CDSOcorrenciaDATAATENDIMENTO->ReadOnly = true;

        EdtSaidaEmp->Text = fdmOcorrencia->CDSOcorrenciaHORASAIDAEMP->AsDateTime.FormatString("hh:nn");
        EdtChegadaLocal->Text = fdmOcorrencia->CDSOcorrenciaHORACHEGADALOCAL->AsDateTime.FormatString("hh:nn");
        EdtSaidaLocal->Text = fdmOcorrencia->CDSOcorrenciaHORASAIDALOCAL->AsDateTime.FormatString("hh:nn");
        EdtChegadaEmpresa->Text = fdmOcorrencia->CDSOcorrenciaHORACHEGADAEMP->AsDateTime.FormatString("hh:nn");
        EdtTempoDeslocamento->Text = fdmOcorrencia->CDSOcorrenciaTEMPODESOLOCAMENTO->AsDateTime.FormatString("hh:nn");
        EdtTempoRetorno->Text = fdmOcorrencia->CDSOcorrenciaTEMPORETORNO->AsDateTime.FormatString("hh:nn");
        EdtTempoAtendimento->Text = fdmOcorrencia->CDSOcorrenciaTEMPOATENDIMENTO->AsDateTime.FormatString("hh:nn");

        // Uma vez que um operador abrir a ocorrência seu nome ficará registrado como operador de abertura
        if(fdmOcorrencia->CDSOcorrenciaCDOPERADORABERTURA->AsInteger == 0){
            fdmOcorrencia->CDSOcorrenciaCDOPERADORABERTURA->AsInteger = CDUSUARIO;
        }

        // Todo usuário que abrir a tela ficará registrado como usuário de encerramento
        if(fdmOcorrencia->CDSOcorrenciaISOCORRENCIAENCERRADA->AsInteger == 0){
            fdmOcorrencia->CDSOcorrenciaCDOPERADORENCERRAMENTO->AsInteger = CDUSUARIO;
        }

        // Verifica se a classificação da OC foi preenchida pra liberar abertura de OS
        if(fdmOcorrencia->CDSOcorrenciaCDTIPOOCORRENCIA->AsInteger > 0 &&
                fdmOcorrencia->CDSOcorrenciaCDSUBTIPOOCORRENCIA->AsInteger > 0){
            BtnOrdemServico->Enabled = true;
        }

        this->Caption = Format("Atendimento # %s - %s",
            ARRAYOFCONST((fdmOcorrencia->CDSOcorrenciaCDOCORRENCIA->AsString, fdmOcorrencia->CDSClienteNMCLIENTE->AsString)));

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao abrir o formulário de ocorrências."
            "\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFOcorrencia::FormClose(TObject *Sender, TCloseAction &Action)
{
    try{
        if(fdmOcorrencia->CDSOcorrenciaISOCORRENCIAENCERRADA->AsInteger == 0){
            if(ValidaOcorrencia()){
                bool ConfirmaEncerramento = Application->MessageBox("Deseja encerrar esta ocorrência agora?","Confirmar", MB_ICONINFORMATION|MB_YESNO) == IDYES;
                if(ConfirmaEncerramento){
                    fdmOcorrencia->CDSOcorrenciaISOCORRENCIAENCERRADA->AsInteger = 1;
                    fdmOcorrencia->CDSOcorrenciaDATAENCERRAMENTO->AsDateTime = DModule->RetornaDataHoraAtual();
                }
            }
        }

        String CodigoOcorrencia = fdmOcorrencia->CDSOcorrenciaCDOCORRENCIA->AsString;
        String CodigoCliente = fdmOcorrencia->CDSOcorrenciaCDCLIENTE->AsString;

        if(CodigoOcorrencia !="" && CodigoCliente != ""){
            CalculaTemposEDistancias();
            fdmOcorrencia->CDSOcorrencia->ApplyUpdates(0);

            if(fdmOcorrencia->CDSProcedimento->Active)
                fdmOcorrencia->CDSProcedimento->ApplyUpdates(0);
            FHome->AtualizarListaOcorrencias();

            fdmOcorrencia->CDSProcedimento->Active = false;
            fdmOcorrencia->CDSContato->Active = false;
            fdmOcorrencia->CDSCliente->Active = false;
            fdmOcorrencia->CDSAgente->Active = false;
            fdmOcorrencia->CDSOperador->Active = false;
            fdmOcorrencia->CDSTipoOcorrencia->Active = false;
            fdmOcorrencia->CDSSubTipoOcorrencia->Active = false;
            fdmOcorrencia->CDSOcorrencia->Active = false;
            fdmOcorrencia->CDSSetores->Active = false;
        }else{

            bool ConfirmaAberturaManual = Application->MessageBox(
                "É necessário preencher os valores destacados em negrito para "
                "gravar uma ocorrência corretamente. Deseja cancelar "
                "o cadastro e fechar tela?","Confirmar", MB_ICONINFORMATION|MB_YESNO) == IDYES;
            if(!ConfirmaAberturaManual){
                Action = caNone;
                return;
            }
        }

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao encerrar a ocorrência."
            "\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }

    Action = caFree;
}

//---------------------------------------------------------------------------

void __fastcall TFOcorrencia::FormKeyPress(TObject *Sender, char &Key)
{
    if (Key == VK_RETURN) {
        Key=0;
        Perform(WM_NEXTDLGCTL, 0, 0);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFOcorrencia::CmbTipoOcorrenciaExit(TObject *Sender)
{
    if(CmbTipoOcorrencia->Text != ""){
        fdmOcorrencia->CDSSubTipoOcorrencia->Filter = Format("CDTIPOOCORRENCIA=%d",
                ARRAYOFCONST((fdmOcorrencia->CDSTipoOcorrenciaCDTIPOOCORRENCIA->AsInteger)));
        fdmOcorrencia->CDSSubTipoOcorrencia->Filtered = true;
    }
}

//---------------------------------------------------------------------------

bool __fastcall TFOcorrencia::ValidaOcorrencia()
{
    try{
        String Operadora = fdmOcorrencia->CDSOcorrenciaCDOPERADORENCERRAMENTO->AsString;
        String Resumo = fdmOcorrencia->CDSOcorrenciaRESUMO->AsString;
        String TipoOcorrencia = fdmOcorrencia->CDSOcorrenciaCDTIPOOCORRENCIA->AsString;
        String CodigoCliente = fdmOcorrencia->CDSOcorrenciaCDCLIENTE->AsString;
        String DataEvento = fdmOcorrencia->CDSOcorrenciaDATAEVENTO->AsString;
        String DataAtendimento = fdmOcorrencia->CDSOcorrenciaDATAATENDIMENTO->AsString;

        if(Operadora == "" || Resumo == "" || TipoOcorrencia == ""){
            return false;
        }
        return true;

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao validar o o encerramento da ocorrência."
            "\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFOcorrencia::CDSOcorrenciaTIPOCTXGetText(TField *Sender, AnsiString
    &Text, bool DisplayText)
{
    if(Sender->AsString != ""){
        switch (Sender->AsInteger)
        {
            case 0:
                Text = "CTA";
            break;
            case 1:
                Text = "CTF";
            break;
            case 2:
                Text = "CTD";
            break;
        }
    }
}

//---------------------------------------------------------------------------

void __fastcall TFOcorrencia::CDSOcorrenciaCDSUBTIPOOCORRENCIAChange(
      TField *Sender)
{
    BtnOrdemServico->Enabled = true;
}

//---------------------------------------------------------------------------

void __fastcall TFOcorrencia::BtnOrdemServicoClick(TObject *Sender)
{
    if(FHome->FormEstaAberto("FCadOrdemServico")){
        String Alerta = "É necessário fechar a tela de ordem de serviço que "
            "esta aberta antes de vincular uma ocorrência.";
        Application->MessageBox(Alerta.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }else{
        AnsiString DescricaoOrdemServico = Format(
        "VERIFICAR: %s, SETORIZAÇÃO: %s %s",
            ARRAYOFCONST((
                fdmOcorrencia->CDSOcorrenciaDESTATUS->AsString,
                fdmOcorrencia->CDSOcorrenciaNUMSETOR->AsString,
                fdmOcorrencia->CDSOcorrenciaLOCAL->AsString)));

        FCadOrdemServico = new TFCadOrdemServico(this);
        FCadOrdemServico->ConsultaOrdemServico(0);
        FCadOrdemServico->CriarOrdemServicoOcorrencia(
            fdmOcorrencia->CDSClienteCDCLIENTE->AsInteger,
            fdmOcorrencia->CDSOcorrenciaCDOPERADORABERTURA->AsInteger,
            DescricaoOrdemServico,
            fdmOcorrencia->CDSOcorrenciaSTATUS->AsString,
            fdmOcorrencia->CDSOcorrenciaCDORDEMSERVICO,
            fdmOcorrencia->CDSOcorrenciaRESUMO);
        FCadOrdemServico->Show();
        FCadOrdemServico->EdtOrdemServico->SetFocus();
    }
}

//---------------------------------------------------------------------------

void __fastcall TFOcorrencia::BtnLocalizarClienteClick(TObject *Sender)
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
    FConsCliente->SetarObjetoCodigoCliente(fdmOcorrencia->CDSOcorrenciaCDCLIENTE);
    FConsCliente->Show();
}

//---------------------------------------------------------------------------

void __fastcall TFOcorrencia::EdtResumoEnter(TObject *Sender)
{
    CalculaTemposEDistancias();
}

//---------------------------------------------------------------------------


void __fastcall TFOcorrencia::EdtDataEventoDblClick(TObject *Sender)
{
    if(!EdtDataEvento->ReadOnly){
        fdmOcorrencia->CDSOcorrenciaDATAEVENTO->AsDateTime = Now();
    }
}

//---------------------------------------------------------------------------

void __fastcall TFOcorrencia::EdtDataAberturaOcorrenciaDblClick(
      TObject *Sender)
{
    if(!EdtDataAberturaOcorrencia->ReadOnly){
        fdmOcorrencia->CDSOcorrenciaDATAATENDIMENTO->AsDateTime = Now();
    }
}

//---------------------------------------------------------------------------

TDateTime __fastcall TFOcorrencia::ConfiguraDataHora(AnsiString HoraInformada, bool bNovoDia)
{
    AnsiString DataAtual;
    if(bNovoDia){
        DataAtual = DateToStr(IncDay(Now(), 1));
    }else{
        DataAtual = DateToStr(Now());
    }
    AnsiString DataHora = Format("%s %s", ARRAYOFCONST((DataAtual, HoraInformada)));
    TDateTime DataFinal = StrToDateTime(DataHora);
    return DataFinal;
}

//---------------------------------------------------------------------------

bool __fastcall TFOcorrencia::ValidaHora(AnsiString HoraInformada){
    if(HoraInformada == "  :  "){
        return false;
    }return true;
}

//---------------------------------------------------------------------------

void __fastcall TFOcorrencia::CalculaTemposEDistancias()
{
    bool CalculouTDeslocamento, CalculouTRetorno = false;

    if(ValidaHora(EdtSaidaEmp->Text) && ValidaHora(EdtChegadaLocal->Text)){
        CalcularTempoDeslocamento();
        CalculouTDeslocamento = true;
    }

    if(ValidaHora(EdtSaidaLocal->Text) && ValidaHora(EdtChegadaEmpresa->Text)){
        CalcularTempoRetorno();
        CalculouTRetorno = true;
    }

    if(CalculouTRetorno && CalculouTDeslocamento){
        CalcularTempoAtendimento();
    }

    float fKmRetorno = fdmOcorrencia->CDSOcorrenciaKMRETORNO->AsFloat;
    float fKmSaida = fdmOcorrencia->CDSOcorrenciaKMSAIDA->AsFloat;
    float fTotal = fKmRetorno - fKmSaida;

    fdmOcorrencia->CDSOcorrenciaKMTOTALPERCORRIDO->AsFloat = fTotal;
}

//---------------------------------------------------------------------------

void __fastcall TFOcorrencia::CalcularTempoDeslocamento()
{
    TTime HoraTempoSaidaEmp = StrToTime(EdtSaidaEmp->Text);
    TTime HoraTempoChegadaLocal = StrToTime(EdtChegadaLocal->Text);
    bool bNovoDia = HoraTempoChegadaLocal < HoraTempoSaidaEmp;
    TDateTime DataHoraSaidaEmp = ConfiguraDataHora(EdtSaidaEmp->Text, false);
    TDateTime DataHoraChegadaLocal = ConfiguraDataHora(EdtChegadaLocal->Text, bNovoDia);

    TDateTime TempoDeslocamento = DataHoraChegadaLocal - DataHoraSaidaEmp;
    fdmOcorrencia->CDSOcorrenciaHORASAIDAEMP->AsDateTime = HoraTempoSaidaEmp;
    fdmOcorrencia->CDSOcorrenciaHORACHEGADALOCAL->AsDateTime = HoraTempoChegadaLocal;
    fdmOcorrencia->CDSOcorrenciaTEMPODESOLOCAMENTO->AsDateTime = TempoDeslocamento;

    EdtTempoDeslocamento->Text = TempoDeslocamento.FormatString("hh:nn");
}

//---------------------------------------------------------------------------

void __fastcall TFOcorrencia::CalcularTempoRetorno()
{
    TTime HoraTempoSaidaLocal = StrToTime(EdtSaidaLocal->Text);
    TTime HoraTempoChegadaEmpresa = StrToTime(EdtChegadaEmpresa->Text);

    bool bNovoDia = HoraTempoChegadaEmpresa < HoraTempoSaidaLocal;
    TDateTime DataHoraSaidaLocal = ConfiguraDataHora(EdtSaidaLocal->Text, false);
    TDateTime DataHoraChegadaEmpresa = ConfiguraDataHora(EdtChegadaEmpresa->Text, bNovoDia);

    TDateTime TempoRetorno = DataHoraChegadaEmpresa - DataHoraSaidaLocal;
    fdmOcorrencia->CDSOcorrenciaHORASAIDALOCAL->AsDateTime = HoraTempoSaidaLocal;
    fdmOcorrencia->CDSOcorrenciaHORACHEGADAEMP->AsDateTime = HoraTempoChegadaEmpresa;
    fdmOcorrencia->CDSOcorrenciaTEMPORETORNO->AsDateTime = TempoRetorno;

    EdtTempoRetorno->Text = TempoRetorno.FormatString("hh:nn");
}

//---------------------------------------------------------------------------

void __fastcall TFOcorrencia::CalcularTempoAtendimento()
{
    TTime TempoDeslocamento = StrToTime(EdtTempoDeslocamento->Text);
    TTime TempoRetorno = StrToTime(EdtTempoRetorno->Text);
    TTime TempoAtendimento = TempoDeslocamento + TempoRetorno;
    EdtTempoAtendimento->Text = TempoAtendimento.FormatString("hh:nn");
    fdmOcorrencia->CDSOcorrenciaTEMPOATENDIMENTO->AsDateTime = TempoAtendimento;
}

//---------------------------------------------------------------------------

void __fastcall TFOcorrencia::DBGSetoresDrawColumnCell(TObject *Sender,
      const TRect &Rect, int DataCol, TColumn *Column,
      TGridDrawState State)
{
    if(fdmOcorrencia->CDSSetores->RecNo % 2){
        (dynamic_cast <TDBGrid*> (Sender))->Canvas->Brush->Color = COLOR_GRID_ALTERNATE_ROW;
    }else{
        (dynamic_cast <TDBGrid*> (Sender))->Canvas->Brush->Color = clWindow;
    }

    if(State.Contains(gdSelected)){
        (dynamic_cast <TDBGrid*> (Sender))->Canvas->Brush->Color = COLOR_GRID_SELECTED_ROW;
    }
    (dynamic_cast <TDBGrid*> (Sender))->DefaultDrawColumnCell(Rect, DataCol, Column, State); 
}

//---------------------------------------------------------------------------

void __fastcall TFOcorrencia::DBGContatosDrawColumnCell(TObject *Sender,
      const TRect &Rect, int DataCol, TColumn *Column,
      TGridDrawState State)
{
    if(fdmOcorrencia->CDSContato->RecNo % 2){
        (dynamic_cast <TDBGrid*> (Sender))->Canvas->Brush->Color = COLOR_GRID_ALTERNATE_ROW;
    }else{
        (dynamic_cast <TDBGrid*> (Sender))->Canvas->Brush->Color = clWindow;
    }

    if(State.Contains(gdSelected)){
        (dynamic_cast <TDBGrid*> (Sender))->Canvas->Brush->Color = COLOR_GRID_SELECTED_ROW;
    }
    (dynamic_cast <TDBGrid*> (Sender))->DefaultDrawColumnCell(Rect, DataCol, Column, State); 
}

//---------------------------------------------------------------------------

void __fastcall TFOcorrencia::EdtOcorrenciaPolicialExit(TObject *Sender)
{
    Close();    
}
//---------------------------------------------------------------------------

void __fastcall TFOcorrencia::CDSOcorrenciaCDCLIENTEChange(TField *Sender)
{
    if(BtnLocalizarCliente->Visible)
    {
        fdmOcorrencia->CDSCliente->Active = false;
        fdmOcorrencia->CDSContato->Active = false;
        fdmOcorrencia->IBQCliente->ParamByName("CDCLIENTE")->AsInteger = fdmOcorrencia->CDSOcorrenciaCDCLIENTE->AsInteger;
        fdmOcorrencia->CDSCliente->Active = true;
        fdmOcorrencia->CDSContato->Active = true;
        if(fdmOcorrencia->IBTCliente->InTransaction)
            fdmOcorrencia->IBTCliente->Commit();

        fdmOcorrencia->CDSProcedimento->Active = false;
        fdmOcorrencia->IBQProcedimeto->ParamByName("CDCLIENTE")->AsInteger = fdmOcorrencia->CDSOcorrenciaCDCLIENTE->AsInteger;
        fdmOcorrencia->CDSProcedimento->Active = true;
        if(fdmOcorrencia->IBTProcedimento->InTransaction)
            fdmOcorrencia->IBTProcedimento->Commit();
        fdmOcorrencia->CDSProcedimento->Edit();

        this->Caption = Format("Atendimento # %s - %s",
            ARRAYOFCONST((fdmOcorrencia->CDSOcorrenciaCDOCORRENCIA->AsString, fdmOcorrencia->CDSClienteNMCLIENTE->AsString)));
    }
}

//---------------------------------------------------------------------------
