//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "ConsEvento.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFConsEvento *FConsEvento;
//---------------------------------------------------------------------------
__fastcall TFConsEvento::TFConsEvento(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFConsEvento::BtnConsultarClick(TObject *Sender)
{
    try{
        AnsiString SQL_ORDER_BY = " ORDER BY E.DATAEVENTO";

        AnsiString SQL_FILTRO_DATA =
            "SELECT "
            "    E.DATAEVENTO, E.CTX, E.PORTACOM, E.EQUIPAMENTO, E.STATUS || '.' || REPLACE(E.REFERENCIA, 'F', '*') AS STATUS, "
            "    E.DESTATUS, E.NMCLIENTE, E.ENDERECO, E.CIDADE "
            "FROM LOGEVENTO E LEFT JOIN CLIENTE C ON E.CDCLIENTE = C.CDCLIENTE "
            "WHERE E.DATAEVENTO BETWEEN :DATAINICIAL AND :DATAFINAL" + SQL_ORDER_BY;

        AnsiString SQL_FILTRO = SQL_FILTRO_DATA;
        AnsiString SQL_FILTRO_CODIGO = SQL_FILTRO_DATA.SubString(0, StrLen(SQL_FILTRO_DATA.c_str()) - StrLen(SQL_ORDER_BY.c_str())) + " AND C.CDCLIENTE = :CDCLIENTE" + SQL_ORDER_BY;
        AnsiString SQL_FILTRO_NOME = SQL_FILTRO_DATA.SubString(0, StrLen(SQL_FILTRO_DATA.c_str()) - StrLen(SQL_ORDER_BY.c_str())) + " AND C.NMCLIENTE LIKE UPPER(:NMCLIENTE)" + SQL_ORDER_BY;
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

            if(StrLen(Estatus.c_str()) != 4){
                String ErroNoCriterio =
                    "Informe o status no fomato de 4 digitos (1 caracter para o estatus + ponto + 2 caracteres para a referência). Ex: 0.0*";
                Application->MessageBox(ErroNoCriterio.c_str(),"Atenção",MB_ICONERROR|MB_OK);
                return;
            }else{
                if(!StrPos(Estatus.c_str(), ".")){
                    String ErroNoCriterio =
                        "Informe o status no fomato de 4 digitos (1 caracter para o estatus + ponto + 2 caracteres para a referência). Ex: 0.0*";
                    Application->MessageBox(ErroNoCriterio.c_str(),"Atenção",MB_ICONERROR|MB_OK);
                    return;
                }
            }

            CDSConsEventos->Close();
            IBQConsEventos->SQL->Clear();
            SQL_FILTRO = SQL_FILTRO.SubString(0, StrLen(SQL_FILTRO.c_str()) - StrLen(SQL_ORDER_BY.c_str())) +
                " AND E.STATUS = :STATUS AND E.REFERENCIA = :REFERENCIA" + SQL_ORDER_BY;
            IBQConsEventos->SQL->Text = SQL_FILTRO;

        }else if(StatusDescricao != ""){

            CDSConsEventos->Close();
            IBQConsEventos->SQL->Clear();
            SQL_FILTRO = SQL_FILTRO.SubString(0, StrLen(SQL_FILTRO.c_str()) - StrLen(SQL_ORDER_BY.c_str())) +
                " AND E.DESTATUS LIKE :DESTATUS" + SQL_ORDER_BY;
            IBQConsEventos->SQL->Text = SQL_FILTRO;
        }

        ConfiguraCriteriosSQL(CDSConsEventos);

        IBQConsEventos->ParamByName("DATAINICIAL")->AsDate = EdtDataInicial->Date;
        IBQConsEventos->ParamByName("DATAFINAL")->AsDate = EdtDataFinal->Date;
        CDSConsEventos->Active = true;
        int totalRegistros = CDSConsEventos->RecordCount;
        if(IBTConsEventos->InTransaction){
            IBTConsEventos->Commit();
        }

        if(CkbAtualizar->Checked){
            TMRConsulta->Enabled = true;
        }else{
            TMRConsulta->Enabled = false;
        }

    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao consultar o cadastro de eventos."
            "\n\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }
}
//---------------------------------------------------------------------------
void __fastcall TFConsEvento::ConfiguraCriteriosSQL(TClientDataSet *CDSConsEventos)
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
        AnsiString _Estatus = Estatus.SubString(0,1);
        AnsiString _Referencia = StringReplace (Estatus.SubString(3,2), "*", "F", TReplaceFlags() << rfReplaceAll);
        IBQConsEventos->ParamByName("STATUS")->AsString = _Estatus;
        IBQConsEventos->ParamByName("REFERENCIA")->AsString = _Referencia;

    }else if(StatusDescricao != ""){
        IBQConsEventos->ParamByName("DESTATUS")->AsString = "%" + StatusDescricao + "%";
    }
}
//---------------------------------------------------------------------------
void __fastcall TFConsEvento::DBGEventosDrawColumnCell(TObject *Sender,
      const TRect &Rect, int DataCol, TColumn *Column,
      TGridDrawState State)
{
    if(CDSConsEventos->RecNo % 2){
        DBGEventos->Canvas->Brush->Color = 15138520;
    }else{
        DBGEventos->Canvas->Brush->Color = clWindow;
    }

    if(State.Contains(gdSelected)){
        DBGEventos->Canvas->Brush->Color = clTeal;
    }

    DBGEventos->DefaultDrawColumnCell(Rect, DataCol, Column, State);
}
//---------------------------------------------------------------------------
void __fastcall TFConsEvento::TMRConsultaTimer(TObject *Sender)
{
    BtnConsultarClick(Sender);
}
//---------------------------------------------------------------------------

void __fastcall TFConsEvento::CkbAtualizarClick(TObject *Sender)
{
    if(!CkbAtualizar->Checked){
        TMRConsulta->Enabled = false;
    }
}
//---------------------------------------------------------------------------
void __fastcall TFConsEvento::ParaTimerDaConsulta(TObject *Sender)
{
    TMRConsulta->Enabled = false;
    CkbAtualizar->Checked = false;
}
