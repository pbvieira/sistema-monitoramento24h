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
#include "DialogGeracaoRelClientes.h"
#include "FichaCliente.h"
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

void __fastcall TFConsCliente::FormCreate(TObject *Sender)
{
    pnlTituloForm->Color = COLOR_HEADER_FORM;
    ConfiguraEventosForm();
}

//---------------------------------------------------------------------------

void __fastcall TFConsCliente::FormShow(TObject *Sender)
{
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
        AnsiString RESTRINGI_CONTRATO_ATIVOS = "";

        if(rgClientesAtivos->ItemIndex >= 1){
            RESTRINGI_CONTRATO = "INNER";
          if (rgClientesAtivos->ItemIndex == 2){
              // Restringi a clientes que tiveram ocorrências atendidas nos últimos 180 dias
              RESTRINGI_CONTRATO_ATIVOS = "	AND (SELECT COUNT(1) FROM OCORRENCIA O "
                "WHERE O.ISOCORRENCIAENCERRADA = 1 "
                "AND O.CDCLIENTE = C.CDCLIENTE AND DATEDIFF(MONTH, O.DATAEVENTO, CURRENT_DATE) < 7) > 1 ";
          } else if (rgClientesAtivos->ItemIndex == 3){
              // Restringi a clientes que tiveram ocorrências atendidas nos últimos 90 dias
              RESTRINGI_CONTRATO_ATIVOS = "	AND (SELECT COUNT(1) FROM OCORRENCIA O "
                "WHERE O.ISOCORRENCIAENCERRADA = 1 "
                "AND O.CDCLIENTE = C.CDCLIENTE AND DATEDIFF(MONTH, O.DATAEVENTO, CURRENT_DATE) < 4) > 1 ";
          } else if (rgClientesAtivos->ItemIndex == 4){
              // Restringi a clientes que tiveram ocorrências atendidas nos últimos 60 dias
              RESTRINGI_CONTRATO_ATIVOS = "	AND (SELECT COUNT(1) FROM OCORRENCIA O "
                "WHERE O.ISOCORRENCIAENCERRADA = 1 "
                "AND O.CDCLIENTE = C.CDCLIENTE AND DATEDIFF(MONTH, O.DATAEVENTO, CURRENT_DATE) < 3) > 1 ";
          } else if (rgClientesAtivos->ItemIndex == 5){
              // Restringi a clientes que tiveram ocorrências atendidas nos últimos 30 dias
              RESTRINGI_CONTRATO_ATIVOS = "	AND (SELECT COUNT(1) FROM OCORRENCIA O "
                "WHERE O.ISOCORRENCIAENCERRADA = 1 "
                "AND O.CDCLIENTE = C.CDCLIENTE AND DATEDIFF(MONTH, O.DATAEVENTO, CURRENT_DATE) < 2) > 1 ";
          }
        }

        AnsiString ORDER_BY = " ORDER BY C.NMCLIENTE";
        if(RgpOrdenacao->ItemIndex == 1){
            ORDER_BY = " ORDER BY CR.CDCODIFICADOR";
        }

        AnsiString SQL_FILTRO_TODOS = Format("SELECT C.CDCLIENTE, C.CDFILIAL, C.TPPESSOA, "
            "CASE WHEN C.NMFANTASIA IS NULL THEN C.NMCLIENTE ELSE C.NMFANTASIA END AS NOME, C.NMCLIENTE, C.NMFANTASIA, "
            "C.DOCUMENTO, C.INSCMUNICIPAL, C.ENDERECO, C.BAIRRO, C.CIDADE, C.UF, C.CEP, "
	        "C.PONTOREF, C.CHAVE, C.KMBASE, C.OBSERVACAO, C.PROCEDIMENTOS, C.DATACADASTRO, "
	        "C.DATAALTERACAO, C.FONE1, C.FONEOBS1, C.FONE2, C.FONEOBS2, C.FONE3, C.FONEOBS3, "
	        "C.FONE4, C.FONEOBS4, C.FONE5, C.FONEOBS5, C.FONE6, C.FONEOBS6, C.FONE7, C.FONEOBS7, "
	        "C.FONE8, C.FONEOBS8, CR.CDCONTRATO, CR.CDCODIFICADOR, CR.LOCALINSTALCENTRAL, CR.MODELOCENTRAL "
          "FROM CLIENTE C %s JOIN CONTRATO CR ON C.CDCLIENTE = CR.CDCLIENTE ",
            ARRAYOFCONST((RESTRINGI_CONTRATO)));

        AnsiString SQL_FILTRO_POR_CODIGO = Format(
            "%s WHERE C.CDCLIENTE = :CDCLIENTE %s %s",
                ARRAYOFCONST((SQL_FILTRO_TODOS, RESTRINGI_CONTRATO_ATIVOS, ORDER_BY)));

        AnsiString SQL_FILTRO_POR_NOME = Format(
            "%s WHERE C.NMCLIENTE LIKE UPPER(:NMCLIENTE) OR C.NMFANTASIA LIKE UPPER(:NMCLIENTE) %s %s",
                ARRAYOFCONST((SQL_FILTRO_TODOS, RESTRINGI_CONTRATO_ATIVOS, ORDER_BY)));

        AnsiString SQL_FILTRO_POR_FILIAL = Format(
            "%s WHERE C.CDFILIAL = :CDFILIAL %s %s",
                ARRAYOFCONST((SQL_FILTRO_TODOS, RESTRINGI_CONTRATO_ATIVOS, ORDER_BY)));

        if(Sender!= NULL && dynamic_cast <TSpeedButton*> (Sender)->Name == "BtnTodos"){
            if (rgClientesAtivos->ItemIndex >= 2){
                SQL_FILTRO_TODOS = Format(
                    "%s WHERE %s %s",
                        ARRAYOFCONST((SQL_FILTRO_TODOS,
                            RESTRINGI_CONTRATO_ATIVOS.SubString(5, StrLen(RESTRINGI_CONTRATO_ATIVOS.c_str())), ORDER_BY)));
            }

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
                DModuleCliente->IBQConsCliente->SQL->Text = SQL_FILTRO_POR_FILIAL;
                DModuleCliente->IBQConsCliente->ParamByName("CDFILIAL")->AsInteger = CmbFilial->KeyValue;
                DModuleCliente->CDSConsCliente->Active = true;
                if(DModuleCliente->IBTConsCliente->InTransaction){
                    DModuleCliente->IBTConsCliente->Commit();
                }
            } else if(CodigoCliente > 0){
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

            }else{
                AnsiString SQL_FILTRO_POR_LOCAL =  Format(
                    "%s WHERE C.CIDADE LIKE UPPER(:LOCAL) OR C.ENDERECO LIKE UPPER(:LOCAL) OR C.BAIRRO LIKE UPPER(:LOCAL) %s",
                        ARRAYOFCONST((SQL_FILTRO_TODOS, ORDER_BY)));

                String Endereco = EdtEndereco->Text;

                if(Endereco != ""){
                    DModuleCliente->CDSConsCliente->Close();
                    DModuleCliente->IBQConsCliente->SQL->Clear();
                    DModuleCliente->IBQConsCliente->SQL->Text = SQL_FILTRO_POR_LOCAL;
                    DModuleCliente->IBQConsCliente->ParamByName("LOCAL")->AsString = "%" + Endereco + "%";

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
            sbarConsulta->Panels->Items[1]->Text = "Total: " +
                IntToStr(DModuleCliente->CDSConsCliente->RecordCount);

            if(DModuleCliente->CDSConsCliente->RecordCount > 0){
                BtnRelatorioClientes->Enabled = true;
                BtnAbrirClientes->Enabled = true;
                BtnAbrirContratos->Enabled = true;
            }else{
                BtnRelatorioClientes->Enabled = false;
                BtnAbrirClientes->Enabled = false;
                BtnAbrirContratos->Enabled = false;
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
        if(FHome->FormEstaAberto("FFichaCliente")){
            FFichaCliente->Close();
        }

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
    }else{
        Application->MessageBox("O cliente não possuí cadastro de contratos", "Aviso",MB_ICONINFORMATION|MB_OK);
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
        this->Close();
    }
}

//---------------------------------------------------------------------------

void __fastcall TFConsCliente::BtnRelatorioClientesClick(TObject *Sender)
{
    if(dlgGeracaoRelClientes->ShowModal() == mrOk){
      QrpFichaCliente = new TQrpFichaCliente(this);
      QrpFichaCliente->PreviewModal();
      QrpFichaCliente->Free();
    }else{
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

      if (!DirectoryExists("./relatorios")){
          if (!CreateDir("./relatorios"))
              throw Exception("Não foi possível criar o diretório relatorios.");
      }

      AnsiString NumeroDias = "";

      if (rgClientesAtivos->ItemIndex == 2){
          //Clientes que tiveram ocorrências atendidas nos últimos 180 dias
          NumeroDias = "-180-dias";
      } else if (rgClientesAtivos->ItemIndex == 3){
          // Clientes que tiveram ocorrências atendidas nos últimos 90 dias
          NumeroDias = "-90-dias";
      } else if (rgClientesAtivos->ItemIndex == 4){
          // Clientes que tiveram ocorrências atendidas nos últimos 60 dias
          NumeroDias = "-60-dias";
      } else if (rgClientesAtivos->ItemIndex == 5){
          // Clientes que tiveram ocorrências atendidas nos últimos 30 dias
          NumeroDias = "-30-dias";
      }

      AnsiString NomeArquivo = Format(
          "Clientes-%s%s.csv",
              ARRAYOFCONST((FormatDateTime("ddmmmyyyy", Date()), NumeroDias)));

      AnsiString PathApp = ExtractFilePath(ParamStr(0));
      AnsiString PathArquivo = PathApp+ "relatorios\\" + NomeArquivo;
      AnsiString MensagemExportacao = "Arquivo exportadado em " + PathArquivo;
      ConteudoCSV->SaveToFile(PathArquivo);
      Application->MessageBox(MensagemExportacao.c_str(),"Exportação",MB_OK);
    }
}

//---------------------------------------------------------------------------

void __fastcall TFConsCliente::ConfiguraEventosForm(void)
{
    for(int i=0; i < ComponentCount; i++){
        if(dynamic_cast <TEdit*> (Components[i]) != NULL){
            dynamic_cast <TEdit*> (Components[i])->OnEnter = ChangeEnter;
            dynamic_cast <TEdit*> (Components[i])->OnExit = ChangeExit;
        }

        if(dynamic_cast <TDBLookupComboBox*> (Components[i]) != NULL){
            dynamic_cast <TDBLookupComboBox*> (Components[i])->OnEnter = ChangeEnter;
            dynamic_cast <TDBLookupComboBox*> (Components[i])->OnExit = ChangeExit;
        }

        if(dynamic_cast <TDBComboBox*> (Components[i]) != NULL){
            dynamic_cast <TDBComboBox*> (Components[i])->OnEnter = ChangeEnter;
            dynamic_cast <TDBComboBox*> (Components[i])->OnExit = ChangeExit;
        }
    }
}

//---------------------------------------------------------------------------

void __fastcall TFConsCliente::ChangeEnter(TObject * Sender)
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

void __fastcall TFConsCliente::ChangeExit(TObject *Sender)
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

void __fastcall TFConsCliente::DBGClientesDrawColumnCell(TObject *Sender,
      const TRect &Rect, int DataCol, TColumn *Column,
      TGridDrawState State)
{
    if(DModuleCliente->CDSConsCliente->RecNo % 2){
        (dynamic_cast <TDBGrid*> (Sender))->Canvas->Brush->Color = COLOR_GRID_ALTERNATE_ROW;
    }else{
        (dynamic_cast <TDBGrid*> (Sender))->Canvas->Brush->Color = clWindow;
    }

    if(State.Contains(gdSelected)){
        DBGClientes->Canvas->Brush->Color = COLOR_GRID_SELECTED_ROW;
    }
    DBGClientes->DefaultDrawColumnCell(Rect, DataCol, Column, State);
}

//---------------------------------------------------------------------------




