object FOcorrencia: TFOcorrencia
  Left = 254
  Top = 104
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Atendimento'
  ClientHeight = 709
  ClientWidth = 974
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTituloForm: TPanel
    Left = 0
    Top = 0
    Width = 974
    Height = 30
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = ' Registro da ocorr'#234'ncia'
    Color = 11367990
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 4
    Top = 33
    Width = 501
    Height = 509
    TabOrder = 1
    object Label8: TLabel
      Left = 7
      Top = 7
      Width = 51
      Height = 13
      Caption = 'Origem OC'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 46
      Width = 30
      Height = 13
      Caption = 'Status'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 48
      Top = 46
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 8
      Top = 82
      Width = 25
      Height = 13
      Caption = 'Setor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 48
      Top = 82
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 7
      Top = 120
      Width = 127
      Height = 13
      Caption = '*Nome / Raz'#227'o Social'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 7
      Top = 159
      Width = 46
      Height = 13
      Caption = 'Endere'#231'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 314
      Top = 198
      Width = 27
      Height = 13
      Caption = 'Bairro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 7
      Top = 198
      Width = 33
      Height = 13
      Caption = 'Cidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label20: TLabel
      Left = 8
      Top = 235
      Width = 98
      Height = 13
      Caption = 'Ponto de Refer'#234'ncia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label17: TLabel
      Left = 148
      Top = 7
      Width = 89
      Height = 13
      Caption = '*Data Hora OC.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 79
      Top = 7
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
    object Label7: TLabel
      Left = 266
      Top = 7
      Width = 138
      Height = 13
      Caption = '*Data Hora Atendimento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 431
      Top = 7
      Width = 31
      Height = 13
      Caption = 'Chave'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 8
      Top = 272
      Width = 36
      Height = 13
      Caption = 'Fone(1)'
      FocusControl = EdtFone1
    end
    object Label34: TLabel
      Left = 8
      Top = 310
      Width = 36
      Height = 13
      Caption = 'Fone(2)'
      FocusControl = EdtFone2
    end
    object Label35: TLabel
      Left = 8
      Top = 346
      Width = 36
      Height = 13
      Caption = 'Fone(3)'
      FocusControl = EdtFone3
    end
    object Label36: TLabel
      Left = 96
      Top = 272
      Width = 73
      Height = 13
      Caption = 'Observa'#231#227'o (1)'
      FocusControl = EdtFone1Obs
    end
    object Label37: TLabel
      Left = 96
      Top = 310
      Width = 73
      Height = 13
      Caption = 'Observa'#231#227'o (2)'
      FocusControl = EdtFone2Obs
    end
    object Label38: TLabel
      Left = 96
      Top = 346
      Width = 73
      Height = 13
      Caption = 'Observa'#231#227'o (3)'
      FocusControl = EdtFone3Obs
    end
    object Label39: TLabel
      Left = 249
      Top = 272
      Width = 36
      Height = 13
      Caption = 'Fone(4)'
      FocusControl = EdtFone4
    end
    object Label40: TLabel
      Left = 249
      Top = 310
      Width = 36
      Height = 13
      Caption = 'Fone(5)'
      FocusControl = EdtFone5
    end
    object Label41: TLabel
      Left = 249
      Top = 346
      Width = 36
      Height = 13
      Caption = 'Fone(6)'
      FocusControl = EdtFone6
    end
    object Label42: TLabel
      Left = 337
      Top = 272
      Width = 73
      Height = 13
      Caption = 'Observa'#231#227'o (4)'
      FocusControl = EdtFone4Obs
    end
    object Label43: TLabel
      Left = 337
      Top = 310
      Width = 73
      Height = 13
      Caption = 'Observa'#231#227'o (5)'
      FocusControl = EdtFone5Obs
    end
    object Label44: TLabel
      Left = 337
      Top = 346
      Width = 73
      Height = 13
      Caption = 'Observa'#231#227'o (6)'
      FocusControl = EdtFone6Obs
    end
    object BtnLocalizarCliente: TSpeedButton
      Left = 465
      Top = 135
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
      Visible = False
      OnClick = BtnLocalizarClienteClick
    end
    object Label46: TLabel
      Left = 10
      Top = 421
      Width = 201
      Height = 13
      Caption = 'Observa'#231#245'es do Cliente dados de Viagens'
      FocusControl = EdtFone3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label47: TLabel
      Left = 8
      Top = 382
      Width = 36
      Height = 13
      Caption = 'Fone(7)'
      FocusControl = EdtFone3
    end
    object Label48: TLabel
      Left = 96
      Top = 382
      Width = 73
      Height = 13
      Caption = 'Observa'#231#227'o (7)'
      FocusControl = EdtFone3Obs
    end
    object Label49: TLabel
      Left = 249
      Top = 382
      Width = 36
      Height = 13
      Caption = 'Fone(8)'
      FocusControl = EdtFone6
    end
    object Label50: TLabel
      Left = 337
      Top = 382
      Width = 73
      Height = 13
      Caption = 'Observa'#231#227'o (8)'
      FocusControl = EdtFone6Obs
    end
    object Label51: TLabel
      Left = 240
      Top = 120
      Width = 71
      Height = 13
      Caption = 'Nome Fantasia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object EdtStatus: TDBEdit
      Left = 7
      Top = 60
      Width = 40
      Height = 21
      TabStop = False
      Color = 14155775
      DataField = 'STATUS'
      DataSource = fdmOcorrencia.DSOcorrencia
      TabOrder = 0
    end
    object EdtDescricaoStatus: TDBEdit
      Left = 49
      Top = 60
      Width = 438
      Height = 21
      TabStop = False
      Color = 14155775
      DataField = 'DESTATUS'
      DataSource = fdmOcorrencia.DSOcorrencia
      TabOrder = 1
    end
    object EdtSetor: TDBEdit
      Left = 7
      Top = 96
      Width = 40
      Height = 21
      TabStop = False
      Color = 14155775
      DataField = 'NUMSETOR'
      DataSource = fdmOcorrencia.DSOcorrencia
      TabOrder = 2
    end
    object EdtLocalSetor: TDBEdit
      Left = 49
      Top = 96
      Width = 438
      Height = 21
      TabStop = False
      Color = 14155775
      DataField = 'LOCAL'
      DataSource = fdmOcorrencia.DSOcorrencia
      TabOrder = 3
    end
    object EdtNmCliente: TDBEdit
      Left = 7
      Top = 136
      Width = 230
      Height = 21
      TabStop = False
      Color = 14155775
      DataField = 'NMCLIENTE'
      DataSource = fdmOcorrencia.DSCliente
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object EdtEndereco: TDBEdit
      Left = 7
      Top = 175
      Width = 480
      Height = 21
      TabStop = False
      Color = 14155775
      DataField = 'ENDERECO'
      DataSource = fdmOcorrencia.DSCliente
      TabOrder = 5
    end
    object EdtBairro: TDBEdit
      Left = 315
      Top = 214
      Width = 172
      Height = 21
      TabStop = False
      Color = 14155775
      DataField = 'BAIRRO'
      DataSource = fdmOcorrencia.DSCliente
      TabOrder = 6
    end
    object EdtCidade: TDBEdit
      Left = 7
      Top = 214
      Width = 305
      Height = 21
      TabStop = False
      Color = 14155775
      DataField = 'CIDADE'
      DataSource = fdmOcorrencia.DSCliente
      TabOrder = 7
    end
    object EdtPontoRef: TDBEdit
      Left = 8
      Top = 250
      Width = 479
      Height = 21
      TabStop = False
      Color = 14155775
      DataField = 'PONTOREF'
      DataSource = fdmOcorrencia.DSCliente
      TabOrder = 8
    end
    object EdtDataEvento: TDBEdit
      Left = 148
      Top = 23
      Width = 115
      Height = 21
      Hint = 'Duplo clique para setar a data e hora atual'
      Color = 14155775
      DataField = 'DATAEVENTO'
      DataSource = fdmOcorrencia.DSOcorrencia
      TabOrder = 9
      OnDblClick = EdtDataEventoDblClick
    end
    object EdtTipoCtx: TDBEdit
      Left = 7
      Top = 23
      Width = 29
      Height = 21
      TabStop = False
      Color = 14155775
      DataField = 'TIPOCTX'
      DataSource = fdmOcorrencia.DSOcorrencia
      TabOrder = 10
    end
    object EdtCodificador: TDBEdit
      Left = 79
      Top = 23
      Width = 67
      Height = 21
      TabStop = False
      Color = 14155775
      DataField = 'EQUIPAMENTO'
      DataSource = fdmOcorrencia.DSOcorrencia
      TabOrder = 11
    end
    object EdtCtx: TDBEdit
      Left = 38
      Top = 23
      Width = 39
      Height = 21
      TabStop = False
      Color = 14155775
      DataField = 'CTX'
      DataSource = fdmOcorrencia.DSOcorrencia
      TabOrder = 12
    end
    object EdtDataAberturaOcorrencia: TDBEdit
      Left = 265
      Top = 23
      Width = 115
      Height = 21
      Hint = 'Duplo clique para setar a data e hora atual'
      Color = 14155775
      DataField = 'DATAATENDIMENTO'
      DataSource = fdmOcorrencia.DSOcorrencia
      TabOrder = 13
      OnDblClick = EdtDataAberturaOcorrenciaDblClick
    end
    object EdtChave: TDBEdit
      Left = 382
      Top = 23
      Width = 105
      Height = 21
      TabStop = False
      Color = 14155775
      DataField = 'CHAVE'
      DataSource = fdmOcorrencia.DSOcorrencia
      TabOrder = 14
    end
    object EdtFone1: TDBEdit
      Left = 8
      Top = 288
      Width = 85
      Height = 21
      TabStop = False
      Color = 14155775
      DataField = 'FONE1'
      DataSource = fdmOcorrencia.DSCliente
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 15
    end
    object EdtFone2: TDBEdit
      Left = 8
      Top = 325
      Width = 85
      Height = 21
      TabStop = False
      Color = 14155775
      DataField = 'FONE2'
      DataSource = fdmOcorrencia.DSCliente
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 16
    end
    object EdtFone3: TDBEdit
      Left = 8
      Top = 361
      Width = 85
      Height = 21
      TabStop = False
      Color = 14155775
      DataField = 'FONE3'
      DataSource = fdmOcorrencia.DSCliente
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 17
    end
    object EdtFone1Obs: TDBEdit
      Left = 96
      Top = 288
      Width = 150
      Height = 21
      TabStop = False
      Color = 14155775
      DataField = 'FONEOBS1'
      DataSource = fdmOcorrencia.DSCliente
      TabOrder = 18
    end
    object EdtFone2Obs: TDBEdit
      Left = 96
      Top = 325
      Width = 150
      Height = 21
      TabStop = False
      Color = 14155775
      DataField = 'FONEOBS2'
      DataSource = fdmOcorrencia.DSCliente
      TabOrder = 19
    end
    object EdtFone3Obs: TDBEdit
      Left = 96
      Top = 361
      Width = 150
      Height = 21
      TabStop = False
      Color = 14155775
      DataField = 'FONEOBS3'
      DataSource = fdmOcorrencia.DSCliente
      TabOrder = 20
    end
    object EdtFone4: TDBEdit
      Left = 249
      Top = 288
      Width = 85
      Height = 21
      TabStop = False
      Color = 14155775
      DataField = 'FONE4'
      DataSource = fdmOcorrencia.DSCliente
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 21
    end
    object EdtFone5: TDBEdit
      Left = 249
      Top = 325
      Width = 85
      Height = 21
      TabStop = False
      Color = 14155775
      DataField = 'FONE5'
      DataSource = fdmOcorrencia.DSCliente
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 22
    end
    object EdtFone6: TDBEdit
      Left = 249
      Top = 361
      Width = 85
      Height = 21
      TabStop = False
      Color = 14155775
      DataField = 'FONE6'
      DataSource = fdmOcorrencia.DSCliente
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 23
    end
    object EdtFone4Obs: TDBEdit
      Left = 337
      Top = 288
      Width = 150
      Height = 21
      TabStop = False
      Color = 14155775
      DataField = 'FONEOBS4'
      DataSource = fdmOcorrencia.DSCliente
      TabOrder = 24
    end
    object EdtFone5Obs: TDBEdit
      Left = 337
      Top = 325
      Width = 150
      Height = 21
      TabStop = False
      Color = 14155775
      DataField = 'FONEOBS5'
      DataSource = fdmOcorrencia.DSCliente
      TabOrder = 25
    end
    object EdtFone6Obs: TDBEdit
      Left = 337
      Top = 361
      Width = 150
      Height = 21
      TabStop = False
      Color = 14155775
      DataField = 'FONEOBS6'
      DataSource = fdmOcorrencia.DSCliente
      TabOrder = 26
    end
    object EdtObs: TDBMemo
      Left = 8
      Top = 437
      Width = 481
      Height = 67
      TabStop = False
      BevelKind = bkSoft
      BorderStyle = bsNone
      Color = 14155775
      DataField = 'OBSERVACAO'
      DataSource = fdmOcorrencia.DSCliente
      ScrollBars = ssVertical
      TabOrder = 27
    end
    object EdtFone7: TDBEdit
      Left = 8
      Top = 397
      Width = 85
      Height = 21
      TabStop = False
      Color = 14155775
      DataField = 'FONE7'
      DataSource = fdmOcorrencia.DSCliente
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 28
    end
    object EdtFone7Obs: TDBEdit
      Left = 96
      Top = 397
      Width = 150
      Height = 21
      TabStop = False
      Color = 14155775
      DataField = 'FONEOBS7'
      DataSource = fdmOcorrencia.DSCliente
      TabOrder = 29
    end
    object EdtFone8: TDBEdit
      Left = 249
      Top = 397
      Width = 85
      Height = 21
      TabStop = False
      Color = 14155775
      DataField = 'FONE8'
      DataSource = fdmOcorrencia.DSCliente
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 30
    end
    object EdtFone8Obs: TDBEdit
      Left = 337
      Top = 397
      Width = 150
      Height = 21
      TabStop = False
      Color = 14155775
      DataField = 'FONEOBS8'
      DataSource = fdmOcorrencia.DSCliente
      TabOrder = 31
    end
    object EdtNomeFantasia: TDBEdit
      Left = 240
      Top = 136
      Width = 220
      Height = 21
      TabStop = False
      Color = 14155775
      DataField = 'NMFANTASIA'
      DataSource = fdmOcorrencia.DSCliente
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 32
    end
  end
  object Panel3: TPanel
    Left = 507
    Top = 33
    Width = 462
    Height = 509
    TabOrder = 2
    object Label13: TLabel
      Left = 11
      Top = 129
      Width = 70
      Height = 13
      Caption = 'H. Sa'#237'da Emp.'
    end
    object Label14: TLabel
      Left = 11
      Top = 153
      Width = 72
      Height = 13
      Caption = 'H. Sa'#237'da Local'
    end
    object Label16: TLabel
      Left = 11
      Top = 177
      Width = 72
      Height = 13
      Caption = 'H. Abert. Lacre'
    end
    object Label18: TLabel
      Left = 11
      Top = 202
      Width = 62
      Height = 13
      Caption = 'Km de Sa'#237'da'
    end
    object Label19: TLabel
      Left = 144
      Top = 129
      Width = 86
      Height = 13
      Caption = 'H. Chegada Local'
    end
    object Label21: TLabel
      Left = 144
      Top = 153
      Width = 81
      Height = 13
      Caption = 'H. Chegada Emp'
    end
    object Label22: TLabel
      Left = 144
      Top = 177
      Width = 27
      Height = 13
      Caption = 'Lacre'
    end
    object Label23: TLabel
      Left = 144
      Top = 202
      Width = 71
      Height = 13
      Caption = 'Km de Retorno'
    end
    object Label24: TLabel
      Left = 290
      Top = 129
      Width = 104
      Height = 13
      Caption = 'Tempo Deslocamento'
    end
    object Label25: TLabel
      Left = 290
      Top = 153
      Width = 89
      Height = 13
      Caption = 'Tempo de Retorno'
    end
    object Label26: TLabel
      Left = 290
      Top = 177
      Width = 94
      Height = 13
      Caption = 'Tempo atendimento'
    end
    object Label27: TLabel
      Left = 290
      Top = 202
      Width = 93
      Height = 13
      Caption = 'Km Total Percorrido'
    end
    object Label28: TLabel
      Left = 10
      Top = 217
      Width = 51
      Height = 13
      Caption = '*Resumo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label29: TLabel
      Left = 11
      Top = 279
      Width = 70
      Height = 13
      Caption = 'Procedimentos'
    end
    object Label31: TLabel
      Left = 11
      Top = 426
      Width = 88
      Height = 13
      Caption = 'Ocorr'#234'ncia Policial'
    end
    object Label30: TLabel
      Left = 10
      Top = 6
      Width = 115
      Height = 13
      Caption = '*Tipo de Ocorr'#234'ncia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label32: TLabel
      Left = 10
      Top = 85
      Width = 73
      Height = 13
      Caption = '*Operador(a)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label33: TLabel
      Left = 209
      Top = 85
      Width = 34
      Height = 13
      Caption = 'Agente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label45: TLabel
      Left = 231
      Top = 6
      Width = 141
      Height = 13
      Caption = '*Sub-Tipo da Ocorr'#234'ncia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BtnOrdemServico: TSpeedButton
      Left = 9
      Top = 49
      Width = 442
      Height = 33
      Caption = 'Abrir ordem de servi'#231'o a partir desta ocorr'#234'ncia'
      Enabled = False
      Flat = True
      Glyph.Data = {
        C6040000424DC60400000000000036040000280000000C0000000C0000000100
        080000000000900000000000000000000000000100000000000004BEF30003BF
        F40014A9DD002495C70009B7EC000EB1E5001F9BCD0060DFFC0006BDF20008BA
        EF00C8FCFF0000C3F8000EC7F90079EEFD0001C2F70062DFFC00AEF5FF001BCB
        F9001CCDF9003FD5FB0045DBFB008AEBFD001AA2D500288FC100FFFFFF000000
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
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000171717171717
        1717171717170312121212121212121212030614141414141414141414061616
        161616160D0D0D0D0D16020C0C0C0C0C16161616160205111111111111111111
        1105041313131313131313131304090F0F0F0F070F0F0F0F0F00081515151515
        1515151515000110101010101010101010010E0E0A0A0A0E0E0E0E0E0E0E1818
        0B0B0B0B181818181818}
      OnClick = BtnOrdemServicoClick
    end
    object EdtKmRetorno: TDBEdit
      Left = 234
      Top = 197
      Width = 52
      Height = 21
      Color = 14155775
      DataField = 'KMRETORNO'
      DataSource = fdmOcorrencia.DSOcorrencia
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
    end
    object EdtKmTotalPercorrido: TDBEdit
      Left = 396
      Top = 197
      Width = 53
      Height = 21
      Hint = 'Preenchimento autom'#225'tico ao preencher o resumo da ocorr'#234'ncia.'
      Color = 14155775
      DataField = 'KMTOTALPERCORRIDO'
      DataSource = fdmOcorrencia.DSOcorrencia
      ParentShowHint = False
      ShowHint = True
      TabOrder = 16
    end
    object EdtResumo: TDBMemo
      Left = 10
      Top = 231
      Width = 440
      Height = 47
      Color = 14155775
      DataField = 'RESUMO'
      DataSource = fdmOcorrencia.DSOcorrencia
      ScrollBars = ssVertical
      TabOrder = 17
      OnEnter = EdtResumoEnter
    end
    object EdtProcedimentos: TDBMemo
      Left = 10
      Top = 294
      Width = 440
      Height = 131
      Color = 14155775
      DataField = 'PROCEDIMENTOS'
      DataSource = fdmOcorrencia.DSProcedimeto
      ScrollBars = ssVertical
      TabOrder = 18
    end
    object EdtOcorrenciaPolicial: TDBMemo
      Left = 10
      Top = 441
      Width = 440
      Height = 57
      Color = 14155775
      DataField = 'OCORRENCIAPOLICIAL'
      DataSource = fdmOcorrencia.DSOcorrencia
      ScrollBars = ssVertical
      TabOrder = 19
      OnExit = EdtOcorrenciaPolicialExit
    end
    object CmbSubTipoOcorrencia: TDBLookupComboBox
      Left = 229
      Top = 23
      Width = 221
      Height = 21
      Color = 14155775
      DataField = 'DESUBTIPOOCORRENCIA'
      DataSource = fdmOcorrencia.DSOcorrencia
      TabOrder = 1
    end
    object CmbTipoOcorrencia: TDBLookupComboBox
      Left = 10
      Top = 23
      Width = 216
      Height = 21
      Color = 14155775
      DataField = 'DETIPOOCORRENCIA'
      DataSource = fdmOcorrencia.DSOcorrencia
      TabOrder = 0
      OnExit = CmbTipoOcorrenciaExit
    end
    object CmbOperadora: TDBLookupComboBox
      Left = 10
      Top = 100
      Width = 197
      Height = 21
      Color = 14155775
      DataField = 'NMOPERADORA'
      DataSource = fdmOcorrencia.DSOcorrencia
      TabOrder = 2
    end
    object CmbAgente: TDBLookupComboBox
      Left = 250
      Top = 100
      Width = 199
      Height = 21
      Color = 14155775
      DataField = 'NMAGENTE'
      DataSource = fdmOcorrencia.DSOcorrencia
      TabOrder = 4
    end
    object EdtCodAgente: TDBEdit
      Left = 209
      Top = 100
      Width = 39
      Height = 21
      Color = 14155775
      DataField = 'CDAGENTE'
      DataSource = fdmOcorrencia.DSOcorrencia
      TabOrder = 3
    end
    object EdtSaidaEmp: TMaskEdit
      Left = 86
      Top = 127
      Width = 52
      Height = 21
      Color = 14155775
      EditMask = '!90:00;1;_'
      MaxLength = 5
      TabOrder = 5
      Text = '  :  '
    end
    object EdtChegadaLocal: TMaskEdit
      Left = 234
      Top = 126
      Width = 52
      Height = 21
      Color = 14155775
      EditMask = '!90:00;1;_'
      MaxLength = 5
      TabOrder = 6
      Text = '  :  '
    end
    object EdtTempoDeslocamento: TMaskEdit
      Left = 396
      Top = 126
      Width = 52
      Height = 21
      Color = 14155775
      EditMask = '!90:00;1;_'
      MaxLength = 5
      TabOrder = 7
      Text = '  :  '
    end
    object EdtSaidaLocal: TMaskEdit
      Left = 86
      Top = 150
      Width = 52
      Height = 21
      Color = 14155775
      EditMask = '!90:00;1;_'
      MaxLength = 5
      TabOrder = 8
      Text = '  :  '
    end
    object EdtChegadaEmpresa: TMaskEdit
      Left = 234
      Top = 150
      Width = 52
      Height = 21
      Color = 14155775
      EditMask = '!90:00;1;_'
      MaxLength = 5
      TabOrder = 9
      Text = '  :  '
    end
    object EdtTempoRetorno: TMaskEdit
      Left = 396
      Top = 150
      Width = 52
      Height = 21
      Color = 14155775
      EditMask = '!90:00;1;_'
      MaxLength = 5
      TabOrder = 10
      Text = '  :  '
    end
    object EdtTempoAtendimento: TMaskEdit
      Left = 396
      Top = 174
      Width = 52
      Height = 21
      Color = 14155775
      EditMask = '!90:00;1;_'
      MaxLength = 5
      TabOrder = 13
      Text = '  :  '
    end
    object EdtLacre: TDBEdit
      Left = 234
      Top = 174
      Width = 52
      Height = 21
      Color = 14155775
      DataField = 'LACRE'
      DataSource = fdmOcorrencia.DSOcorrencia
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
    end
    object EdtKmSaida: TDBEdit
      Left = 86
      Top = 197
      Width = 53
      Height = 21
      Color = 14155775
      DataField = 'KMSAIDA'
      DataSource = fdmOcorrencia.DSOcorrencia
      ParentShowHint = False
      ShowHint = True
      TabOrder = 14
    end
    object EdtHoraLacre: TDBEdit
      Left = 86
      Top = 174
      Width = 52
      Height = 21
      Color = 14155775
      DataField = 'HORAABERTURALACRE'
      DataSource = fdmOcorrencia.DSOcorrencia
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
    end
  end
  object PCGrids: TPageControl
    Left = 3
    Top = 545
    Width = 966
    Height = 159
    ActivePage = TSSetores
    Style = tsFlatButtons
    TabIndex = 1
    TabOrder = 3
    TabStop = False
    object TSContatos: TTabSheet
      Caption = '&Usu'#225'rios'
      object DBGContatos: TDBGrid
        Left = 0
        Top = 0
        Width = 958
        Height = 128
        TabStop = False
        Align = alClient
        DataSource = fdmOcorrencia.DSContato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGContatosDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'NMCONTATO'
            Title.Caption = 'Nome'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATANASCIMENTO'
            Title.Caption = 'Data Nasc.'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SENHA'
            Title.Caption = 'Senha'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTRASENHA'
            Title.Caption = 'Contra-Senha'
            Width = 800
            Visible = True
          end>
      end
    end
    object TSSetores: TTabSheet
      Caption = '&Setores'
      ImageIndex = 2
      object DBGSetores: TDBGrid
        Left = 0
        Top = 0
        Width = 958
        Height = 128
        TabStop = False
        Align = alClient
        DataSource = fdmOcorrencia.DSSetores
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGSetoresDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'NUMSETOR'
            Title.Caption = 'Setor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LOCAL'
            Title.Caption = 'Localiza'#231#227'o'
            Width = 860
            Visible = True
          end>
      end
    end
    object tbCentral: TTabSheet
      Caption = 'Central'
      ImageIndex = 2
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 958
        Height = 128
        Align = alClient
        TabOrder = 0
        DesignSize = (
          958
          128)
        object GrpNomeSelecionado: TGroupBox
          Left = 11
          Top = 12
          Width = 936
          Height = 100
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          object TXTModeloCentral: TDBText
            Left = 83
            Top = 24
            Width = 777
            Height = 17
            DataField = 'MODELOCENTRAL'
            DataSource = fdmOcorrencia.DSSetores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TXTLocalInstalacao: TDBText
            Left = 147
            Top = 48
            Width = 713
            Height = 17
            DataField = 'LOCALINSTALCENTRAL'
            DataSource = fdmOcorrencia.DSSetores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label53: TLabel
            Left = 8
            Top = 24
            Width = 64
            Height = 20
            Caption = 'Central:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label54: TLabel
            Left = 8
            Top = 48
            Width = 136
            Height = 20
            Caption = 'Local instala'#231#227'o:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
    end
  end
end
