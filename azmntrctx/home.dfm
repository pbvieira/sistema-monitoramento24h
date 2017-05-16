object FHome: TFHome
  Left = 190
  Top = 104
  Width = 1175
  Height = 663
  Caption = 'AZSIM - SISTEMA INTEGRADO DE MONITORAMENTO'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MMenuHome
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object SBarHome: TStatusBar
    Left = 0
    Top = 598
    Width = 1167
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object PHome: TPanel
    Left = 0
    Top = 0
    Width = 1167
    Height = 598
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 1
  end
  object MMenuHome: TMainMenu
    Left = 8
    Top = 8
    object Aplicativo1: TMenuItem
      Caption = 'Cadastros'
      object Sair1: TMenuItem
        Caption = 'Clientes'
      end
      object Contratos1: TMenuItem
        Caption = 'Contratos'
      end
      object Filiais1: TMenuItem
        Caption = 'Filiais'
      end
    end
    object Dados1: TMenuItem
      Caption = 'Dados'
    end
    object Ferramentas1: TMenuItem
      Caption = 'Ferramentas'
    end
    object Registro1: TMenuItem
      Caption = 'Registro'
    end
  end
end
