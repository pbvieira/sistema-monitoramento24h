object FCadCentral: TFCadCentral
  Left = 835
  Top = 180
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Centrais'
  ClientHeight = 508
  ClientWidth = 497
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PMenu: TPanel
    Left = 0
    Top = 469
    Width = 497
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
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
          OnClick = BtnEditarClick
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
          Visible = False
        end
      end
    end
    object PFechar: TPanel
      Left = 440
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 7
    Width = 481
    Height = 225
    Caption = 'Central'
    TabOrder = 1
    object Label4: TLabel
      Left = 10
      Top = 17
      Width = 47
      Height = 13
      Caption = 'N'#186' Cliente'
    end
    object Label19: TLabel
      Left = 10
      Top = 135
      Width = 63
      Height = 13
      Caption = 'Observa'#231#245'es'
    end
    object Label3: TLabel
      Left = 10
      Top = 56
      Width = 93
      Height = 13
      Caption = 'Local da Instala'#231#227'o'
    end
    object Label5: TLabel
      Left = 10
      Top = 96
      Width = 86
      Height = 13
      Caption = 'Modelo da Central'
    end
    object EdtCodigo: TDBEdit
      Left = 10
      Top = 33
      Width = 63
      Height = 21
      DataField = 'CDCLIENTE'
      TabOrder = 0
    end
    object EdtNomeCliente: TEdit
      Left = 76
      Top = 33
      Width = 389
      Height = 21
      ReadOnly = True
      TabOrder = 1
      OnEnter = EdtNomeClienteEnter
    end
    object EdtLocalInstalacao: TDBEdit
      Left = 10
      Top = 72
      Width = 455
      Height = 21
      DataField = 'LOCALINSTALACACAO'
      TabOrder = 2
    end
    object EdtInfoTecnica: TDBEdit
      Left = 10
      Top = 112
      Width = 455
      Height = 21
      DataField = 'OBSTECNICA'
      TabOrder = 3
    end
    object EdtInfoComercial: TDBMemo
      Left = 10
      Top = 152
      Width = 455
      Height = 65
      DataField = 'OBSCOMERCIAL'
      TabOrder = 4
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 239
    Width = 481
    Height = 223
    Caption = 'Setoriza'#231#227'o'
    TabOrder = 2
    object DBGSetor: TDBGrid
      Left = 11
      Top = 20
      Width = 454
      Height = 189
      DataSource = DModuleCliente.DSSetor
      Options = [dgEditing, dgTitles, dgIndicator, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGSetorDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'NUMSETOR'
          Title.Caption = 'Setor'
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LOCAL'
          Title.Caption = 'Localiza'#231#227'o'
          Width = 380
          Visible = True
        end>
    end
  end
end
