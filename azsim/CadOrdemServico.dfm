object FCadOrdemServico: TFCadOrdemServico
  Left = 723
  Top = 71
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'AZSIM'
  ClientHeight = 640
  ClientWidth = 523
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PMenu: TPanel
    Left = 0
    Top = 603
    Width = 523
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object BtnFechar: TSpeedButton
      Left = 473
      Top = 0
      Width = 49
      Height = 36
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAD6B2CE1A53CE7C690F3E1C4F9F1
        E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5CEBBB6
        B7BA975C1ADF9C1FCC891BCD8A1BCD8A1BD7A24AE6BF74E5CEB8FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFB36624121019804A09E39C20CB891CCD8A1CCD8A
        1CCC891CD6941CAC641DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC77C2D13
        111A864F09E49A21CD8A1DCF8B1DCF8B1DCE8A1DD8941BB4702BFFFFFFFFFFFF
        FFFFFFFEFEFF2121CBFFFFFFD7924114111B8A530BE69E22CE8C1FCF8D1FCF8D
        1FCE8C1FD6941DB77430FFFFFFFFFFFFFFFFFFFFFFFF1614D9242AF5AE6E4125
        1A008E530ED89220CF8C1FD08F23D08F22CF8E22D79620BB79343039E81D2AE8
        232CE8222EEB2430EF2032FF1B25F900002FAA6F06E4EAF1BC7418D69324D292
        27D29127D89925BF7E36616EF0152EF4223AF42137F42338F2273AEF213CFF2B
        3FFF895645FAD273D29A3DD6982ED39229D4932BDA9C2DC383396B7BF54565F7
        4A67F64E69F6425CF31F3CF25E7FFF1F28B9A46820F0BA4DDEAE56DFAF58DBA7
        49D59A36DB9F31C6893E5A61F0656FF1636DF16670F0495FF1638AFF8667B40D
        0300AA7628F2C46DE0B05DE0B25EE2B462E2B261E1AE4BCB8C3FFFFFFFFFFFFF
        FFFFFFFFFFFF3B40F05461FFEAA94F22180BA8793AF5CA77E2B768E3B869E3B8
        69E4B86AEAC377D2994DFFFFFFFFFFFFFFFFFFFBFBFF2222FFFFFFFFF7B64D1C
        1014B2803FF8D284E6BF73E7C074E7C074E7BF73ECCB80D69E53FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF6B2451D1212B98949FDD991EAC681EAC581EAC5
        81EAC581F0D08FD9A458FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7AC5C18
        0D0EC49957FFF2AFFFE09DFFE4A0F8DB9AF3D495F5DEA3DEAC5DFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFECB15C301F1B231F206E5A449E8663BBA77CDDC1
        8CF1D399FEEBBAE3B265FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAB968DC
        A851D09D4EC59447BA8A41B38239CF9A48DFAC54E9B964E4B360}
      Layout = blGlyphTop
      OnClick = BtnFecharClick
    end
    object TBOperacoes: TToolBar
      Left = 0
      Top = 0
      Width = 457
      Height = 41
      Align = alCustom
      ButtonHeight = 36
      ButtonWidth = 55
      Caption = 'TBOperacoes'
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Images = DModule.ILForm12
      ShowCaptions = True
      TabOrder = 0
      object BtnNovo: TToolButton
        Left = 0
        Top = 0
        Caption = '&Novo'
        ImageIndex = 0
        OnClick = BtnNovoClick
      end
      object BtnGravar: TToolButton
        Left = 55
        Top = 0
        Caption = '&Gravar'
        ImageIndex = 1
        OnClick = BtnGravarClick
      end
      object BtnEditar: TToolButton
        Left = 110
        Top = 0
        Caption = '&Editar'
        ImageIndex = 2
        OnClick = BtnEditarClick
      end
      object BtnCancelar: TToolButton
        Left = 165
        Top = 0
        Caption = 'C&ancelar'
        ImageIndex = 3
        OnClick = BtnCancelarClick
      end
      object BtnDeletar: TToolButton
        Left = 220
        Top = 0
        Caption = 'E&xcluir'
        ImageIndex = 4
        OnClick = BtnDeletarClick
      end
      object BtnConsultar: TToolButton
        Left = 275
        Top = 0
        Caption = 'Consultar'
        ImageIndex = 5
        OnClick = BtnConsultarClick
      end
      object BtnImprimir: TToolButton
        Left = 330
        Top = 0
        Caption = 'Imprimir'
        ImageIndex = 10
        OnClick = BtnImprimirClick
      end
    end
  end
  object Panel1: TPanel
    Left = 8
    Top = 40
    Width = 505
    Height = 553
    TabOrder = 1
    object Label2: TLabel
      Left = 19
      Top = 12
      Width = 62
      Height = 13
      Caption = 'N'#186' do Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 20
      Top = 52
      Width = 62
      Height = 13
      Caption = 'N'#186' do Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label19: TLabel
      Left = 19
      Top = 91
      Width = 134
      Height = 13
      Caption = 'Endere'#231'o de Monitoramento'
    end
    object Label18: TLabel
      Left = 330
      Top = 91
      Width = 27
      Height = 13
      Caption = 'Bairro'
    end
    object Label16: TLabel
      Left = 19
      Top = 131
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object Label20: TLabel
      Left = 338
      Top = 131
      Width = 14
      Height = 13
      Caption = 'UF'
    end
    object Label21: TLabel
      Left = 393
      Top = 131
      Width = 19
      Height = 13
      Caption = 'Cep'
    end
    object Label1: TLabel
      Left = 21
      Top = 168
      Width = 85
      Height = 13
      Caption = 'Ordem de Servi'#231'o'
    end
    object Label8: TLabel
      Left = 83
      Top = 12
      Width = 92
      Height = 13
      Caption = 'Data Hora Abertura'
    end
    object Label9: TLabel
      Left = 200
      Top = 13
      Width = 117
      Height = 13
      Caption = 'Operador(a) Abertura OS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object BtnLocalizarCliente: TSpeedButton
      Left = 452
      Top = 67
      Width = 23
      Height = 22
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
      Transparent = False
      OnClick = BtnLocalizarClienteClick
    end
    object Label10: TLabel
      Left = 20
      Top = 12
      Width = 30
      Height = 13
      Caption = 'N'#186' OS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 20
      Top = 298
      Width = 105
      Height = 13
      Caption = 'Observa'#231#245'es T'#233'cnico'
    end
    object GroupBox3: TGroupBox
      Left = 8
      Top = 418
      Width = 481
      Height = 111
      Caption = 'Dados de Encerramento'
      TabOrder = 13
      object Label7: TLabel
        Left = 10
        Top = 63
        Width = 88
        Height = 13
        Caption = 'Data Execu'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 109
        Top = 64
        Width = 32
        Height = 13
        Caption = 'Inicio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 163
        Top = 64
        Width = 46
        Height = 13
        Caption = 'T'#233'rmino'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label32: TLabel
        Left = 10
        Top = 22
        Width = 150
        Height = 13
        Caption = 'Operador(a) Encerramento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label33: TLabel
        Left = 210
        Top = 22
        Width = 124
        Height = 13
        Caption = 'T'#233'cnico Respons'#225'vel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object BtnEncerrar: TSpeedButton
        Left = 225
        Top = 77
        Width = 160
        Height = 22
        Caption = 'Encerrar ordem de servi'#231'o'
        Flat = True
        OnClick = BtnEncerrarClick
      end
      object EdtHoraInicio: TDBEdit
        Left = 107
        Top = 79
        Width = 53
        Height = 21
        Hint = 'Duplo clique para setar a hora atual'
        DataField = 'HORAINICIO'
        DataSource = DSOrdemServico
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
      end
      object EdtHoraFim: TDBEdit
        Left = 162
        Top = 79
        Width = 53
        Height = 21
        Hint = 'Duplo clique para setar a hora atual'
        DataField = 'HORAFIM'
        DataSource = DSOrdemServico
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
      end
      object EdtDataExecucao: TDBEdit
        Left = 9
        Top = 79
        Width = 96
        Height = 21
        DataField = 'DATAEXECUCAO'
        DataSource = DSOrdemServico
        TabOrder = 2
      end
      object CmbOperadorEncerramento: TDBLookupComboBox
        Left = 10
        Top = 37
        Width = 197
        Height = 21
        DataField = 'NMOPENCERRAMENTO'
        DataSource = DSOrdemServico
        TabOrder = 0
      end
      object CmbTecnico: TDBLookupComboBox
        Left = 209
        Top = 37
        Width = 199
        Height = 21
        DataField = 'NMTECNICO'
        DataSource = DSOrdemServico
        TabOrder = 1
      end
    end
    object EdtCodigoOS: TDBEdit
      Left = 17
      Top = 28
      Width = 63
      Height = 21
      TabStop = False
      DataField = 'CDORDEMSERVICO'
      DataSource = DSOrdemServico
      ReadOnly = True
      TabOrder = 0
    end
    object EdtCodCliente: TDBEdit
      Left = 18
      Top = 68
      Width = 63
      Height = 21
      DataField = 'CDCLIENTE'
      DataSource = DSOrdemServico
      TabOrder = 3
    end
    object EdtNomeCliente: TEdit
      Left = 84
      Top = 68
      Width = 365
      Height = 21
      ReadOnly = True
      TabOrder = 4
      OnEnter = EdtNomeClienteEnter
    end
    object EdtEnderecoMon: TEdit
      Left = 18
      Top = 107
      Width = 309
      Height = 21
      TabStop = False
      TabOrder = 5
    end
    object EdtBairroMon: TEdit
      Left = 330
      Top = 107
      Width = 145
      Height = 21
      TabStop = False
      TabOrder = 6
    end
    object EdtCidadeMon: TEdit
      Left = 18
      Top = 145
      Width = 309
      Height = 21
      TabStop = False
      TabOrder = 7
    end
    object EdtUfMon: TEdit
      Left = 330
      Top = 145
      Width = 58
      Height = 21
      TabStop = False
      TabOrder = 8
    end
    object EdtCepMon: TEdit
      Left = 391
      Top = 145
      Width = 84
      Height = 21
      TabStop = False
      TabOrder = 9
    end
    object EdtOrdemServico: TDBMemo
      Left = 18
      Top = 183
      Width = 457
      Height = 85
      DataField = 'DEORDEMSERVICO'
      DataSource = DSOrdemServico
      ScrollBars = ssVertical
      TabOrder = 10
    end
    object CkbRetrabalho: TDBCheckBox
      Left = 18
      Top = 274
      Width = 353
      Height = 17
      Caption = 
        'Marque se esta ordem de servi'#231'o pode ser considerada um retrabal' +
        'ho.'
      DataField = 'ISRETRABALHO'
      DataSource = DSOrdemServico
      TabOrder = 11
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object EdtDataAberturaOcorrencia: TDBEdit
      Left = 82
      Top = 28
      Width = 115
      Height = 21
      TabStop = False
      DataField = 'DATACADASTRO'
      DataSource = DSOrdemServico
      TabOrder = 1
    end
    object CmbOperadorAbertura: TDBLookupComboBox
      Left = 200
      Top = 28
      Width = 197
      Height = 21
      DataField = 'NMOPABERTURA'
      DataSource = DSOrdemServico
      TabOrder = 2
    end
    object EdtObservacoes: TDBMemo
      Left = 18
      Top = 316
      Width = 457
      Height = 85
      DataField = 'OBSERVACAO'
      DataSource = DSOrdemServico
      ScrollBars = ssVertical
      TabOrder = 12
    end
  end
  object pnlTituloForm: TPanel
    Left = 0
    Top = 0
    Width = 523
    Height = 30
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = ' Cadastro de ordens de servi'#231'o'
    Color = clPurple
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object IBTOperadorAbertura: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 208
    Top = 171
  end
  object IBQOperadorAbertura: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTOperadorAbertura
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT CDUSUARIO, LOGIN FROM USUARIO WHERE CDTIPOUSUARIO = 1 ORD' +
        'ER BY LOGIN')
    UniDirectional = True
    Left = 240
    Top = 171
    object IBQOperadorAberturaCDUSUARIO: TIntegerField
      FieldName = 'CDUSUARIO'
      Origin = 'USUARIO.CDUSUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQOperadorAberturaLOGIN: TIBStringField
      FieldName = 'LOGIN'
      Origin = 'USUARIO.LOGIN'
    end
  end
  object DSPOperadorAbertura: TDataSetProvider
    DataSet = IBQOperadorAbertura
    Constraints = True
    Left = 272
    Top = 171
  end
  object CDSOperadorAbertura: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPOperadorAbertura'
    Left = 304
    Top = 171
    object CDSOperadorAberturaCDUSUARIO: TIntegerField
      FieldName = 'CDUSUARIO'
      Origin = 'USUARIO.CDUSUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CDSOperadorAberturaLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = 'USUARIO.LOGIN'
    end
  end
  object IBTOperadorEncerramento: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 208
    Top = 203
  end
  object IBQOperadorEncerramento: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTOperadorEncerramento
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT CDUSUARIO, LOGIN FROM USUARIO WHERE CDTIPOUSUARIO = 1 ORD' +
        'ER BY LOGIN')
    UniDirectional = True
    Left = 240
    Top = 203
    object IntegerField9: TIntegerField
      FieldName = 'CDUSUARIO'
      Origin = 'USUARIO.CDUSUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQOperadorEncerramentoLOGIN: TIBStringField
      FieldName = 'LOGIN'
      Origin = 'USUARIO.LOGIN'
    end
  end
  object DSPOperadorEncerramento: TDataSetProvider
    DataSet = IBQOperadorEncerramento
    Constraints = True
    Left = 272
    Top = 203
  end
  object CDSOperadorEncerramento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPOperadorEncerramento'
    Left = 304
    Top = 203
    object IntegerField10: TIntegerField
      FieldName = 'CDUSUARIO'
      Origin = 'USUARIO.CDUSUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CDSOperadorEncerramentoLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = 'USUARIO.LOGIN'
    end
  end
  object IBTOrdemServico: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 207
    Top = 134
  end
  object IBQOrdemServico: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTOrdemServico
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT CDORDEMSERVICO, CDCLIENTE, DATACADASTRO, DATAENCERRAMENTO' +
        ', DEORDEMSERVICO, ISRETRABALHO, OBSERVACAO, ISORDEMENCERRADA, CD' +
        'OPERADORABERTURA, CDOPERADORENCERRAMENTO, CDTECNICO, DATAEXECUCA' +
        'O, HORAINICIO, HORAFIM, STATUS'
      'FROM ORDEMSERVICO WHERE CDORDEMSERVICO= -1;')
    UniDirectional = True
    Left = 240
    Top = 134
    object IBQOrdemServicoCDORDEMSERVICO: TIntegerField
      FieldName = 'CDORDEMSERVICO'
      Origin = 'ORDEMSERVICO.CDORDEMSERVICO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQOrdemServicoCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'ORDEMSERVICO.CDCLIENTE'
    end
    object IBQOrdemServicoISRETRABALHO: TIntegerField
      FieldName = 'ISRETRABALHO'
      Origin = 'ORDEMSERVICO.ISRETRABALHO'
    end
    object IBQOrdemServicoOBSERVACAO: TIBStringField
      FieldName = 'OBSERVACAO'
      Origin = 'ORDEMSERVICO.OBSERVACAO'
      Size = 800
    end
    object IBQOrdemServicoISORDEMENCERRADA: TIntegerField
      FieldName = 'ISORDEMENCERRADA'
      Origin = 'ORDEMSERVICO.ISORDEMENCERRADA'
    end
    object IBQOrdemServicoCDOPERADORABERTURA: TIntegerField
      FieldName = 'CDOPERADORABERTURA'
      Origin = 'ORDEMSERVICO.CDOPERADORABERTURA'
    end
    object IBQOrdemServicoCDOPERADORENCERRAMENTO: TIntegerField
      FieldName = 'CDOPERADORENCERRAMENTO'
      Origin = 'ORDEMSERVICO.CDOPERADORENCERRAMENTO'
    end
    object IBQOrdemServicoCDTECNICO: TIntegerField
      FieldName = 'CDTECNICO'
      Origin = 'ORDEMSERVICO.CDTECNICO'
    end
    object IBQOrdemServicoDATAEXECUCAO: TDateField
      FieldName = 'DATAEXECUCAO'
      Origin = 'ORDEMSERVICO.DATAEXECUCAO'
    end
    object IBQOrdemServicoHORAINICIO: TTimeField
      FieldName = 'HORAINICIO'
      Origin = 'ORDEMSERVICO.HORAINICIO'
    end
    object IBQOrdemServicoHORAFIM: TTimeField
      FieldName = 'HORAFIM'
      Origin = 'ORDEMSERVICO.HORAFIM'
    end
    object IBQOrdemServicoDATACADASTRO: TDateTimeField
      FieldName = 'DATACADASTRO'
      Origin = 'ORDEMSERVICO.DATACADASTRO'
    end
    object IBQOrdemServicoDATAENCERRAMENTO: TDateTimeField
      FieldName = 'DATAENCERRAMENTO'
      Origin = 'ORDEMSERVICO.DATAENCERRAMENTO'
    end
    object IBQOrdemServicoSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'ORDEMSERVICO.STATUS'
      Size = 10
    end
    object IBQOrdemServicoDEORDEMSERVICO: TIBStringField
      FieldName = 'DEORDEMSERVICO'
      Origin = 'ORDEMSERVICO.DEORDEMSERVICO'
      Size = 2000
    end
  end
  object DSPOrdemServico: TDataSetProvider
    DataSet = IBQOrdemServico
    Constraints = True
    Left = 273
    Top = 134
  end
  object DSOrdemServico: TDataSource
    DataSet = CDSOrdemServico
    Left = 336
    Top = 135
  end
  object CDSOrdemServico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPOrdemServico'
    BeforePost = CDSOrdemServicoBeforePost
    Left = 305
    Top = 135
    object CDSOrdemServicoCDORDEMSERVICO: TIntegerField
      FieldName = 'CDORDEMSERVICO'
      Origin = 'ORDEMSERVICO.CDORDEMSERVICO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CDSOrdemServicoCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'ORDEMSERVICO.CDCLIENTE'
      OnChange = CDSOrdemServicoCDCLIENTEChange
    end
    object CDSOrdemServicoISRETRABALHO: TIntegerField
      FieldName = 'ISRETRABALHO'
      Origin = 'ORDEMSERVICO.ISRETRABALHO'
    end
    object CDSOrdemServicoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'ORDEMSERVICO.OBSERVACAO'
      Size = 800
    end
    object CDSOrdemServicoISORDEMENCERRADA: TIntegerField
      FieldName = 'ISORDEMENCERRADA'
      Origin = 'ORDEMSERVICO.ISORDEMENCERRADA'
    end
    object CDSOrdemServicoCDOPERADORABERTURA: TIntegerField
      FieldName = 'CDOPERADORABERTURA'
      Origin = 'ORDEMSERVICO.CDOPERADORABERTURA'
    end
    object CDSOrdemServicoCDOPERADORENCERRAMENTO: TIntegerField
      FieldName = 'CDOPERADORENCERRAMENTO'
      Origin = 'ORDEMSERVICO.CDOPERADORENCERRAMENTO'
    end
    object CDSOrdemServicoCDTECNICO: TIntegerField
      FieldName = 'CDTECNICO'
      Origin = 'ORDEMSERVICO.CDTECNICO'
    end
    object CDSOrdemServicoDATAEXECUCAO: TDateField
      FieldName = 'DATAEXECUCAO'
      Origin = 'ORDEMSERVICO.DATAEXECUCAO'
      EditMask = '!99/99/0000;1;_'
    end
    object CDSOrdemServicoHORAINICIO: TTimeField
      FieldName = 'HORAINICIO'
      Origin = 'ORDEMSERVICO.HORAINICIO'
      EditMask = '!90:00;1;_'
    end
    object CDSOrdemServicoHORAFIM: TTimeField
      FieldName = 'HORAFIM'
      Origin = 'ORDEMSERVICO.HORAFIM'
      EditMask = '!90:00;1;_'
    end
    object CDSOrdemServicoNMOPABERTURA: TStringField
      FieldKind = fkLookup
      FieldName = 'NMOPABERTURA'
      LookupDataSet = CDSOperadorAbertura
      LookupKeyFields = 'CDUSUARIO'
      LookupResultField = 'LOGIN'
      KeyFields = 'CDOPERADORABERTURA'
      Lookup = True
    end
    object CDSOrdemServicoNMOPENCERRAMENTO: TStringField
      FieldKind = fkLookup
      FieldName = 'NMOPENCERRAMENTO'
      LookupDataSet = CDSOperadorEncerramento
      LookupKeyFields = 'CDUSUARIO'
      LookupResultField = 'LOGIN'
      KeyFields = 'CDOPERADORENCERRAMENTO'
      Lookup = True
    end
    object CDSOrdemServicoNMTECNICO: TStringField
      FieldKind = fkLookup
      FieldName = 'NMTECNICO'
      LookupDataSet = CDSTecnico
      LookupKeyFields = 'CDUSUARIO'
      LookupResultField = 'LOGIN'
      KeyFields = 'CDTECNICO'
      Lookup = True
    end
    object CDSOrdemServicoDATACADASTRO: TDateTimeField
      FieldName = 'DATACADASTRO'
      Origin = 'ORDEMSERVICO.DATACADASTRO'
    end
    object CDSOrdemServicoDATAENCERRAMENTO: TDateTimeField
      FieldName = 'DATAENCERRAMENTO'
    end
    object CDSOrdemServicoSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 10
    end
    object CDSOrdemServicoDEORDEMSERVICO: TStringField
      FieldName = 'DEORDEMSERVICO'
      Size = 2000
    end
  end
  object IBTTecnico: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 208
    Top = 235
  end
  object IBQTecnico: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTTecnico
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT CDUSUARIO, LOGIN FROM USUARIO WHERE CDTIPOUSUARIO = 3 ORD' +
        'ER BY LOGIN')
    UniDirectional = True
    Left = 240
    Top = 235
    object IntegerField1: TIntegerField
      FieldName = 'CDUSUARIO'
      Origin = 'USUARIO.CDUSUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBStringField1: TIBStringField
      FieldName = 'LOGIN'
      Origin = 'USUARIO.LOGIN'
    end
  end
  object DSPTecnico: TDataSetProvider
    DataSet = IBQTecnico
    Constraints = True
    Left = 272
    Top = 235
  end
  object CDSTecnico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPTecnico'
    Left = 304
    Top = 235
    object IntegerField2: TIntegerField
      FieldName = 'CDUSUARIO'
      Origin = 'USUARIO.CDUSUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'LOGIN'
      Origin = 'USUARIO.LOGIN'
    end
  end
  object IBSPGenIdOrdemServico: TIBStoredProc
    Database = DModule.IBCONAzsim
    Transaction = IBTGenIdOrdemServico
    StoredProcName = 'SP_GEN_ORDEMSERVICO_ID'
    Left = 241
    Top = 102
  end
  object IBTGenIdOrdemServico: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 208
    Top = 102
  end
end
