//---------------------------------------------------------------------------
#include <vcl.h>
#include <winuser.h>
#include <stdio.h>
#include <dos.h>
#include <IniFiles.hpp>

#define AZSIM
#include "Home.h"
#include "Login.h"
#include "FaltaComunicacaoCTX.h"
#include "RelTopEventos.h"
#include "ListRelatoriosAtendimento.h"
#include "CadOrdemServico.h"
#include "ConsOrdemServico.h"
#include "CadCodificadores.h"
#include "RelOcorrenciasEncerradas.h"
#include "DMCliente.h"

#pragma hdrstop
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "SHDocVw_OCX"
#pragma resource "*.dfm"
//---------------------------------------------------------------------------

HWND apphwnd;
HWND apphwnd1;
HWND apphwnd2;
HWND apphwnd3;
HWND apphwnd4;
HWND apphwnd5;
HWND apphwnd6;
HWND apphwnd7;
HWND apphwnd8;
HWND apphwnd9;
HWND apphwnd10;
HWND apphwnd11;
HWND apphwnd12;
HWND apphwnd13;
HWND apphwnd14;
HWND apphwnd15;
HWND apphwnd16;

String appMonitor;

bool montaTreeView = true;
int totalClientesSemComunicacao = 0;

//*************Global functions for hosting******************/
//Function to enumerate all windows.
int CALLBACK EnumWindowsProc(HWND hwnd, LPARAM param)
{
    DWORD pID;
    DWORD TpID = GetWindowThreadProcessId(hwnd, &pID);//get process id
    if (TpID == (DWORD)param){
        apphwnd=hwnd;//hwnd is the window handle
        return false;
    }
    return true;
}

//Function to start a orocess and return the process handle
HANDLE StartProcess(LPCTSTR program, LPCTSTR args)
{
     HANDLE hProcess = NULL;
     PROCESS_INFORMATION processInfo;
     STARTUPINFO startupInfo;

     ::ZeroMemory(&startupInfo, sizeof(startupInfo));

     startupInfo.cb = sizeof(startupInfo);
     startupInfo.dwFlags = STARTF_USESHOWWINDOW;
     startupInfo.wShowWindow = SW_HIDE;

     if(::CreateProcess(program, (LPTSTR)args,
                        NULL,  // process security
                        NULL,  // thread security
                        TRUE,  // no inheritance
                        0,     // no startup flags
                        NULL,  // no special environment
                        NULL,  // default startup directory
                        &startupInfo,
                        &processInfo))
        { /* success */
            Screen->Cursor = crHourGlass;
			Sleep(1500);
            Screen->Cursor = crArrow;
		 	::EnumWindows((WNDENUMPROC)&EnumWindowsProc, processInfo.dwThreadId);//Iterate all windows
	        hProcess = processInfo.hProcess;
        } /* success */
     return hProcess;
}

TFHome *FHome;

//---------------------------------------------------------------------------

__fastcall TFHome::TFHome(TComponent* Owner)
    : TForm(Owner)
{
    apphwnd   = NULL;
    apphwnd1  = NULL;
    apphwnd2  = NULL;
    apphwnd3  = NULL;
    apphwnd4  = NULL;
    apphwnd5  = NULL;
    apphwnd6  = NULL;
    apphwnd7  = NULL;
    apphwnd8  = NULL;
    apphwnd9  = NULL;
    apphwnd10 = NULL;
    apphwnd11 = NULL;
    apphwnd12 = NULL;
    apphwnd13 = NULL;
    apphwnd14 = NULL;
    apphwnd15 = NULL;
    apphwnd16 = NULL;
}

//---------------------------------------------------------------------------

