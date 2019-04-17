//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "SelectRelNaoIdentificados.h"
#include "RelNaoIdentificados.h"
#include "DMCliente.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFSelectRelNaoIdentificados *FSelectRelNaoIdentificados;
//---------------------------------------------------------------------------
__fastcall TFSelectRelNaoIdentificados::TFSelectRelNaoIdentificados(TComponent* Owner)
    : TForm(Owner)
{
    QRPRelNaoIdentificados = new TQRPRelNaoIdentificados(this);
}
//---------------------------------------------------------------------------
void __fastcall TFSelectRelNaoIdentificados::BtnSemComunicacaoClick(
      TObject *Sender)
{
    try{
      int NumDias = StrToIntDef(EdtNumDias->Text, 30);
      QRPRelNaoIdentificados->NumDias = NumDias;
      DModuleCliente->CDSRelNaoIdentificados->Close();
      DModuleCliente->IBQRelNaoIdentificados->ParamByName("NUMDIAS")->AsInteger = NumDias;

      Screen->Cursor = crHourGlass;
      DModuleCliente->CDSRelNaoIdentificados->Open();
      Screen->Cursor = crArrow;

      int totalRegistros = DModuleCliente->CDSRelNaoIdentificados->RecordCount;

      if(totalRegistros > 0){
          QRPRelNaoIdentificados->DataSet = DModuleCliente->CDSRelNaoIdentificados;
          QRPRelNaoIdentificados->PreviewModal();
      }else{
          Application->MessageBox("Nenhum registro localizado", "Sucesso", MB_ICONINFORMATION|MB_OK);
      }

      if(DModuleCliente->IBTRelNaoIdentificados->InTransaction){
          DModuleCliente->IBTRelNaoIdentificados->Commit();
      }
      
    }catch(Exception &excecao){
        AnsiString erro = excecao.Message;
        String ErroNaConexao =
            "Ocorreu um erro ao consultar as centrais sem comunicaçãon\nDescrição do erro:\n" + erro;
        Application->MessageBox(ErroNaConexao.c_str(),"Atenção",MB_ICONERROR|MB_OK);
    }
}
//---------------------------------------------------------------------------
void __fastcall TFSelectRelNaoIdentificados::BtnFecharClick(
      TObject *Sender)
{
    Close();    
}
//---------------------------------------------------------------------------
void __fastcall TFSelectRelNaoIdentificados::FormClose(TObject *Sender,
      TCloseAction &Action)
{
    DModuleCliente->CDSRelNaoIdentificados->Close();
    QRPRelNaoIdentificados->Free();
    Action = caFree;    
}
//---------------------------------------------------------------------------
