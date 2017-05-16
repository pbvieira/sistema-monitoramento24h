//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ConsOrdemServico.h"
#include "DMCliente.h"
#include "DMApp.h"
#include "RelOrdemServicos.h"
#include "CadOrdemServico.h"
#include "Home.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFConsOrdemServico *FConsOrdemServico;
//---------------------------------------------------------------------------
__fastcall TFConsOrdemServico::TFConsOrdemServico(TComponent* Owner)
    : TForm(Owner)
{
    QRPOrdemServicos = new TQRPOrdemServicos(this);
}

//---------------------------------------------------------------------------

void __fastcall TFConsOrdemServico::FormShow(TObject *Sender)
{
    EdtDataInicial->Date = IncDay(DModule->RetornaDataHoraAtual(), -1);
    EdtDataFinal->Date   = IncDay(DModule->RetornaDataHoraAtual(),  2);
    EdtCodCliente->SetFocus();
}

//---------------------------------------------------------------------------

void __fastcall TFConsOrdemServico::BtnConsultarClick(TObject *Sender)
{
    try{
        AnsiString SQL_ORDER_BY = " ORDER BY DATACADASTRO";

        AnsiString SQL_FILTRO_DATA =
            "SELECT DISTINCT CDORDEMSERVICO, CDCLIENTE, NMCLIENTE, DATACADASTRO, DEORDEMSERVICO, EQUIPAMENTO "
            "FROM VORDEMSERVICOS WHERE DATACADASTRO BETWEEN :DATAINICIAL AND :DATAFINAL AND "
            "ISORDEMENCERRADA = :ISORDEMENCERRADA " + SQL_ORDER_BY;

        AnsiString SQL_FILTRO = SQL_FILTRO_DATA;
        AnsiString SQL_FILTRO_CODIGO = SQL_FILTRO_DATA.SubString(0, StrLen(SQL_FILTRO_DATA.c_str()) - StrLen(SQL_ORDER_BY.c_str())) + " AND CDCLIENTE = :CDCLIENTE" + SQL_ORDER_BY;
        AnsiString SQL_FILTRO_NOME = SQL_FILTRO_DATA.SubString(0, StrLen(SQL_FILTRO_DATA.c_str()) - StrLen(SQL_ORDER_BY.c_str())) + " AND NMCLIENTE LIKE UPPER(:NMCLIENTE)" + SQL_ORDER_BY;
        AnsiString SQL_FILTRO_CDORDEMSERVICO = SQL_FILTRO_DATA.SubString(0, StrLen(SQL_FILTRO_DATA.c_str()) - StrLen(SQL_ORDER_BY.c_str())) + " AND CDORDEMSERVICO = :CDORDEMSERVICO" + SQL_ORDER_BY;

        DModuleCliente->CDSConsOrdemServico->Close();
        DModuleCliente->IBQConsOrdemServico->SQL->Clear();
        DModuleCliente->IBQConsOrdemServico->SQL->Text = SQL_FILTRO;

        int CodigoCliente = StrToIntDef(EdtCodCliente->Text, 0);
        AnsiString NomeCliente = EdtNome->Text;
        int CdOrdemServico = StrToIntDef(EdtCdOrdemServico->Text, 0);

        if(CodigoCliente > 0){
            DModuleCliente->CDSConsOrdemServico->Close();
            DModuleCliente->IBQConsOrdemServico->SQL->Clear();
            SQL_FILTRO = SQL_FILTRO_CODIGO;
            DModuleCliente->IBQConsOrdemServico->SQL->Text = SQL_FILTRO;

        }else if(NomeCliente != ""){
            DModuleCliente->CDSConsOrdemServico->Close();
            DModuleCliente->IBQConsOrdemServico->SQL->Clear();
            SQL_FILTRO = SQL_FILTRO_NOME;
            DModuleCliente->IBQConsOrdemServico->SQL->Text = SQL_FILTRO;

        }else if(CdOrdemServico > 0){
            DModuleCliente->CDSConsOrdemServico->Close();
            DModuleCliente->IBQConsOrdemServico->SQL->Clear();
            SQL_FILTRO = SQL_FILTRO_CDORDEMSERVICO;
            DModuleCliente->IBQConsOrdemServico->SQL->Text = SQL_FILTRO;
        }

        ConfiguraCriteriosOSSQL();

        DModuleCliente->IBQConsOrdemServico->ParamByName("DATAINICIAL")->AsDate = EdtDataInicial->Date;
        DModuleCliente->IBQConsOrdemServico->ParamByName("DATAFINAL")->AsDate = EdtDataFinal->Date;
        if(CkbEncerradas->Checked){
            DModuleCliente->IBQConsOrdemServico->ParamByName("ISORDEMENCERRADA")->AsInteger = 1;
        }else{
            DModuleCliente->IBQConsOrdemServico->ParamByName("ISORDEMENCERRADA")->AsInteger = 0;
        }

        DModuleCliente->CDSConsOrdemServico->Active = true;
        int totalRegistros = DModuleCliente->CDSConsOrdemServico->RecordCount;

        if(totalRegistros > 0){
            BtnImprimir->Enabled = true;
        }else{
            BtnImprimir->Enabled = false;
            Application->MessageBox("Nenhum registro localizado", "Sucesso", MB_ICONINFORMATION|MB_OK);
        }

        if(DModuleCliente->IBTConsOrdemServico->InTransaction){
            DModuleCliente->IBTConsOrdemServico->Commit();
        }

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao consultar o cadastro de ordem de serviços.\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }    
}

