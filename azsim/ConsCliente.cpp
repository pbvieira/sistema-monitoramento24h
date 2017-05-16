//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "ConsCliente.h"
#include "DMApp.h"
#include "Home.h"
#include "CadCliente.h"
#include "DMCliente.h"
#include "RelClientes.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFConsCliente *FConsCliente;
//---------------------------------------------------------------------------

__fastcall TFConsCliente::TFConsCliente(TComponent* Owner)
    : TForm(Owner)
{
    DModule->CDSConsFilial->Active = true;
    if(DModule->IBTConsFilial->InTransaction){
        DModule->IBTConsFilial->Commit();
    }
    this->ObjetoCodigoCliente = NULL;
}

//---------------------------------------------------------------------------

void __fastcall TFConsCliente::FormShow(TObject *Sender)
{
    PCResultado->ActivePageIndex = 0;
    EdtNome->SetFocus();
}

//---------------------------------------------------------------------------

void __fastcall TFConsCliente::BtnFecharClick(TObject *Sender)
{
    Close();
}

//---------------------------------------------------------------------------

void __fastcall TFConsCliente::BtnConsultarClick(TObject *Sender)
{
    try{
        AnsiString ENTIDADE = "CLIENTE";
        if(CkbAtivos->Checked){
            ENTIDADE = "VCLIENTES_ATIVOS";
        }

        AnsiString SQL_FILTRO_TODOS = Format(
                "SELECT CDCLIENTE, NMCLIENTE, CIDADE, ENDERECO "
                "FROM %s C ORDER BY NMCLIENTE",
                ARRAYOFCONST((ENTIDADE)));

        AnsiString SQL_FILTRO_POR_CODIGO = Format(
            "SELECT CDCLIENTE, NMCLIENTE, CIDADE, ENDERECO "
            "FROM %s C WHERE C.CDCLIENTE = :CDCLIENTE",
                ARRAYOFCONST((ENTIDADE)));

        AnsiString SQL_FILTRO_POR_NOME = Format(
            "SELECT CDCLIENTE, NMCLIENTE, CIDADE, ENDERECO "
            "FROM %s C WHERE C.NMCLIENTE LIKE UPPER(:NMCLIENTE)",
                ARRAYOFCONST((ENTIDADE)));

        AnsiString SQL_FILTRO_POR_FILIAL = Format(
            "SELECT CDCLIENTE, NMCLIENTE, CIDADE, ENDERECO "
            "FROM %s C WHERE C.CDFILIAL = :CDFILIAL",
                ARRAYOFCONST((ENTIDADE)));

        AnsiString ORDER_BY = " ORDER BY NMCLIENTE";

        if(Sender!= NULL && dynamic_cast <TSpeedButton*> (Sender)->Name == "BtnTodos"){
            DModuleCliente->CDSConsCliente->Close();
            DModuleCliente->IBQConsCliente->SQL->Clear();
            DModuleCliente->IBQConsCliente->SQL->Text = SQL_FILTRO_TODOS;
            DModuleCliente->CDSConsCliente->Active = true;
            if(DModuleCliente->IBTConsCliente->InTransaction){
                DModuleCliente->IBTConsCliente->Commit();
            }

        }else{
            int CodigoCliente = StrToIntDef(EdtCodigo->Text, 0);
            String NomeCliente = EdtNome->Text;

            if(!VarIsNull(CmbFilial->KeyValue)){
                DModuleCliente->CDSConsCliente->Close();
                DModuleCliente->IBQConsCliente->SQL->Clear();
                DModuleCliente->IBQConsCliente->SQL->Text = SQL_FILTRO_POR_FILIAL + ORDER_BY;
                DModuleCliente->IBQConsCliente->ParamByName("CDFILIAL")->AsInteger = CmbFilial->KeyValue;
                DModuleCliente->CDSConsCliente->Active = true;
                if(DModuleCliente->IBTConsCliente->InTransaction){
                    DModuleCliente->IBTConsCliente->Commit();
                }
            } else if(CodigoCliente > 0){
                DModuleCliente->CDSConsCliente->Close();
                DModuleCliente->IBQConsCliente->SQL->Clear();
                DModuleCliente->IBQConsCliente->SQL->Text = SQL_FILTRO_POR_CODIGO + ORDER_BY;
                DModuleCliente->IBQConsCliente->ParamByName("CDCLIENTE")->AsInteger = CodigoCliente;
                DModuleCliente->CDSConsCliente->Active = true;
                if(DModuleCliente->IBTConsCliente->InTransaction){
                    DModuleCliente->IBTConsCliente->Commit();
                }
            }else if(NomeCliente != ""){
                DModuleCliente->CDSConsCliente->Close();
                DModuleCliente->IBQConsCliente->SQL->Clear();
                DModuleCliente->IBQConsCliente->SQL->Text = SQL_FILTRO_POR_NOME + ORDER_BY;
                DModuleCliente->IBQConsCliente->ParamByName("NMCLIENTE")->AsString = "%" + NomeCliente + "%";
                DModuleCliente->CDSConsCliente->Active = true;
                if(DModuleCliente->IBTConsCliente->InTransaction){
                    DModuleCliente->IBTConsCliente->Commit();
                }

            }else{
                AnsiString SQL_FILTRO_POR_LOCAL =  Format(
                    "SELECT CDCLIENTE, NMCLIENTE, CIDADE, ENDERECO "
                    "FROM %s C WHERE ",
                        ARRAYOFCONST((ENTIDADE)));
                
                String Cidade = EdtCidade->Text;

                if(Cidade != ""){
                    if(Cidade != ""){
                        SQL_FILTRO_POR_LOCAL += " C.CIDADE LIKE UPPER(:CIDADE)";
                    }

                    DModuleCliente->CDSConsCliente->Close();
                    DModuleCliente->IBQConsCliente->SQL->Clear();
                    DModuleCliente->IBQConsCliente->SQL->Text = SQL_FILTRO_POR_LOCAL + ORDER_BY;

                    if(Cidade != ""){
                        DModuleCliente->IBQConsCliente->ParamByName("CIDADE")->AsString = "%" + Cidade + "%";
                    }

                    DModuleCliente->CDSConsCliente->Active = true;
                    if(DModuleCliente->IBTConsCliente->InTransaction){
                        DModuleCliente->IBTConsCliente->Commit();
                    }
                }else if (Sender!= NULL){
                    String CamposObrigatorios = "Informe algum critério para realizar a consulta.";
                    Application->MessageBox(CamposObrigatorios.c_str(),
                        "Atenção",MB_ICONINFORMATION|MB_OK);
                }
            }
        }

        if(DModuleCliente->CDSConsCliente->Active){
            SBarConsCliente->Panels->Items[1]->Text = "Total: " +
                IntToStr(DModuleCliente->CDSConsCliente->RecordCount);

            if(DModuleCliente->CDSConsCliente->RecordCount > 0){
                BtnRelatorioClientes->Enabled = true;
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

void __fastcall TFConsCliente::FormClose(TObject *Sender,
      TCloseAction &Action)
{
    try{
        DModuleCliente->CDSConsCliente->Close();
        DModule->CDSFilial->Close();
    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao fechar o formulário de consulta.\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }
    Action = caFree;
}

//---------------------------------------------------------------------------

void __fastcall TFConsCliente::DBGClientesKeyPress(TObject *Sender,
      char &Key)
{
    if(Key == '\r'){
        DBGClientesDblClick(Sender);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFConsCliente::EdtNomeKeyPress(TObject *Sender, char &Key)
{
   if(Key == '\r'){
        BtnConsultarClick(NULL);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFConsCliente::EdtNomeKeyUp(TObject *Sender, WORD &Key,
      TShiftState Shift)
{
    //if(BtnSelecionar->Visible){
        //BtnConsultarClick(NULL);
    //}
}

//---------------------------------------------------------------------------

void __fastcall TFConsCliente::DBGContratosKeyPress(TObject *Sender,
      char &Key)
{
    if(Key == '\r'){
        DBGContratosDblClick(Sender);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFConsCliente::DBGContratosDblClick(TObject *Sender)
{
    if(DModuleCliente->DSConsContrato->DataSet->Active &&
        DModuleCliente->DSConsContrato->DataSet->RecordCount > 0){

        int CodigoContrato = DModuleCliente->DSConsContrato->DataSet->FieldValues["CDCONTRATO"];
        int CodigoCliente = DModuleCliente->DSConsCliente->DataSet->FieldValues["CDCLIENTE"];
        bool bFContrato = FHome->FormEstaAberto("FCadContratoBasico");
        if(bFContrato){
            FCadContratoBasico->Show();
        }else{
            FCadContratoBasico = new TFCadContratoBasico(FHome);
            FCadContratoBasico->ConsultaContrato(CodigoContrato, CodigoCliente);
            FCadContratoBasico->Show();
        }
    }
}

//---------------------------------------------------------------------------

void __fastcall TFConsCliente::DBGClientesDblClick(TObject *Sender)
{
    if(DModuleCliente->DSConsCliente->DataSet->Active &&
        DModuleCliente->DSConsCliente->DataSet->RecordCount > 0){
        int CodigoCliente = DModuleCliente->DSConsCliente->DataSet->FieldValues["CDCLIENTE"];
        bool bFCliente = FHome->FormEstaAberto("FCadCliente");
        if(bFCliente){
            FCadCliente->ConsultaCliente(CodigoCliente);
            FCadCliente->Show();
        }else{
            FCadCliente = new TFCadCliente(FHome);
            FCadCliente->ConsultaCliente(CodigoCliente);
            FCadCliente->Show();
        }
    }
}

//---------------------------------------------------------------------------

void __fastcall TFConsCliente::SetarObjetoCodigoCliente(TIntegerField *CampoCodigo)
{
    this->ObjetoCodigoCliente = CampoCodigo;
}

//---------------------------------------------------------------------------

void __fastcall TFConsCliente::BtnSelecionarClick(TObject *Sender)
{
    if(this->ObjetoCodigoCliente != NULL){
        int CodigoCliente = DModuleCliente->CDSConsClienteCDCLIENTE->AsInteger;
        this->ObjetoCodigoCliente->AsInteger = CodigoCliente;
    }
}

//---------------------------------------------------------------------------

void __fastcall TFConsCliente::BtnRelatorioClientesClick(TObject *Sender)
{
    QRPClientes = new TQRPClientes(this);
    QRPClientes->PreviewModal();
    QRPClientes->Free();

    /*
    AnsiString Cabecalho = "";
    TStringList *ConteudoCSV = new TStringList();

    ConteudoCSV->Add("RELATÓRIO DE CLIENTE " + DModule->RetornaDataHoraAtual());
    ConteudoCSV->Add("");
    if(CmbFilial->Text != ""){
        ConteudoCSV->Add("FILIAL " + CmbFilial->Text);
    }
    ConteudoCSV->Add("");

    // Monta o cabeçalho do arquivo
    for(int i =0; i <= DModuleCliente->CDSConsCliente->FieldCount -3; i++){
        AnsiString NomeCampo = DModuleCliente->CDSConsCliente->Fields->Fields[i]->FieldName;
        if(NomeCampo == "CDCLIENTE" || NomeCampo == "NMCLIENTE"){
            Cabecalho+=  NomeCampo + ",";
        }
    }

    for(int j =0; j <= DModuleCliente->CDSConsContrato->FieldCount -3; j++){
        AnsiString NomeCampo = DModuleCliente->CDSConsContrato->Fields->Fields[j]->FieldName;
        Cabecalho+= NomeCampo + ",";
    }


    ConteudoCSV->Add(Cabecalho.SubString(0, StrLen(Cabecalho.c_str())-1));
    DModuleCliente->CDSConsCliente->First();

    // Monta linhas do arquivo
    while(!DModuleCliente->CDSConsCliente->Eof){
        AnsiString Linha = "";
        AnsiString Valor = "";
        for(int i =0; i <= DModuleCliente->CDSConsCliente->FieldCount -3; i++){
            AnsiString NomeCampo = DModuleCliente->CDSConsCliente->Fields->Fields[i]->FieldName;
            if(NomeCampo == "CDCLIENTE" || NomeCampo == "NMCLIENTE"){
                Valor = DModuleCliente->CDSConsCliente->Fields->Fields[i]->AsString;
                Linha += StringReplace (Valor, ",", " ", TReplaceFlags() << rfReplaceAll) + ",";
            }
        }

        for(int j =0; j <= DModuleCliente->CDSConsContrato->FieldCount -3; j++){
            Valor = DModuleCliente->CDSConsContrato->Fields->Fields[j]->AsString;
            Linha += StringReplace (Valor, ",", " ", TReplaceFlags() << rfReplaceAll) + ",";
        }

        ConteudoCSV->Add(Linha.SubString(0, StrLen(Linha.c_str())-1));
        DModuleCliente->CDSConsCliente->Next();
    }

    AnsiString PathArquivo = "C:\\AZSIM\\Clientes.csv";
    AnsiString MensagemExportacao = "Arquivo exportadado em " + PathArquivo;
    ConteudoCSV->SaveToFile(PathArquivo);
    Application->MessageBox(MensagemExportacao.c_str(),"Exportação",MB_OK);
    */
}

//---------------------------------------------------------------------------

