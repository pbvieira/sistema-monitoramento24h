object FCadContrato: TFCadContrato
  Left = 858
  Top = 184
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Contratos'
  ClientHeight = 508
  ClientWidth = 476
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
  object Label4: TLabel
    Left = 10
    Top = 8
    Width = 55
    Height = 13
    Caption = 'N'#186' Contrato'
  end
  object Label14: TLabel
    Left = 79
    Top = 8
    Width = 79
    Height = 13
    Caption = 'Tipo de Contrato'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 11
    Top = 46
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
  object Label9: TLabel
    Left = 288
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
  object Label17: TLabel
    Left = 10
    Top = 123
    Width = 56
    Height = 13
    Caption = 'Dt Ativa'#231#227'o'
  end
  object Label3: TLabel
    Left = 82
    Top = 123
    Width = 41
    Height = 13
    Caption = 'Dt Inicial'
  end
  object Label5: TLabel
    Left = 152
    Top = 123
    Width = 36
    Height = 13
    Caption = 'Dt Final'
  end
  object Label7: TLabel
    Left = 221
    Top = 123
    Width = 58
    Height = 13
    Caption = 'Dia Revis'#227'o'
  end
  object Label8: TLabel
    Left = 11
    Top = 84
    Width = 37
    Height = 13
    Caption = 'Receita'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 251
    Top = 84
    Width = 20
    Height = 13
    Caption = 'Item'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label11: TLabel
    Left = 290
    Top = 123
    Width = 54
    Height = 13
    Caption = 'Valor Inicial'
  end
  object Label12: TLabel
    Left = 386
    Top = 123
    Width = 51
    Height = 13
    Caption = 'Valor Atual'
  end
  object Label15: TLabel
    Left = 11
    Top = 162
    Width = 31
    Height = 13
    Caption = 'Chave'
  end
  object Label19: TLabel
    Left = 10
    Top = 243
    Width = 110
    Height = 13
    Caption = 'Endere'#231'o de Cobran'#231'a'
  end
  object Label18: TLabel
    Left = 322
    Top = 243
    Width = 27
    Height = 13
    Caption = 'Bairro'
  end
  object Label16: TLabel
    Left = 10
    Top = 283
    Width = 33
    Height = 13
    Caption = 'Cidade'
  end
  object Label20: TLabel
    Left = 330
    Top = 283
    Width = 14
    Height = 13
    Caption = 'UF'
  end
  object Label21: TLabel
    Left = 385
    Top = 283
    Width = 19
    Height = 13
    Caption = 'Cep'
  end
  object Label22: TLabel
    Left = 11
    Top = 202
    Width = 85
    Height = 13
    Caption = 'Tipo de Cobran'#231'a'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label23: TLabel
    Left = 10
    Top = 322
    Width = 62
    Height = 13
    Caption = 'Dia do Venc.'
  end
  object Label24: TLabel
    Left = 84
    Top = 322
    Width = 50
    Height = 13
    Caption = 'Toler'#226'ncia'
  end
  object Label25: TLabel
    Left = 156
    Top = 322
    Width = 79
    Height = 13
    Caption = 'Qtd. de Parcelas'
  end
  object Label26: TLabel
    Left = 13
    Top = 385
    Width = 118
    Height = 13
    Caption = 'Motivo do Cancelamento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object PMenu: TPanel
    Left = 0
    Top = 469
    Width = 476
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 25
    object POperacoes: TPanel
      Left = 0
      Top = 0
      Width = 361
      Height = 39
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object TBOperacoes: TToolBar
        Left = 0
        Top = 0
        Width = 361
        Height = 37
        ButtonHeight = 36
        ButtonWidth = 56
        Caption = 'TBOperacoes'
        DisabledImages = DModule.ILForm12
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
      Left = 419
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
  object EdtCodigo: TDBEdit
    Left = 10
    Top = 24
    Width = 63
    Height = 21
    DataField = 'CDCONTRATO'
    DataSource = DModuleCliente.DSContrato
    TabOrder = 0
  end
  object CmbTipoContrato: TDBLookupComboBox
    Left = 76
    Top = 24
    Width = 209
    Height = 21
    DataField = 'DETIPOCONTRATO'
    DataSource = DModuleCliente.DSContrato
    TabOrder = 1
  end
  object EdtCodCodificador: TDBEdit
    Left = 287
    Top = 23
    Width = 178
    Height = 21
    DataField = 'CDCODIFICADOR'
    DataSource = DModuleCliente.DSContrato
    TabOrder = 2
  end
  object EdtDataAtivacao: TDBEdit
    Left = 10
    Top = 139
    Width = 69
    Height = 21
    DataField = 'DATAATIVACAO'
    DataSource = DModuleCliente.DSContrato
    TabOrder = 7
  end
  object EdtDataInicial: TDBEdit
    Left = 82
    Top = 139
    Width = 67
    Height = 21
    DataField = 'DATAINICIAL'
    DataSource = DModuleCliente.DSContrato
    TabOrder = 8
  end
  object EdtDataFinal: TDBEdit
    Left = 152
    Top = 139
    Width = 66
    Height = 21
    DataField = 'DATAFINAL'
    DataSource = DModuleCliente.DSContrato
    TabOrder = 9
  end
  object EdtDiaRevisao: TDBEdit
    Left = 221
    Top = 139
    Width = 66
    Height = 21
    DataField = 'DIAREVISAO'
    DataSource = DModuleCliente.DSContrato
    TabOrder = 10
  end
  object CmbReceita: TDBLookupComboBox
    Left = 10
    Top = 100
    Width = 235
    Height = 21
    DataField = 'DERECEITA'
    DataSource = DModuleCliente.DSContrato
    TabOrder = 5
  end
  object CmbItem: TDBLookupComboBox
    Left = 248
    Top = 100
    Width = 218
    Height = 21
    DataSource = DModuleCliente.DSContrato
    TabOrder = 6
    Visible = False
  end
  object EdtValorInicial: TDBEdit
    Left = 290
    Top = 139
    Width = 87
    Height = 21
    DataField = 'VALORINICIAL'
    DataSource = DModuleCliente.DSContrato
    TabOrder = 11
  end
  object EdtValorAtual: TDBEdit
    Left = 380
    Top = 139
    Width = 85
    Height = 21
    DataField = 'VALORATUAL'
    DataSource = DModuleCliente.DSContrato
    TabOrder = 12
  end
  object EdtChave: TDBEdit
    Left = 11
    Top = 178
    Width = 65
    Height = 21
    DataField = 'CHAVE'
    DataSource = DModuleCliente.DSContrato
    TabOrder = 13
  end
  object EdtEnderecoCob: TDBEdit
    Left = 10
    Top = 259
    Width = 309
    Height = 21
    DataField = 'ENDERECO_COB'
    DataSource = DModuleCliente.DSContrato
    TabOrder = 17
  end
  object EdtBairroCob: TDBEdit
    Left = 322
    Top = 259
    Width = 145
    Height = 21
    DataField = 'BAIRRO_COB'
    DataSource = DModuleCliente.DSContrato
    TabOrder = 18
  end
  object EdtCepCob: TDBEdit
    Left = 383
    Top = 299
    Width = 83
    Height = 21
    DataField = 'CEP_COB'
    DataSource = DModuleCliente.DSContrato
    TabOrder = 21
  end
  object EdtUfCob: TDBEdit
    Left = 322
    Top = 299
    Width = 58
    Height = 21
    DataField = 'UF_COB'
    DataSource = DModuleCliente.DSContrato
    TabOrder = 20
  end
  object EdtCidadeCob: TDBEdit
    Left = 10
    Top = 299
    Width = 309
    Height = 21
    DataField = 'CIDADE_COB'
    DataSource = DModuleCliente.DSContrato
    TabOrder = 19
  end
  object CmbTipoCobranca: TDBLookupComboBox
    Left = 11
    Top = 218
    Width = 199
    Height = 21
    DataField = 'DETIPOCOBRANCA'
    DataSource = DModuleCliente.DSContrato
    TabOrder = 16
  end
  object EdtDiaVenc: TDBEdit
    Left = 10
    Top = 338
    Width = 71
    Height = 21
    DataField = 'DIAVENCIMENTO'
    DataSource = DModuleCliente.DSContrato
    TabOrder = 22
  end
  object EdtTolerancia: TDBEdit
    Left = 84
    Top = 338
    Width = 69
    Height = 21
    DataField = 'TOLERANCIA'
    DataSource = DModuleCliente.DSContrato
    TabOrder = 23
  end
  object EdtQtdParcelas: TDBEdit
    Left = 156
    Top = 338
    Width = 69
    Height = 21
    DataField = 'QTDPARCELAS'
    DataSource = DModuleCliente.DSContrato
    TabOrder = 24
  end
  object CkbConfChave: TDBCheckBox
    Left = 89
    Top = 180
    Width = 81
    Height = 17
    Caption = 'Conf.Chave'
    DataField = 'CONFCHAVE'
    DataSource = DModuleCliente.DSContrato
    TabOrder = 14
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object CkbLocacao: TDBCheckBox
    Left = 177
    Top = 180
    Width = 65
    Height = 17
    Caption = 'Loca'#231#227'o'
    DataField = 'CONFLOCACAO'
    DataSource = DModuleCliente.DSContrato
    TabOrder = 15
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object EdtCodCliente: TDBEdit
    Left = 10
    Top = 62
    Width = 63
    Height = 21
    DataField = 'CDCLIENTE'
    DataSource = DModuleCliente.DSContrato
    TabOrder = 3
  end
  object EdtNomeCliente: TEdit
    Left = 76
    Top = 62
    Width = 389
    Height = 21
    ReadOnly = True
    TabOrder = 4
    OnEnter = EdtNomeClienteEnter
  end
  object CmbMotivoCancelamento: TDBLookupComboBox
    Left = 12
    Top = 402
    Width = 201
    Height = 21
    DataField = 'DEMOTIVOCANCEL'
    DataSource = DModuleCliente.DSContrato
    TabOrder = 26
  end
  object CkbInativo: TDBCheckBox
    Left = 16
    Top = 364
    Width = 121
    Height = 17
    Caption = 'Contrato Inativo'
    DataField = 'INATIVO'
    DataSource = DModuleCliente.DSContrato
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 27
    ValueChecked = '1'
    ValueUnchecked = '0'
    OnClick = CkbInativoClick
  end
end
