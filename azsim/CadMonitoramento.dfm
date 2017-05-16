object FCadMonitoramento: TFCadMonitoramento
  Left = 811
  Top = 257
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Monitoramento'
  ClientHeight = 315
  ClientWidth = 522
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 12
    Top = 88
    Width = 270
    Height = 13
    Caption = 'Informe os hor'#225'rios em que o alarme dever'#225' estar armado'
  end
  object BtnCadExcecao: TSpeedButton
    Left = 9
    Top = 110
    Width = 128
    Height = 22
    Caption = 'Cadastrar Exce'#231#227'o ...'
    Flat = True
    Visible = False
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 505
    Height = 73
    Caption = 'Selecione o Cliente'
    TabOrder = 0
    object Label6: TLabel
      Left = 11
      Top = 22
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
    object EdtNomeCliente: TEdit
      Left = 75
      Top = 38
      Width = 413
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object EdtCodCliente: TEdit
      Left = 9
      Top = 38
      Width = 64
      Height = 21
      TabOrder = 0
      OnKeyUp = EdtCodClienteKeyUp
    end
  end
  object PCDiasSemana: TPageControl
    Left = 8
    Top = 144
    Width = 513
    Height = 121
    ActivePage = TabSheet7
    Style = tsFlatButtons
    TabIndex = 6
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Segunda'
      object Label3: TLabel
        Left = 32
        Top = 8
        Width = 89
        Height = 13
        Caption = 'Intervalo de hora 1'
      end
      object Label5: TLabel
        Left = 70
        Top = 28
        Width = 15
        Height = 13
        Caption = 'at'#233
      end
      object Label7: TLabel
        Left = 214
        Top = 28
        Width = 15
        Height = 13
        Caption = 'at'#233
      end
      object Label8: TLabel
        Left = 176
        Top = 8
        Width = 89
        Height = 13
        Caption = 'Intervalo de hora 2'
      end
      object Label9: TLabel
        Left = 357
        Top = 28
        Width = 15
        Height = 13
        Caption = 'at'#233
      end
      object Label10: TLabel
        Left = 319
        Top = 8
        Width = 89
        Height = 13
        Caption = 'Intervalo de hora 3'
      end
      object BtnCancelarSegunda: TSpeedButton
        Left = 289
        Top = 57
        Width = 137
        Height = 22
        Caption = 'Cancelar Monitoramento'
        Flat = True
        OnClick = BtnCancelarSegundaClick
      end
      object EdtHIni1Segunda: TMaskEdit
        Left = 16
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 0
        Text = '  :  '
      end
      object EdtHFim1Segunda: TMaskEdit
        Left = 90
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 1
        Text = '  :  '
      end
      object EdtHIni2Segunda: TMaskEdit
        Left = 160
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 2
        Text = '  :  '
      end
      object EdtHFim2Segunda: TMaskEdit
        Left = 234
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 3
        Text = '  :  '
      end
      object EdtHIni3Segunda: TMaskEdit
        Left = 303
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 4
        Text = '  :  '
      end
      object EdtHFim3Segunda: TMaskEdit
        Left = 377
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 5
        Text = '  :  '
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Ter'#231'a'
      ImageIndex = 1
      object Label11: TLabel
        Left = 32
        Top = 8
        Width = 89
        Height = 13
        Caption = 'Intervalo de hora 1'
      end
      object Label12: TLabel
        Left = 70
        Top = 28
        Width = 15
        Height = 13
        Caption = 'at'#233
      end
      object Label13: TLabel
        Left = 214
        Top = 28
        Width = 15
        Height = 13
        Caption = 'at'#233
      end
      object Label14: TLabel
        Left = 176
        Top = 8
        Width = 89
        Height = 13
        Caption = 'Intervalo de hora 2'
      end
      object Label15: TLabel
        Left = 357
        Top = 28
        Width = 15
        Height = 13
        Caption = 'at'#233
      end
      object Label16: TLabel
        Left = 319
        Top = 8
        Width = 89
        Height = 13
        Caption = 'Intervalo de hora 3'
      end
      object BtnCancelarTerca: TSpeedButton
        Left = 289
        Top = 57
        Width = 137
        Height = 22
        Caption = 'Cancelar Monitoramento'
        Flat = True
        OnClick = BtnCancelarTercaClick
      end
      object EdtHIni1Terca: TMaskEdit
        Left = 16
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 0
        Text = '  :  '
      end
      object EdtHFim1Terca: TMaskEdit
        Left = 90
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 1
        Text = '  :  '
      end
      object EdtHIni2Terca: TMaskEdit
        Left = 160
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 2
        Text = '  :  '
      end
      object EdtHFim2Terca: TMaskEdit
        Left = 234
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 3
        Text = '  :  '
      end
      object EdtHIni3Terca: TMaskEdit
        Left = 303
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 4
        Text = '  :  '
      end
      object EdtHFim3Terca: TMaskEdit
        Left = 377
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 5
        Text = '  :  '
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Quarta'
      ImageIndex = 2
      object Label17: TLabel
        Left = 32
        Top = 8
        Width = 89
        Height = 13
        Caption = 'Intervalo de hora 1'
      end
      object Label18: TLabel
        Left = 70
        Top = 28
        Width = 15
        Height = 13
        Caption = 'at'#233
      end
      object Label19: TLabel
        Left = 214
        Top = 28
        Width = 15
        Height = 13
        Caption = 'at'#233
      end
      object Label20: TLabel
        Left = 176
        Top = 8
        Width = 89
        Height = 13
        Caption = 'Intervalo de hora 2'
      end
      object Label21: TLabel
        Left = 357
        Top = 28
        Width = 15
        Height = 13
        Caption = 'at'#233
      end
      object Label22: TLabel
        Left = 319
        Top = 8
        Width = 89
        Height = 13
        Caption = 'Intervalo de hora 3'
      end
      object BtnCancelarQuarta: TSpeedButton
        Left = 289
        Top = 57
        Width = 137
        Height = 22
        Caption = 'Cancelar Monitoramento'
        Flat = True
        OnClick = BtnCancelarQuartaClick
      end
      object EdtHIni1Quarta: TMaskEdit
        Left = 16
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 0
        Text = '  :  '
      end
      object EdtHFim1Quarta: TMaskEdit
        Left = 90
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 1
        Text = '  :  '
      end
      object EdtHIni2Quarta: TMaskEdit
        Left = 160
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 2
        Text = '  :  '
      end
      object EdtHFim2Quarta: TMaskEdit
        Left = 234
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 3
        Text = '  :  '
      end
      object EdtHIni3Quarta: TMaskEdit
        Left = 303
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 4
        Text = '  :  '
      end
      object EdtHFim3Quarta: TMaskEdit
        Left = 377
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 5
        Text = '  :  '
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Quinta'
      ImageIndex = 3
      object Label23: TLabel
        Left = 32
        Top = 8
        Width = 89
        Height = 13
        Caption = 'Intervalo de hora 1'
      end
      object Label24: TLabel
        Left = 70
        Top = 28
        Width = 15
        Height = 13
        Caption = 'at'#233
      end
      object Label25: TLabel
        Left = 214
        Top = 28
        Width = 15
        Height = 13
        Caption = 'at'#233
      end
      object Label26: TLabel
        Left = 176
        Top = 8
        Width = 89
        Height = 13
        Caption = 'Intervalo de hora 2'
      end
      object Label27: TLabel
        Left = 357
        Top = 28
        Width = 15
        Height = 13
        Caption = 'at'#233
      end
      object Label28: TLabel
        Left = 319
        Top = 8
        Width = 89
        Height = 13
        Caption = 'Intervalo de hora 3'
      end
      object BtnCancelarQuinta: TSpeedButton
        Left = 289
        Top = 57
        Width = 137
        Height = 22
        Caption = 'Cancelar Monitoramento'
        Flat = True
        OnClick = BtnCancelarQuintaClick
      end
      object EdtHIni1Quinta: TMaskEdit
        Left = 16
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 0
        Text = '  :  '
      end
      object EdtHFim1Quinta: TMaskEdit
        Left = 90
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 1
        Text = '  :  '
      end
      object EdtHIni2Quinta: TMaskEdit
        Left = 160
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 2
        Text = '  :  '
      end
      object EdtHFim2Quinta: TMaskEdit
        Left = 234
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 3
        Text = '  :  '
      end
      object EdtHIni3Quinta: TMaskEdit
        Left = 303
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 4
        Text = '  :  '
      end
      object EdtHFim3Quinta: TMaskEdit
        Left = 377
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 5
        Text = '  :  '
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Sexta'
      ImageIndex = 4
      object Label29: TLabel
        Left = 32
        Top = 8
        Width = 89
        Height = 13
        Caption = 'Intervalo de hora 1'
      end
      object Label30: TLabel
        Left = 70
        Top = 28
        Width = 15
        Height = 13
        Caption = 'at'#233
      end
      object Label31: TLabel
        Left = 214
        Top = 28
        Width = 15
        Height = 13
        Caption = 'at'#233
      end
      object Label32: TLabel
        Left = 176
        Top = 8
        Width = 89
        Height = 13
        Caption = 'Intervalo de hora 2'
      end
      object Label33: TLabel
        Left = 357
        Top = 28
        Width = 15
        Height = 13
        Caption = 'at'#233
      end
      object Label34: TLabel
        Left = 319
        Top = 8
        Width = 89
        Height = 13
        Caption = 'Intervalo de hora 3'
      end
      object BtnCancelarSexta: TSpeedButton
        Left = 289
        Top = 57
        Width = 137
        Height = 22
        Caption = 'Cancelar Monitoramento'
        Flat = True
        OnClick = BtnCancelarSextaClick
      end
      object EdtHIni1Sexta: TMaskEdit
        Left = 16
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 0
        Text = '  :  '
      end
      object EdtHFim1Sexta: TMaskEdit
        Left = 90
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 1
        Text = '  :  '
      end
      object EdtHIni2Sexta: TMaskEdit
        Left = 160
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 2
        Text = '  :  '
      end
      object EdtHFim2Sexta: TMaskEdit
        Left = 234
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 3
        Text = '  :  '
      end
      object EdtHIni3Sexta: TMaskEdit
        Left = 303
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 4
        Text = '  :  '
      end
      object EdtHFim3Sexta: TMaskEdit
        Left = 377
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 5
        Text = '  :  '
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'S'#225'bado'
      ImageIndex = 5
      object Label35: TLabel
        Left = 32
        Top = 8
        Width = 89
        Height = 13
        Caption = 'Intervalo de hora 1'
      end
      object Label36: TLabel
        Left = 70
        Top = 28
        Width = 15
        Height = 13
        Caption = 'at'#233
      end
      object Label37: TLabel
        Left = 214
        Top = 28
        Width = 15
        Height = 13
        Caption = 'at'#233
      end
      object Label38: TLabel
        Left = 176
        Top = 8
        Width = 89
        Height = 13
        Caption = 'Intervalo de hora 2'
      end
      object Label39: TLabel
        Left = 357
        Top = 28
        Width = 15
        Height = 13
        Caption = 'at'#233
      end
      object Label40: TLabel
        Left = 319
        Top = 8
        Width = 89
        Height = 13
        Caption = 'Intervalo de hora 3'
      end
      object BtnCancelarSabado: TSpeedButton
        Left = 289
        Top = 57
        Width = 137
        Height = 22
        Caption = 'Cancelar Monitoramento'
        Flat = True
        OnClick = BtnCancelarSabadoClick
      end
      object EdtHIni1Sabado: TMaskEdit
        Left = 16
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 0
        Text = '  :  '
      end
      object EdtHFim1Sabado: TMaskEdit
        Left = 90
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 1
        Text = '  :  '
      end
      object EdtHIni2Sabado: TMaskEdit
        Left = 160
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 2
        Text = '  :  '
      end
      object EdtHFim2Sabado: TMaskEdit
        Left = 234
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 3
        Text = '  :  '
      end
      object EdtHIni3Sabado: TMaskEdit
        Left = 303
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 4
        Text = '  :  '
      end
      object EdtHFim3Sabado: TMaskEdit
        Left = 377
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 5
        Text = '  :  '
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'Domingo'
      ImageIndex = 6
      object Label41: TLabel
        Left = 32
        Top = 8
        Width = 89
        Height = 13
        Caption = 'Intervalo de hora 1'
      end
      object Label42: TLabel
        Left = 70
        Top = 28
        Width = 15
        Height = 13
        Caption = 'at'#233
      end
      object Label43: TLabel
        Left = 214
        Top = 28
        Width = 15
        Height = 13
        Caption = 'at'#233
      end
      object Label44: TLabel
        Left = 176
        Top = 8
        Width = 89
        Height = 13
        Caption = 'Intervalo de hora 2'
      end
      object Label45: TLabel
        Left = 357
        Top = 28
        Width = 15
        Height = 13
        Caption = 'at'#233
      end
      object Label46: TLabel
        Left = 319
        Top = 8
        Width = 89
        Height = 13
        Caption = 'Intervalo de hora 3'
      end
      object BtnCancelarDomingo: TSpeedButton
        Left = 289
        Top = 57
        Width = 137
        Height = 22
        Caption = 'Cancelar Monitoramento'
        Flat = True
        OnClick = BtnCancelarDomingoClick
      end
      object EdtHIni1Domingo: TMaskEdit
        Left = 16
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 0
        Text = '  :  '
      end
      object EdtHFim1Domingo: TMaskEdit
        Left = 90
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 1
        Text = '  :  '
      end
      object EdtHIni2Domingo: TMaskEdit
        Left = 160
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 2
        Text = '  :  '
      end
      object EdtHFim2Domingo: TMaskEdit
        Left = 234
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 3
        Text = '  :  '
      end
      object EdtHIni3Domingo: TMaskEdit
        Left = 303
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 4
        Text = '  :  '
      end
      object EdtHFim3Domingo: TMaskEdit
        Left = 377
        Top = 24
        Width = 46
        Height = 21
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 5
        Text = '  :  '
      end
    end
  end
  object PMenu: TPanel
    Left = 0
    Top = 276
    Width = 522
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object POperacoes: TPanel
      Left = 0
      Top = 0
      Width = 337
      Height = 39
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object TBOperacoes: TToolBar
        Left = 0
        Top = 0
        Width = 337
        Height = 37
        ButtonHeight = 36
        ButtonWidth = 56
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
          Left = 56
          Top = 0
          Caption = '&Gravar'
          ImageIndex = 1
          OnClick = BtnGravarClick
        end
        object BtnEditar: TToolButton
          Left = 112
          Top = 0
          Caption = '&Editar'
          ImageIndex = 2
        end
        object BtnCancelar: TToolButton
          Left = 168
          Top = 0
          Caption = 'C&ancelar'
          ImageIndex = 3
          OnClick = BtnCancelarClick
        end
        object BtnDeletar: TToolButton
          Left = 224
          Top = 0
          Caption = 'E&xcluir'
          ImageIndex = 4
          OnClick = BtnDeletarClick
        end
        object BtnPesquisa: TToolButton
          Left = 280
          Top = 0
          Caption = '&Pesquisa'
          ImageIndex = 5
          OnClick = BtnPesquisaClick
        end
      end
    end
    object PFechar: TPanel
      Left = 465
      Top = 0
      Width = 57
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      object BtnFechar: TSpeedButton
        Left = 8
        Top = 1
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
    end
  end
  object CkbMonitorAtivo: TCheckBox
    Left = 368
    Top = 88
    Width = 121
    Height = 17
    Caption = 'Monitoramento Ativo'
    TabOrder = 3
  end
end
