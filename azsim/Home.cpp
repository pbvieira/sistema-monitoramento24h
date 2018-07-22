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
#include "FichaCliente.h"
#include "ListaClientes.h"

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
    pnlTituloForm->Color = COLOR_HEADER_FORM;
    pnlSubTituloForm->Color = COLOR_HEADER_FORM;

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
    CDSConsFaltaComunicacao->Active = false;
    CDSConsEventos->Active = false;
    CDSRelAtendimento->Active = false;
    CDSOcorrenciasAbertas->Active = false;

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
    if(!FHome->FormEstaAberto("FConsCliente")){
        FConsCliente = new TFConsCliente(this);
    }

    FConsCliente->Width = 1010;
    FConsCliente->GrpEndereco->Visible = true;
    FConsCliente->GrpNomeSelecionado->Visible = true;
    FConsCliente->BtnTodos->Visible = true;
    FConsCliente->BtnAbrirClientes->Visible = true;
    FConsCliente->BtnAbrirContratos->Visible = true;
    FConsCliente->BtnRelatorioClientes->Visible = true;
    FConsCliente->BtnSelecionar->Visible = false;
    FConsCliente->ImgSelecionarCliente->Visible = false;
    FConsCliente->LblOR->Visible = true;
    FConsCliente->Show();
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
        AnsiString SQL_ORDER_BY = " ORDER BY E.DATAEVENTO DESC";
        AnsiString SQL_FILTRO_DATA = Format("%s "
            "    E.DATAEVENTO, E.CTX, E.PORTACOM, E.EQUIPAMENTO, "
            "    E.STATUS || '.' || REPLACE(E.REFERENCIA, 'F', '*') AS STATUS, "
            "    E.DESTATUS, E.CDCLIENTE, "
            "    CASE "
            "    	WHEN C.NMFANTASIA IS NULL THEN E.NMCLIENTE ELSE C.NMFANTASIA "
            "    END AS NMCLIENTE, E.ENDERECO, E.CIDADE "
            "FROM LOGEVENTO E INNER JOIN CLIENTE C ON E.CDCLIENTE = C.CDCLIENTE "
            "WHERE E.DATAEVENTO BETWEEN :DATAINICIAL AND :DATAFINAL %s",
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
                " AND E.STATUS LIKE :STATUS" + SQL_ORDER_BY;
            IBQConsEventos->SQL->Text = SQL_FILTRO;
            IBQConsEventos->ParamByName("STATUS")->Size = 5;

        }else if(StatusDescricao != ""){
            CDSConsEventos->Close();
            IBQConsEventos->SQL->Clear();
            SQL_FILTRO = SQL_FILTRO.SubString(0, StrLen(SQL_FILTRO.c_str()) - StrLen(SQL_ORDER_BY.c_str())) +
                " AND E.DESTATUS LIKE :DESTATUS" + SQL_ORDER_BY;
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

void __fastcall TFHome::gridOcorrenciasDblClick(TObject *Sender)
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

void __fastcall TFHome::BtnConsultaRapidaClick(TObject *Sender)
{
    try{
        AnsiString ORDER_BY = " ORDER BY C.NMCLIENTE";

        AnsiString SQL_FILTRO_TODOS = "SELECT C.CDCLIENTE, C.CDFILIAL, C.TPPESSOA, "
            "CASE WHEN C.NMFANTASIA IS NULL THEN C.NMCLIENTE ELSE C.NMFANTASIA END AS NOME, C.NMCLIENTE, C.NMFANTASIA, "
            "C.DOCUMENTO, C.INSCMUNICIPAL, C.ENDERECO, C.BAIRRO, C.CIDADE, C.UF, C.CEP, "
	        "C.PONTOREF, C.CHAVE, C.KMBASE, C.OBSERVACAO, C.PROCEDIMENTOS, C.DATACADASTRO, "
	        "C.DATAALTERACAO, C.FONE1, C.FONEOBS1, C.FONE2, C.FONEOBS2, C.FONE3, C.FONEOBS3, "
	        "C.FONE4, C.FONEOBS4, C.FONE5, C.FONEOBS5, C.FONE6, C.FONEOBS6, C.FONE7, C.FONEOBS7, "
	        "C.FONE8, C.FONEOBS8, CR.CDCONTRATO, CR.CDCODIFICADOR, CR.LOCALINSTALCENTRAL, CR.MODELOCENTRAL "
          "FROM CLIENTE C INNER JOIN CONTRATO CR ON C.CDCLIENTE = CR.CDCLIENTE ";

        AnsiString SQL_FILTRO_POR_CODIGO = Format(
            "%s WHERE C.CDCLIENTE = :CDCLIENTE %s",
                ARRAYOFCONST((SQL_FILTRO_TODOS, ORDER_BY)));

        AnsiString SQL_FILTRO_POR_NOME = Format(
            "%s WHERE C.NMCLIENTE LIKE UPPER(:NMCLIENTE) OR C.NMFANTASIA LIKE UPPER(:NMCLIENTE) %s",
                ARRAYOFCONST((SQL_FILTRO_TODOS, ORDER_BY)));

        int CodigoCliente = StrToIntDef(EdtCodigoConsultaRapida->Text, 0);
        String NomeCliente = EdtNomeConsultaRapida->Text;

        if(CodigoCliente > 0){
            DModuleCliente->CDSConsCliente->Close();
            DModuleCliente->IBQConsCliente->SQL->Clear();
            DModuleCliente->IBQConsCliente->SQL->Text = SQL_FILTRO_POR_CODIGO;
            DModuleCliente->IBQConsCliente->ParamByName("CDCLIENTE")->AsInteger = CodigoCliente;
            DModuleCliente->CDSConsCliente->Active = true;
            if(DModuleCliente->IBTConsCliente->InTransaction){
                DModuleCliente->IBTConsCliente->Commit();
            }
        }else if(NomeCliente != ""){
            DModuleCliente->CDSConsCliente->Close();
            DModuleCliente->IBQConsCliente->SQL->Clear();
            DModuleCliente->IBQConsCliente->SQL->Text = SQL_FILTRO_POR_NOME;
            DModuleCliente->IBQConsCliente->ParamByName("NMCLIENTE")->AsString = "%" + NomeCliente + "%";
            DModuleCliente->CDSConsCliente->Active = true;
            if(DModuleCliente->IBTConsCliente->InTransaction){
                DModuleCliente->IBTConsCliente->Commit();
            }
        }

        if(DModuleCliente->CDSConsCliente->Active){
           if(DModuleCliente->CDSConsCliente->RecordCount > 0){
                if(DModuleCliente->CDSConsCliente->RecordCount == 1){
                 if(FormEstaAberto("FFichaCliente")){
                      FFichaCliente->Show();
                  }else{
                      FFichaCliente = new TFFichaCliente(FHome);
                      FFichaCliente->Show();
                  }
                }else{
                 if(FormEstaAberto("FFichaCliente")){
                      FListaClientes->Show();
                  }else{
                      FListaClientes = new TFListaClientes(FHome);
                      FListaClientes->Show();
                  }
                }
            }else{
                Application->MessageBox("Nenhum cliente foi localizado","",MB_ICONINFORMATION|MB_OK);
            }
        }

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao consultar o cadastro de clientes.\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }

}
//---------------------------------------------------------------------------

void __fastcall TFHome::gridOcorrenciasDrawColumnCell(TObject *Sender,
      const TRect &Rect, int DataCol, TColumn *Column,
      TGridDrawState State)
{
    if(CDSOcorrenciasAbertas->RecNo % 2){
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

void __fastcall TFHome::gridEventosDrawColumnCell(TObject *Sender,
      const TRect &Rect, int DataCol, TColumn *Column,
      TGridDrawState State)
{
    if(CDSConsEventos->RecNo % 2){
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

