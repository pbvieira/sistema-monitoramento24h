object dlgGeracaoRelClientes: TdlgGeracaoRelClientes
  Left = 655
  Top = 488
  BorderStyle = bsDialog
  Caption = 'Dialog'
  ClientHeight = 87
  ClientWidth = 225
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object btnRelatorio: TButton
    Left = 23
    Top = 12
    Width = 178
    Height = 25
    Caption = 'Gerar Relat'#243'rio Impresso'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = btnRelatorioClick
  end
  object btnPlanilha: TButton
    Left = 23
    Top = 44
    Width = 178
    Height = 25
    Cancel = True
    Caption = 'Gerar Planilha'
    ModalResult = 2
    TabOrder = 1
    OnClick = btnPlanilhaClick
  end
end
