//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ConsSimplesClientes.h"
#include "FichaCliente.h"
#include "Home.h"
#include "DMCliente.h"
#include "ListaClientes.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFConsSimplesClientes *FConsSimplesClientes;
//---------------------------------------------------------------------------
__fastcall TFConsSimplesClientes::TFConsSimplesClientes(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFConsSimplesClientes::BtnConsultaRapidaClick(
      TObject *Sender)
{
    try{
        AnsiString ORDER_BY = " ORDER BY C.NMCLIENTE";

        AnsiString SQL_FILTRO_TODOS = "SELECT C.CDCLIENTE, C.CDFILIAL, C.TPPESSOA, "
            "CASE WHEN C.NMFANTASIA IS NULL THEN C.NMCLIENTE ELSE C.NMFANTASIA END AS NOME, C.NMCLIENTE, C.NMFANTASIA, "
            "C.DOCUMENTO, C.INSCMUNICIPAL, C.ENDERECO, C.BAIRRO, C.CIDADE, C.UF, C.CEP, "
	        "C.PONTOREF, C.CHAVE, C.KMBASE, C.OBSERVACAO, C.PROCEDIMENTOS, C.DATACADASTRO, "
	        "C.DATAALTERACAO, C.FONE1, C.FONEOBS1, C.FONE2, C.FONEOBS2, C.FONE3, C.FONEOBS3, "
	        "C.FONE4, C.FONEOBS4, C.FONE5, C.FONEOBS5, C.FONE6, C.FONEOBS6, C.FONE7, C.FONEOBS7, "
	        "C.FONE8, C.FONEOBS8, C.CDHABIL, C.CDCONDOR, CR.CDCONTRATO, CR.CDCODIFICADOR, CR.LOCALINSTALCENTRAL, CR.MODELOCENTRAL "
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
                 if(FHome->FormEstaAberto("FFichaCliente")){
                      FFichaCliente->Show();
                  }else{
                      FFichaCliente = new TFFichaCliente(FHome);
                      FFichaCliente->Show();
                  }
                }else{
                 if(FHome->FormEstaAberto("FFichaCliente")){
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
