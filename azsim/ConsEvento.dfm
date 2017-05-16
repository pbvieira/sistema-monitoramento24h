object FConsEvento: TFConsEvento
  Left = 193
  Top = 105
  Width = 1001
  Height = 479
  Color = clBtnFace
  DefaultMonitor = dmDesktop
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
  object PTitulo: TPanel
    Left = 0
    Top = 0
    Width = 993
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    Color = clTeal
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 5
      Width = 173
      Height = 22
      Caption = 'Registro de Eventos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 33
    Width = 993
    Height = 176
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object BtnConsultar: TSpeedButton
      Left = 565
      Top = 140
      Width = 138
      Height = 22
      Caption = '&Executar Consulta'
      Flat = True
      Glyph.Data = {
        C6040000424DC60400000000000036040000280000000C0000000C0000000100
        0800000000009000000000000000000000000001000000000000AC650000FCF1
        DD00B36D0000BE770000A35E0000FCF2E000F3CE8A00FDF7EB00CA871200DAA0
        3C00BA730000B56E0000C27B0000EABB6400A5600000F0C57500AA6500009F5A
        0000FEFBF500AF6A0000FFFEFB00FAE6C300F6DAA600FAEACC00C37C0000F8E4
        BD00BB740000A05B0000FFFFFF00FFFFFF000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000001C1C1C1C1C1C
        1C1C1C1C04041C1C1C1C1C1C1C1C1C0008001C1C1C1C1C1C1C1C0209021C1C1C
        1C1C1C1C1C1A0D1A1C1C1C1C1B1B111B1A0F0C1C1C1C1C0E191919191A1A1C1C
        1C1C101717060617171B1C1C1C1C130116161616011B1C1C1C1C0B0715151515
        071B1C1C1C1C0A1414050512141B1C1C1C1C1C031C1C1C1C031C1C1C1C1C1C1C
        181818181C1C1C1C1C1C}
      OnClick = BtnConsultarClick
    end
    object GBCliente: TGroupBox
      Left = 222
      Top = 8
      Width = 481
      Height = 62
      Caption = ' Cliente ou Codificador '
      TabOrder = 1
      object Label6: TLabel
        Left = 13
        Top = 17
        Width = 47
        Height = 13
        Caption = 'N'#186' Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 395
        Top = 17
        Width = 68
        Height = 13
        Caption = 'N'#186' Codificador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 85
        Top = 17
        Width = 78
        Height = 13
        Caption = 'Nome do Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object EdtCodCliente: TEdit
        Left = 12
        Top = 32
        Width = 70
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
        OnChange = ParaTimerDaConsulta
      end
      object EdtNome: TEdit
        Left = 84
        Top = 32
        Width = 308
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 1
        OnChange = ParaTimerDaConsulta
      end
      object EdtCodificador: TEdit
        Left = 394
        Top = 32
        Width = 70
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 2
        OnChange = ParaTimerDaConsulta
      end
    end
    object GBData: TGroupBox
      Left = 8
      Top = 8
      Width = 209
      Height = 126
      Caption = 'Selecione o Intervalo da Consulta'
      TabOrder = 0
      object Label3: TLabel
        Left = 9
        Top = 57
        Width = 48
        Height = 13
        Caption = 'Data Final'
      end
      object Label2: TLabel
        Left = 9
        Top = 17
        Width = 53
        Height = 13
        Caption = 'Data Inicial'
      end
      object EdtDataFinal: TDateTimePicker
        Left = 9
        Top = 72
        Width = 186
        Height = 21
        CalAlignment = dtaLeft
        Date = 42183.6729884259
        Time = 42183.6729884259
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 1
      end
      object EdtDataInicial: TDateTimePicker
        Left = 9
        Top = 32
        Width = 186
        Height = 21
        CalAlignment = dtaLeft
        Date = 42183.6729884259
        Time = 42183.6729884259
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 0
      end
    end
    object GBEstatus: TGroupBox
      Left = 222
      Top = 72
      Width = 481
      Height = 62
      Caption = ' Estatus ou Descri'#231#227'o'
      TabOrder = 2
      object Label5: TLabel
        Left = 13
        Top = 17
        Width = 35
        Height = 13
        Caption = 'Estatus'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 85
        Top = 17
        Width = 101
        Height = 13
        Caption = 'Descri'#231#227'o do Estatus'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object EdtStatus: TEdit
        Left = 12
        Top = 33
        Width = 70
        Height = 21
        Hint = 'Exemplo: 0.0*'
        CharCase = ecUpperCase
        TabOrder = 0
        OnChange = ParaTimerDaConsulta
      end
      object EdtStatusDescricao: TEdit
        Left = 84
        Top = 33
        Width = 381
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 1
        OnChange = ParaTimerDaConsulta
      end
    end
    object CkbAtualizar: TCheckBox
      Left = 446
      Top = 143
      Width = 113
      Height = 17
      Caption = 'Monitorar Registros'
      TabOrder = 3
      OnClick = CkbAtualizarClick
    end
  end
  object DBGEventos: TDBGrid
    Left = 0
    Top = 209
    Width = 993
    Height = 243
    Align = alClient
    BorderStyle = bsNone
    Ctl3D = True
    DataSource = DSEventos
    DefaultDrawing = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGEventosDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'DATAEVENTO'
        Title.Caption = 'Data Evento'
        Width = 120
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'CTX'
        Title.Caption = 'Ctx'
        Width = 50
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PORTACOM'
        Title.Caption = 'Com'
        Width = 30
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'EQUIPAMENTO'
        Title.Caption = 'Codificador'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
        Title.Caption = 'Status'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESTATUS'
        Title.Caption = 'Descri'#231#227'o'
        Width = 350
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMCLIENTE'
        Title.Caption = 'Cliente'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENDERECO'
        Title.Caption = 'Endere'#231'o'
        Width = 290
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIDADE'
        Title.Caption = 'Cidade'
        Width = 400
        Visible = True
      end>
  end
  object IBTConsEventos: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 625
    Top = 2
  end
  object IBQConsEventos: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTConsEventos
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT E.DATAEVENTO, E.CTX, E.PORTACOM, E.EQUIPAMENTO, E.STATUS ' +
        '|| '#39'.'#39' || REPLACE(E.REFERENCIA, '#39'F'#39', '#39'*'#39') AS STATUS,  E.DESTATUS' +
        ', E.NMCLIENTE, E.ENDERECO, E.CIDADE '
      
        'FROM LOGEVENTO E LEFT JOIN CLIENTE C ON E.CDCLIENTE = C.CDCLIENT' +
        'E WHERE E.DATAEVENTO BETWEEN :DATAINICIAL AND :DATAFINAL ORDER B' +
        'Y E.DATAEVENTO DESC;')
    UniDirectional = True
    Left = 656
    Top = 2
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATAINICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAFINAL'
        ParamType = ptUnknown
      end>
    object IBQConsEventosCTX: TIntegerField
      FieldName = 'CTX'
      Origin = 'LOGEVENTO.CTX'
    end
    object IBQConsEventosPORTACOM: TIntegerField
      FieldName = 'PORTACOM'
      Origin = 'LOGEVENTO.PORTACOM'
    end
    object IBQConsEventosEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
      Origin = 'LOGEVENTO.EQUIPAMENTO'
    end
    object IBQConsEventosSTATUS: TIBStringField
      FieldName = 'STATUS'
      Size = 4
    end
    object IBQConsEventosDESTATUS: TIBStringField
      FieldName = 'DESTATUS'
      Origin = 'LOGEVENTO.DESTATUS'
      Size = 70
    end
    object IBQConsEventosNMCLIENTE: TIBStringField
      FieldName = 'NMCLIENTE'
      Origin = 'LOGEVENTO.NMCLIENTE'
      Size = 60
    end
    object IBQConsEventosENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = 'LOGEVENTO.ENDERECO'
      Size = 60
    end
    object IBQConsEventosCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = 'LOGEVENTO.CIDADE'
      Size = 30
    end
    object IBQConsEventosDATAEVENTO: TDateTimeField
      FieldName = 'DATAEVENTO'
      Origin = 'LOGEVENTO.DATAEVENTO'
    end
  end
  object DSPEventos: TDataSetProvider
    DataSet = IBQConsEventos
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 688
    Top = 2
  end
  object CDSConsEventos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPEventos'
    Left = 720
    Top = 2
    object CDSConsEventosCTX: TIntegerField
      FieldName = 'CTX'
    end
    object CDSConsEventosPORTACOM: TIntegerField
      FieldName = 'PORTACOM'
    end
    object CDSConsEventosEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
    end
    object CDSConsEventosSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 4
    end
    object CDSConsEventosDESTATUS: TStringField
      FieldName = 'DESTATUS'
      Size = 70
    end
    object CDSConsEventosNMCLIENTE: TStringField
      FieldName = 'NMCLIENTE'
      Size = 60
    end
    object CDSConsEventosENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object CDSConsEventosCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object CDSConsEventosDATAEVENTO: TDateTimeField
      FieldName = 'DATAEVENTO'
    end
  end
  object DSEventos: TDataSource
    DataSet = CDSConsEventos
    Left = 752
    Top = 2
  end
  object TMRConsulta: TTimer
    Enabled = False
    OnTimer = TMRConsultaTimer
    Left = 784
    Top = 2
  end
end
