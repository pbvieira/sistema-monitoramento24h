//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "Ocorrencia.h"
#include "CadOrdemServico.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

TFOcorrencia *FOcorrencia;
//---------------------------------------------------------------------------
__fastcall TFOcorrencia::TFOcorrencia(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TFOcorrencia::FormShow(TObject *Sender)
{
    PCGrids->ActivePageIndex = 0;
}

//---------------------------------------------------------------------------

void __fastcall TFOcorrencia::GeraOcorrenciaId()
{
    try{
        IBSPGenIdOcorrencia->ExecProc();
        int id = IBSPGenIdOcorrencia->ParamByName("ID")->AsInteger;
        CDSOcorrenciaCDOCORRENCIA->AsInteger = id;
        IBTGenIdOcorrencia->Commit();

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
        BtnLocalizarCliente->Enabled = true;

        CDSAgente->Active = true;
        if(IBTAgente->InTransaction)
            IBTAgente->Commit();

        CDSOperador->Active = true;
        if(IBTOperador->InTransaction)
            IBTOperador->Commit();

        CDSTipoOcorrencia->Active = true;
        if(IBTTipoOcorrencia->InTransaction)
            IBTTipoOcorrencia->Commit();

        CDSSubTipoOcorrencia->Active = true;
        if(IBTSubTipoOcorrencia->InTransaction)
            IBTSubTipoOcorrencia->Commit();

        IBQOcorrencia->ParamByName("CDOCORRENCIA")->AsInteger = 0;
        CDSOcorrencia->Active = true;
        if(IBTOcorrencia->InTransaction)
            IBTOcorrencia->Commit();
        CDSOcorrencia->Edit();
        GeraOcorrenciaId();

        // Realiza um filtro para o combo de subtipos
        CDSSubTipoOcorrencia->Filter = Format("CDTIPOOCORRENCIA=%d",
                ARRAYOFCONST((CDSOcorrenciaCDTIPOOCORRENCIA->AsInteger)));
        CDSSubTipoOcorrencia->Filtered = true;

        // Uma vez que um operador abrir a ocorrência seu nome ficará registrado como operador de abertura
        if(CDSOcorrenciaCDOPERADORABERTURA->AsInteger == 0){
            CDSOcorrenciaCDOPERADORABERTURA->AsInteger = CDUSUARIO;
        }

        // Todo usuário que abrir a tela ficará registrado como usuário de encerramento
        if(CDSOcorrenciaISOCORRENCIAENCERRADA->AsInteger == 0){
            CDSOcorrenciaCDOPERADORENCERRAMENTO->AsInteger = CDUSUARIO;
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
        CDSAgente->Active = true;
        if(IBTAgente->InTransaction)
            IBTAgente->Commit();

        CDSOperador->Active = true;
        if(IBTOperador->InTransaction)
            IBTOperador->Commit();

        CDSTipoOcorrencia->Active = true;
        if(IBTTipoOcorrencia->InTransaction)
            IBTTipoOcorrencia->Commit();

        CDSSubTipoOcorrencia->Active = true;
        if(IBTSubTipoOcorrencia->InTransaction)
            IBTSubTipoOcorrencia->Commit();

        IBQOcorrencia->ParamByName("CDOCORRENCIA")->AsInteger = iCodigoOcorrencia;
        CDSOcorrencia->Active = true;
        if(IBTOcorrencia->InTransaction)
            IBTOcorrencia->Commit();

        IBQCliente->ParamByName("CDCLIENTE")->AsInteger = CDSOcorrenciaCDCLIENTE->AsInteger;
        CDSCliente->Active = true;
        CDSContato->Active = true;
        if(IBTCliente->InTransaction)
            IBTCliente->Commit();

       if(CDSCliente->RecordCount == 0){
            String ErroNaConsulta = "Não foi possível consultar o cliente, verifique "
            " se houve mudança de codificador\ne corrija o cadastro de contratos do cliente.";
            Application->MessageBox(ErroNaConsulta.c_str(),"Atenção",MB_ICONERROR|MB_OK);
            Close();
        }

        // Realiza um filtro para o combo de subtipos
        CDSSubTipoOcorrencia->Filter = Format("CDTIPOOCORRENCIA=%d",
                ARRAYOFCONST((CDSOcorrenciaCDTIPOOCORRENCIA->AsInteger)));
        CDSSubTipoOcorrencia->Filtered = true;

        // Lista os setores
        IBQSetores->ParamByName("CDCODIFICADOR")->AsInteger = CDSOcorrenciaEQUIPAMENTO->AsInteger;
        CDSSetores->Active = true;
        if(IBTSetores->InTransaction)
            IBTSetores->Commit();

        // Campo memo dos procedimentos do cliente
        IBQProcedimeto->ParamByName("CDCLIENTE")->AsInteger = CDSOcorrenciaCDCLIENTE->AsInteger;
        CDSProcedimento->Active = true;
        if(IBTProcedimento->InTransaction)
            IBTProcedimento->Commit();

        // Coloca os dois clients datasets em modo de edição
        CDSOcorrencia->Edit();
        CDSProcedimento->Edit();

        // Bloqueia a edição das datas OC e Atendimento
        EdtDataEvento->ReadOnly = true;
        EdtDataAberturaOcorrencia->ReadOnly = true;
        CDSOcorrenciaDATAEVENTO->ReadOnly = true;
        CDSOcorrenciaDATAATENDIMENTO->ReadOnly = true;

        EdtSaidaEmp->Text = CDSOcorrenciaHORASAIDAEMP->AsDateTime.FormatString("hh:nn");
        EdtChegadaLocal->Text = CDSOcorrenciaHORACHEGADALOCAL->AsDateTime.FormatString("hh:nn");
        EdtSaidaLocal->Text = CDSOcorrenciaHORASAIDALOCAL->AsDateTime.FormatString("hh:nn");
        EdtChegadaEmpresa->Text = CDSOcorrenciaHORACHEGADAEMP->AsDateTime.FormatString("hh:nn");
        EdtTempoDeslocamento->Text = CDSOcorrenciaTEMPODESOLOCAMENTO->AsDateTime.FormatString("hh:nn");
        EdtTempoRetorno->Text = CDSOcorrenciaTEMPORETORNO->AsDateTime.FormatString("hh:nn");
        EdtTempoAtendimento->Text = CDSOcorrenciaTEMPOATENDIMENTO->AsDateTime.FormatString("hh:nn");

        // Uma vez que um operador abrir a ocorrência seu nome ficará registrado como operador de abertura
        if(CDSOcorrenciaCDOPERADORABERTURA->AsInteger == 0){
            CDSOcorrenciaCDOPERADORABERTURA->AsInteger = CDUSUARIO;
        }

        // Todo usuário que abrir a tela ficará registrado como usuário de encerramento
        if(CDSOcorrenciaISOCORRENCIAENCERRADA->AsInteger == 0){
            CDSOcorrenciaCDOPERADORENCERRAMENTO->AsInteger = CDUSUARIO;
        }

        // Verifica se a classificação da OC foi preenchida pra liberar abertura de OS
        if(CDSOcorrenciaCDTIPOOCORRENCIA->AsInteger > 0 &&
                CDSOcorrenciaCDSUBTIPOOCORRENCIA->AsInteger > 0){
            BtnOrdemServico->Enabled = true;
        }

        this->Caption = Format("Atendimento # %s - %s",
            ARRAYOFCONST((CDSOcorrenciaCDOCORRENCIA->AsString, CDSClienteNMCLIENTE->AsString)));

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
        if(CDSOcorrenciaISOCORRENCIAENCERRADA->AsInteger == 0){
            if(ValidaOcorrencia()){
                bool ConfirmaEncerramento = Application->MessageBox("Deseja encerrar esta ocorrência agora?","Confirmar", MB_ICONINFORMATION|MB_YESNO) == IDYES;
                if(ConfirmaEncerramento){
                    CDSOcorrenciaISOCORRENCIAENCERRADA->AsInteger = 1;
                    CDSOcorrenciaDATAENCERRAMENTO->AsDateTime = DModule->RetornaDataHoraAtual();
                }
            }
        }

        String CodigoOcorrencia = CDSOcorrenciaCDOCORRENCIA->AsString;
        String CodigoCliente = CDSOcorrenciaCDCLIENTE->AsString;

        if(CodigoOcorrencia !="" && CodigoCliente != ""){
            CalculaTemposEDistancias();
            CDSOcorrencia->ApplyUpdates(0);

            if(CDSProcedimento->Active)
                CDSProcedimento->ApplyUpdates(0);
            FHome->AtualizarListaOcorrencias();

            CDSProcedimento->Active = false;
            CDSContato->Active = false;
            CDSCliente->Active = false;
            CDSAgente->Active = false;
            CDSOperador->Active = false;
            CDSTipoOcorrencia->Active = false;
            CDSSubTipoOcorrencia->Active = false;
            CDSOcorrencia->Active = false;
            CDSSetores->Active = false;
        }else{

            bool ConfirmaAberturaManual = Application->MessageBox(
                "É necessário preencher os valores destacados em vermelho para "
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

void __fastcall TFOcorrencia::DBGContatosDrawColumnCell(TObject *Sender,
      const TRect &Rect, int DataCol, TColumn *Column,
      TGridDrawState State)
{
    if(CDSContato->RecNo % 2){
        DBGContatos->Canvas->Brush->Color = 15138520;
    }else{
        DBGContatos->Canvas->Brush->Color = clWindow;
    }

    if(State.Contains(gdSelected)){
        DBGContatos->Canvas->Brush->Color = clTeal;
    }

    DBGContatos->DefaultDrawColumnCell(Rect, DataCol, Column, State);
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
        CDSSubTipoOcorrencia->Filter = Format("CDTIPOOCORRENCIA=%d",
                ARRAYOFCONST((CDSTipoOcorrenciaCDTIPOOCORRENCIA->AsInteger)));
        CDSSubTipoOcorrencia->Filtered = true;
    }
}

//---------------------------------------------------------------------------

bool __fastcall TFOcorrencia::ValidaOcorrencia()
{
    try{
        String Operadora = CDSOcorrenciaCDOPERADORENCERRAMENTO->AsString;
        String Resumo = CDSOcorrenciaRESUMO->AsString;
        String TipoOcorrencia = CDSOcorrenciaCDTIPOOCORRENCIA->AsString;
        String SubTipoOcorrencia = CDSOcorrenciaCDSUBTIPOOCORRENCIA->AsString;
        String CodigoCliente = CDSOcorrenciaCDCLIENTE->AsString;
        String DataEvento = CDSOcorrenciaDATAEVENTO->AsString;
        String DataAtendimento = CDSOcorrenciaDATAATENDIMENTO->AsString;
        
        if(Operadora == "" || Resumo == "" || TipoOcorrencia == "" || SubTipoOcorrencia == ""){
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

void __fastcall TFOcorrencia::EdtOcorrenciaPolicialExit(TObject *Sender)
{
    Close();
}

//---------------------------------------------------------------------------

void __fastcall TFOcorrencia::CDSEventosNUMSETORGetText(TField *Sender,
      AnsiString &Text, bool DisplayText)
{
    if(Sender->AsString != NULL){
        AnsiString szSetor = StringReplace (Sender->AsString, "F", "", TReplaceFlags() << rfReplaceAll);
        Text = StrToIntDef("0x" + szSetor, -1);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFOcorrencia::CDSClienteTIPOCTXGetText(TField *Sender,
      AnsiString &Text, bool DisplayText)
{
    try {
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
    }catch(Exception &excecao){
       ;
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
                CDSOcorrenciaDESTATUS->AsString,
                CDSOcorrenciaNUMSETOR->AsString,
                CDSOcorrenciaLOCAL->AsString)));

        FCadOrdemServico = new TFCadOrdemServico(this);
        FCadOrdemServico->ConsultaOrdemServico(0);
        FCadOrdemServico->CriarOrdemServicoOcorrencia(
            CDSClienteCDCLIENTE->AsInteger,
            CDSOcorrenciaCDOPERADORABERTURA->AsInteger,
            DescricaoOrdemServico,
            CDSOcorrenciaSTATUS->AsString,
            CDSOcorrenciaCDORDEMSERVICO,
            CDSOcorrenciaRESUMO);
        FCadOrdemServico->Show();
        FCadOrdemServico->EdtOrdemServico->SetFocus();
    }
}

//---------------------------------------------------------------------------

void __fastcall TFOcorrencia::BtnLocalizarClienteClick(TObject *Sender)
{
    if(FHome->FormEstaAberto("FConsCliente")){
        FConsCliente->Left = 10;
        FConsCliente->Width = 375;
        FConsCliente->GPBConsEndereco->Visible = false;
        FConsCliente->GPBNomeSelecionado->Visible = false;
        FConsCliente->BtnTodos->Visible = false;
        FConsCliente->BtnAbrirClientes->Visible = false;
        FConsCliente->BtnAbrirContratos->Visible = false;
        FConsCliente->BtnSelecionar->Visible = true;
        FConsCliente->SetarObjetoCodigoCliente(CDSOcorrenciaCDCLIENTE);
        FConsCliente->Show();
    }else{
        FConsCliente = new TFConsCliente(this);
        FConsCliente->Width = 375;
        FConsCliente->GPBConsEndereco->Visible = false;
        FConsCliente->GPBNomeSelecionado->Visible = false;
        FConsCliente->BtnTodos->Visible = false;
        FConsCliente->BtnAbrirClientes->Visible = false;
        FConsCliente->BtnAbrirContratos->Visible = false;
        FConsCliente->BtnSelecionar->Visible = true;
        FConsCliente->SetarObjetoCodigoCliente(CDSOcorrenciaCDCLIENTE);
        FConsCliente->Show();
        FConsCliente->Left = 10;
    }
}

//---------------------------------------------------------------------------

void __fastcall TFOcorrencia::DSPOcorrenciaGetTableName(TObject *Sender,
      TDataSet *DataSet, AnsiString &TableName)
{
    TableName = "OCORRENCIA";
}

//---------------------------------------------------------------------------

void __fastcall TFOcorrencia::EdtResumoEnter(TObject *Sender)
{
    CalculaTemposEDistancias();
}

//---------------------------------------------------------------------------

void __fastcall TFOcorrencia::CDSOcorrenciaCDCLIENTEChange(TField *Sender)
{
    if(BtnLocalizarCliente->Enabled)
    {
        CDSCliente->Active = false;
        CDSContato->Active = false;
        IBQCliente->ParamByName("CDCLIENTE")->AsInteger = CDSOcorrenciaCDCLIENTE->AsInteger;
        CDSCliente->Active = true;
        CDSContato->Active = true;
        if(IBTCliente->InTransaction)
            IBTCliente->Commit();

        CDSProcedimento->Active = false;
        IBQProcedimeto->ParamByName("CDCLIENTE")->AsInteger = CDSOcorrenciaCDCLIENTE->AsInteger;
        CDSProcedimento->Active = true;
        if(IBTProcedimento->InTransaction)
            IBTProcedimento->Commit();
        CDSProcedimento->Edit();

        this->Caption = Format("Atendimento # %s - %s",
            ARRAYOFCONST((CDSOcorrenciaCDOCORRENCIA->AsString, CDSClienteNMCLIENTE->AsString)));
    }
}

//---------------------------------------------------------------------------

void __fastcall TFOcorrencia::EdtDataEventoDblClick(TObject *Sender)
{
    if(!EdtDataEvento->ReadOnly){
        CDSOcorrenciaDATAEVENTO->AsDateTime = Now();
    }
}

//---------------------------------------------------------------------------

void __fastcall TFOcorrencia::EdtDataAberturaOcorrenciaDblClick(
      TObject *Sender)
{
    if(!EdtDataAberturaOcorrencia->ReadOnly){
        CDSOcorrenciaDATAATENDIMENTO->AsDateTime = Now();
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

    float fKmRetorno = CDSOcorrenciaKMRETORNO->AsFloat;
    float fKmSaida = CDSOcorrenciaKMSAIDA->AsFloat;
    float fTotal = fKmRetorno - fKmSaida;

    CDSOcorrenciaKMTOTALPERCORRIDO->AsFloat = fTotal;
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
    CDSOcorrenciaHORASAIDAEMP->AsDateTime = HoraTempoSaidaEmp;
    CDSOcorrenciaHORACHEGADALOCAL->AsDateTime = HoraTempoChegadaLocal;
    CDSOcorrenciaTEMPODESOLOCAMENTO->AsDateTime = TempoDeslocamento;

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
    CDSOcorrenciaHORASAIDALOCAL->AsDateTime = HoraTempoSaidaLocal;
    CDSOcorrenciaHORACHEGADAEMP->AsDateTime = HoraTempoChegadaEmpresa;
    CDSOcorrenciaTEMPORETORNO->AsDateTime = TempoRetorno;

    EdtTempoRetorno->Text = TempoRetorno.FormatString("hh:nn");
}

//---------------------------------------------------------------------------

void __fastcall TFOcorrencia::CalcularTempoAtendimento()
{
    TTime TempoDeslocamento = StrToTime(EdtTempoDeslocamento->Text);
    TTime TempoRetorno = StrToTime(EdtTempoRetorno->Text);
    TTime TempoAtendimento = TempoDeslocamento + TempoRetorno;
    EdtTempoAtendimento->Text = TempoAtendimento.FormatString("hh:nn");
    CDSOcorrenciaTEMPOATENDIMENTO->AsDateTime = TempoAtendimento;
}

//---------------------------------------------------------------------------

