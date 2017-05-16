object DLGAvisoOcorrencia: TDLGAvisoOcorrencia
  Left = 938
  Top = 269
  BorderStyle = bsDialog
  ClientHeight = 100
  ClientWidth = 313
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 297
    Height = 57
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 48
    Top = 24
    Width = 204
    Height = 20
    Caption = 'Nova ocorr'#234'ncia recebida'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object OKBtn: TButton
    Left = 111
    Top = 71
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
end
