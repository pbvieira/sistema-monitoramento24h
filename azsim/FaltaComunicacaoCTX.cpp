//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "FaltaComunicacaoCTX.h"
#include "Home.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFAvisoFaltaComunicacaoCTX *FAvisoFaltaComunicacaoCTX;
//---------------------------------------------------------------------------
__fastcall TFAvisoFaltaComunicacaoCTX::TFAvisoFaltaComunicacaoCTX(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFAvisoFaltaComunicacaoCTX::DBGCtxsDrawColumnCell(
      TObject *Sender, const TRect &Rect, int DataCol, TColumn *Column,
      TGridDrawState State)
{
    if(FHome->CDSConsFaltaComunicacao->RecNo % 2){
        DBGCtxs->Canvas->Brush->Color = clCream;
    }else{
        DBGCtxs->Canvas->Brush->Color = clWindow;
    }

    if(State.Contains(gdSelected)){
        DBGCtxs->Canvas->Brush->Color = clMoneyGreen;
    }
    DBGCtxs->DefaultDrawColumnCell(Rect, DataCol, Column, State);
}
//---------------------------------------------------------------------------
void __fastcall TFAvisoFaltaComunicacaoCTX::BtnFecharClick(TObject *Sender)
{
    Close();    
}
//---------------------------------------------------------------------------
void __fastcall TFAvisoFaltaComunicacaoCTX::FormClose(TObject *Sender,
      TCloseAction &Action)
{
    Action = caFree;    
}
//---------------------------------------------------------------------------
void __fastcall TFAvisoFaltaComunicacaoCTX::BtnDesativarMonitoramentoClick(
      TObject *Sender)
{
    AnsiString motivo = EdtMotivoDesativar->Text;
    if(motivo == ""){
        Application->MessageBox("Informe o motivo!", "Confirmar", MB_ICONERROR|MB_OK);
    }else{
        AnsiString confirmacao = "Deseja desativar o monitoramento de falta de comunicação para esta CTX? "
            "O monitoramento será ativado automaticamente quando a CTX se conectar novamente.";
        bool ConfirmaDesativacao = Application->MessageBox(confirmacao.c_str(), "Confirmar", MB_ICONINFORMATION|MB_YESNO) == IDYES;
        if(ConfirmaDesativacao){
            FHome->CDSConsFaltaComunicacao->Edit();
            FHome->CDSConsFaltaComunicacaoMONITORAMENTO_ATIVO->AsInteger = 0;
            FHome->CDSConsFaltaComunicacaoCDUSUARIO_DESATIVOU->AsInteger = CDUSUARIO;
            FHome->CDSConsFaltaComunicacao->ApplyUpdates(0);
        }
    }
}
//---------------------------------------------------------------------------
void __fastcall TFAvisoFaltaComunicacaoCTX::FormCreate(TObject *Sender)
{
    if(FHome->CDSConsFaltaComunicacao->RecordCount > 0){
        BtnDesativarMonitoramento->Enabled = true;
    }else{
        BtnDesativarMonitoramento->Enabled = false;
    }

    lblTituloAlerta->Caption = "Alerta de falta de comunicação: " + DModule->RetornaDataHoraAtual();
}
//---------------------------------------------------------------------------
