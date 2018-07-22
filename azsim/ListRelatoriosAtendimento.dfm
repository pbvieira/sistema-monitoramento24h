object FListRelatoriosAtendimento: TFListRelatoriosAtendimento
  Left = 389
  Top = 205
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'AZSIM'
  ClientHeight = 296
  ClientWidth = 722
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object BtnFechar: TSpeedButton
    Left = 656
    Top = 257
    Width = 57
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
  object Panel1: TPanel
    Left = 8
    Top = 40
    Width = 708
    Height = 213
    TabOrder = 0
    object BtnOcorrencias: TSpeedButton
      Left = 456
      Top = 50
      Width = 240
      Height = 35
      Caption = 'Ocorr'#234'ncias atendidas'
      Transparent = False
      OnClick = BtnOcorrenciasClick
    end
    object BtnEventos: TSpeedButton
      Left = 456
      Top = 13
      Width = 240
      Height = 35
      Caption = 'Eventos recebidos'
      Transparent = False
      OnClick = BtnEventosClick
    end
    object GroupBox2: TGroupBox
      Left = 11
      Top = 8
      Width = 438
      Height = 62
      Caption = 'Selecione o Intervalo da Consulta'
      TabOrder = 0
      object Label10: TLabel
        Left = 106
        Top = 17
        Width = 48
        Height = 13
        Caption = 'Data Final'
      end
      object Label11: TLabel
        Left = 9
        Top = 17
        Width = 53
        Height = 13
        Caption = 'Data Inicial'
      end
      object Label1: TLabel
        Left = 208
        Top = 36
        Width = 190
        Height = 13
        Caption = 'Obrigat'#243'rio informar o intervalo de datas.'
      end
      object EdtDataFinalTotais: TDateTimePicker
        Left = 106
        Top = 32
        Width = 96
        Height = 21
        CalAlignment = dtaLeft
        Date = 42183.6729884259
        Format = 'dd/MM/yyyy'
        Time = 42183.6729884259
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 1
      end
      object EdtDataInicialTotais: TDateTimePicker
        Left = 9
        Top = 32
        Width = 96
        Height = 21
        CalAlignment = dtaLeft
        Date = 42183.6729884259
        Format = 'dd/MM/yyyy'
        Time = 42183.6729884259
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 0
      end
    end
    object GroupBox3: TGroupBox
      Left = 11
      Top = 72
      Width = 438
      Height = 62
      Caption = ' Cliente ou Codificador '
      TabOrder = 1
      object Label12: TLabel
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
      object Label13: TLabel
        Left = 361
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
      object Label14: TLabel
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
      object EdtCodClienteTotais: TEdit
        Left = 12
        Top = 32
        Width = 70
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
      end
      object EdtNomeTotais: TEdit
        Left = 84
        Top = 32
        Width = 274
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 1
      end
      object EdtCodificadorTotais: TEdit
        Left = 360
        Top = 32
        Width = 70
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 2
      end
    end
    object GroupBox4: TGroupBox
      Left = 11
      Top = 136
      Width = 438
      Height = 62
      Caption = ' Estatus ou Descri'#231#227'o'
      TabOrder = 2
      object Label15: TLabel
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
      object Label16: TLabel
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
      object EdtStatusTotais: TEdit
        Left = 12
        Top = 33
        Width = 70
        Height = 21
        Hint = 'Exemplo: 0.0*'
        CharCase = ecUpperCase
        TabOrder = 0
      end
      object EdtStatusDescricaoTotais: TEdit
        Left = 84
        Top = 33
        Width = 346
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 1
      end
    end
  end
  object pnlTituloOcorrencias: TPanel
    Left = 0
    Top = 0
    Width = 722
    Height = 30
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = ' Relat'#243'rios'
    Color = clPurple
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object IBTRelAtendimento: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 26
    Top = 257
  end
  object IBQRelAtendimento: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTRelAtendimento
    BufferChunks = 1000
    CachedUpdates = False
    Left = 57
    Top = 256
  end
  object DSPRelAtendimento: TDataSetProvider
    DataSet = IBQRelAtendimento
    Constraints = True
    Left = 88
    Top = 257
  end
  object CDSRelAtendimento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPRelAtendimento'
    Left = 120
    Top = 256
  end
end
