//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "ConsCliente.h"
#include "DMApp.h"
#include "Home.h"
#include "CadCliente.h"
#include "DMCliente.h"
#include "RelClientes.h"
#include "RelFichaClientes.h"
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
        AnsiString RESTRINGI_CONTRATO = "LEFT";
        if(CkbAtivos->Checked){
            RESTRINGI_CONTRATO = "INNER";
        }

        AnsiString SQL_FILTRO_TODOS = Format("SELECT C.CDCLIENTE, C.CDFILIAL, C.TPPESSOA, C.NMCLIENTE, C.NMFANTASIA, "
            "C.DOCUMENTO, C.INSCMUNICIPAL, C.ENDERECO, C.BAIRRO, C.CIDADE, C.UF, C.CEP, "
	        "C.PONTOREF, C.CHAVE, C.KMBASE, C.OBSERVACAO, C.PROCEDIMENTOS, C.DATACADASTRO, "
	        "C.DATAALTERACAO, C.FONE1, C.FONEOBS1, C.FONE2, C.FONEOBS2, C.FONE3, C.FONEOBS3, "
	        "C.FONE4, C.FONEOBS4, C.FONE5, C.FONEOBS5, C.FONE6, C.FONEOBS6, C.FONE7, C.FONEOBS7, "
	        "C.FONE8, C.FONEOBS8, CR.CDCONTRATO, CR.CDCODIFICADOR, CR.LOCALINSTALCENTRAL, CR.MODELOCENTRAL "
          "FROM CLIENTE C %s JOIN CONTRATO CR ON C.CDCLIENTE = CR.CDCLIENTE ",
          ARRAYOFCONST((RESTRINGI_CONTRATO)));

        AnsiString SQL_FILTRO_POR_CODIGO = Format(
            "%s WHERE C.CDCLIENTE = :CDCLIENTE",
                ARRAYOFCONST((SQL_FILTRO_TODOS)));

        AnsiString SQL_FILTRO_POR_NOME = Format(
            "%s WHERE C.NMCLIENTE LIKE UPPER(:NMCLIENTE) OR C.NMFANTASIA LIKE UPPER(:NMCLIENTE)",
                ARRAYOFCONST((SQL_FILTRO_TODOS)));

        AnsiString SQL_FILTRO_POR_FILIAL = Format(
            "%s WHERE C.CDFILIAL = :CDFILIAL",
                ARRAYOFCONST((SQL_FILTRO_TODOS)));

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
                    "%s WHERE ",
                        ARRAYOFCONST((SQL_FILTRO_TODOS)));
                
                String Cidade = EdtCidade->Text;

                if(Cidade != ""){
                    if(Cidade != ""){
                        SQL_FILTRO_POR_LOCAL += " C.CIDADE LIKE UPPER(:CIDADE) OR C.ENDERECO LIKE UPPER(:CIDADE) OR C.BAIRRO LIKE UPPER(:CIDADE)";
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
    QrpFichaCliente = new TQrpFichaCliente(this);
    QrpFichaCliente->PreviewModal();
    QrpFichaCliente->Free();
}

//---------------------------------------------------------------------------

