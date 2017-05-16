inherited FCadCodificadores: TFCadCodificadores
  Left = 829
  Width = 514
  Height = 405
  Caption = 'Cadastro de Codificadores'
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMenu: TPanel
    Top = 341
    Width = 506
    inherited POperacoes: TPanel
      inherited TBOperacoes: TToolBar
        inherited BtnVoltar: TToolButton
          Visible = False
        end
        inherited BtnAvancar: TToolButton
          Visible = False
        end
      end
    end
    inherited PFechar: TPanel
      Left = 449
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 489
    Height = 65
    TabOrder = 1
    object Label6: TLabel
      Left = 10
      Top = 16
      Width = 53
      Height = 13
      Caption = 'Codificador'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object EdtCodificador: TDBEdit
      Left = 8
      Top = 32
      Width = 122
      Height = 21
      DataField = 'CDCODIFICADOR'
      DataSource = DSCodificadores
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 77
    Width = 489
    Height = 257
    Caption = 'Codificadores Cadastrados'
    TabOrder = 2
    object DBGUsuario: TDBGrid
      Left = 9
      Top = 19
      Width = 466
      Height = 227
      DataSource = DSCodificadores
      Options = [dgTitles, dgIndicator, dgRowLines, dgTabs, dgConfirmDelete]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'CDCODIFICADOR'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NMCLIENTE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CDCONTRATO'
          Visible = True
        end>
    end
  end
  object DSCodificadores: TDataSource
    DataSet = CDSCodificadores
    Left = 216
    Top = 8
  end
  object CDSCodificadores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPCodificadores'
    Left = 248
    Top = 8
    object CDSCodificadoresCDCODIFICADOR: TIntegerField
      FieldName = 'CDCODIFICADOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CDSCodificadoresNMCLIENTE: TStringField
      FieldName = 'NMCLIENTE'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object CDSCodificadoresCDCONTRATO: TIntegerField
      FieldName = 'CDCONTRATO'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object DSPCodificadores: TDataSetProvider
    DataSet = IBQCodificadores
    Constraints = True
    OnGetTableName = DSPCodificadoresGetTableName
    Left = 280
    Top = 8
  end
  object IBQCodificadores: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTCodificadores
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT COD.CDCODIFICADOR, CLI.NMCLIENTE, CO.CDCONTRATO'
      'FROM CODIFICADOR COD'
      'LEFT JOIN CONTRATO CO ON COD.CDCODIFICADOR = CO.CDCODIFICADOR'
      'LEFT OUTER JOIN CLIENTE CLI ON CLI.CDCLIENTE = CO.CDCLIENTE')
    Left = 312
    Top = 8
    object IBQCodificadoresCDCODIFICADOR: TIntegerField
      FieldName = 'CDCODIFICADOR'
      Origin = 'EQUIPAMENTOS.CDCODIFICADOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQCodificadoresNMCLIENTE: TIBStringField
      FieldName = 'NMCLIENTE'
      Origin = 'CLIENTE.NMCLIENTE'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object IBQCodificadoresCDCONTRATO: TIntegerField
      FieldName = 'CDCONTRATO'
      Origin = 'CONTRATO.CDCONTRATO'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object IBTCodificadores: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 344
    Top = 8
  end
end
