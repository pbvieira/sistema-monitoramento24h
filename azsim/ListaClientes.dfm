object FListaClientes: TFListaClientes
  Left = 284
  Top = 288
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'AZSIM'
  ClientHeight = 233
  ClientWidth = 940
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 39
    Width = 650
    Height = 20
    AutoSize = False
    Caption = 
      'A consulta retornou mais de um cliente com o nome informado. Sel' +
      'ecione o cliente com um duplo clique no nome do cliente abaixo.'
    WordWrap = True
  end
  object pnlTituloClientes: TPanel
    Left = 0
    Top = 0
    Width = 940
    Height = 30
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = ' Lista de clientes'
    Color = 11367990
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object DBGClientes: TDBGrid
    Left = 0
    Top = 62
    Width = 940
    Height = 171
    Align = alBottom
    DataSource = DModuleCliente.DSConsCliente
    Options = [dgTitles, dgIndicator, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGClientesDrawColumnCell
    OnDblClick = DBGClientesDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CDCODIFICADOR'
        Title.Caption = 'Codificador'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CDCLIENTE'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome / Raz'#227'o Social / Nome Fantasia'
        Width = 350
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIDADE'
        Title.Caption = 'Cidade'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENDERECO'
        Title.Caption = 'Endere'#231'o'
        Width = 600
        Visible = True
      end>
  end
end
