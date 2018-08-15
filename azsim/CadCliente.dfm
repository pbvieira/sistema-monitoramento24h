object FCadCliente: TFCadCliente
  Left = 242
  Top = 164
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'AZSIM'
  ClientHeight = 623
  ClientWidth = 1002
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PMenu: TPanel
    Left = 0
    Top = 586
    Width = 1002
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object POperacoes: TPanel
      Left = 0
      Top = 0
      Width = 361
      Height = 37
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object TBOperacoes: TToolBar
        Left = 0
        Top = 0
        Width = 361
        Height = 37
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
      end
    end
    object PFechar: TPanel
      Left = 945
      Top = 0
      Width = 57
      Height = 37
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      object BtnFechar: TSpeedButton
        Left = 0
        Top = 1
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
    end
  end
  object Panel1: TPanel
    Left = 9
    Top = 40
    Width = 983
    Height = 539
    Align = alCustom
    TabOrder = 1
    object BtnPesquisa: TSpeedButton
      Left = 883
      Top = 207
      Width = 98
      Height = 65
      Caption = 'Pesquisar'
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFF163B7B
        4D66A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF3A629D70D4FF148AFD335293FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4788CCA1F1FF
        CFFFFF1791F63866AEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF3678C77EE2FFE0FFFF2BA1F6326FBDFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        3280D265D9FFE9FFFF4BB3F7368BEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF368CDE58D5FFBCFBFF118BF0C4
        B7BC9E7A78A1807CAB8B7FA37C72815F61DDD5D6FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF2F9AEE19A5FFC7B8BCAB746EFAFAF6FFFFFFFFFFF3FFFFEBFFF8
        D298695CBBACAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7CBD6C98A7DFD
        FFFFFFFFFFFDFAECFAF2E1F6F0D3F8E8CBFFFFD9996959E5DFE0FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFD2B7B5F5EFE8FFFFFFFEFCF5FCF9EEFBF2DFF9F3D7EDD5
        B7F4DCBCF5D5AE9D7D7CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB89A9DFFFFFCFD
        FAF2FCF9EFFBF4E5FDF8E9FAF3DDF5E5C9ECD4B6FFE4BC986D66FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFC9B3B2FFFFE9FBF4E5FAF5E2FDF7E9FCF4E2F4E3C9F1D9
        BFEFDDC0FFE1B9A67B72FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8B4B3FFFEDAFA
        F2DBFAF3D9FBF5E0F4E3C6FEFDFBFFFFFBF5EBCFFDD5ABA0746EFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFD0BFC6EEDABBFCEFCEF2DEC0F6EAD0F3E1C6FDFDEDFAF8
        E3F7E8C8E8B892BDA2A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9AEAAF6
        D8B3F1D9B7E8CCACF4E2C6F4E9CAF7E3C3F3CC9FB98677E5DEE1FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCBB1A7E7C49FEDC498EEC59AEBBD90E1AF
        84BF8F79CDBFC7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFCEB4A8CBB1AAC5A69DCFBABAE8E2E5FFFFFFFFFFFF}
      Layout = blGlyphTop
      OnClick = BtnPesquisaClick
    end
    object BtnContratos: TSpeedButton
      Left = 883
      Top = 142
      Width = 98
      Height = 65
      Caption = 'Contratos'
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        916D37A7895BA68756A68756A68756A68756A68756A68756A68756A68756A585
        579D7B4C987545FFFFFFFFFFFFFFFFFFA98D62FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F3ECA48659FFFFFFFFFFFFFFFFFF
        B1946AFDFCFCB37955B57E5BB77F5DB77F5DB67E5BB37C5AB37C5CB0714FCAA2
        8CE8DDD1A58452FFFFFFFFFFFFFFFFFFB89E76FDFCFCFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDEDE7DDA58452FFFFFFFFFFFFFFFFFF
        BCA37AFDFCFCB47753B77954B77A57B77A57B77B58B77A58BA7B5AB5744ED1AB
        91E6D8CBA58452FFFFFFFFFFFFFFFFFFBBA37AFDFCFCFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEEDE7DDA58451FFFFFFFFFFFFFFFFFF
        BBA37AFDFCFCB67854B87A56B67956B77957BA7A5ABD8257BC825FBA7652CFA6
        8BE6D9CCA58453FFFFFFFFFFFFFFFFFFBAA37FFDFCFCFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FBF6EDE6DEA68553FFFFFFFFFFFFFFFFFF
        BCAA8CFDFCFCB87A54B47B52B97B5AB77C5BB97C5AB77B5BB1764DA4653FC29C
        83DECCBCA68553FFFFFFFFFFFFFFFFFFC5B295FDFCFCFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFEFFFFECEDE3D9CEB9A58553FFFFFFFFFFFFFFFFFF
        CCBA9DFDFCFCB47954B77855B77A5AB77D55B67953B47851A76A44984F27B386
        68BDA380A48452FFFFFFFFFFFFFFFFFFCEBDA3FDFCFCFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFCEBB9EE8DFD5DDD2BEB69C72A98857FFFFFFFFFFFFFFFFFF
        CFBDA6FDFCFCA86136B36F48AD6F43A8663DAA633E904F2BCFBDA0FFFFFFCDB9
        9DBAA078F2EDE6FFFFFFFFFFFFFFFFFFD0C0A7FDFCFCFCFEFFFBF7F3F3EBE5E6
        DFD6E2D4C4CDB798BEAC8AD1C1A9B69B6EF9F7F3FFFFFFFFFFFFFFFFFFFFFFFF
        D1C3ABFDFCFBFEFEFEF6F2EFEDE4DADED5C4D6C4ADC0A984A38652BAA078FCFB
        F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCBBB9FD1C2A9D1C0A7CDBCA2CBBA9EC7
        B291C3AB86AD9364AF9367F9F7F3FFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphTop
      OnClick = BtnContratosClick
    end
    object BtnSenhas: TSpeedButton
      Left = 883
      Top = 77
      Width = 98
      Height = 65
      Caption = 'Senhas'
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFD2D1F23D39C83836CF3B39DD3C39E13937D53D3BD27471D6EBEB
        FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8A88E02020E51113E816
        17EB1717EE1617EA1517E81517DF9595EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF6865E2475DFF192FFD1D2CFB121AFA2030FD243AFE1232FF9386
        D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA49AFF6A86FF2644F93E
        6EFA7DD7FF365FFA3457FA0320FFA26960D9984BC68E5FE9D2C1FFFFFFDDE5DB
        D1DACBD8E4D6B6BAE35F5BE46A90FF50C1FD5ACBEA4AB0FA2B4CFF5139CCFFB8
        11E6AA33E7AB34D1892C70A67031AA463DB55740C65441D230081D6821379347
        A6F3208AEB1B69D60000807F684FFFCC4AE5B455EFC45CD99C4371C58243E77E
        3EDA7042D87447EB741B656A21388D52D7FF31C7FF3DCAFF001754B39061FFE1
        62FFD66DEFCA75E9C28D8FBE926BEAB026D1703AD87340EF6F22A3735172BBB0
        FFFF7DE2FF7DF3FF20429265A5DF3E8BE6BEA88DFFD355FFFDF9E5F1E684D69A
        57E4A229BB9633C2A01C85832D4CAACDFFFF9BE4F61A3B8E0E2E8C1CA5FF1BBA
        FF1591FDFFFFFFFFFFFFFFFFFFE3F2E46CB1D54BAAFF2991FF257BE00E299336
        66B62656A80A258C2558B863DBFF47CAFF51DFFFB9CEF2FFFFFFFFFFFFFFFFFF
        7CCCFF3CC8FF32C3FF3DCCFF3B72CF3453B54869BF2549AB405B81A3EDF1B3FF
        FFAAFDFF9C968FFFFFFFFFFFFFFFFFFF93CCE397FAFF81E2FF87F9FF88B4DAFF
        FFFFFFFFFFB0B4BF3A1D0344474C93D1D85362687F7573FFFFFFFFFFFFFFFFFF
        2F1D153E3732B1FFFFA1E2EA58493BFFFFFFFFFFFFFBFAFA4F4B48483C393F32
        303F312CD3D1D1FFFFFFFFFFFFFFFFFF4A444140323050595E413B3969605CFF
        FFFFFFFFFFFFFFFFE2E0E1CBC9C9D2D1D0E3E2E2FFFFFFFFFFFFFFFFFFFFFFFF
        B6B2B25E5A595D524E5B5250D0CFCEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphTop
      OnClick = BtnSenhasClick
    end
    object BtnProcedimentos: TSpeedButton
      Left = 883
      Top = 12
      Width = 98
      Height = 65
      Caption = 'Procedimentos'
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFC3E2FD
        4096BE4085BB428ABE4289BE438ABE428CBD4186BD3F83BD4083BC4286BD4285
        BB4394BEB5D7F8FFFFFFFFFFFF60B1FF52B9FF40B0FF43B2FF43B2FF43B2FF41
        B3FF3FABFF3EA9FF3FA9FF40ABFF42ACFF45ACFF3093FDFFFFFFFFFFFF63B1FF
        439EFE3497FF3899FF399BFF389AFF389AFF3191FF2D8EFF2C8BFF2B8AFF2985
        FF2886FF2E8FFFFFFFFFFFFFFF68B7FF4CAFFF42AAFF47ACFF46ADFF48AEFF49
        AFFF46ABFF3EA3FF399DFF3799FF3294FF308FFF3190FFFFFFFFFFFFFF6ABAFF
        55BAFF4AB2FF4CB4FF4FB5FF52B8FF51B7FF4FB5FF4DB3FF48AEFF42A8FF3A9D
        FF3193FF3290FFFFFFFFFFFFFF6DBCFF5BC0FF4DB5FF53B7FF52B8FF56BCFF54
        BAFF52B8FF51B7FF4FB5FF4BB2FF44A9FF3698FF3796FFFFFFFFFFFFFF6EBCFF
        62C4FF50B9FF57BDFF53B9FF56BCFF57BCFF57BCFF55BAFF50B4FF4DB3FF4AB0
        FF3CA1FF3C9AFFFFFFFFFFFFFF6EBCFF68C9FF52BCFF5ABEFF58BEFF58BEFF59
        BFFF59BFFF58BEFF54BAFF50B6FF4BB1FF40A6FF3C9FFFFFFFFFFFFFFF70BCFF
        6FCFFF54BEFF5DC1FF59BCFF58BCFF58BEFF59BEFF59BEFF5BBDFF55BBFF55BB
        FF47ADFF399FFFFFFFFFFFFFFF70BDFF76D1FF56BDFF60CFFF67E1FF69E2FF60
        E2FF5FE2FF5FE2FF61E5FF65D3FF66C6FF4DB3FF359EFFFFFFFFFFFFFF71BEFF
        7BD4FF60CFFF5CC0E72868832A6A8D296F9727709B256D972A739948B8F048CA
        FF43AFFF359EFFFFFFFFFFFFFF71BEFF7EDAFF47D1FF79929FA27A6896898199
        867C98887E9B8D83AA846B315F862EB3FF45ABFF399AF8FFFFFFFFFFFF93CCFF
        92D9FF5DCBFFA1BBCCFFFFF3F2F6F7FFFFFFFAF8F9F9FAFCFFFCF14875983098
        F742A2FF6CB1F5FFFFFFFFFFFFFFFFFFCCE7FFC9E7FFEBF1F7FFF4E8FFFFFFBE
        BEBED9D9D9FFFFFFF8F0E6D6E3EFB9DAFCBEDEFDFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFEFF2F3BABABAD3D2D2F2F2F2FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBE
        BEBEB9B9B9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphTop
      OnClick = BtnProcedimentosClick
    end
    object GRPObs: TGroupBox
      Left = 8
      Top = 393
      Width = 873
      Height = 97
      Caption = 'Observa'#231#245'es / Viagens'
      TabOrder = 0
      object EdtObservacao: TDBMemo
        Left = 8
        Top = 16
        Width = 855
        Height = 71
        DataField = 'OBSERVACAO'
        DataSource = DModuleCliente.DSCliente
        TabOrder = 0
      end
    end
    object GRPCliente: TGroupBox
      Left = 8
      Top = 8
      Width = 873
      Height = 193
      Caption = 'Cliente'
      TabOrder = 1
      object Label2: TLabel
        Left = 8
        Top = 15
        Width = 20
        Height = 13
        Caption = 'Filial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 212
        Top = 12
        Width = 58
        Height = 13
        Caption = 'C'#243'd. AZSIM'
      end
      object Label6: TLabel
        Left = 8
        Top = 57
        Width = 102
        Height = 13
        Caption = 'Nome / Raz'#227'o Social'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 341
        Top = 12
        Width = 58
        Height = 13
        Caption = 'CPF / CNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 284
        Top = 12
        Width = 43
        Height = 13
        Caption = 'Natureza'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 8
        Top = 101
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
        Left = 340
        Top = 101
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
        Left = 506
        Top = 101
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
      object Label12: TLabel
        Left = 727
        Top = 101
        Width = 14
        Height = 13
        Caption = 'UF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 787
        Top = 101
        Width = 19
        Height = 13
        Caption = 'Cep'
      end
      object Label22: TLabel
        Left = 496
        Top = 12
        Width = 91
        Height = 13
        Caption = 'Inscri'#231#227'o Municipal'
      end
      object Label20: TLabel
        Left = 8
        Top = 143
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
      object Label25: TLabel
        Left = 787
        Top = 142
        Width = 43
        Height = 13
        Caption = 'KM Base'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 415
        Top = 57
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
      object Label21: TLabel
        Left = 609
        Top = 11
        Width = 49
        Height = 13
        Caption = 'C'#243'd. H'#225'bil'
        Visible = False
      end
      object Label23: TLabel
        Left = 680
        Top = 11
        Width = 59
        Height = 13
        Caption = 'C'#243'd. Condor'
        Visible = False
      end
      object Label24: TLabel
        Left = 751
        Top = 12
        Width = 57
        Height = 13
        Caption = 'Codificador*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object CmbFilial: TDBLookupComboBox
        Left = 8
        Top = 30
        Width = 201
        Height = 21
        DataField = 'NMFILIAL'
        DataSource = DModuleCliente.DSCliente
        TabOrder = 0
      end
      object EdtCodigo: TDBEdit
        Left = 211
        Top = 29
        Width = 69
        Height = 21
        DataField = 'CDCLIENTE'
        DataSource = DModuleCliente.DSCliente
        TabOrder = 1
      end
      object EdtNmCliente: TDBEdit
        Left = 8
        Top = 73
        Width = 403
        Height = 21
        DataField = 'NMCLIENTE'
        DataSource = DModuleCliente.DSCliente
        TabOrder = 8
      end
      object EdtDocumento: TDBEdit
        Left = 341
        Top = 28
        Width = 150
        Height = 21
        DataField = 'DOCUMENTO'
        DataSource = DModuleCliente.DSCliente
        TabOrder = 3
      end
      object CmbNatureza: TDBComboBox
        Left = 282
        Top = 28
        Width = 57
        Height = 21
        Style = csDropDownList
        AutoComplete = False
        CharCase = ecUpperCase
        DataField = 'TPPESSOA'
        DataSource = DModuleCliente.DSCliente
        ItemHeight = 13
        Items.Strings = (
          'F'
          'J')
        TabOrder = 2
      end
      object EdtEndereco: TDBEdit
        Left = 8
        Top = 117
        Width = 331
        Height = 21
        DataField = 'ENDERECO'
        DataSource = DModuleCliente.DSCliente
        TabOrder = 10
      end
      object EdtBairro: TDBEdit
        Left = 341
        Top = 117
        Width = 163
        Height = 21
        DataField = 'BAIRRO'
        DataSource = DModuleCliente.DSCliente
        TabOrder = 11
      end
      object EdtCidade: TDBEdit
        Left = 506
        Top = 117
        Width = 219
        Height = 21
        DataField = 'CIDADE'
        DataSource = DModuleCliente.DSCliente
        TabOrder = 12
      end
      object EdtUf: TDBEdit
        Left = 727
        Top = 117
        Width = 57
        Height = 21
        DataField = 'UF'
        DataSource = DModuleCliente.DSCliente
        TabOrder = 13
      end
      object EdtCep: TDBEdit
        Left = 786
        Top = 117
        Width = 79
        Height = 21
        DataField = 'CEP'
        DataSource = DModuleCliente.DSCliente
        TabOrder = 14
      end
      object EdtIcm: TDBEdit
        Left = 493
        Top = 28
        Width = 113
        Height = 21
        DataField = 'INSCMUNICIPAL'
        DataSource = DModuleCliente.DSCliente
        TabOrder = 4
      end
      object EdtPontoRef: TDBEdit
        Left = 8
        Top = 158
        Width = 777
        Height = 21
        DataField = 'PONTOREF'
        DataSource = DModuleCliente.DSCliente
        TabOrder = 15
      end
      object EdtKmBase: TDBEdit
        Left = 787
        Top = 158
        Width = 78
        Height = 21
        DataField = 'KMBASE'
        DataSource = DModuleCliente.DSCliente
        TabOrder = 16
      end
      object EdtNomeFantasia: TDBEdit
        Left = 414
        Top = 72
        Width = 451
        Height = 21
        DataField = 'NMFANTASIA'
        DataSource = DModuleCliente.DSCliente
        TabOrder = 9
      end
      object EdtCodigoHabil: TDBEdit
        Left = 608
        Top = 28
        Width = 69
        Height = 21
        DataField = 'CDCLIENTE'
        DataSource = DModuleCliente.DSCliente
        TabOrder = 5
        Visible = False
      end
      object EdtCodigoCondor: TDBEdit
        Left = 679
        Top = 28
        Width = 69
        Height = 21
        DataField = 'CDCLIENTE'
        DataSource = DModuleCliente.DSCliente
        TabOrder = 6
        Visible = False
      end
      object EdtCodCodificador: TDBEdit
        Left = 750
        Top = 28
        Width = 115
        Height = 21
        TabOrder = 7
        Visible = False
      end
    end
    object GRPContatos: TGroupBox
      Left = 8
      Top = 211
      Width = 873
      Height = 182
      Caption = 'Contatos'
      TabOrder = 2
      TabStop = True
      object Label34: TLabel
        Left = 11
        Top = 18
        Width = 39
        Height = 13
        Caption = 'Fone (1)'
      end
      object Label35: TLabel
        Left = 93
        Top = 18
        Width = 73
        Height = 13
        Caption = 'Observa'#231#227'o (1)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label36: TLabel
        Left = 440
        Top = 17
        Width = 39
        Height = 13
        Caption = 'Fone (2)'
      end
      object Label37: TLabel
        Left = 523
        Top = 18
        Width = 73
        Height = 13
        Caption = 'Observa'#231#227'o (2)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label38: TLabel
        Left = 11
        Top = 57
        Width = 39
        Height = 13
        Caption = 'Fone (3)'
      end
      object Label39: TLabel
        Left = 93
        Top = 57
        Width = 73
        Height = 13
        Caption = 'Observa'#231#227'o (3)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label40: TLabel
        Left = 440
        Top = 57
        Width = 39
        Height = 13
        Caption = 'Fone (4)'
      end
      object Label41: TLabel
        Left = 523
        Top = 57
        Width = 73
        Height = 13
        Caption = 'Observa'#231#227'o (4)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 11
        Top = 97
        Width = 39
        Height = 13
        Caption = 'Fone (5)'
      end
      object Label5: TLabel
        Left = 93
        Top = 97
        Width = 73
        Height = 13
        Caption = 'Observa'#231#227'o (5)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 440
        Top = 97
        Width = 39
        Height = 13
        Caption = 'Fone (6)'
      end
      object Label15: TLabel
        Left = 523
        Top = 97
        Width = 73
        Height = 13
        Caption = 'Observa'#231#227'o (6)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label17: TLabel
        Left = 11
        Top = 137
        Width = 39
        Height = 13
        Caption = 'Fone (7)'
      end
      object Label16: TLabel
        Left = 523
        Top = 137
        Width = 73
        Height = 13
        Caption = 'Observa'#231#227'o (8)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label18: TLabel
        Left = 93
        Top = 137
        Width = 73
        Height = 13
        Caption = 'Observa'#231#227'o (7)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label19: TLabel
        Left = 440
        Top = 137
        Width = 39
        Height = 13
        Caption = 'Fone (8)'
      end
      object EdtFone1: TDBEdit
        Tag = 1
        Left = 8
        Top = 33
        Width = 81
        Height = 21
        DataField = 'FONE1'
        DataSource = DModuleCliente.DSCliente
        TabOrder = 0
      end
      object EdtFone1Obs: TDBEdit
        Tag = 1
        Left = 91
        Top = 33
        Width = 343
        Height = 21
        DataField = 'FONEOBS1'
        DataSource = DModuleCliente.DSCliente
        TabOrder = 1
      end
      object EdtFone2: TDBEdit
        Tag = 1
        Left = 438
        Top = 33
        Width = 81
        Height = 21
        DataField = 'FONE2'
        DataSource = DModuleCliente.DSCliente
        TabOrder = 2
      end
      object EdtFone2Obs: TDBEdit
        Tag = 1
        Left = 521
        Top = 33
        Width = 343
        Height = 21
        DataField = 'FONEOBS2'
        DataSource = DModuleCliente.DSCliente
        TabOrder = 3
      end
      object EdtFone3: TDBEdit
        Tag = 1
        Left = 8
        Top = 73
        Width = 81
        Height = 21
        DataField = 'FONE3'
        DataSource = DModuleCliente.DSCliente
        TabOrder = 4
      end
      object EdtFone3Obs: TDBEdit
        Tag = 1
        Left = 91
        Top = 73
        Width = 343
        Height = 21
        DataField = 'FONEOBS3'
        DataSource = DModuleCliente.DSCliente
        TabOrder = 5
      end
      object EdtFone4: TDBEdit
        Tag = 1
        Left = 438
        Top = 73
        Width = 81
        Height = 21
        DataField = 'FONE4'
        DataSource = DModuleCliente.DSCliente
        TabOrder = 6
      end
      object EdtFone4Obs: TDBEdit
        Tag = 1
        Left = 521
        Top = 73
        Width = 343
        Height = 21
        DataField = 'FONEOBS4'
        DataSource = DModuleCliente.DSCliente
        TabOrder = 7
      end
      object EdtFone5: TDBEdit
        Tag = 1
        Left = 8
        Top = 113
        Width = 81
        Height = 21
        DataField = 'FONE5'
        DataSource = DModuleCliente.DSCliente
        TabOrder = 8
      end
      object EdtFone5Obs: TDBEdit
        Tag = 1
        Left = 91
        Top = 113
        Width = 343
        Height = 21
        DataField = 'FONEOBS5'
        DataSource = DModuleCliente.DSCliente
        TabOrder = 9
      end
      object EdtFone6: TDBEdit
        Tag = 1
        Left = 438
        Top = 113
        Width = 81
        Height = 21
        DataField = 'FONE6'
        DataSource = DModuleCliente.DSCliente
        TabOrder = 10
      end
      object EdtFone6Obs: TDBEdit
        Tag = 1
        Left = 521
        Top = 113
        Width = 343
        Height = 21
        DataField = 'FONEOBS6'
        DataSource = DModuleCliente.DSCliente
        TabOrder = 11
      end
      object EdtFone7: TDBEdit
        Tag = 1
        Left = 9
        Top = 153
        Width = 81
        Height = 21
        DataField = 'FONE7'
        DataSource = DModuleCliente.DSCliente
        TabOrder = 12
      end
      object EdtFone7Obs: TDBEdit
        Tag = 1
        Left = 92
        Top = 153
        Width = 343
        Height = 21
        DataField = 'FONEOBS7'
        DataSource = DModuleCliente.DSCliente
        TabOrder = 13
      end
      object EdtFone8: TDBEdit
        Tag = 1
        Left = 439
        Top = 153
        Width = 81
        Height = 21
        DataField = 'FONE8'
        DataSource = DModuleCliente.DSCliente
        TabOrder = 14
      end
      object EdtFone8Obs: TDBEdit
        Tag = 1
        Left = 522
        Top = 152
        Width = 343
        Height = 21
        DataField = 'FONEOBS8'
        DataSource = DModuleCliente.DSCliente
        TabOrder = 15
      end
    end
  end
  object pnlTituloForm: TPanel
    Left = 0
    Top = 0
    Width = 1002
    Height = 30
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = ' Cadastro de clientes'
    Color = clPurple
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
end