//---------------------------------------------------------------------------

void __fastcall TFConsOrdemServico::ConfiguraCriteriosOSSQL()
{
    int CodigoCliente = StrToIntDef(EdtCodCliente->Text, 0);
    AnsiString NomeCliente = EdtNome->Text;
    int CdOrdemServico = StrToIntDef(EdtCdOrdemServico->Text, 0);

    if(CodigoCliente > 0){
        DModuleCliente->IBQConsOrdemServico->ParamByName("CDCLIENTE")->AsInteger = CodigoCliente;

    }else if(NomeCliente != ""){
        DModuleCliente->IBQConsOrdemServico->ParamByName("NMCLIENTE")->AsString = "%" + NomeCliente + "%";

    }else if(CdOrdemServico > 0){
        DModuleCliente->IBQConsOrdemServico->ParamByName("CDORDEMSERVICO")->AsInteger = CdOrdemServico;
    }
}

//---------------------------------------------------------------------------

void __fastcall TFConsOrdemServico::FormClose(TObject *Sender,
      TCloseAction &Action)
{
    try{
        DModuleCliente->CDSConsOrdemServico->Close();
    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao fechar o formulário de consulta.\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }
    Action = caFree;
}
//---------------------------------------------------------------------------

void __fastcall TFConsOrdemServico::BtnFecharClick(TObject *Sender)
{
    Close();    
}

//---------------------------------------------------------------------------