void __fastcall TFHome::FormShow(TObject *Sender)
{
    if(ATENDEROCORRENCIAS){
        PGCHome->ActivePageIndex = 0;
        TMRConsulta->Enabled = true;
        TMRMonitoramento->Enabled = true;
    }else{
        PGCHome->ActivePageIndex = 2;
        TMRConsulta->Enabled = false;
        TMRMonitoramento->Enabled = false;
    }

    if(!ISADMINISTRADOR){
        MnCadCliente->Enabled = false;
        MnCadContrato->Enabled = false;
        MnCadProcedimento->Enabled = false;
        MnUsuarios->Enabled = false;
        MnFiliais->Enabled = false;
        MnConsClientes->Enabled = false;
    }

    TIniFile *ini = new TIniFile(ARQUIVO_INICIALIZACAO);
    appMonitor = ini->ReadString(SECAO_MONITOR,"Monitor","");
    delete ini;
    SBarHome->Panels->Items[0]->Text = "Usuário ativo: " + NMUSUARIO;
    SBarHome->Panels->Items[1]->Text = ISADMINISTRADOR ? "Usuário Operador(a) Administrador" : "Usuário Operador(a)";

    // Seta data atual no registro de eventos
    EdtDataInicial->Date   = IncDay(DModule->RetornaDataHoraAtual(), -1);
    EdtDataFinal->Date     = IncDay(DModule->RetornaDataHoraAtual(),  2);
    EdtDataInicialOC->Date = IncDay(DModule->RetornaDataHoraAtual(), -1);
    EdtDataFinalOC->Date   = IncDay(DModule->RetornaDataHoraAtual(),  2);

    // Lista as ocorrências abertas
    if(ATENDEROCORRENCIAS){
        try{
            CDSOcorrenciasAbertas->Active = true;
            if(IBTOcorrenciasAbertas->InTransaction)
                IBTOcorrenciasAbertas->Commit();
            IBEOcorrencia->Events->Add("0C0RRENCIA");
            IBEOcorrencia->RegisterEvents();

        }catch(Exception &excecao){
            AnsiString erro = excecao.Message;
            String ErroNaConexao =
                "Ocorreu um erro ao abrir o formulário de ocorrências abertas."
                "\n\nDescrição do erro:\n" + erro;
            Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
        }
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::FormClose(TObject *Sender, TCloseAction &Action)
{
    // Fecha o monitor de eventos
    /*
    if(apphwnd1 != NULL)
        PostMessage(apphwnd1, WM_CLOSE, 0, 0);

    if(apphwnd2 != NULL)
        PostMessage(apphwnd2, WM_CLOSE, 0, 0);

    if(apphwnd3 != NULL)
        PostMessage(apphwnd3, WM_CLOSE, 0, 0);

    if(apphwnd4 != NULL)
        PostMessage(apphwnd4, WM_CLOSE, 0, 0);

    if(apphwnd5 != NULL)
        PostMessage(apphwnd5, WM_CLOSE, 0, 0);

    if(apphwnd6 != NULL)
        PostMessage(apphwnd6, WM_CLOSE, 0, 0);

    if(apphwnd7 != NULL)
        PostMessage(apphwnd7, WM_CLOSE, 0, 0);

    if(apphwnd8 != NULL)
        PostMessage(apphwnd8, WM_CLOSE, 0, 0);

    if(apphwnd9 != NULL)
        PostMessage(apphwnd9, WM_CLOSE, 0, 0);

    if(apphwnd10 != NULL)
        PostMessage(apphwnd10, WM_CLOSE, 0, 0);

    if(apphwnd11 != NULL)
        PostMessage(apphwnd11, WM_CLOSE, 0, 0);

    if(apphwnd12 != NULL)
        PostMessage(apphwnd12, WM_CLOSE, 0, 0);

    if(apphwnd13 != NULL)
        PostMessage(apphwnd13, WM_CLOSE, 0, 0);

    if(apphwnd14 != NULL)
        PostMessage(apphwnd14, WM_CLOSE, 0, 0);

    if(apphwnd15 != NULL)
        PostMessage(apphwnd15, WM_CLOSE, 0, 0);

    if(apphwnd16 != NULL)
        PostMessage(apphwnd16, WM_CLOSE, 0, 0);
    */

    CDSConsFaltaComunicacao->Active = false;
    CDSConsEventos->Active = false;
    CDSRelAtendimento->Active = false;
    CDSOcorrenciasAbertas->Active = false;

    CDSIdentificaZero->Active = false;
    CDSIdentifica->Active = false;
    CDSSetorCurto->Active = false;
    CDSBateriaFraca->Active = false;
    CDSSensorIRContPreso->Active = false;
    CDSConsertoSistema->Active = false;
    CDSRetiradaKit->Active = false;
    CDSCanalRFAberto->Active = false;
    CDSMauContato->Active = false;
    CDSSemEnergia->Active = false;
    CDSAgenteLocal->Active = false;
    CDSPresencaAnimais->Active = false;
    CDSAlarmeAcidental->Active = false;
    CDSSuspeitoLocal->Active = false;
    CDSSinalArrombamento->Active = false;
    CDSJanelaMalFechada->Active = false;
    CDSSinalIndesejado->Active = false;

    CDSCliConsOrdemServico->Active = false;
    CDSCliConsArmeDesarme->Active = false;
    CDSCliConsOcorrencia->Active = false;
    CDSCliConsLogEvento->Active = false;

    Action = caFree;
    Application->Terminate();
}

//---------------------------------------------------------------------------

bool __fastcall TFHome::FormEstaAberto(AnsiString Name)
{
    for (int i = 0; i < Screen->FormCount; i++){
        if (Screen->Forms[i]->Name == Name){
            return true;
        }
    }
    return false;
}

//---------------------------------------------------------------------------

TForm* TFHome::OcorrenciaEmAtendimento(int iCdOcorrencia)
{
    for (int i = 0; i < Screen->FormCount; i++){
        AnsiString szNomeFormulario = Screen->Forms[i]->Name;
        if (szNomeFormulario.Pos("FOcorrencia") > 0){
            if(dynamic_cast <TFOcorrencia*>(Screen->Forms[i])->FOcorrenciaId == iCdOcorrencia){
                return dynamic_cast <TFOcorrencia*>(Screen->Forms[i]);
            }
        }
    }
    return NULL;
}

//---------------------------------------------------------------------------
// MENUS
//---------------------------------------------------------------------------

void __fastcall TFHome::MnSairClick(TObject *Sender)
{
    Close();
}

//---------------------------------------------------------------------------

void __fastcall TFHome::MnCadMonitoramentoClick(TObject *Sender)
{
    if(FormEstaAberto("FCadMonitoramento")){
        FCadMonitoramento->Show();
    }else{
        FCadMonitoramento = new TFCadMonitoramento(this);
        FCadMonitoramento->Show();
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::MnCadContratoClick(TObject *Sender)
{
    if(FormEstaAberto("FCadContratoBasico")){
        FCadContratoBasico->Show();
    }else{
        FCadContratoBasico = new TFCadContratoBasico(this);
        FCadContratoBasico->ConsultaContrato(0, 0);
        FCadContratoBasico->Show();
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::MnCadClienteClick(TObject *Sender)
{
    if(FormEstaAberto("FCadCliente")){
        FCadCliente->Show();
    }else{
        FCadCliente = new TFCadCliente(this);
        FCadCliente->ConsultaCliente(0);
        FCadCliente->Show();
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::MnConsClientesClick(TObject *Sender)
{
    if(FormEstaAberto("FConsCliente")){
        FConsCliente->Width = 1010;
        FConsCliente->GPBConsEndereco->Visible = true;
        FConsCliente->GPBNomeSelecionado->Visible = true;
        FConsCliente->BtnTodos->Visible = true;
        FConsCliente->BtnAbrirClientes->Visible = true;
        FConsCliente->BtnAbrirContratos->Visible = true;
        FConsCliente->BtnSelecionar->Visible = false;
        FConsCliente->Show();
    }else{
        FConsCliente = new TFConsCliente(this);
        FConsCliente->Width = 1010;
        FConsCliente->GPBConsEndereco->Visible = true;
        FConsCliente->GPBNomeSelecionado->Visible = true;
        FConsCliente->BtnTodos->Visible = true;
        FConsCliente->BtnAbrirClientes->Visible = true;
        FConsCliente->BtnAbrirContratos->Visible = true;
        FConsCliente->BtnSelecionar->Visible = false;        
        FConsCliente->Show();
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::MnCadProcedimentoClick(TObject *Sender)
{
    if(FormEstaAberto("FCadProcedimento")){
        FCadProcedimento->Show();
    }else{
        FCadProcedimento = new TFCadProcedimento(this);
        FCadProcedimento->Show();
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::MnFiliaisClick(TObject *Sender)
{
    if(FormEstaAberto("FCadFilial")){
        FCadFilial->Show();
    }else{
        FCadFilial = new TFCadFilial(this);
        FCadFilial->Show();
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::MnUsuariosClick(TObject *Sender)
{
    if(FormEstaAberto("FCadUsuario")){
        FCadUsuario->Show();
    }else{
        FCadUsuario = new TFCadUsuario(this);
        FCadUsuario->Show();
    }
}

//---------------------------------------------------------------------------

/*
Tela de configuração de sistema ativo
void __fastcall TFHome::MnCadMonitoramentoClick(TObject *Sender)
{
    if(FormEstaAberto("FCadMonitoramento")){
        this->FormCadastroMonitoramento->Show();
    }else{
        this->FormCadastroMonitoramento = new TFCadMonitoramento(this);
        this->FormCadastroMonitoramento->Show();
    }
}
*/

//---------------------------------------------------------------------------

// GERAL
//---------------------------------------------------------------------------

void __fastcall TFHome::DBGOcorrenciasHistDblClick(TObject *Sender)
{
    TFOcorrencia *FOcorrencia = NULL;
    int iCdOcorrencia = CDSRelAtendimentoCDOCORRENCIA->AsInteger;
    if(iCdOcorrencia > 0){
        FOcorrencia = dynamic_cast <TFOcorrencia*>(FHome->OcorrenciaEmAtendimento(iCdOcorrencia));
        if(FOcorrencia != NULL){
            FOcorrencia->Show();
        }else{
            FOcorrencia = new TFOcorrencia(this);
            FOcorrencia->FOcorrenciaId = iCdOcorrencia;
            FOcorrencia->ConsultaOcorrencia(iCdOcorrencia);
            FOcorrencia->Show();
        }
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::BtnConsultarClick(TObject *Sender)
{
    try{
        AnsiString LIMITA_CONSULTA = "SELECT FIRST 200";
        if(!CkbAtualizar->Checked){
            LIMITA_CONSULTA = "SELECT";
        }
        AnsiString SQL_ORDER_BY = " ORDER BY DATAEVENTO DESC";
        AnsiString SQL_FILTRO_DATA = Format("%s DATAEVENTO, CTX, PORTACOM, EQUIPAMENTO, "
          "  STATUS, DESTATUS, CDCLIENTE, NMCLIENTE, ENDERECO, CIDADE "
          "  FROM VLOGEVENTO WHERE E.DATAEVENTO BETWEEN :DATAINICIAL AND :DATAFINAL %s",
          ARRAYOFCONST((LIMITA_CONSULTA, SQL_ORDER_BY)));

        AnsiString SQL_FILTRO = SQL_FILTRO_DATA;
        AnsiString SQL_FILTRO_CODIGO = SQL_FILTRO_DATA.SubString(0, StrLen(SQL_FILTRO_DATA.c_str()) - StrLen(SQL_ORDER_BY.c_str())) + " AND E.CDCLIENTE = :CDCLIENTE" + SQL_ORDER_BY;
        AnsiString SQL_FILTRO_NOME = SQL_FILTRO_DATA.SubString(0, StrLen(SQL_FILTRO_DATA.c_str()) - StrLen(SQL_ORDER_BY.c_str())) + " AND E.NMCLIENTE LIKE UPPER(:NMCLIENTE)" + SQL_ORDER_BY;
        AnsiString SQL_FILTRO_CODIFICADOR = SQL_FILTRO_DATA.SubString(0, StrLen(SQL_FILTRO_DATA.c_str()) - StrLen(SQL_ORDER_BY.c_str())) + " AND E.EQUIPAMENTO = :EQUIPAMENTO" + SQL_ORDER_BY;

        CDSConsEventos->Close();
        IBQConsEventos->SQL->Clear();
        IBQConsEventos->SQL->Text = SQL_FILTRO;

        int CodigoCliente = StrToIntDef(EdtCodCliente->Text, 0);
        AnsiString NomeCliente = EdtNome->Text;
        int Codificador = StrToIntDef(EdtCodificador->Text, 0);;
        AnsiString Estatus = EdtStatus->Text;
        AnsiString StatusDescricao = EdtStatusDescricao->Text;

        if(CodigoCliente > 0){
            CDSConsEventos->Close();
            IBQConsEventos->SQL->Clear();
            SQL_FILTRO = SQL_FILTRO_CODIGO;
            IBQConsEventos->SQL->Text = SQL_FILTRO;

        }else if(NomeCliente != ""){
            CDSConsEventos->Close();
            IBQConsEventos->SQL->Clear();
            SQL_FILTRO = SQL_FILTRO_NOME;
            IBQConsEventos->SQL->Text = SQL_FILTRO;

        }else if(Codificador > 0){
            CDSConsEventos->Close();
            IBQConsEventos->SQL->Clear();
            SQL_FILTRO = SQL_FILTRO_CODIFICADOR;
            IBQConsEventos->SQL->Text = SQL_FILTRO;
        }

        if(Estatus != ""){
            CDSConsEventos->Close();
            IBQConsEventos->SQL->Clear();
            SQL_FILTRO = SQL_FILTRO.SubString(0, StrLen(SQL_FILTRO.c_str()) - StrLen(SQL_ORDER_BY.c_str())) +
                " AND STATUS LIKE :STATUS" + SQL_ORDER_BY;
            IBQConsEventos->SQL->Text = SQL_FILTRO;
            IBQConsEventos->ParamByName("STATUS")->Size = 5;

        }else if(StatusDescricao != ""){
            CDSConsEventos->Close();
            IBQConsEventos->SQL->Clear();
            SQL_FILTRO = SQL_FILTRO.SubString(0, StrLen(SQL_FILTRO.c_str()) - StrLen(SQL_ORDER_BY.c_str())) +
                " AND DESTATUS LIKE :DESTATUS" + SQL_ORDER_BY;
            IBQConsEventos->SQL->Text = SQL_FILTRO;
        }

        ConfiguraCriteriosEventosSQL();

        IBQConsEventos->ParamByName("DATAINICIAL")->AsDate = EdtDataInicial->Date;
        IBQConsEventos->ParamByName("DATAFINAL")->AsDate = EdtDataFinal->Date;
        CDSConsEventos->Active = true;
         int totalRegistros = CDSConsEventos->RecordCount;

        if(IBTConsEventos->InTransaction){
            IBTConsEventos->Commit();
        }

        AnsiString statusMonitoramento = " (atualização automática apresenta no máximo 200 registros)";

        if(CkbAtualizar->Checked){
            TMRConsulta->Enabled = true;
        }else{
            TMRConsulta->Enabled = false;
            statusMonitoramento = "";
        }

        SBarHome->Panels->Items[2]->Text = "Total de registros encontrados: " + IntToStr(totalRegistros) + statusMonitoramento;

    }catch(Exception &excecao){
        /*
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao consultar o cadastro de eventos.\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
        */
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::BtnConsultarOCClick(TObject *Sender)
{
    try{
        AnsiString SQL_ORDER_BY = " ORDER BY DATAEVENTO, CDOCORRENCIA";

        AnsiString SQL_FILTRO_DATA =
            "SELECT CDOCORRENCIA, DATAEVENTO, DATAATENDIMENTO, DATAENCERRAMENTO, CTX, PORTACOM, EQUIPAMENTO, CDCLIENTE, NMCLIENTE, ENDERECO, CIDADE, STATUS, "
                "DESTATUS, LOCAL, RESUMO, OPERADORABERTURA, OPERADORENCERRAMENTO, AGENTE, KMTOTALPERCORRIDO "
            "FROM VOCORRENCIAS_ENCERRADAS "
            "WHERE DATAEVENTO BETWEEN :DATAINICIAL AND :DATAFINAL" + SQL_ORDER_BY;

        AnsiString SQL_FILTRO = SQL_FILTRO_DATA;
        AnsiString SQL_FILTRO_CODIGO = SQL_FILTRO_DATA.SubString(0, StrLen(SQL_FILTRO_DATA.c_str()) - StrLen(SQL_ORDER_BY.c_str())) + " AND CDCLIENTE = :CDCLIENTE" + SQL_ORDER_BY;
        AnsiString SQL_FILTRO_NOME = SQL_FILTRO_DATA.SubString(0, StrLen(SQL_FILTRO_DATA.c_str()) - StrLen(SQL_ORDER_BY.c_str())) + " AND NMCLIENTE LIKE UPPER(:NMCLIENTE)" + SQL_ORDER_BY;
        AnsiString SQL_FILTRO_CODIFICADOR = SQL_FILTRO_DATA.SubString(0, StrLen(SQL_FILTRO_DATA.c_str()) - StrLen(SQL_ORDER_BY.c_str())) + " AND EQUIPAMENTO = :EQUIPAMENTO" + SQL_ORDER_BY;

        CDSRelAtendimento->Close();
        IBQRelAtendimento->SQL->Clear();
        IBQRelAtendimento->SQL->Text = SQL_FILTRO_DATA;

        int CodigoCliente = StrToIntDef(EdtCodClienteOC->Text, 0);
        AnsiString NomeCliente = EdtNomeOC->Text;
        int Codificador = StrToIntDef(EdtCodificadorOC->Text, 0);
        AnsiString Estatus = EdtStatusOC->Text;
        AnsiString StatusDescricao = EdtStatusDescricaoOC->Text;

        if(CodigoCliente > 0){
            CDSRelAtendimento->Close();
            IBQRelAtendimento->SQL->Clear();
            SQL_FILTRO = SQL_FILTRO_CODIGO;
            IBQRelAtendimento->SQL->Text = SQL_FILTRO;

        }else if(NomeCliente != ""){
            CDSRelAtendimento->Close();
            IBQRelAtendimento->SQL->Clear();
            SQL_FILTRO = SQL_FILTRO_NOME;
            IBQRelAtendimento->SQL->Text = SQL_FILTRO;

        }else if(Codificador > 0){
            CDSRelAtendimento->Close();
            IBQRelAtendimento->SQL->Clear();
            SQL_FILTRO = SQL_FILTRO_CODIFICADOR;
            IBQRelAtendimento->SQL->Text = SQL_FILTRO;
        }

        if(Estatus != ""){
            CDSRelAtendimento->Close();
            IBQRelAtendimento->SQL->Clear();
            SQL_FILTRO = SQL_FILTRO.SubString(0, StrLen(SQL_FILTRO.c_str()) - StrLen(SQL_ORDER_BY.c_str())) +
                " AND STATUS LIKE :STATUS" + SQL_ORDER_BY;
            IBQRelAtendimento->SQL->Text = SQL_FILTRO;
            IBQRelAtendimento->ParamByName("STATUS")->Size = 5;

        }else if(StatusDescricao != ""){
            CDSRelAtendimento->Close();
            IBQRelAtendimento->SQL->Clear();
            SQL_FILTRO = SQL_FILTRO.SubString(0, StrLen(SQL_FILTRO.c_str()) - StrLen(SQL_ORDER_BY.c_str())) +
                " AND DESTATUS LIKE :DESTATUS" + SQL_ORDER_BY;
            IBQRelAtendimento->SQL->Text = SQL_FILTRO;
        }

        ConfiguraCriteriosOcorrenciasSQL();

        IBQRelAtendimento->ParamByName("DATAINICIAL")->AsDate = EdtDataInicialOC->Date;
        IBQRelAtendimento->ParamByName("DATAFINAL")->AsDate = EdtDataFinalOC->Date;
        CDSRelAtendimento->Active = true;
        int totalRegistros = CDSRelAtendimento->RecordCount;

        /*
        if(totalRegistros > 0){
            BtnImprimirOC->Enabled = true;
        }else{
            BtnImprimirOC->Enabled = false;
        }
        */

        if(IBTRelAtendimento->InTransaction){
            IBTRelAtendimento->Commit();
        }

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao consultar o cadastro de ocorências.\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::ConfiguraCriteriosEventosSQL()
{
    int CodigoCliente = StrToIntDef(EdtCodCliente->Text, 0);
    AnsiString NomeCliente = EdtNome->Text;
    int Codificador = StrToIntDef(EdtCodificador->Text, 0);;
    AnsiString Estatus = EdtStatus->Text;
    AnsiString StatusDescricao = EdtStatusDescricao->Text;

    if(CodigoCliente > 0){
        IBQConsEventos->ParamByName("CDCLIENTE")->AsInteger = CodigoCliente;

    }else if(NomeCliente != ""){
        IBQConsEventos->ParamByName("NMCLIENTE")->AsString = "%" + NomeCliente + "%";

    }else if(Codificador > 0){
        IBQConsEventos->ParamByName("EQUIPAMENTO")->AsInteger = Codificador;
    }

    if(Estatus != ""){
        if(StrLen(Estatus.c_str()) < 4){
            IBQConsEventos->ParamByName("STATUS")->AsString = Estatus + "%";
        }else{
            IBQConsEventos->ParamByName("STATUS")->AsString = Estatus;
        }
    }else if(StatusDescricao != ""){
        IBQConsEventos->ParamByName("DESTATUS")->AsString = "%" + StatusDescricao + "%";
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::ConfiguraCriteriosOcorrenciasSQL()
{
    int CodigoCliente = StrToIntDef(EdtCodClienteOC->Text, 0);
    AnsiString NomeCliente = EdtNomeOC->Text;
    int Codificador = StrToIntDef(EdtCodificadorOC->Text, 0);;
    AnsiString Estatus = EdtStatusOC->Text;
    AnsiString StatusDescricao = EdtStatusDescricaoOC->Text;

    if(CodigoCliente > 0){
        IBQRelAtendimento->ParamByName("CDCLIENTE")->AsInteger = CodigoCliente;

    }else if(NomeCliente != ""){
        IBQRelAtendimento->ParamByName("NMCLIENTE")->AsString = "%" + NomeCliente + "%";

    }else if(Codificador > 0){
        IBQRelAtendimento->ParamByName("EQUIPAMENTO")->AsInteger = Codificador;
    }

    if(Estatus != ""){
        if(StrLen(Estatus.c_str()) < 4){
            IBQRelAtendimento->ParamByName("STATUS")->AsString = Estatus + "%";
        }else{
            IBQRelAtendimento->ParamByName("STATUS")->AsString = Estatus;
        }
    }else if(StatusDescricao != ""){
        IBQRelAtendimento->ParamByName("DESTATUS")->AsString = "%" + StatusDescricao + "%";
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::TMRConsultaTimer(TObject *Sender)
{
    BtnConsultarClick(Sender);
}

//---------------------------------------------------------------------------

void __fastcall TFHome::CkbAtualizarClick(TObject *Sender)
{
    if(!CkbAtualizar->Checked){
        TMRConsulta->Enabled = false;
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::TMRMonitoramentoTimer(TObject *Sender)
{
    /*
        - Lista todos os clientes que possuem configuração de monitoramento (VLISTA_MONITORCLIENTES)
        - Verifica se a data e hora atual retorna alguma intervalo
        - Se retornar um intervalo refaz a consulta usando o horario do evento de arme pra verificar se o estado atual é armado
        - Se retornar um registro esta certo,
        - Caso contrário verifiva se já foi registrado uma ocorência para essta data e intervalo se não regisra uma ocorrência
        - Caso contrário não faz nada
    */

    CDSConsFaltaComunicacao->Active = false;
    CDSConsFaltaComunicacao->Active = true;

    if(IBTConsFaltaComunicacao->InTransaction)
        IBTConsFaltaComunicacao->Commit();

    if(CDSConsFaltaComunicacao->RecordCount > 0){
        if(FormEstaAberto("FAvisoFaltaComunicacaoCTX")){
            FAvisoFaltaComunicacaoCTX->Show();
        }else{
            FAvisoFaltaComunicacaoCTX = new TFAvisoFaltaComunicacaoCTX(this);
            FAvisoFaltaComunicacaoCTX->Show();
        }
    }else{
        if(FormEstaAberto("FAvisoFaltaComunicacaoCTX")){
            FAvisoFaltaComunicacaoCTX->Close();
            CDSConsFaltaComunicacao->Active = false;
        }
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::IBEOcorrenciaEventAlert(TObject *Sender,
      AnsiString EventName, int EventCount, bool &CancelAlerts)
{
    AtualizarListaOcorrencias();
    Application->MessageBox("NOVA OCORRÊNCIA RECEBIDA", "Atenção", MB_ICONWARNING|MB_OK);
}

//---------------------------------------------------------------------------

void __fastcall TFHome::MnMonitor1Click(TObject *Sender)
{
    char acCmdline[100];
    sprintf(acCmdline,"%s -MONITOR 1 -HANDLE %d", appMonitor, this->Handle);

    HWND hwnd = FindWindow(NULL, "COM1");
    if (hwnd == 0){
        apphwnd = NULL;
        StartProcess(NULL, acCmdline);
        if(apphwnd){
            apphwnd1 = apphwnd;
        }
    }else{
        Application->MessageBox("Monitor Serial COM1 já está aberto.","Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::MnMonitor2Click(TObject *Sender)
{
    char acCmdline[100];
    sprintf(acCmdline,"%s -MONITOR 2 -HANDLE %d", appMonitor, this->Handle);

    HWND hwnd = FindWindow(NULL, "COM2");
    if (hwnd == 0){
        apphwnd = NULL;
        StartProcess(NULL, acCmdline);
        if(apphwnd){
            apphwnd2 = apphwnd;
        }
    }else{
        Application->MessageBox("Monitor Serial COM2 já está aberto.","Atenção",MB_ICONERROR|MB_OK);
    }
}
//---------------------------------------------------------------------------

void __fastcall TFHome::MnMonitor3Click(TObject *Sender)
{
    char acCmdline[100];
    sprintf(acCmdline,"%s -MONITOR 3 -HANDLE %d", appMonitor, this->Handle);

    HWND hwnd = FindWindow(NULL, "COM3");
    if (hwnd == 0){
        apphwnd = NULL;
        StartProcess(NULL, acCmdline);
        if(apphwnd){
            apphwnd3 = apphwnd;
        }
    }else{
        Application->MessageBox("Monitor Serial COM3 já está aberto.","Atenção",MB_ICONERROR|MB_OK);
    }
}
//---------------------------------------------------------------------------

void __fastcall TFHome::MnMonitor4Click(TObject *Sender)
{
    char acCmdline[100];
    sprintf(acCmdline,"%s -MONITOR 4 -HANDLE %d", appMonitor, this->Handle);

    HWND hwnd = FindWindow(NULL, "COM4");
    if (hwnd == 0){
        apphwnd = NULL;
        StartProcess(NULL, acCmdline);
        if(apphwnd){
            apphwnd4 = apphwnd;
        }
    }else{
        Application->MessageBox("Monitor Serial COM4 já está aberto.","Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::MnMonitor5Click(TObject *Sender)
{
    char acCmdline[100];
    sprintf(acCmdline,"%s -MONITOR 5 -HANDLE %d", appMonitor, this->Handle);

    HWND hwnd = FindWindow(NULL, "COM5");
    if (hwnd == 0){
        apphwnd = NULL;
        StartProcess(NULL, acCmdline);
        if(apphwnd){
            apphwnd5 = apphwnd;
        }
    }else{
        Application->MessageBox("Monitor Serial COM5 já está aberto.","Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::MnMonitor6Click(TObject *Sender)
{
    char acCmdline[100];
    sprintf(acCmdline,"%s -MONITOR 6 -HANDLE %d", appMonitor, this->Handle);

    HWND hwnd = FindWindow(NULL, "COM6");
    if (hwnd == 0){
        apphwnd = NULL;
        StartProcess(NULL, acCmdline);
        if(apphwnd){
            apphwnd6 = apphwnd;
        }
    }else{
        Application->MessageBox("Monitor Serial COM6 já está aberto.","Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::MnMonitor7Click(TObject *Sender)
{
    char acCmdline[100];
    sprintf(acCmdline,"%s -MONITOR 7 -HANDLE %d", appMonitor, this->Handle);

    HWND hwnd = FindWindow(NULL, "COM7");
    if (hwnd == 0){
        apphwnd = NULL;
        StartProcess(NULL, acCmdline);
        if(apphwnd){
            apphwnd7 = apphwnd;
        }
    }else{
        Application->MessageBox("Monitor Serial COM7 já está aberto.","Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::MnMonitor8Click(TObject *Sender)
{
    char acCmdline[100];
    sprintf(acCmdline,"%s -MONITOR 8 -HANDLE %d", appMonitor, this->Handle);

    HWND hwnd = FindWindow(NULL, "COM8");
    if (hwnd == 0){
        apphwnd = NULL;
        StartProcess(NULL, acCmdline);
        if(apphwnd){
            apphwnd8 = apphwnd;
        }
    }else{
        Application->MessageBox("Monitor Serial COM8 já está aberto.","Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::MnMonitor9Click(TObject *Sender)
{
    char acCmdline[100];
    sprintf(acCmdline,"%s -MONITOR 9 -HANDLE %d", appMonitor, this->Handle);

    HWND hwnd = FindWindow(NULL, "COM9");
    if (hwnd == 0){
        apphwnd = NULL;
        StartProcess(NULL, acCmdline);
        if(apphwnd){
            apphwnd9 = apphwnd;
        }
    }else{
        Application->MessageBox("Monitor Serial COM9 já está aberto.","Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::MnMonitor10Click(TObject *Sender)
{
    char acCmdline[100];
    sprintf(acCmdline,"%s -MONITOR 10 -HANDLE %d", appMonitor, this->Handle);

    HWND hwnd = FindWindow(NULL, "COM10");
    if (hwnd == 0){
        apphwnd = NULL;
        StartProcess(NULL, acCmdline);
        if(apphwnd){
            apphwnd10 = apphwnd;
        }
    }else{
        Application->MessageBox("Monitor Serial COM10 já está aberto.","Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::MnMonitor11Click(TObject *Sender)
{
    char acCmdline[100];
    sprintf(acCmdline,"%s -MONITOR 11 -HANDLE %d", appMonitor, this->Handle);

    HWND hwnd = FindWindow(NULL, "COM11");
    if (hwnd == 0){
        apphwnd = NULL;
        StartProcess(NULL, acCmdline);
        if(apphwnd){
            apphwnd11 = apphwnd;
        }
    }else{
        Application->MessageBox("Monitor Serial COM11 já está aberto.","Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::MnMonitor12Click(TObject *Sender)
{
    char acCmdline[100];
    sprintf(acCmdline,"%s -MONITOR 12 -HANDLE %d", appMonitor, this->Handle);

    HWND hwnd = FindWindow(NULL, "COM12");
    if (hwnd == 0){
        apphwnd = NULL;
        StartProcess(NULL, acCmdline);
        if(apphwnd){
            apphwnd12 = apphwnd;
        }
    }else{
        Application->MessageBox("Monitor Serial COM12 já está aberto.","Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::MnMonitor13Click(TObject *Sender)
{
    char acCmdline[100];
    sprintf(acCmdline,"%s -MONITOR 13 -HANDLE %d", appMonitor, this->Handle);

    HWND hwnd = FindWindow(NULL, "COM13");
    if (hwnd == 0){
        apphwnd = NULL;
        StartProcess(NULL, acCmdline);
        if(apphwnd){
            apphwnd13 = apphwnd;
        }
    }else{
        Application->MessageBox("Monitor Serial COM13 já está aberto.","Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::MnMonitor14Click(TObject *Sender)
{
    char acCmdline[100];
    sprintf(acCmdline,"%s -MONITOR 14 -HANDLE %d", appMonitor, this->Handle);

    HWND hwnd = FindWindow(NULL, "COM14");
    if (hwnd == 0){
        apphwnd = NULL;
        StartProcess(NULL, acCmdline);
        if(apphwnd){
            apphwnd14 = apphwnd;
        }
    }else{
        Application->MessageBox("Monitor Serial COM14 já está aberto.","Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::MnMonitor15Click(TObject *Sender)
{
    char acCmdline[100];
    sprintf(acCmdline,"%s -MONITOR 15 -HANDLE %d", appMonitor, this->Handle);

    HWND hwnd = FindWindow(NULL, "COM15");
    if (hwnd == 0){
        apphwnd = NULL;
        StartProcess(NULL, acCmdline);
        if(apphwnd){
            apphwnd15 = apphwnd;
        }
    }else{
        Application->MessageBox("Monitor Serial COM15 já está aberto.","Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::MnMonitor16Click(TObject *Sender)
{
    char acCmdline[100];
    sprintf(acCmdline,"%s -MONITOR 16 -HANDLE %d", appMonitor, this->Handle);

    HWND hwnd = FindWindow(NULL, "COM16");
    if (hwnd == 0){
        apphwnd = NULL;
        StartProcess(NULL, acCmdline);
        if(apphwnd){
            apphwnd16 = apphwnd;
        }
    }else{
        Application->MessageBox("Monitor Serial COM16 já está aberto.","Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::MnCadastrarOSClick(TObject *Sender)
{
    if(FormEstaAberto("FCadOrdemServico")){
        FCadUsuario->Show();
    }else{
        FCadOrdemServico = new TFCadOrdemServico(this);
        FCadOrdemServico->ConsultaOrdemServico(0);
        FCadOrdemServico->Show();
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::MnConsultarOSClick(TObject *Sender)
{
    if(FormEstaAberto("FConsOrdemServico")){
        FConsOrdemServico->Show();
    }else{
        FConsOrdemServico = new TFConsOrdemServico(this);
        FConsOrdemServico->Show();
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::AtualizarListaOcorrencias()
{
    CDSOcorrenciasAbertas->Active = false;
    CDSOcorrenciasAbertas->Active = true;
    if(IBTOcorrenciasAbertas->InTransaction)
        IBTOcorrenciasAbertas->Commit();
}

//---------------------------------------------------------------------------

void __fastcall TFHome::DBGOcorrenciasDblClick(TObject *Sender)
{
    TFOcorrencia *FOcorrencia = NULL;
    int iCdOcorrencia = CDSOcorrenciasAbertasCDOCORRENCIA->AsInteger;
    if(iCdOcorrencia > 0){
        FOcorrencia = dynamic_cast <TFOcorrencia*>(OcorrenciaEmAtendimento(iCdOcorrencia));
        if(FOcorrencia != NULL){
            FOcorrencia->Show();
        }else{
            FOcorrencia = new TFOcorrencia(FHome);
            FOcorrencia->FOcorrenciaId = iCdOcorrencia;
            FOcorrencia->ConsultaOcorrencia(iCdOcorrencia);
            FOcorrencia->Show();
        }
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::DBGCliConsOcorrenciasDblClick(TObject *Sender)
{
    TFOcorrencia *FOcorrencia = NULL;
    int iCdOcorrencia = CDSCliConsOcorrenciaCDOCORRENCIA->AsInteger;
    if(iCdOcorrencia > 0){
        FOcorrencia = dynamic_cast <TFOcorrencia*>(OcorrenciaEmAtendimento(iCdOcorrencia));
        if(FOcorrencia != NULL){
            FOcorrencia->Show();
        }else{
            FOcorrencia = new TFOcorrencia(FHome);
            FOcorrencia->FOcorrenciaId = iCdOcorrencia;
            FOcorrencia->ConsultaOcorrencia(iCdOcorrencia);
            FOcorrencia->Show();
        }
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::DSPConsFaltaComunicacaoGetTableName(
      TObject *Sender, TDataSet *DataSet, AnsiString &TableName)
{
    TableName = "LOGCTX";
}

//---------------------------------------------------------------------------

void __fastcall TFHome::MnRelAtendimentoClick(TObject *Sender)
{
    if(FormEstaAberto("FListRelatoriosAtendimento")){
        FListRelatoriosAtendimento->Show();
    }else{
        FListRelatoriosAtendimento = new TFListRelatoriosAtendimento(this);
        FListRelatoriosAtendimento->Show();
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::MnCadCodificadorClick(TObject *Sender)
{
    if(FormEstaAberto("FCadCodificadores")){
        FCadCodificadores->Show();
    }else{
        FCadCodificadores = new TFCadCodificadores(this);
        FCadCodificadores->Show();
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::BtnImprimirOCClick(TObject *Sender)
{
    if(QRPOcorrenciasEncerradas == NULL){
        QRPOcorrenciasEncerradas = new TQRPOcorrenciasEncerradas(this);
    }

    QRPOcorrenciasEncerradas->DataSet = CDSRelAtendimento;
    QRPOcorrenciasEncerradas->QRDBTDATAEVENTO->DataSet = CDSRelAtendimento;
    QRPOcorrenciasEncerradas->QRDBTDATAATENDIMENTO->DataSet = CDSRelAtendimento;
    QRPOcorrenciasEncerradas->QRDBTDATAENCERRAMENTO->DataSet = CDSRelAtendimento;
    QRPOcorrenciasEncerradas->QRDBTOPERADORABERTURA->DataSet = CDSRelAtendimento;
    QRPOcorrenciasEncerradas->QRDBTSTATUS->DataSet = CDSRelAtendimento;
    QRPOcorrenciasEncerradas->QRDBTDESTATUS->DataSet = CDSRelAtendimento;
    QRPOcorrenciasEncerradas->QRDBTLOCAL->DataSet = CDSRelAtendimento;
    QRPOcorrenciasEncerradas->QRDBTRESUMO->DataSet = CDSRelAtendimento;
    QRPOcorrenciasEncerradas->QRDBTOPERADORENCERRAMENTO->DataSet = CDSRelAtendimento;
    QRPOcorrenciasEncerradas->QRDBTAGENTE->DataSet = CDSRelAtendimento;
    QRPOcorrenciasEncerradas->QRDBTKMTOTALPERCORRIDO->DataSet = CDSRelAtendimento;
    QRPOcorrenciasEncerradas->QRDBTEQUIPAMENTO->DataSet = CDSRelAtendimento;
    QRPOcorrenciasEncerradas->QRDBTNMCLIENTE->DataSet = CDSRelAtendimento;
    QRPOcorrenciasEncerradas->PreviewModal();
}

//---------------------------------------------------------------------------

void __fastcall TFHome::MnAbrirOcorrenciaClick(TObject *Sender)
{
    TFOcorrencia *FOcorrencia = new TFOcorrencia(FHome);
    FOcorrencia->FOcorrenciaId = 0;
    FOcorrencia->AbrirManualmente();
    FOcorrencia->Show();
}

//---------------------------------------------------------------------------

void __fastcall TFHome::DBGClientesManutencaoDrawColumnCell(
      TObject *Sender, const TRect &Rect, int DataCol, TColumn *Column,
      TGridDrawState State)
{
    if(DBGClientesManutencao->DataSource->Name == "DSIdentificaZero"){
        if(CDSIdentificaZeroTOTAL_ATIVA->AsInteger == 0){
            DBGClientesManutencao->Canvas->Font->Color = clRed;
        }
    }

    if(DBGClientesManutencao->DataSource->Name == "DSIdentifica"){
        if(CDSIdentificaTOTAL_ATIVA->AsInteger == 0){
            DBGClientesManutencao->Canvas->Font->Color = clRed;
        }
    }

    DBGClientesManutencao->DefaultDrawColumnCell(Rect, DataCol, Column, State);
}

//---------------------------------------------------------------------------

void __fastcall TFHome::DBGCliConsOrdensAbertasDblClick(TObject *Sender)
{
    if(CDSCliConsOrdemServico->Active && CDSCliConsOrdemServico > 0){
        int CodigoOS = CDSCliConsOrdemServicoCDORDEMSERVICO->AsInteger;
        bool bFCadOrdemServico = FormEstaAberto("FCadOrdemServico");
        if(bFCadOrdemServico){
            FCadOrdemServico->ConsultaOrdemServico(CodigoOS);
            FCadOrdemServico->Show();
        }else{
            FCadOrdemServico = new TFCadOrdemServico(FHome);
            FCadOrdemServico->ConsultaOrdemServico(CodigoOS);
            FCadOrdemServico->Show();
        }
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::TVEventosAnalisadosClick(TObject *Sender)
{
    TTreeNode *nodeSelecionado = dynamic_cast <TTreeView*>(Sender)->Selected;
    if(nodeSelecionado != NULL){

        CDSCliConsOrdemServico->Active = false;
        CDSCliConsArmeDesarme->Active = false;
        CDSCliConsOcorrencia->Active = false;
        CDSCliConsLogEvento->Active = false;

        switch(nodeSelecionado->Index){
            case 0:
                DSMasterCliConsOrdemServico->DataSet = IBQIdentificaZero;
                DSMasterCliConsArmeDesarme->DataSet = IBQIdentificaZero;
                DSMasterCliConsOcorrencia->DataSet = IBQIdentificaZero;
                DSMasterCliConsLogEvento->DataSet = IBQIdentificaZero;
                CDSCliConsOrdemServico->DataSetField = CDSIdentificaZeroIBQCliConsOrdemServico;
                CDSCliConsArmeDesarme->DataSetField = CDSIdentificaZeroIBQCliConsArmeDesarme;
                CDSCliConsOcorrencia->DataSetField = CDSIdentificaZeroIBQCliConsOcorrencia;
                CDSCliConsLogEvento->DataSetField = CDSIdentificaZeroIBQCliConsLogEvento;

                DBGClientesManutencao->DataSource = DSIdentificaZero;
                DBGClientesManutencao->Columns->Items[1]->Visible = false;
            break;

            case 1:
                DSMasterCliConsOrdemServico->DataSet = IBQIdentifica;
                DSMasterCliConsArmeDesarme->DataSet = IBQIdentifica;
                DSMasterCliConsOcorrencia->DataSet = IBQIdentifica;
                DSMasterCliConsLogEvento->DataSet = IBQIdentifica;
                CDSCliConsOrdemServico->DataSetField = CDSIdentificaIBQCliConsOrdemServico;
                CDSCliConsArmeDesarme->DataSetField = CDSIdentificaIBQCliConsArmeDesarme;
                CDSCliConsOcorrencia->DataSetField = CDSIdentificaIBQCliConsOcorrencia;
                CDSCliConsLogEvento->DataSetField = CDSIdentificaIBQCliConsLogEvento;

                DBGClientesManutencao->DataSource = DSIdentifica;
                DBGClientesManutencao->Columns->Items[1]->Visible = true;
            break;

            case 2:
                DSMasterCliConsOrdemServico->DataSet = IBQSetorCurto;
                DSMasterCliConsArmeDesarme->DataSet = IBQSetorCurto;
                DSMasterCliConsOcorrencia->DataSet = IBQSetorCurto;
                DSMasterCliConsLogEvento->DataSet = IBQSetorCurto;
                CDSCliConsOrdemServico->DataSetField = CDSSetorCurtoIBQCliConsOrdemServico;
                CDSCliConsArmeDesarme->DataSetField = CDSSetorCurtoIBQCliConsArmeDesarme;
                CDSCliConsOcorrencia->DataSetField = CDSSetorCurtoIBQCliConsOcorrencia;
                CDSCliConsLogEvento->DataSetField = CDSSetorCurtoIBQCliConsLogEvento;

                DBGClientesManutencao->DataSource = DSSetorCurto;
                DBGClientesManutencao->Columns->Items[1]->Visible = false;
            break;

            case 3:
                DSMasterCliConsOrdemServico->DataSet = IBQBateriaFraca;
                DSMasterCliConsArmeDesarme->DataSet = IBQBateriaFraca;
                DSMasterCliConsOcorrencia->DataSet = IBQBateriaFraca;
                DSMasterCliConsLogEvento->DataSet = IBQBateriaFraca;
                CDSCliConsOrdemServico->DataSetField = CDSBateriaFracaIBQCliConsOrdemServico;
                CDSCliConsArmeDesarme->DataSetField = CDSBateriaFracaIBQCliConsArmeDesarme;
                CDSCliConsOcorrencia->DataSetField = CDSBateriaFracaIBQCliConsOcorrencia;
                CDSCliConsLogEvento->DataSetField = CDSBateriaFracaIBQCliConsLogEvento;

                DBGClientesManutencao->DataSource = DSBateriaFraca;
                DBGClientesManutencao->Columns->Items[1]->Visible = false;
            break;

            case 4:
                DSMasterCliConsOrdemServico->DataSet = IBQSensorIRContPreso;
                DSMasterCliConsArmeDesarme->DataSet = IBQSensorIRContPreso;
                DSMasterCliConsOcorrencia->DataSet = IBQSensorIRContPreso;
                DSMasterCliConsLogEvento->DataSet = IBQSensorIRContPreso;
                CDSCliConsOrdemServico->DataSetField = CDSSensorIRContPresoIBQCliConsOrdemServico;
                CDSCliConsArmeDesarme->DataSetField = CDSSensorIRContPresoIBQCliConsArmeDesarme;
                CDSCliConsOcorrencia->DataSetField = CDSSensorIRContPresoIBQCliConsOcorrencia;
                CDSCliConsLogEvento->DataSetField = CDSSensorIRContPresoIBQCliConsLogEvento;

                DBGClientesManutencao->DataSource = DSSensorIRContPreso;
                DBGClientesManutencao->Columns->Items[1]->Visible = false;
            break;

            case 5:
                DSMasterCliConsOrdemServico->DataSet = IBQConsertoSistema;
                DSMasterCliConsArmeDesarme->DataSet = IBQConsertoSistema;
                DSMasterCliConsOcorrencia->DataSet = IBQConsertoSistema;
                DSMasterCliConsLogEvento->DataSet = IBQConsertoSistema;
                CDSCliConsOrdemServico->DataSetField = CDSConsertoSistemaIBQCliConsOrdemServico;
                CDSCliConsArmeDesarme->DataSetField = CDSConsertoSistemaIBQCliConsArmeDesarme;
                CDSCliConsOcorrencia->DataSetField = CDSConsertoSistemaIBQCliConsOcorrencia;
                CDSCliConsLogEvento->DataSetField = CDSConsertoSistemaIBQCliConsLogEvento;

                DBGClientesManutencao->DataSource = DSConsertoSistema;
                DBGClientesManutencao->Columns->Items[1]->Visible = false;
            break;

            case 6:
                DSMasterCliConsOrdemServico->DataSet = IBQRetiradaKit;
                DSMasterCliConsArmeDesarme->DataSet = IBQRetiradaKit;
                DSMasterCliConsOcorrencia->DataSet = IBQRetiradaKit;
                DSMasterCliConsLogEvento->DataSet = IBQRetiradaKit;
                CDSCliConsOrdemServico->DataSetField = CDSRetiradaKitIBQCliConsOrdemServico;
                CDSCliConsArmeDesarme->DataSetField = CDSRetiradaKitIBQCliConsArmeDesarme;
                CDSCliConsOcorrencia->DataSetField = CDSRetiradaKitIBQCliConsOcorrencia;
                CDSCliConsLogEvento->DataSetField = CDSRetiradaKitIBQCliConsLogEvento;

                DBGClientesManutencao->DataSource = DSRetiradaKit;
                DBGClientesManutencao->Columns->Items[1]->Visible = false;
            break;

            case 7:
                DSMasterCliConsOrdemServico->DataSet = IBQCanalRFAberto;
                DSMasterCliConsArmeDesarme->DataSet = IBQCanalRFAberto;
                DSMasterCliConsOcorrencia->DataSet = IBQCanalRFAberto;
                DSMasterCliConsLogEvento->DataSet = IBQCanalRFAberto;
                CDSCliConsOrdemServico->DataSetField = CDSCanalRFAbertoIBQCliConsOrdemServico;
                CDSCliConsArmeDesarme->DataSetField = CDSCanalRFAbertoIBQCliConsArmeDesarme;
                CDSCliConsOcorrencia->DataSetField = CDSCanalRFAbertoIBQCliConsOcorrencia;
                CDSCliConsLogEvento->DataSetField = CDSCanalRFAbertoIBQCliConsLogEvento;

                DBGClientesManutencao->DataSource = DSCanalRFAberto;
                DBGClientesManutencao->Columns->Items[1]->Visible = false;
            break;

            case 8:
                DSMasterCliConsOrdemServico->DataSet = IBQMauContato;
                DSMasterCliConsArmeDesarme->DataSet = IBQMauContato;
                DSMasterCliConsOcorrencia->DataSet = IBQMauContato;
                DSMasterCliConsLogEvento->DataSet = IBQMauContato;
                CDSCliConsOrdemServico->DataSetField = CDSMauContatoIBQCliConsOrdemServico;
                CDSCliConsArmeDesarme->DataSetField = CDSMauContatoIBQCliConsArmeDesarme;
                CDSCliConsOcorrencia->DataSetField = CDSMauContatoIBQCliConsOcorrencia;
                CDSCliConsLogEvento->DataSetField = CDSMauContatoIBQCliConsLogEvento;

                DBGClientesManutencao->DataSource = DSMauContato;
                DBGClientesManutencao->Columns->Items[1]->Visible = false;
            break;

            case 9:
                DSMasterCliConsOrdemServico->DataSet = IBQSemEnergia;
                DSMasterCliConsArmeDesarme->DataSet = IBQSemEnergia;
                DSMasterCliConsOcorrencia->DataSet = IBQSemEnergia;
                DSMasterCliConsLogEvento->DataSet = IBQSemEnergia;
                CDSCliConsOrdemServico->DataSetField = CDSSemEnergiaIBQCliConsOrdemServico;
                CDSCliConsArmeDesarme->DataSetField = CDSSemEnergiaIBQCliConsArmeDesarme;
                CDSCliConsOcorrencia->DataSetField = CDSSemEnergiaIBQCliConsOcorrencia;
                CDSCliConsLogEvento->DataSetField = CDSSemEnergiaIBQCliConsLogEvento;

                DBGClientesManutencao->DataSource = DSSemEnergia;
                DBGClientesManutencao->Columns->Items[1]->Visible = false;
            break;

            case 10:
                DSMasterCliConsOrdemServico->DataSet = IBQAgenteLocal;
                DSMasterCliConsArmeDesarme->DataSet = IBQAgenteLocal;
                DSMasterCliConsOcorrencia->DataSet = IBQAgenteLocal;
                DSMasterCliConsLogEvento->DataSet = IBQAgenteLocal;
                CDSCliConsOrdemServico->DataSetField = CDSAgenteLocalIBQCliConsOrdemServico;
                CDSCliConsArmeDesarme->DataSetField = CDSAgenteLocalIBQCliConsArmeDesarme;
                CDSCliConsOcorrencia->DataSetField = CDSAgenteLocalIBQCliConsOcorrencia;
                CDSCliConsLogEvento->DataSetField = CDSAgenteLocalIBQCliConsLogEvento;

                DBGClientesManutencao->DataSource = DSAgenteLocal;
                DBGClientesManutencao->Columns->Items[1]->Visible = false;
            break;

            case 11:
                DSMasterCliConsOrdemServico->DataSet = IBQPresencaAnimais;
                DSMasterCliConsArmeDesarme->DataSet = IBQPresencaAnimais;
                DSMasterCliConsOcorrencia->DataSet = IBQPresencaAnimais;
                DSMasterCliConsLogEvento->DataSet = IBQPresencaAnimais;
                CDSCliConsOrdemServico->DataSetField = CDSPresencaAnimaisIBQCliConsOrdemServico;
                CDSCliConsArmeDesarme->DataSetField = CDSPresencaAnimaisIBQCliConsArmeDesarme;
                CDSCliConsOcorrencia->DataSetField = CDSPresencaAnimaisIBQCliConsOcorrencia;
                CDSCliConsLogEvento->DataSetField = CDSPresencaAnimaisIBQCliConsLogEvento;

                DBGClientesManutencao->DataSource = DSPresencaAnimais;
                DBGClientesManutencao->Columns->Items[1]->Visible = false;
            break;

            case 12:
                DSMasterCliConsOrdemServico->DataSet = IBQAlarmeAcidental;
                DSMasterCliConsArmeDesarme->DataSet = IBQAlarmeAcidental;
                DSMasterCliConsOcorrencia->DataSet = IBQAlarmeAcidental;
                DSMasterCliConsLogEvento->DataSet = IBQAlarmeAcidental;
                CDSCliConsOrdemServico->DataSetField = CDSAlarmeAcidentalIBQCliConsOrdemServico;
                CDSCliConsArmeDesarme->DataSetField = CDSAlarmeAcidentalIBQCliConsArmeDesarme;
                CDSCliConsOcorrencia->DataSetField = CDSAlarmeAcidentalIBQCliConsOcorrencia;
                CDSCliConsLogEvento->DataSetField = CDSAlarmeAcidentalIBQCliConsLogEvento;

                DBGClientesManutencao->DataSource = DSAlarmeAcidental;
                DBGClientesManutencao->Columns->Items[1]->Visible = false;
            break;

            case 13:
                DSMasterCliConsOrdemServico->DataSet = IBQSuspeitoLocal;
                DSMasterCliConsArmeDesarme->DataSet = IBQSuspeitoLocal;
                DSMasterCliConsOcorrencia->DataSet = IBQSuspeitoLocal;
                DSMasterCliConsLogEvento->DataSet = IBQSuspeitoLocal;
                CDSCliConsOrdemServico->DataSetField = CDSSuspeitoLocalIBQCliConsOrdemServico;
                CDSCliConsArmeDesarme->DataSetField = CDSSuspeitoLocalIBQCliConsArmeDesarme;
                CDSCliConsOcorrencia->DataSetField = CDSSuspeitoLocalIBQCliConsOcorrencia;
                CDSCliConsLogEvento->DataSetField = CDSSuspeitoLocalIBQCliConsLogEvento;

                DBGClientesManutencao->DataSource = DSSuspeitoLocal;
                DBGClientesManutencao->Columns->Items[1]->Visible = false;
            break;

            case 14:
                DSMasterCliConsOrdemServico->DataSet = IBQSinalArrombamento;
                DSMasterCliConsArmeDesarme->DataSet = IBQSinalArrombamento;
                DSMasterCliConsOcorrencia->DataSet = IBQSinalArrombamento;
                DSMasterCliConsLogEvento->DataSet = IBQSinalArrombamento;
                CDSCliConsOrdemServico->DataSetField = CDSSinalArrombamentoIBQCliConsOrdemServico;
                CDSCliConsArmeDesarme->DataSetField = CDSSinalArrombamentoIBQCliConsArmeDesarme;
                CDSCliConsOcorrencia->DataSetField = CDSSinalArrombamentoIBQCliConsOcorrencia;
                CDSCliConsLogEvento->DataSetField = CDSSinalArrombamentoIBQCliConsLogEvento;

                DBGClientesManutencao->DataSource = DSSinalArrombamento;
                DBGClientesManutencao->Columns->Items[1]->Visible = false;
            break;

            case 15:
                DSMasterCliConsOrdemServico->DataSet = IBQJanelaMalFechada;
                DSMasterCliConsArmeDesarme->DataSet = IBQJanelaMalFechada;
                DSMasterCliConsOcorrencia->DataSet = IBQJanelaMalFechada;
                DSMasterCliConsLogEvento->DataSet = IBQJanelaMalFechada;
                CDSCliConsOrdemServico->DataSetField = CDSJanelaMalFechadaIBQCliConsOrdemServico;
                CDSCliConsArmeDesarme->DataSetField = CDSJanelaMalFechadaIBQCliConsArmeDesarme;
                CDSCliConsOcorrencia->DataSetField = CDSJanelaMalFechadaIBQCliConsOcorrencia;
                CDSCliConsLogEvento->DataSetField = CDSJanelaMalFechadaIBQCliConsLogEvento;

                DBGClientesManutencao->DataSource = DSJanelaMalFechada;
                DBGClientesManutencao->Columns->Items[1]->Visible = false;
            break;

            case 16:
                DSMasterCliConsOrdemServico->DataSet = IBQSinalIndesejado;
                DSMasterCliConsArmeDesarme->DataSet = IBQSinalIndesejado;
                DSMasterCliConsOcorrencia->DataSet = IBQSinalIndesejado;
                DSMasterCliConsLogEvento->DataSet = IBQSinalIndesejado;
                CDSCliConsOrdemServico->DataSetField = CDSSinalIndesejadoIBQCliConsOrdemServico;
                CDSCliConsArmeDesarme->DataSetField = CDSSinalIndesejadoIBQCliConsArmeDesarme;
                CDSCliConsOcorrencia->DataSetField = CDSSinalIndesejadoIBQCliConsOcorrencia;
                CDSCliConsLogEvento->DataSetField = CDSSinalIndesejadoIBQCliConsLogEvento;

                DBGClientesManutencao->DataSource = DSSinalIndesejado;
                DBGClientesManutencao->Columns->Items[1]->Visible = false;
            break;
        }
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::BtnConsultarManutPreventivasClick(TObject *Sender)
{
    try{
        // Indetifica zer não precisa de percentual, já que são os clientes sem comunicação
        DBGClientesManutencao->Columns->Items[1]->Visible = false;
        Application->MessageBox("Esta consulta irá demorar alguns minutos, congelando o sistema. "
        "Clique em OK e aguarde até o término!",
            "Atenção", MB_ICONWARNING|MB_OK);

        // IDENTIFICACAO
        if(CDSIdentificaZero->Active){
            CDSIdentificaZero->Active = false;
        }

        DSMasterCliConsOrdemServico->DataSet = IBQIdentificaZero;
        DSMasterCliConsArmeDesarme->DataSet = IBQIdentificaZero;
        DSMasterCliConsOcorrencia->DataSet = IBQIdentificaZero;
        DSMasterCliConsLogEvento->DataSet = IBQIdentificaZero;
        CDSCliConsOrdemServico->DataSetField = CDSIdentificaZeroIBQCliConsOrdemServico;
        CDSCliConsArmeDesarme->DataSetField = CDSIdentificaZeroIBQCliConsArmeDesarme;
        CDSCliConsOcorrencia->DataSetField = CDSIdentificaZeroIBQCliConsOcorrencia;
        CDSCliConsLogEvento->DataSetField = CDSIdentificaZeroIBQCliConsLogEvento;
        CDSIdentificaZero->Active = true;

        CDSCliConsOrdemServico->Active = false;
        CDSCliConsArmeDesarme->Active = false;
        CDSCliConsOcorrencia->Active = false;
        CDSCliConsLogEvento->Active = false;

        if(CDSIdentifica->Active){
            CDSIdentifica->Active = false;
        }

        DSMasterCliConsOrdemServico->DataSet = IBQIdentifica;
        DSMasterCliConsArmeDesarme->DataSet = IBQIdentifica;
        DSMasterCliConsOcorrencia->DataSet = IBQIdentifica;
        DSMasterCliConsLogEvento->DataSet = IBQIdentifica;
        CDSCliConsOrdemServico->DataSetField = CDSIdentificaIBQCliConsOrdemServico;
        CDSCliConsArmeDesarme->DataSetField = CDSIdentificaIBQCliConsArmeDesarme;
        CDSCliConsOcorrencia->DataSetField = CDSIdentificaIBQCliConsOcorrencia;
        CDSCliConsLogEvento->DataSetField = CDSIdentificaIBQCliConsLogEvento;
        CDSIdentifica->Active = true;

        CDSCliConsOrdemServico->Active = false;
        CDSCliConsArmeDesarme->Active = false;
        CDSCliConsOcorrencia->Active = false;
        CDSCliConsLogEvento->Active = false;

        // SETOR EM CURTO
        if(CDSSetorCurto->Active){
            CDSSetorCurto->Active = false;
        }

        DSMasterCliConsOrdemServico->DataSet = IBQSetorCurto;
        DSMasterCliConsArmeDesarme->DataSet = IBQSetorCurto;
        DSMasterCliConsOcorrencia->DataSet = IBQSetorCurto;
        DSMasterCliConsLogEvento->DataSet = IBQSetorCurto;
        CDSCliConsOrdemServico->DataSetField = CDSSetorCurtoIBQCliConsOrdemServico;
        CDSCliConsArmeDesarme->DataSetField = CDSSetorCurtoIBQCliConsArmeDesarme;
        CDSCliConsOcorrencia->DataSetField = CDSSetorCurtoIBQCliConsOcorrencia;
        CDSCliConsLogEvento->DataSetField = CDSSetorCurtoIBQCliConsLogEvento;
        CDSSetorCurto->Active = true;

        CDSCliConsOrdemServico->Active = false;
        CDSCliConsArmeDesarme->Active = false;
        CDSCliConsOcorrencia->Active = false;
        CDSCliConsLogEvento->Active = false;

        // BATERIA FRACA
        if(CDSBateriaFraca->Active){
            CDSBateriaFraca->Active = false;
        }

        DSMasterCliConsOrdemServico->DataSet = IBQBateriaFraca;
        DSMasterCliConsArmeDesarme->DataSet = IBQBateriaFraca;
        DSMasterCliConsOcorrencia->DataSet = IBQBateriaFraca;
        DSMasterCliConsLogEvento->DataSet = IBQBateriaFraca;
        CDSCliConsOrdemServico->DataSetField = CDSBateriaFracaIBQCliConsOrdemServico;
        CDSCliConsArmeDesarme->DataSetField = CDSBateriaFracaIBQCliConsArmeDesarme;
        CDSCliConsOcorrencia->DataSetField = CDSBateriaFracaIBQCliConsOcorrencia;
        CDSCliConsLogEvento->DataSetField = CDSBateriaFracaIBQCliConsLogEvento;

        CDSBateriaFraca->Active = true;

        CDSCliConsOrdemServico->Active = false;
        CDSCliConsArmeDesarme->Active = false;
        CDSCliConsOcorrencia->Active = false;
        CDSCliConsLogEvento->Active = false;

        // SENSOR IR/CONT.PRESO
        if(CDSSensorIRContPreso->Active){
            CDSSensorIRContPreso->Active = false;
        }

        DSMasterCliConsOrdemServico->DataSet = IBQSensorIRContPreso;
        DSMasterCliConsArmeDesarme->DataSet = IBQSensorIRContPreso;
        DSMasterCliConsOcorrencia->DataSet = IBQSensorIRContPreso;
        DSMasterCliConsLogEvento->DataSet = IBQSensorIRContPreso;
        CDSCliConsOrdemServico->DataSetField = CDSSensorIRContPresoIBQCliConsOrdemServico;
        CDSCliConsArmeDesarme->DataSetField = CDSSensorIRContPresoIBQCliConsArmeDesarme;
        CDSCliConsOcorrencia->DataSetField = CDSSensorIRContPresoIBQCliConsOcorrencia;
        CDSCliConsLogEvento->DataSetField = CDSSensorIRContPresoIBQCliConsLogEvento;

        CDSSensorIRContPreso->Active = true;

        CDSCliConsOrdemServico->Active = false;
        CDSCliConsArmeDesarme->Active = false;
        CDSCliConsOcorrencia->Active = false;
        CDSCliConsLogEvento->Active = false;

        //CONSERTO SISTEMA
        if(CDSConsertoSistema->Active){
            CDSConsertoSistema->Active = false;
        }

        DSMasterCliConsOrdemServico->DataSet = IBQConsertoSistema;
        DSMasterCliConsArmeDesarme->DataSet = IBQConsertoSistema;
        DSMasterCliConsOcorrencia->DataSet = IBQConsertoSistema;
        DSMasterCliConsLogEvento->DataSet = IBQConsertoSistema;
        CDSCliConsOrdemServico->DataSetField = CDSConsertoSistemaIBQCliConsOrdemServico;
        CDSCliConsArmeDesarme->DataSetField = CDSConsertoSistemaIBQCliConsArmeDesarme;
        CDSCliConsOcorrencia->DataSetField = CDSConsertoSistemaIBQCliConsOcorrencia;
        CDSCliConsLogEvento->DataSetField = CDSConsertoSistemaIBQCliConsLogEvento;

        CDSConsertoSistema->Active = true;

        CDSCliConsOrdemServico->Active = false;
        CDSCliConsArmeDesarme->Active = false;
        CDSCliConsOcorrencia->Active = false;
        CDSCliConsLogEvento->Active = false;

        // SIST.C/PROBLEMA COLOCAÇÃO/RETIRADA KIT
        if(CDSRetiradaKit->Active){
            CDSRetiradaKit->Active = false;
        }

        DSMasterCliConsOrdemServico->DataSet = IBQRetiradaKit;
        DSMasterCliConsArmeDesarme->DataSet = IBQRetiradaKit;
        DSMasterCliConsOcorrencia->DataSet = IBQRetiradaKit;
        DSMasterCliConsLogEvento->DataSet = IBQRetiradaKit;
        CDSCliConsOrdemServico->DataSetField = CDSRetiradaKitIBQCliConsOrdemServico;
        CDSCliConsArmeDesarme->DataSetField = CDSRetiradaKitIBQCliConsArmeDesarme;
        CDSCliConsOcorrencia->DataSetField = CDSRetiradaKitIBQCliConsOcorrencia;
        CDSCliConsLogEvento->DataSetField = CDSRetiradaKitIBQCliConsLogEvento;

        CDSRetiradaKit->Active = true;

        CDSCliConsOrdemServico->Active = false;
        CDSCliConsArmeDesarme->Active = false;
        CDSCliConsOcorrencia->Active = false;
        CDSCliConsLogEvento->Active = false;

        // CANAL RF ABERTO
        if(CDSCanalRFAberto->Active){
            CDSCanalRFAberto->Active = false;
        }

        DSMasterCliConsOrdemServico->DataSet = IBQCanalRFAberto;
        DSMasterCliConsArmeDesarme->DataSet = IBQCanalRFAberto;
        DSMasterCliConsOcorrencia->DataSet = IBQCanalRFAberto;
        DSMasterCliConsLogEvento->DataSet = IBQCanalRFAberto;
        CDSCliConsOrdemServico->DataSetField = CDSCanalRFAbertoIBQCliConsOrdemServico;
        CDSCliConsArmeDesarme->DataSetField = CDSCanalRFAbertoIBQCliConsArmeDesarme;
        CDSCliConsOcorrencia->DataSetField = CDSCanalRFAbertoIBQCliConsOcorrencia;
        CDSCliConsLogEvento->DataSetField = CDSCanalRFAbertoIBQCliConsLogEvento;

        CDSCanalRFAberto->Active = true;

        CDSCliConsOrdemServico->Active = false;
        CDSCliConsArmeDesarme->Active = false;
        CDSCliConsOcorrencia->Active = false;
        CDSCliConsLogEvento->Active = false;

        // MAU CONTATO
        if(CDSMauContato->Active){
            CDSMauContato->Active = false;
        }

        DSMasterCliConsOrdemServico->DataSet = IBQMauContato;
        DSMasterCliConsArmeDesarme->DataSet = IBQMauContato;
        DSMasterCliConsOcorrencia->DataSet = IBQMauContato;
        DSMasterCliConsLogEvento->DataSet = IBQMauContato;
        CDSCliConsOrdemServico->DataSetField = CDSMauContatoIBQCliConsOrdemServico;
        CDSCliConsArmeDesarme->DataSetField = CDSMauContatoIBQCliConsArmeDesarme;
        CDSCliConsOcorrencia->DataSetField = CDSMauContatoIBQCliConsOcorrencia;
        CDSCliConsLogEvento->DataSetField = CDSMauContatoIBQCliConsLogEvento;

        CDSMauContato->Active = true;

        CDSCliConsOrdemServico->Active = false;
        CDSCliConsArmeDesarme->Active = false;
        CDSCliConsOcorrencia->Active = false;
        CDSCliConsLogEvento->Active = false;

        // SEM ENERGIA/REDE
        if(CDSSemEnergia->Active){
            CDSSemEnergia->Active = false;
        }

        DSMasterCliConsOrdemServico->DataSet = IBQSemEnergia;
        DSMasterCliConsArmeDesarme->DataSet = IBQSemEnergia;
        DSMasterCliConsOcorrencia->DataSet = IBQSemEnergia;
        DSMasterCliConsLogEvento->DataSet = IBQSemEnergia;
        CDSCliConsOrdemServico->DataSetField = CDSSemEnergiaIBQCliConsOrdemServico;
        CDSCliConsArmeDesarme->DataSetField = CDSSemEnergiaIBQCliConsArmeDesarme;
        CDSCliConsOcorrencia->DataSetField = CDSSemEnergiaIBQCliConsOcorrencia;
        CDSCliConsLogEvento->DataSetField = CDSSemEnergiaIBQCliConsLogEvento;

        CDSSemEnergia->Active = true;

        CDSCliConsOrdemServico->Active = false;
        CDSCliConsArmeDesarme->Active = false;
        CDSCliConsOcorrencia->Active = false;
        CDSCliConsLogEvento->Active = false;

        // AG NO LOCAL
        if(CDSAgenteLocal->Active){
            CDSAgenteLocal->Active = false;
        }

        DSMasterCliConsOrdemServico->DataSet = IBQAgenteLocal;
        DSMasterCliConsArmeDesarme->DataSet = IBQAgenteLocal;
        DSMasterCliConsOcorrencia->DataSet = IBQAgenteLocal;
        DSMasterCliConsLogEvento->DataSet = IBQAgenteLocal;
        CDSCliConsOrdemServico->DataSetField = CDSAgenteLocalIBQCliConsOrdemServico;
        CDSCliConsArmeDesarme->DataSetField = CDSAgenteLocalIBQCliConsArmeDesarme;
        CDSCliConsOcorrencia->DataSetField = CDSAgenteLocalIBQCliConsOcorrencia;
        CDSCliConsLogEvento->DataSetField = CDSAgenteLocalIBQCliConsLogEvento;

        CDSAgenteLocal->Active = true;

        CDSCliConsOrdemServico->Active = false;
        CDSCliConsArmeDesarme->Active = false;
        CDSCliConsOcorrencia->Active = false;
        CDSCliConsLogEvento->Active = false;

        // PRESENÇA DE ANIMAIS E/OU INSETOS
        if(CDSPresencaAnimais->Active){
            CDSPresencaAnimais->Active = false;
        }

        DSMasterCliConsOrdemServico->DataSet = IBQPresencaAnimais;
        DSMasterCliConsArmeDesarme->DataSet = IBQPresencaAnimais;
        DSMasterCliConsOcorrencia->DataSet = IBQPresencaAnimais;
        DSMasterCliConsLogEvento->DataSet = IBQPresencaAnimais;
        CDSCliConsOrdemServico->DataSetField = CDSPresencaAnimaisIBQCliConsOrdemServico;
        CDSCliConsArmeDesarme->DataSetField = CDSPresencaAnimaisIBQCliConsArmeDesarme;
        CDSCliConsOcorrencia->DataSetField = CDSPresencaAnimaisIBQCliConsOcorrencia;
        CDSCliConsLogEvento->DataSetField = CDSPresencaAnimaisIBQCliConsLogEvento;

        CDSPresencaAnimais->Active = true;

        CDSCliConsOrdemServico->Active = false;
        CDSCliConsArmeDesarme->Active = false;
        CDSCliConsOcorrencia->Active = false;
        CDSCliConsLogEvento->Active = false;

        // SINAL DE ALARME ACIDENTAL
        if(CDSAlarmeAcidental->Active){
            CDSAlarmeAcidental->Active = false;
        }

        DSMasterCliConsOrdemServico->DataSet = IBQAlarmeAcidental;
        DSMasterCliConsArmeDesarme->DataSet = IBQAlarmeAcidental;
        DSMasterCliConsOcorrencia->DataSet = IBQAlarmeAcidental;
        DSMasterCliConsLogEvento->DataSet = IBQAlarmeAcidental;
        CDSCliConsOrdemServico->DataSetField = CDSAlarmeAcidentalIBQCliConsOrdemServico;
        CDSCliConsArmeDesarme->DataSetField = CDSAlarmeAcidentalIBQCliConsArmeDesarme;
        CDSCliConsOcorrencia->DataSetField = CDSAlarmeAcidentalIBQCliConsOcorrencia;
        CDSCliConsLogEvento->DataSetField = CDSAlarmeAcidentalIBQCliConsLogEvento;

        CDSAlarmeAcidental->Active = true;

        CDSCliConsOrdemServico->Active = false;
        CDSCliConsArmeDesarme->Active = false;
        CDSCliConsOcorrencia->Active = false;
        CDSCliConsLogEvento->Active = false;

        // SINAL POR SUSPEITO NO LOCAL
        if(CDSSuspeitoLocal->Active){
            CDSSuspeitoLocal->Active = false;
        }

        DSMasterCliConsOrdemServico->DataSet = IBQSuspeitoLocal;
        DSMasterCliConsArmeDesarme->DataSet = IBQSuspeitoLocal;
        DSMasterCliConsOcorrencia->DataSet = IBQSuspeitoLocal;
        DSMasterCliConsLogEvento->DataSet = IBQSuspeitoLocal;
        CDSCliConsOrdemServico->DataSetField = CDSSuspeitoLocalIBQCliConsOrdemServico;
        CDSCliConsArmeDesarme->DataSetField = CDSSuspeitoLocalIBQCliConsArmeDesarme;
        CDSCliConsOcorrencia->DataSetField = CDSSuspeitoLocalIBQCliConsOcorrencia;
        CDSCliConsLogEvento->DataSetField = CDSSuspeitoLocalIBQCliConsLogEvento;

        CDSSuspeitoLocal->Active = true;

        CDSCliConsOrdemServico->Active = false;
        CDSCliConsArmeDesarme->Active = false;
        CDSCliConsOcorrencia->Active = false;
        CDSCliConsLogEvento->Active = false;

        // SINAL ALARME ARROMBAMENTO
        if(CDSSinalArrombamento->Active){
            CDSSinalArrombamento->Active = false;
        }

        DSMasterCliConsOrdemServico->DataSet = IBQSinalArrombamento;
        DSMasterCliConsArmeDesarme->DataSet = IBQSinalArrombamento;
        DSMasterCliConsOcorrencia->DataSet = IBQSinalArrombamento;
        DSMasterCliConsLogEvento->DataSet = IBQSinalArrombamento;
        CDSCliConsOrdemServico->DataSetField = CDSSinalArrombamentoIBQCliConsOrdemServico;
        CDSCliConsArmeDesarme->DataSetField = CDSSinalArrombamentoIBQCliConsArmeDesarme;
        CDSCliConsOcorrencia->DataSetField = CDSSinalArrombamentoIBQCliConsOcorrencia;
        CDSCliConsLogEvento->DataSetField = CDSSinalArrombamentoIBQCliConsLogEvento;

        CDSSinalArrombamento->Active = true;

        CDSCliConsOrdemServico->Active = false;
        CDSCliConsArmeDesarme->Active = false;
        CDSCliConsOcorrencia->Active = false;
        CDSCliConsLogEvento->Active = false;

        // JANELA/PORTA MAL FECHADA
        if(CDSJanelaMalFechada->Active){
            CDSJanelaMalFechada->Active = false;
        }

        DSMasterCliConsOrdemServico->DataSet = IBQJanelaMalFechada;
        DSMasterCliConsArmeDesarme->DataSet = IBQJanelaMalFechada;
        DSMasterCliConsOcorrencia->DataSet = IBQJanelaMalFechada;
        DSMasterCliConsLogEvento->DataSet = IBQJanelaMalFechada;
        CDSCliConsOrdemServico->DataSetField = CDSJanelaMalFechadaIBQCliConsOrdemServico;
        CDSCliConsArmeDesarme->DataSetField = CDSJanelaMalFechadaIBQCliConsArmeDesarme;
        CDSCliConsOcorrencia->DataSetField = CDSJanelaMalFechadaIBQCliConsOcorrencia;
        CDSCliConsLogEvento->DataSetField = CDSJanelaMalFechadaIBQCliConsLogEvento;

        CDSJanelaMalFechada->Active = true;

        CDSCliConsOrdemServico->Active = false;
        CDSCliConsArmeDesarme->Active = false;
        CDSCliConsOcorrencia->Active = false;
        CDSCliConsLogEvento->Active = false;

        // SINAL DE ALARME INDESEJADO
        if(CDSSinalIndesejado->Active){
            CDSSinalIndesejado->Active = false;
        }

        DSMasterCliConsOrdemServico->DataSet = IBQSinalIndesejado;
        DSMasterCliConsArmeDesarme->DataSet = IBQSinalIndesejado;
        DSMasterCliConsOcorrencia->DataSet = IBQSinalIndesejado;
        DSMasterCliConsLogEvento->DataSet = IBQSinalIndesejado;
        CDSCliConsOrdemServico->DataSetField = CDSSinalIndesejadoIBQCliConsOrdemServico;
        CDSCliConsArmeDesarme->DataSetField = CDSSinalIndesejadoIBQCliConsArmeDesarme;
        CDSCliConsOcorrencia->DataSetField = CDSSinalIndesejadoIBQCliConsOcorrencia;
        CDSCliConsLogEvento->DataSetField = CDSSinalIndesejadoIBQCliConsLogEvento;

        CDSSinalIndesejado->Active = true;

        CDSCliConsOrdemServico->Active = false;
        CDSCliConsArmeDesarme->Active = false;
        CDSCliConsOcorrencia->Active = false;
        CDSCliConsLogEvento->Active = false;


        // Configuração incial do primeiro item da treeview
        DSMasterCliConsOrdemServico->DataSet = IBQIdentificaZero;
        DSMasterCliConsArmeDesarme->DataSet = IBQIdentificaZero;
        DSMasterCliConsOcorrencia->DataSet = IBQIdentificaZero;
        DSMasterCliConsLogEvento->DataSet = IBQIdentificaZero;
        CDSCliConsOrdemServico->DataSetField = CDSIdentificaZeroIBQCliConsOrdemServico;
        CDSCliConsArmeDesarme->DataSetField = CDSIdentificaZeroIBQCliConsArmeDesarme;
        CDSCliConsOcorrencia->DataSetField = CDSIdentificaZeroIBQCliConsOcorrencia;
        CDSCliConsLogEvento->DataSetField = CDSIdentificaZeroIBQCliConsLogEvento;

    }catch(Exception &excecao){
        Cursor = crArrow;
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao consultar registros de manutenção preventiva."
            "\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
        return;
    }

    if(montaTreeView){
        montaTreeView = false;

        AnsiString sNodoIdentificaZero = Format("IDENTIFICAÇÃO ZERO (%d)",
                    ARRAYOFCONST((CDSIdentificaZero->RecordCount)));
        TTreeNode* nodoIdentificaZero = TVEventosAnalisados->Items->Add(NULL, sNodoIdentificaZero);
        nodoIdentificaZero->ImageIndex = 9;
        nodoIdentificaZero->SelectedIndex = 9;
        nodoIdentificaZero->StateIndex = 9;

        AnsiString sNodoIdentifica = Format("IDENTIFICAÇÃO (%d)",
                    ARRAYOFCONST((CDSIdentifica->RecordCount)));
        TTreeNode* nodoIdentifica = TVEventosAnalisados->Items->Add(NULL, sNodoIdentifica);
        nodoIdentifica->ImageIndex = 9;
        nodoIdentifica->SelectedIndex = 9;
        nodoIdentifica->StateIndex = 9;

        // SETOR EM CURTO
        AnsiString sNodoSetorCurto = Format("SETOR EM CURTO (%d)",
                    ARRAYOFCONST((CDSSetorCurto->RecordCount)));
        TTreeNode* nodoSetorCurto = TVEventosAnalisados->Items->Add(NULL, sNodoSetorCurto);
        nodoSetorCurto->ImageIndex = 9;
        nodoSetorCurto->SelectedIndex = 9;
        nodoSetorCurto->StateIndex = 9;

        // BATERIA FRACA
        AnsiString sNodoBateriaFraca = Format("BATERIA FRACA (%d)",
                    ARRAYOFCONST((CDSBateriaFraca->RecordCount)));
        TTreeNode* nodoBateriaFraca = TVEventosAnalisados->Items->Add(NULL, sNodoBateriaFraca);
        nodoBateriaFraca->ImageIndex = 9;
        nodoBateriaFraca->SelectedIndex = 9;
        nodoBateriaFraca->StateIndex = 9;

        // SENSOR IR/CONT.PRESO
        AnsiString sNodoSensorIRContPreso = Format("SENSOR IR/CONT.PRESO (%d)",
                    ARRAYOFCONST((CDSSensorIRContPreso->RecordCount)));
        TTreeNode* nodoSensorIRContPreso = TVEventosAnalisados->Items->Add(NULL, sNodoSensorIRContPreso);
        nodoSensorIRContPreso->ImageIndex = 9;
        nodoSensorIRContPreso->SelectedIndex = 9;
        nodoSensorIRContPreso->StateIndex = 9;

        //CONSERTO SISTEMA
        AnsiString sNodoConsertoSistema = Format("CONSERTO SISTEMA (%d)",
                    ARRAYOFCONST((CDSConsertoSistema->RecordCount)));
        TTreeNode* nodoConsertoSistema = TVEventosAnalisados->Items->Add(NULL, sNodoConsertoSistema);
        nodoConsertoSistema->ImageIndex = 9;
        nodoConsertoSistema->SelectedIndex = 9;
        nodoConsertoSistema->StateIndex = 9;

        // SIST.C/PROBLEMA COLOCAÇÃO/RETIRADA KIT
        AnsiString sNodoRetiradaKit = Format("SIST.C/PROB.COLOCAÇÃO/RET.KIT (%d)",
                    ARRAYOFCONST((CDSRetiradaKit->RecordCount)));
        TTreeNode* nodoRetiradaKit = TVEventosAnalisados->Items->Add(NULL, sNodoRetiradaKit);
        nodoRetiradaKit->ImageIndex = 9;
        nodoRetiradaKit->SelectedIndex = 9;
        nodoRetiradaKit->StateIndex = 9;

        // CANAL RF ABERTO
        AnsiString sNodoCanalRFAberto = Format("CANAL RF ABERTO (%d)",
                    ARRAYOFCONST((CDSCanalRFAberto->RecordCount)));
        TTreeNode* nodoCanalRFAberto = TVEventosAnalisados->Items->Add(NULL, sNodoCanalRFAberto);
        nodoCanalRFAberto->ImageIndex = 9;
        nodoCanalRFAberto->SelectedIndex = 9;
        nodoCanalRFAberto->StateIndex = 9;

        // MAU CONTATO
        AnsiString sNodoMauContato = Format("MAU CONTATO (%d)",
                    ARRAYOFCONST((CDSMauContato->RecordCount)));
        TTreeNode* nodoMauContato = TVEventosAnalisados->Items->Add(NULL, sNodoMauContato);
        nodoMauContato->ImageIndex = 9;
        nodoMauContato->SelectedIndex = 9;
        nodoMauContato->StateIndex = 9;

        // SEM ENERGIA
        AnsiString sNodoSemEnergia = Format("SEM ENERGIA/REDE (%d)",
                    ARRAYOFCONST((CDSSemEnergia->RecordCount)));
        TTreeNode* nodoSemEnergia = TVEventosAnalisados->Items->Add(NULL, sNodoSemEnergia);
        nodoSemEnergia->ImageIndex = 9;
        nodoSemEnergia->SelectedIndex = 9;
        nodoSemEnergia->StateIndex = 9;

        // AG NO LOCAL
        AnsiString sNodoAgenteLocal = Format("AG NO LOCAL (%d)",
                    ARRAYOFCONST((CDSAgenteLocal->RecordCount)));
        TTreeNode* nodoAgenteLocal = TVEventosAnalisados->Items->Add(NULL, sNodoAgenteLocal);
        nodoAgenteLocal->ImageIndex = 9;
        nodoAgenteLocal->SelectedIndex = 9;
        nodoAgenteLocal->StateIndex = 9;

        // PRESENÇA DE ANIMAIS E/OU INSETOS
        AnsiString sNodoPresencaAnimais = Format("PRESENÇA DE ANIMAIS E/OU INSETOS (%d)",
                    ARRAYOFCONST((CDSPresencaAnimais->RecordCount)));
        TTreeNode* nodoPresencaAnimais = TVEventosAnalisados->Items->Add(NULL, sNodoPresencaAnimais);
        nodoPresencaAnimais->ImageIndex = 9;
        nodoPresencaAnimais->SelectedIndex = 9;
        nodoPresencaAnimais->StateIndex = 9;

        // SINAL DE ALARME ACIDENTAL
        AnsiString sNodoAlarmeAcidental = Format("SINAL DE ALARME ACIDENTAL (%d)",
                    ARRAYOFCONST((CDSAlarmeAcidental->RecordCount)));
        TTreeNode* nodoAlarmeAcidental = TVEventosAnalisados->Items->Add(NULL, sNodoAlarmeAcidental);
        nodoAlarmeAcidental->ImageIndex = 9;
        nodoAlarmeAcidental->SelectedIndex = 9;
        nodoAlarmeAcidental->StateIndex = 9;

        // SINAL POR SUSPEITO NO LOCAL
        AnsiString sNodoSuspeitoLocal = Format("SINAL POR SUSPEITO NO LOCAL (%d)",
                    ARRAYOFCONST((CDSSuspeitoLocal->RecordCount)));
        TTreeNode* nodoSuspeitoLocal = TVEventosAnalisados->Items->Add(NULL, sNodoSuspeitoLocal);
        nodoSuspeitoLocal->ImageIndex = 9;
        nodoSuspeitoLocal->SelectedIndex = 9;
        nodoSuspeitoLocal->StateIndex = 9;

        // SINAL ALARME ARROMBAMENTO
        AnsiString sNodoSinalArrombamento = Format("SINAL ALARME ARROMBAMENTO (%d)",
                    ARRAYOFCONST((CDSSinalArrombamento->RecordCount)));
        TTreeNode* nodoSinalArrombamento = TVEventosAnalisados->Items->Add(NULL, sNodoSinalArrombamento);
        nodoSinalArrombamento->ImageIndex = 9;
        nodoSinalArrombamento->SelectedIndex = 9;
        nodoSinalArrombamento->StateIndex = 9;

        // JANELA/PORTA MAL FECHADA
        AnsiString sNodoJanelaMalFechada = Format("JANELA/PORTA MAL FECHADA (%d)",
                    ARRAYOFCONST((CDSJanelaMalFechada->RecordCount)));
        TTreeNode* nodoJanelaMalFechada = TVEventosAnalisados->Items->Add(NULL, sNodoJanelaMalFechada);
        nodoJanelaMalFechada->ImageIndex = 9;
        nodoJanelaMalFechada->SelectedIndex = 9;
        nodoJanelaMalFechada->StateIndex = 9;

        // SINAL DE ALARME INDESEJADO
        AnsiString sNodoSinalIndesejado = Format("SINAL DE ALARME INDESEJADO (%d)",
                    ARRAYOFCONST((CDSSinalIndesejado->RecordCount)));
        TTreeNode* nodoSinalIndesejado = TVEventosAnalisados->Items->Add(NULL, sNodoSinalIndesejado);
        nodoSinalIndesejado->ImageIndex = 9;
        nodoSinalIndesejado->SelectedIndex = 9;
        nodoSinalIndesejado->StateIndex = 9;
    }

    Application->MessageBox("Consulta realizada com sucesso!",
        "Atenção", MB_ICONWARNING|MB_OK);
}

//---------------------------------------------------------------------------

void __fastcall TFHome::CDSIdentificaZeroCalcFields(TDataSet *DataSet)
{
    bool existeOS = false;
    if(CDSIdentificaZeroTOTAL_ATIVA->AsInteger == 0){
        CDSIdentificaZeroOBSERVACAO->AsString = "- AVALIAR COM PRIORIDADE";
    }

    AnsiString szObsOrdensServicos = " - ORDENS SERVIÇO";
    if(CDSIdentificaZeroTOTAL_PENDENTE->AsInteger > 0){
        existeOS = true;
        szObsOrdensServicos = szObsOrdensServicos + Format(" - PENDENTES(%d)",
                    ARRAYOFCONST((CDSIdentificaZeroTOTAL_PENDENTE->AsInteger)));
    }

    if(CDSIdentificaZeroTOTAL_REALIZADO->AsInteger > 0){
        existeOS = true;
        szObsOrdensServicos = szObsOrdensServicos + Format(" - REALIZADAS(%d)",
                    ARRAYOFCONST((CDSIdentificaZeroTOTAL_REALIZADO->AsInteger)));
    }

    if(existeOS){
        CDSIdentificaZeroOBSERVACAO->AsString =
            CDSIdentificaZeroOBSERVACAO->AsString + szObsOrdensServicos;
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::CDSIdentificaCalcFields(TDataSet *DataSet)
{
    float percentual = (float)(CDSIdentificaTOTAL->AsInteger * 100) / 30;
    CDSIdentificaPERCENTUAL->Value = (FloatToStr(percentual)).SubString(0, 3) + "%";

    bool existeOS = false;

    if(CDSIdentificaTOTAL_ATIVA->AsInteger == 0){
        CDSIdentificaOBSERVACAO->AsString = "- NENHUM ARME/DESERME RECEBIDO";
    }

    AnsiString szObsOrdensServicos = " - ORDENS SERVIÇO";
    if(CDSIdentificaTOTAL_PENDENTE->AsInteger > 0){
        existeOS = true;
        szObsOrdensServicos = szObsOrdensServicos + Format(" - PENDENTES(%d)",
                    ARRAYOFCONST((CDSIdentificaTOTAL_PENDENTE->AsInteger)));
    }

    if(CDSIdentificaTOTAL_REALIZADO->AsInteger > 0){
        existeOS = true;
        szObsOrdensServicos = szObsOrdensServicos + Format(" - REALIZADAS(%d)",
                    ARRAYOFCONST((CDSIdentificaTOTAL_REALIZADO->AsInteger)));
    }

    if(existeOS){
        CDSIdentificaOBSERVACAO->AsString =
            CDSIdentificaOBSERVACAO->AsString + szObsOrdensServicos;
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::CDSSetorCurtoCalcFields(TDataSet *DataSet)
{
    bool existeOS = false;

    if(CDSSetorCurtoTOTAL_ATIVA->AsInteger == 0){
        CDSSetorCurtoOBSERVACAO->AsString = "- NENHUM ARME/DESERME RECEBIDO";
    }

    AnsiString szObsOrdensServicos = " - ORDENS SERVIÇO";
    if(CDSSetorCurtoTOTAL_PENDENTE->AsInteger > 0){
        existeOS = true;
        szObsOrdensServicos = szObsOrdensServicos + Format(" - PENDENTES(%d)",
                    ARRAYOFCONST((CDSSetorCurtoTOTAL_PENDENTE->AsInteger)));
    }

    if(CDSSetorCurtoTOTAL_REALIZADO->AsInteger > 0){
        existeOS = true;
        szObsOrdensServicos = szObsOrdensServicos + Format(" - REALIZADAS(%d)",
                    ARRAYOFCONST((CDSSetorCurtoTOTAL_REALIZADO->AsInteger)));
    }

    if(existeOS){
        CDSSetorCurtoOBSERVACAO->AsString =
            CDSSetorCurtoOBSERVACAO->AsString + szObsOrdensServicos;
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::CDSBateriaFracaCalcFields(TDataSet *DataSet)
{
    bool existeOS = false;

    if(CDSBateriaFracaTOTAL_ATIVA->AsInteger == 0){
        CDSBateriaFracaOBSERVACAO->AsString = "- NENHUM ARME/DESERME RECEBIDO";
    }

    AnsiString szObsOrdensServicos = " - ORDENS SERVIÇO";
    if(CDSBateriaFracaTOTAL_PENDENTE->AsInteger > 0){
        existeOS = true;
        szObsOrdensServicos = szObsOrdensServicos + Format(" - PENDENTES(%d)",
                    ARRAYOFCONST((CDSBateriaFracaTOTAL_PENDENTE->AsInteger)));
    }

    if(CDSBateriaFracaTOTAL_REALIZADO->AsInteger > 0){
        existeOS = true;
        szObsOrdensServicos = szObsOrdensServicos + Format(" - REALIZADAS(%d)",
                    ARRAYOFCONST((CDSBateriaFracaTOTAL_REALIZADO->AsInteger)));
    }

    if(existeOS){
        CDSBateriaFracaOBSERVACAO->AsString =
            CDSBateriaFracaOBSERVACAO->AsString + szObsOrdensServicos;
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::CDSSensorIRContPresoCalcFields(TDataSet *DataSet)
{
    bool existeOS = false;

    if(CDSSensorIRContPresoTOTAL_ATIVA->AsInteger == 0){
        CDSSensorIRContPresoOBSERVACAO->AsString = "- NENHUM ARME/DESERME RECEBIDO";
    }

    AnsiString szObsOrdensServicos = " - ORDENS SERVIÇO";
    if(CDSSensorIRContPresoTOTAL_PENDENTE->AsInteger > 0){
        existeOS = true;
        szObsOrdensServicos = szObsOrdensServicos + Format(" - PENDENTES(%d)",
                    ARRAYOFCONST((CDSSensorIRContPresoTOTAL_PENDENTE->AsInteger)));
    }

    if(CDSSensorIRContPresoTOTAL_REALIZADO->AsInteger > 0){
        existeOS = true;
        szObsOrdensServicos = szObsOrdensServicos + Format(" - REALIZADAS(%d)",
                    ARRAYOFCONST((CDSSensorIRContPresoTOTAL_REALIZADO->AsInteger)));
    }

    if(existeOS){
        CDSSensorIRContPresoOBSERVACAO->AsString =
            CDSSensorIRContPresoOBSERVACAO->AsString + szObsOrdensServicos;
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::CDSConsertoSistemaCalcFields(TDataSet *DataSet)
{
    bool existeOS = false;

    if(CDSConsertoSistemaTOTAL_ATIVA->AsInteger == 0){
        CDSConsertoSistemaOBSERVACAO->AsString = "- NENHUM ARME/DESERME RECEBIDO";
    }

    AnsiString szObsOrdensServicos = " - ORDENS SERVIÇO";
    if(CDSConsertoSistemaTOTAL_PENDENTE->AsInteger > 0){
        existeOS = true;
        szObsOrdensServicos = szObsOrdensServicos + Format(" - PENDENTES(%d)",
                    ARRAYOFCONST((CDSConsertoSistemaTOTAL_PENDENTE->AsInteger)));
    }

    if(CDSConsertoSistemaTOTAL_REALIZADO->AsInteger > 0){
        existeOS = true;
        szObsOrdensServicos = szObsOrdensServicos + Format(" - REALIZADAS(%d)",
                    ARRAYOFCONST((CDSConsertoSistemaTOTAL_REALIZADO->AsInteger)));
    }

    if(existeOS){
        CDSConsertoSistemaOBSERVACAO->AsString =
            CDSConsertoSistemaOBSERVACAO->AsString + szObsOrdensServicos;
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::CDSRetiradaKitCalcFields(TDataSet *DataSet)
{
    bool existeOS = false;

    if(CDSRetiradaKitTOTAL_ATIVA->AsInteger == 0){
        CDSRetiradaKitOBSERVACAO->AsString = "- NENHUM ARME/DESERME RECEBIDO";
    }

    AnsiString szObsOrdensServicos = " - ORDENS SERVIÇO";
    if(CDSRetiradaKitTOTAL_PENDENTE->AsInteger > 0){
        existeOS = true;
        szObsOrdensServicos = szObsOrdensServicos + Format(" - PENDENTES(%d)",
                    ARRAYOFCONST((CDSRetiradaKitTOTAL_PENDENTE->AsInteger)));
    }

    if(CDSRetiradaKitTOTAL_REALIZADO->AsInteger > 0){
        existeOS = true;
        szObsOrdensServicos = szObsOrdensServicos + Format(" - REALIZADAS(%d)",
                    ARRAYOFCONST((CDSRetiradaKitTOTAL_REALIZADO->AsInteger)));
    }

    if(existeOS){
        CDSRetiradaKitOBSERVACAO->AsString =
            CDSRetiradaKitOBSERVACAO->AsString + szObsOrdensServicos;
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::CDSCanalRFAbertoCalcFields(TDataSet *DataSet)
{
    bool existeOS = false;

    if(CDSCanalRFAbertoTOTAL_ATIVA->AsInteger == 0){
        CDSCanalRFAbertoOBSERVACAO->AsString = "- NENHUM ARME/DESERME RECEBIDO";
    }

    AnsiString szObsOrdensServicos = " - ORDENS SERVIÇO";
    if(CDSCanalRFAbertoTOTAL_PENDENTE->AsInteger > 0){
        existeOS = true;
        szObsOrdensServicos = szObsOrdensServicos + Format(" - PENDENTES(%d)",
                    ARRAYOFCONST((CDSCanalRFAbertoTOTAL_PENDENTE->AsInteger)));
    }

    if(CDSCanalRFAbertoTOTAL_REALIZADO->AsInteger > 0){
        existeOS = true;
        szObsOrdensServicos = szObsOrdensServicos + Format(" - REALIZADAS(%d)",
                    ARRAYOFCONST((CDSCanalRFAbertoTOTAL_REALIZADO->AsInteger)));
    }

    if(existeOS){
        CDSCanalRFAbertoOBSERVACAO->AsString =
            CDSCanalRFAbertoOBSERVACAO->AsString + szObsOrdensServicos;
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::CDSMauContatoCalcFields(TDataSet *DataSet)
{
    bool existeOS = false;

    if(CDSMauContatoTOTAL_ATIVA->AsInteger == 0){
        CDSMauContatoOBSERVACAO->AsString = "- NENHUM ARME/DESERME RECEBIDO";
    }

    AnsiString szObsOrdensServicos = " - ORDENS SERVIÇO";
    if(CDSMauContatoTOTAL_PENDENTE->AsInteger > 0){
        existeOS = true;
        szObsOrdensServicos = szObsOrdensServicos + Format(" - PENDENTES(%d)",
                    ARRAYOFCONST((CDSMauContatoTOTAL_PENDENTE->AsInteger)));
    }

    if(CDSMauContatoTOTAL_REALIZADO->AsInteger > 0){
        existeOS = true;
        szObsOrdensServicos = szObsOrdensServicos + Format(" - REALIZADAS(%d)",
                    ARRAYOFCONST((CDSMauContatoTOTAL_REALIZADO->AsInteger)));
    }

    if(existeOS){
        CDSMauContatoOBSERVACAO->AsString =
            CDSMauContatoOBSERVACAO->AsString + szObsOrdensServicos;
    }
}

void __fastcall TFHome::CDSSemEnergiaCalcFields(TDataSet *DataSet)
{
    bool existeOS = false;

    if(CDSSemEnergiaTOTAL_ATIVA->AsInteger == 0){
        CDSSemEnergiaOBSERVACAO->AsString = "- NENHUM ARME/DESERME RECEBIDO";
    }

    AnsiString szObsOrdensServicos = " - ORDENS SERVIÇO";
    if(CDSSemEnergiaTOTAL_PENDENTE->AsInteger > 0){
        existeOS = true;
        szObsOrdensServicos = szObsOrdensServicos + Format(" - PENDENTES(%d)",
                    ARRAYOFCONST((CDSSemEnergiaTOTAL_PENDENTE->AsInteger)));
    }

    if(CDSSemEnergiaTOTAL_REALIZADO->AsInteger > 0){
        existeOS = true;
        szObsOrdensServicos = szObsOrdensServicos + Format(" - REALIZADAS(%d)",
                    ARRAYOFCONST((CDSSemEnergiaTOTAL_REALIZADO->AsInteger)));
    }

    if(existeOS){
        CDSSemEnergiaOBSERVACAO->AsString =
            CDSSemEnergiaOBSERVACAO->AsString + szObsOrdensServicos;
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::CDSAgenteLocalCalcFields(TDataSet *DataSet)
{
    bool existeOS = false;

    if(CDSAgenteLocalTOTAL_ATIVA->AsInteger == 0){
        CDSAgenteLocalOBSERVACAO->AsString = "- NENHUM ARME/DESERME RECEBIDO";
    }

    AnsiString szObsOrdensServicos = " - ORDENS SERVIÇO";
    if(CDSAgenteLocalTOTAL_PENDENTE->AsInteger > 0){
        existeOS = true;
        szObsOrdensServicos = szObsOrdensServicos + Format(" - PENDENTES(%d)",
                    ARRAYOFCONST((CDSAgenteLocalTOTAL_PENDENTE->AsInteger)));
    }

    if(CDSAgenteLocalTOTAL_REALIZADO->AsInteger > 0){
        existeOS = true;
        szObsOrdensServicos = szObsOrdensServicos + Format(" - REALIZADAS(%d)",
                    ARRAYOFCONST((CDSAgenteLocalTOTAL_REALIZADO->AsInteger)));
    }

    if(existeOS){
        CDSAgenteLocalOBSERVACAO->AsString =
            CDSAgenteLocalOBSERVACAO->AsString + szObsOrdensServicos;
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::CDSPresencaAnimaisCalcFields(TDataSet *DataSet)
{
    bool existeOS = false;

    if(CDSPresencaAnimaisTOTAL_ATIVA->AsInteger == 0){
        CDSPresencaAnimaisOBSERVACAO->AsString = "- NENHUM ARME/DESERME RECEBIDO";
    }

    AnsiString szObsOrdensServicos = " - ORDENS SERVIÇO";
    if(CDSPresencaAnimaisTOTAL_PENDENTE->AsInteger > 0){
        existeOS = true;
        szObsOrdensServicos = szObsOrdensServicos + Format(" - PENDENTES(%d)",
                    ARRAYOFCONST((CDSPresencaAnimaisTOTAL_PENDENTE->AsInteger)));
    }

    if(CDSPresencaAnimaisTOTAL_REALIZADO->AsInteger > 0){
        existeOS = true;
        szObsOrdensServicos = szObsOrdensServicos + Format(" - REALIZADAS(%d)",
                    ARRAYOFCONST((CDSPresencaAnimaisTOTAL_REALIZADO->AsInteger)));
    }

    if(existeOS){
        CDSPresencaAnimaisOBSERVACAO->AsString =
            CDSPresencaAnimaisOBSERVACAO->AsString + szObsOrdensServicos;
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::CDSAlarmeAcidentalCalcFields(TDataSet *DataSet)
{
    bool existeOS = false;

    if(CDSAlarmeAcidentalTOTAL_ATIVA->AsInteger == 0){
        CDSAlarmeAcidentalOBSERVACAO->AsString = "- NENHUM ARME/DESERME RECEBIDO";
    }

    AnsiString szObsOrdensServicos = " - ORDENS SERVIÇO";
    if(CDSAlarmeAcidentalTOTAL_PENDENTE->AsInteger > 0){
        existeOS = true;
        szObsOrdensServicos = szObsOrdensServicos + Format(" - PENDENTES(%d)",
                    ARRAYOFCONST((CDSAlarmeAcidentalTOTAL_PENDENTE->AsInteger)));
    }

    if(CDSAlarmeAcidentalTOTAL_REALIZADO->AsInteger > 0){
        existeOS = true;
        szObsOrdensServicos = szObsOrdensServicos + Format(" - REALIZADAS(%d)",
                    ARRAYOFCONST((CDSAlarmeAcidentalTOTAL_REALIZADO->AsInteger)));
    }

    if(existeOS){
        CDSAlarmeAcidentalOBSERVACAO->AsString =
            CDSAlarmeAcidentalOBSERVACAO->AsString + szObsOrdensServicos;
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::CDSSuspeitoLocalCalcFields(TDataSet *DataSet)
{
    bool existeOS = false;

    if(CDSSuspeitoLocalTOTAL_ATIVA->AsInteger == 0){
        CDSSuspeitoLocalOBSERVACAO->AsString = "- NENHUM ARME/DESERME RECEBIDO";
    }

    AnsiString szObsOrdensServicos = " - ORDENS SERVIÇO";
    if(CDSSuspeitoLocalTOTAL_PENDENTE->AsInteger > 0){
        existeOS = true;
        szObsOrdensServicos = szObsOrdensServicos + Format(" - PENDENTES(%d)",
                    ARRAYOFCONST((CDSSuspeitoLocalTOTAL_PENDENTE->AsInteger)));
    }

    if(CDSSuspeitoLocalTOTAL_REALIZADO->AsInteger > 0){
        existeOS = true;
        szObsOrdensServicos = szObsOrdensServicos + Format(" - REALIZADAS(%d)",
                    ARRAYOFCONST((CDSSuspeitoLocalTOTAL_REALIZADO->AsInteger)));
    }

    if(existeOS){
        CDSSuspeitoLocalOBSERVACAO->AsString =
            CDSSuspeitoLocalOBSERVACAO->AsString + szObsOrdensServicos;
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::CDSSinalArrombamentoCalcFields(TDataSet *DataSet)
{
    bool existeOS = false;

    if(CDSSinalArrombamentoTOTAL_ATIVA->AsInteger == 0){
        CDSSinalArrombamentoOBSERVACAO->AsString = "- NENHUM ARME/DESERME RECEBIDO";
    }

    AnsiString szObsOrdensServicos = " - ORDENS SERVIÇO";
    if(CDSSinalArrombamentoTOTAL_PENDENTE->AsInteger > 0){
        existeOS = true;
        szObsOrdensServicos = szObsOrdensServicos + Format(" - PENDENTES(%d)",
                    ARRAYOFCONST((CDSSinalArrombamentoTOTAL_PENDENTE->AsInteger)));
    }

    if(CDSSinalArrombamentoTOTAL_REALIZADO->AsInteger > 0){
        existeOS = true;
        szObsOrdensServicos = szObsOrdensServicos + Format(" - REALIZADAS(%d)",
                    ARRAYOFCONST((CDSSinalArrombamentoTOTAL_REALIZADO->AsInteger)));
    }

    if(existeOS){
        CDSSinalArrombamentoOBSERVACAO->AsString =
            CDSSinalArrombamentoOBSERVACAO->AsString + szObsOrdensServicos;
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::CDSJanelaMalFechadaCalcFields(TDataSet *DataSet)
{
    bool existeOS = false;

    if(CDSJanelaMalFechadaTOTAL_ATIVA->AsInteger == 0){
        CDSJanelaMalFechadaOBSERVACAO->AsString = "- NENHUM ARME/DESERME RECEBIDO";
    }

    AnsiString szObsOrdensServicos = " - ORDENS SERVIÇO";
    if(CDSJanelaMalFechadaTOTAL_PENDENTE->AsInteger > 0){
        existeOS = true;
        szObsOrdensServicos = szObsOrdensServicos + Format(" - PENDENTES(%d)",
                    ARRAYOFCONST((CDSJanelaMalFechadaTOTAL_PENDENTE->AsInteger)));
    }

    if(CDSJanelaMalFechadaTOTAL_REALIZADO->AsInteger > 0){
        existeOS = true;
        szObsOrdensServicos = szObsOrdensServicos + Format(" - REALIZADAS(%d)",
                    ARRAYOFCONST((CDSJanelaMalFechadaTOTAL_REALIZADO->AsInteger)));
    }

    if(existeOS){
        CDSJanelaMalFechadaOBSERVACAO->AsString =
            CDSJanelaMalFechadaOBSERVACAO->AsString + szObsOrdensServicos;
    }
}

//---------------------------------------------------------------------------

void __fastcall TFHome::CDSSinalIndesejadoCalcFields(TDataSet *DataSet)
{
    bool existeOS = false;

    if(CDSSinalIndesejadoTOTAL_ATIVA->AsInteger == 0){
        CDSSinalIndesejadoOBSERVACAO->AsString = "- NENHUM ARME/DESERME RECEBIDO";
    }

    AnsiString szObsOrdensServicos = " - ORDENS SERVIÇO";
    if(CDSSinalIndesejadoTOTAL_PENDENTE->AsInteger > 0){
        existeOS = true;
        szObsOrdensServicos = szObsOrdensServicos + Format(" - PENDENTES(%d)",
                    ARRAYOFCONST((CDSSinalIndesejadoTOTAL_PENDENTE->AsInteger)));
    }

    if(CDSSinalIndesejadoTOTAL_REALIZADO->AsInteger > 0){
        existeOS = true;
        szObsOrdensServicos = szObsOrdensServicos + Format(" - REALIZADAS(%d)",
                    ARRAYOFCONST((CDSSinalIndesejadoTOTAL_REALIZADO->AsInteger)));
    }

    if(existeOS){
        CDSSinalIndesejadoOBSERVACAO->AsString =
            CDSSinalIndesejadoOBSERVACAO->AsString + szObsOrdensServicos;
    }
}

//---------------------------------------------------------------------------