void __fastcall TFConsOrdemServico::BtnImprimirClick(TObject *Sender)
{
    try{
        AnsiString SQL_FILTRO_DATA =
            "SELECT * "
            "FROM VORDEMSERVICOS WHERE DATACADASTRO BETWEEN :DATAINICIAL AND :DATAFINAL AND "
            "ISORDEMENCERRADA = :ISORDEMENCERRADA ";

        AnsiString SQL_FILTRO = SQL_FILTRO_DATA;
        AnsiString SQL_FILTRO_CODIGO = SQL_FILTRO_DATA + " AND CDCLIENTE = :CDCLIENTE";
        AnsiString SQL_FILTRO_NOME = SQL_FILTRO_DATA + " AND NMCLIENTE LIKE UPPER(:NMCLIENTE)";
        AnsiString SQL_FILTRO_CDORDEMSERVICO = SQL_FILTRO_DATA + " AND CDORDEMSERVICO = :CDORDEMSERVICO";

        DModuleCliente->CDSRelOrdemServico->Close();
        DModuleCliente->IBQRelOrdemServico->SQL->Clear();
        DModuleCliente->IBQRelOrdemServico->SQL->Text = SQL_FILTRO;

        int CodigoCliente = StrToIntDef(EdtCodCliente->Text, 0);
        AnsiString NomeCliente = EdtNome->Text;
        int CdOrdemServico = StrToIntDef(EdtCdOrdemServico->Text, 0);

        if(CodigoCliente > 0){
            DModuleCliente->CDSRelOrdemServico->Close();
            DModuleCliente->IBQRelOrdemServico->SQL->Clear();
            SQL_FILTRO = SQL_FILTRO_CODIGO;
            DModuleCliente->IBQRelOrdemServico->SQL->Text = SQL_FILTRO;

        }else if(NomeCliente != ""){
            DModuleCliente->CDSRelOrdemServico->Close();
            DModuleCliente->IBQRelOrdemServico->SQL->Clear();
            SQL_FILTRO = SQL_FILTRO_NOME;
            DModuleCliente->IBQRelOrdemServico->SQL->Text = SQL_FILTRO;

        }else if(CdOrdemServico > 0){
            DModuleCliente->CDSRelOrdemServico->Close();
            DModuleCliente->IBQRelOrdemServico->SQL->Clear();
            SQL_FILTRO = SQL_FILTRO_CDORDEMSERVICO;
            DModuleCliente->IBQRelOrdemServico->SQL->Text = SQL_FILTRO;
        }

        ConfiguraCriteriosRelatorioOSSQL();

        DModuleCliente->IBQRelOrdemServico->ParamByName("DATAINICIAL")->AsDate = EdtDataInicial->Date;
        DModuleCliente->IBQRelOrdemServico->ParamByName("DATAFINAL")->AsDate = EdtDataFinal->Date;
        if(CkbEncerradas->Checked){
            DModuleCliente->IBQRelOrdemServico->ParamByName("ISORDEMENCERRADA")->AsInteger = 1;
        }else{
            DModuleCliente->IBQRelOrdemServico->ParamByName("ISORDEMENCERRADA")->AsInteger = 0;
        }

        DModuleCliente->CDSRelOrdemServico->Active = true;
        QRPOrdemServicos->DataSet = DModuleCliente->CDSRelOrdemServico;
        QRPOrdemServicos->PreviewModal();

        if(DModuleCliente->IBTRelOrdemServico->InTransaction){
            DModuleCliente->IBTRelOrdemServico->Commit();
        }

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao gerar o relatório de ordem de serviços.\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFConsOrdemServico::ConfiguraCriteriosRelatorioOSSQL()
{
    int CodigoCliente = StrToIntDef(EdtCodCliente->Text, 0);
    AnsiString NomeCliente = EdtNome->Text;
    int CdOrdemServico = StrToIntDef(EdtCdOrdemServico->Text, 0);

    if(CodigoCliente > 0){
        DModuleCliente->IBQRelOrdemServico->ParamByName("CDCLIENTE")->AsInteger = CodigoCliente;

    }else if(NomeCliente != ""){
        DModuleCliente->IBQRelOrdemServico->ParamByName("NMCLIENTE")->AsString = "%" + NomeCliente + "%";

    }else if(CdOrdemServico > 0){
        DModuleCliente->IBQRelOrdemServico->ParamByName("CDORDEMSERVICO")->AsInteger = CdOrdemServico;
    }
}

//---------------------------------------------------------------------------

void __fastcall TFConsOrdemServico::DBGClientesDblClick(TObject *Sender)
{
    if(DModuleCliente->DSConsOrdemServico->DataSet->Active &&
        DModuleCliente->DSConsOrdemServico->DataSet->RecordCount > 0){

        int CodigoOS = DModuleCliente->DSConsOrdemServico->DataSet->FieldValues["CDORDEMSERVICO"];
        bool bFCadOrdemServico = FHome->FormEstaAberto("FCadOrdemServico");
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

void __fastcall TFConsOrdemServico::BtnNovaOSClick(TObject *Sender)
{
    if(FHome->FormEstaAberto("FCadOrdemServico")){
        FCadUsuario->Show();
    }else{
        FCadOrdemServico = new TFCadOrdemServico(FHome);
        FCadOrdemServico->ConsultaOrdemServico(0);
        FCadOrdemServico->Show();
    }
}

//---------------------------------------------------------------------------

