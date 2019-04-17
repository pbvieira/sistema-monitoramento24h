object DModuleCliente: TDModuleCliente
  OldCreateOrder = False
  Left = 191
  Top = 101
  Height = 769
  Width = 1247
  object IBQContato: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTCliente
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DSLinkCliente
    SQL.Strings = (
      
        'SELECT CDCLIENTECONTATO, CDCLIENTE, NMCONTATO, CDTIPOCONTATO, PA' +
        'RENTESCO, ENDERECO, BAIRRO, CIDADE, UF, CEP, FONE1, FONE1OBS, FO' +
        'NE2, FONE2OBS, FONE3, FONE3OBS, FONE4, FONE4OBS, OBSERVACAO, SEN' +
        'HA, CONTRASENHA, DATANASCIMENTO FROM CLIENTECONTATO WHERE CDCLIE' +
        'NTE= :CDCLIENTE')
    UniDirectional = True
    Left = 148
    Top = 14
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CDCLIENTE'
        ParamType = ptUnknown
        Size = 4
      end>
    object IBQContatoCDCLIENTECONTATO: TIntegerField
      FieldName = 'CDCLIENTECONTATO'
      Origin = 'CLIENTECONTATO.CDCLIENTECONTATO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQContatoCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'CLIENTECONTATO.CDCLIENTE'
    end
    object IBQContatoNMCONTATO: TIBStringField
      FieldName = 'NMCONTATO'
      Origin = 'CLIENTECONTATO.NMCONTATO'
      Size = 60
    end
    object IBQContatoCDTIPOCONTATO: TIntegerField
      FieldName = 'CDTIPOCONTATO'
      Origin = 'CLIENTECONTATO.CDTIPOCONTATO'
    end
    object IBQContatoPARENTESCO: TIBStringField
      FieldName = 'PARENTESCO'
      Origin = 'CLIENTECONTATO.PARENTESCO'
      Size = 30
    end
    object IBQContatoENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = 'CLIENTECONTATO.ENDERECO'
      Size = 60
    end
    object IBQContatoBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = 'CLIENTECONTATO.BAIRRO'
      Size = 30
    end
    object IBQContatoCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = 'CLIENTECONTATO.CIDADE'
      Size = 30
    end
    object IBQContatoUF: TIBStringField
      FieldName = 'UF'
      Origin = 'CLIENTECONTATO.UF'
      Size = 2
    end
    object IBQContatoCEP: TIBStringField
      FieldName = 'CEP'
      Origin = 'CLIENTECONTATO.CEP'
      Size = 9
    end
    object IBQContatoOBSERVACAO: TIBStringField
      FieldName = 'OBSERVACAO'
      Origin = 'CLIENTECONTATO.OBSERVACAO'
      Size = 600
    end
    object IBQContatoFONE1: TIBStringField
      FieldName = 'FONE1'
      Origin = 'CLIENTECONTATO.FONE1'
      Size = 13
    end
    object IBQContatoFONE1OBS: TIBStringField
      FieldName = 'FONE1OBS'
      Origin = 'CLIENTECONTATO.FONE1OBS'
      Size = 30
    end
    object IBQContatoFONE2: TIBStringField
      FieldName = 'FONE2'
      Origin = 'CLIENTECONTATO.FONE2'
      Size = 13
    end
    object IBQContatoFONE2OBS: TIBStringField
      FieldName = 'FONE2OBS'
      Origin = 'CLIENTECONTATO.FONE2OBS'
      Size = 30
    end
    object IBQContatoFONE3: TIBStringField
      FieldName = 'FONE3'
      Origin = 'CLIENTECONTATO.FONE3'
      Size = 13
    end
    object IBQContatoFONE3OBS: TIBStringField
      FieldName = 'FONE3OBS'
      Origin = 'CLIENTECONTATO.FONE3OBS'
      Size = 30
    end
    object IBQContatoFONE4: TIBStringField
      FieldName = 'FONE4'
      Origin = 'CLIENTECONTATO.FONE4'
      Size = 13
    end
    object IBQContatoFONE4OBS: TIBStringField
      FieldName = 'FONE4OBS'
      Origin = 'CLIENTECONTATO.FONE4OBS'
      Size = 30
    end
    object IBQContatoSENHA: TIBStringField
      FieldName = 'SENHA'
      Origin = 'CLIENTECONTATO.SENHA'
      Size = 100
    end
    object IBQContatoCONTRASENHA: TIBStringField
      FieldName = 'CONTRASENHA'
      Origin = 'CLIENTECONTATO.CONTRASENHA'
      Size = 100
    end
    object IBQContatoDATANASCIMENTO: TDateField
      FieldName = 'DATANASCIMENTO'
      Origin = 'CLIENTECONTATO.DATANASCIMENTO'
    end
  end
  object CDSContato: TClientDataSet
    Aggregates = <>
    DataSetField = CDSClienteIBQContato
    Params = <>
    BeforePost = CDSContatoBeforePost
    Left = 148
    Top = 62
    object CDSContatoCDCLIENTECONTATO: TIntegerField
      FieldName = 'CDCLIENTECONTATO'
      Origin = 'CLIENTECONTATO.CDCLIENTECONTATO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CDSContatoCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'CLIENTECONTATO.CDCLIENTE'
    end
    object CDSContatoNMCONTATO: TStringField
      FieldName = 'NMCONTATO'
      Origin = 'CLIENTECONTATO.NMCONTATO'
      Required = True
      Size = 60
    end
    object CDSContatoSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'CLIENTECONTATO.SENHA'
      Size = 100
    end
    object CDSContatoCONTRASENHA: TStringField
      FieldName = 'CONTRASENHA'
      Origin = 'CLIENTECONTATO.CONTRASENHA'
      Size = 100
    end
    object CDSContatoDATANASCIMENTO: TDateField
      FieldName = 'DATANASCIMENTO'
      Origin = 'CLIENTECONTATO.DATANASCIMENTO'
      EditMask = '!99/99/0000;1;_'
    end
  end
  object DSContato: TDataSource
    DataSet = CDSContato
    Left = 148
    Top = 110
  end
  object IBTGenIdContato: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 148
    Top = 158
  end
  object IBSPGenIdContato: TIBStoredProc
    Database = DModule.IBCONAzsim
    Transaction = IBTGenIdContato
    StoredProcName = 'SP_GEN_CLIENTECONTATO_ID'
    Left = 148
    Top = 206
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptOutput
      end>
  end
  object IBQCliente: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTCliente
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT  CDCLIENTE, CDFILIAL, BAIRRO, CEP, CIDADE, DOCUMENTO, END' +
        'ERECO, INSCMUNICIPAL, NMCLIENTE,  NMFANTASIA, TPPESSOA, UF, OBSE' +
        'RVACAO ,PROCEDIMENTOS, PONTOREF, KMBASE, DATACADASTRO, DATAALTER' +
        'ACAO, FONE1, FONEOBS1, FONE2, FONEOBS2, FONE3, FONEOBS3, FONE4, ' +
        'FONEOBS4, FONE5, FONEOBS5, FONE6, FONEOBS6, FONE7, FONEOBS7, FON' +
        'E8, FONEOBS8, CDHABIL, CDCONDOR FROM CLIENTE WHERE CDCLIENTE = -' +
        '1;')
    UniDirectional = True
    GeneratorField.ApplyEvent = gamOnPost
    Left = 52
    Top = 62
    object IBQClienteCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'CLIENTE.CDCLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQClienteCDFILIAL: TIntegerField
      FieldName = 'CDFILIAL'
      Origin = 'CLIENTE.CDFILIAL'
    end
    object IBQClienteBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = 'CLIENTE.BAIRRO'
      Size = 60
    end
    object IBQClienteCEP: TIBStringField
      FieldName = 'CEP'
      Origin = 'CLIENTE.CEP'
      Size = 9
    end
    object IBQClienteCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = 'CLIENTE.CIDADE'
      Size = 60
    end
    object IBQClienteDOCUMENTO: TIBStringField
      FieldName = 'DOCUMENTO'
      Origin = 'CLIENTE.DOCUMENTO'
    end
    object IBQClienteENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = 'CLIENTE.ENDERECO'
      Size = 60
    end
    object IBQClienteINSCMUNICIPAL: TIBStringField
      FieldName = 'INSCMUNICIPAL'
      Origin = 'CLIENTE.INSCMUNICIPAL'
      Size = 15
    end
    object IBQClienteNMCLIENTE: TIBStringField
      FieldName = 'NMCLIENTE'
      Origin = 'CLIENTE.NMCLIENTE'
      Size = 60
    end
    object IBQClienteTPPESSOA: TIBStringField
      FieldName = 'TPPESSOA'
      Origin = 'CLIENTE.TPPESSOA'
      FixedChar = True
      Size = 1
    end
    object IBQClienteUF: TIBStringField
      FieldName = 'UF'
      Origin = 'CLIENTE.UF'
      Size = 2
    end
    object IBQClientePROCEDIMENTOS: TIBStringField
      FieldName = 'PROCEDIMENTOS'
      Origin = 'CLIENTE.PROCEDIMENTOS'
      Size = 2000
    end
    object IBQClientePONTOREF: TIBStringField
      FieldName = 'PONTOREF'
      Origin = 'CLIENTE.PONTOREF'
      Size = 200
    end
    object IBQClienteDATACADASTRO: TDateTimeField
      FieldName = 'DATACADASTRO'
      Origin = 'CLIENTE.DATACADASTRO'
    end
    object IBQClienteDATAALTERACAO: TDateTimeField
      FieldName = 'DATAALTERACAO'
      Origin = 'CLIENTE.DATAALTERACAO'
    end
    object IBQClienteKMBASE: TIBBCDField
      FieldName = 'KMBASE'
      Origin = 'CLIENTE.KMBASE'
      Precision = 18
      Size = 4
    end
    object IBQClienteOBSERVACAO: TIBStringField
      FieldName = 'OBSERVACAO'
      Origin = 'CLIENTE.OBSERVACAO'
      Size = 2000
    end
    object IBQClienteFONE1: TIBStringField
      DisplayWidth = 14
      FieldName = 'FONE1'
      Origin = 'CLIENTE.FONE1'
      Size = 14
    end
    object IBQClienteFONEOBS1: TIBStringField
      FieldName = 'FONEOBS1'
      Origin = 'CLIENTE.FONEOBS1'
      Size = 200
    end
    object IBQClienteFONE2: TIBStringField
      DisplayWidth = 14
      FieldName = 'FONE2'
      Origin = 'CLIENTE.FONE2'
      Size = 14
    end
    object IBQClienteFONEOBS2: TIBStringField
      FieldName = 'FONEOBS2'
      Origin = 'CLIENTE.FONEOBS2'
      Size = 200
    end
    object IBQClienteFONE3: TIBStringField
      DisplayWidth = 14
      FieldName = 'FONE3'
      Origin = 'CLIENTE.FONE3'
      Size = 14
    end
    object IBQClienteFONEOBS3: TIBStringField
      FieldName = 'FONEOBS3'
      Origin = 'CLIENTE.FONEOBS3'
      Size = 200
    end
    object IBQClienteFONE4: TIBStringField
      DisplayWidth = 14
      FieldName = 'FONE4'
      Origin = 'CLIENTE.FONE4'
      Size = 14
    end
    object IBQClienteFONEOBS4: TIBStringField
      FieldName = 'FONEOBS4'
      Origin = 'CLIENTE.FONEOBS4'
      Size = 200
    end
    object IBQClienteFONE5: TIBStringField
      DisplayWidth = 14
      FieldName = 'FONE5'
      Origin = 'CLIENTE.FONE5'
      Size = 14
    end
    object IBQClienteFONEOBS5: TIBStringField
      FieldName = 'FONEOBS5'
      Origin = 'CLIENTE.FONEOBS5'
      Size = 200
    end
    object IBQClienteFONE6: TIBStringField
      DisplayWidth = 14
      FieldName = 'FONE6'
      Origin = 'CLIENTE.FONE6'
      Size = 14
    end
    object IBQClienteFONEOBS6: TIBStringField
      FieldName = 'FONEOBS6'
      Origin = 'CLIENTE.FONEOBS6'
      Size = 200
    end
    object IBQClienteFONE7: TIBStringField
      DisplayWidth = 14
      FieldName = 'FONE7'
      Origin = 'CLIENTE.FONE7'
      Size = 14
    end
    object IBQClienteFONEOBS7: TIBStringField
      FieldName = 'FONEOBS7'
      Origin = 'CLIENTE.FONEOBS7'
      Size = 200
    end
    object IBQClienteFONE8: TIBStringField
      DisplayWidth = 14
      FieldName = 'FONE8'
      Origin = 'CLIENTE.FONE8'
      Size = 14
    end
    object IBQClienteFONEOBS8: TIBStringField
      FieldName = 'FONEOBS8'
      Origin = 'CLIENTE.FONEOBS8'
      Size = 200
    end
    object IBQClienteNMFANTASIA: TIBStringField
      FieldName = 'NMFANTASIA'
      Origin = 'CLIENTE.NMFANTASIA'
      Size = 256
    end
    object IBQClienteCDHABIL: TIBBCDField
      FieldName = 'CDHABIL'
      Origin = 'CLIENTE.CDHABIL'
      Precision = 18
      Size = 2
    end
    object IBQClienteCDCONDOR: TIBBCDField
      FieldName = 'CDCONDOR'
      Origin = 'CLIENTE.CDCONDOR'
      Precision = 18
      Size = 2
    end
  end
  object IBTCliente: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 52
    Top = 14
  end
  object DSPCliente: TDataSetProvider
    DataSet = IBQCliente
    Constraints = True
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates]
    UpdateMode = upWhereKeyOnly
    Left = 52
    Top = 158
  end
  object CDSCliente: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CDCLIENTE'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CDFILIAL'
        DataType = ftInteger
      end
      item
        Name = 'BAIRRO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'CIDADE'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'DOCUMENTO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ENDERECO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'INSCMUNICIPAL'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NMCLIENTE'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'TPPESSOA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'UF'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'PROCEDIMENTOS'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'PONTOREF'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'DATACADASTRO'
        DataType = ftDateTime
      end
      item
        Name = 'DATAALTERACAO'
        DataType = ftDateTime
      end
      item
        Name = 'KMBASE'
        DataType = ftBCD
        Precision = 18
        Size = 4
      end
      item
        Name = 'OBSERVACAO'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'FONE1'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'FONEOBS1'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'FONE2'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'FONEOBS2'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'FONE3'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'FONEOBS3'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'FONE4'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'FONEOBS4'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'FONE5'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'FONEOBS5'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'FONE6'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'FONEOBS6'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'FONE7'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'FONEOBS7'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'FONE8'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'FONEOBS8'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'NMFANTASIA'
        DataType = ftString
        Size = 256
      end
      item
        Name = 'CDHABIL'
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'CDCONDOR'
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'IBQContato'
        DataType = ftDataSet
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DSPCliente'
    StoreDefs = True
    BeforePost = CDSClienteBeforePost
    Left = 52
    Top = 206
    object CDSClienteCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'CLIENTE.CDCLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CDSClienteCDFILIAL: TIntegerField
      FieldName = 'CDFILIAL'
      Origin = 'CLIENTE.CDFILIAL'
      Required = True
    end
    object CDSClienteTPPESSOA: TStringField
      FieldName = 'TPPESSOA'
      Origin = 'CLIENTE.TPPESSOA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object CDSClienteDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Origin = 'CLIENTE.DOCUMENTO'
      Required = True
      EditMask = '99999999999999999999;1;_'
    end
    object CDSClienteINSCMUNICIPAL: TStringField
      FieldName = 'INSCMUNICIPAL'
      Origin = 'CLIENTE.INSCMUNICIPAL'
      EditMask = '999999999999999;1;_'
      Size = 15
    end
    object CDSClienteNMCLIENTE: TStringField
      FieldName = 'NMCLIENTE'
      Origin = 'CLIENTE.NMCLIENTE'
      Required = True
      Size = 60
    end
    object CDSClienteENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'CLIENTE.ENDERECO'
      Required = True
      Size = 60
    end
    object CDSClienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'CLIENTE.BAIRRO'
      Required = True
      Size = 60
    end
    object CDSClienteCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CLIENTE.CIDADE'
      Required = True
      Size = 60
    end
    object CDSClienteUF: TStringField
      FieldName = 'UF'
      Origin = 'CLIENTE.UF'
      Required = True
      Size = 2
    end
    object CDSClienteCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CLIENTE.CEP'
      EditMask = '00000\-999;1;_'
      Size = 9
    end
    object CDSClientePROCEDIMENTOS: TStringField
      FieldName = 'PROCEDIMENTOS'
      Origin = 'CLIENTE.PROCEDIMENTOS'
      Size = 2000
    end
    object CDSClientePONTOREF: TStringField
      FieldName = 'PONTOREF'
      Origin = 'CLIENTE.PONTOREF'
      Size = 200
    end
    object CDSClienteNMFILIAL: TStringField
      FieldKind = fkLookup
      FieldName = 'NMFILIAL'
      LookupDataSet = DModule.CDSFilial
      LookupKeyFields = 'CDFILIAL'
      LookupResultField = 'NMFILIAL'
      KeyFields = 'CDFILIAL'
      Size = 60
      Lookup = True
    end
    object CDSClienteIBQContato: TDataSetField
      FieldName = 'IBQContato'
    end
    object CDSClienteDATACADASTRO: TDateTimeField
      FieldName = 'DATACADASTRO'
      Origin = 'CLIENTE.DATACADASTRO'
    end
    object CDSClienteDATAALTERACAO: TDateTimeField
      FieldName = 'DATAALTERACAO'
      Origin = 'CLIENTE.DATAALTERACAO'
    end
    object CDSClienteKMBASE: TBCDField
      FieldName = 'KMBASE'
      Origin = 'CLIENTE.KMBASE'
      Precision = 18
    end
    object CDSClienteOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'CLIENTE.OBSERVACAO'
      Size = 2000
    end
    object CDSClienteFONE1: TStringField
      FieldName = 'FONE1'
      Origin = 'CLIENTE.FONE1'
      EditMask = '!\(99\)99999-9999;1;_'
      Size = 14
    end
    object CDSClienteFONEOBS1: TStringField
      FieldName = 'FONEOBS1'
      Origin = 'CLIENTE.FONEOBS1'
      Size = 200
    end
    object CDSClienteFONE2: TStringField
      FieldName = 'FONE2'
      Origin = 'CLIENTE.FONE2'
      EditMask = '!\(99\)99999-9999;1;_'
      Size = 14
    end
    object CDSClienteFONEOBS2: TStringField
      FieldName = 'FONEOBS2'
      Origin = 'CLIENTE.FONEOBS2'
      Size = 200
    end
    object CDSClienteFONE3: TStringField
      FieldName = 'FONE3'
      Origin = 'CLIENTE.FONE3'
      EditMask = '!\(99\)99999-9999;1;_'
      Size = 14
    end
    object CDSClienteFONEOBS3: TStringField
      FieldName = 'FONEOBS3'
      Origin = 'CLIENTE.FONEOBS3'
      Size = 200
    end
    object CDSClienteFONE4: TStringField
      FieldName = 'FONE4'
      Origin = 'CLIENTE.FONE4'
      EditMask = '!\(99\)99999-9999;1;_'
      Size = 14
    end
    object CDSClienteFONEOBS4: TStringField
      FieldName = 'FONEOBS4'
      Origin = 'CLIENTE.FONEOBS4'
      Size = 200
    end
    object CDSClienteFONE5: TStringField
      FieldName = 'FONE5'
      Origin = 'CLIENTE.FONE5'
      EditMask = '!\(99\)99999-9999;1;_'
      Size = 14
    end
    object CDSClienteFONEOBS5: TStringField
      FieldName = 'FONEOBS5'
      Origin = 'CLIENTE.FONEOBS5'
      Size = 200
    end
    object CDSClienteFONE6: TStringField
      FieldName = 'FONE6'
      Origin = 'CLIENTE.FONE6'
      EditMask = '!\(99\)99999-9999;1;_'
      Size = 14
    end
    object CDSClienteFONEOBS6: TStringField
      FieldName = 'FONEOBS6'
      Origin = 'CLIENTE.FONEOBS6'
      Size = 200
    end
    object CDSClienteFONE7: TStringField
      FieldName = 'FONE7'
      EditMask = '!\(99\)99999-9999;1;_'
      Size = 14
    end
    object CDSClienteFONEOBS7: TStringField
      FieldName = 'FONEOBS7'
      Size = 200
    end
    object CDSClienteFONE8: TStringField
      FieldName = 'FONE8'
      EditMask = '!\(99\)99999-9999;1;_'
      Size = 14
    end
    object CDSClienteFONEOBS8: TStringField
      FieldName = 'FONEOBS8'
      Size = 200
    end
    object CDSClienteNMFANTASIA: TStringField
      FieldName = 'NMFANTASIA'
      Size = 256
    end
    object CDSClienteCDHABIL: TBCDField
      FieldName = 'CDHABIL'
      Precision = 18
      Size = 2
    end
    object CDSClienteCDCONDOR: TBCDField
      FieldName = 'CDCONDOR'
      Precision = 18
      Size = 2
    end
  end
  object DSCliente: TDataSource
    AutoEdit = False
    DataSet = CDSCliente
    Left = 52
    Top = 254
  end
  object IBTGenIdCliente: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 52
    Top = 302
  end
  object DSLinkCliente: TDataSource
    DataSet = IBQCliente
    Left = 52
    Top = 110
  end
  object IBSPGenIdCliente: TIBStoredProc
    Database = DModule.IBCONAzsim
    Transaction = IBTGenIdCliente
    StoredProcName = 'SP_GEN_CLIENTE_ID'
    Left = 52
    Top = 350
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptOutput
      end>
  end
  object IBTContrato: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 244
    Top = 14
  end
  object IBQContrato: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTContrato
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT BAIRRO_MON, CDCLIENTE, CDCODIFICADOR, CDCONTRATO, CDMOTIV' +
        'OCANCEL, CDRECEITA, CDRECEITAITEM, CDTIPOCOBRANCA, CDTIPOCONTRAT' +
        'O, CEP_MON, CHAVE, CIDADE_MON, CONFCHAVE, CONFLOCACAO, DATAALTER' +
        'ACAO, DATAATIVACAO, DATACADASTRO, DATAFINAL, DATAINICIAL, DIAREV' +
        'ISAO, DIAVENCIMENTO, ENDERECO_MON, INATIVO, QTDPARCELAS, TOLERAN' +
        'CIA, UF_MON, VALORATUAL, VALORINICIAL,MODELOCENTRAL,LOCALINSTALC' +
        'ENTRAL,OBSCENTRAL FROM CONTRATO;')
    UniDirectional = True
    Left = 244
    Top = 62
    object IBQContratoBAIRRO_MON: TIBStringField
      DisplayWidth = 60
      FieldName = 'BAIRRO_MON'
      Origin = 'CONTRATO.BAIRRO_MON'
      Size = 60
    end
    object IBQContratoCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'CONTRATO.CDCLIENTE'
    end
    object IBQContratoCDCODIFICADOR: TIntegerField
      FieldName = 'CDCODIFICADOR'
      Origin = 'CONTRATO.CDCODIFICADOR'
    end
    object IBQContratoCDCONTRATO: TIntegerField
      FieldName = 'CDCONTRATO'
      Origin = 'CONTRATO.CDCONTRATO'
      Required = True
    end
    object IBQContratoCDMOTIVOCANCEL: TIntegerField
      FieldName = 'CDMOTIVOCANCEL'
      Origin = 'CONTRATO.CDMOTIVOCANCEL'
    end
    object IBQContratoCDRECEITA: TIntegerField
      FieldName = 'CDRECEITA'
      Origin = 'CONTRATO.CDRECEITA'
    end
    object IBQContratoCDRECEITAITEM: TIntegerField
      FieldName = 'CDRECEITAITEM'
      Origin = 'CONTRATO.CDRECEITAITEM'
    end
    object IBQContratoCDTIPOCOBRANCA: TIntegerField
      FieldName = 'CDTIPOCOBRANCA'
      Origin = 'CONTRATO.CDTIPOCOBRANCA'
    end
    object IBQContratoCDTIPOCONTRATO: TIntegerField
      FieldName = 'CDTIPOCONTRATO'
      Origin = 'CONTRATO.CDTIPOCONTRATO'
    end
    object IBQContratoCEP_MON: TIBStringField
      FieldName = 'CEP_MON'
      Origin = 'CONTRATO.CEP_MON'
      Size = 9
    end
    object IBQContratoCHAVE: TIBStringField
      FieldName = 'CHAVE'
      Origin = 'CONTRATO.CHAVE'
    end
    object IBQContratoCIDADE_MON: TIBStringField
      DisplayWidth = 60
      FieldName = 'CIDADE_MON'
      Origin = 'CONTRATO.CIDADE_MON'
      Size = 60
    end
    object IBQContratoCONFCHAVE: TIBStringField
      FieldName = 'CONFCHAVE'
      Origin = 'CONTRATO.CONFCHAVE'
      FixedChar = True
      Size = 1
    end
    object IBQContratoCONFLOCACAO: TIBStringField
      FieldName = 'CONFLOCACAO'
      Origin = 'CONTRATO.CONFLOCACAO'
      FixedChar = True
      Size = 1
    end
    object IBQContratoDATAALTERACAO: TDateTimeField
      FieldName = 'DATAALTERACAO'
      Origin = 'CONTRATO.DATAALTERACAO'
    end
    object IBQContratoDATAATIVACAO: TDateField
      FieldName = 'DATAATIVACAO'
      Origin = 'CONTRATO.DATAATIVACAO'
    end
    object IBQContratoDATACADASTRO: TDateTimeField
      FieldName = 'DATACADASTRO'
      Origin = 'CONTRATO.DATACADASTRO'
    end
    object IBQContratoDATAFINAL: TDateField
      FieldName = 'DATAFINAL'
      Origin = 'CONTRATO.DATAFINAL'
    end
    object IBQContratoDATAINICIAL: TDateField
      FieldName = 'DATAINICIAL'
      Origin = 'CONTRATO.DATAINICIAL'
    end
    object IBQContratoDIAREVISAO: TIntegerField
      FieldName = 'DIAREVISAO'
      Origin = 'CONTRATO.DIAREVISAO'
    end
    object IBQContratoDIAVENCIMENTO: TIntegerField
      FieldName = 'DIAVENCIMENTO'
      Origin = 'CONTRATO.DIAVENCIMENTO'
    end
    object IBQContratoENDERECO_MON: TIBStringField
      FieldName = 'ENDERECO_MON'
      Origin = 'CONTRATO.ENDERECO_MON'
      Size = 60
    end
    object IBQContratoINATIVO: TIBStringField
      FieldName = 'INATIVO'
      Origin = 'CONTRATO.INATIVO'
      FixedChar = True
      Size = 1
    end
    object IBQContratoQTDPARCELAS: TIntegerField
      FieldName = 'QTDPARCELAS'
      Origin = 'CONTRATO.QTDPARCELAS'
    end
    object IBQContratoTOLERANCIA: TIntegerField
      FieldName = 'TOLERANCIA'
      Origin = 'CONTRATO.TOLERANCIA'
    end
    object IBQContratoUF_MON: TIBStringField
      FieldName = 'UF_MON'
      Origin = 'CONTRATO.UF_MON'
      Size = 2
    end
    object IBQContratoVALORATUAL: TIBBCDField
      FieldName = 'VALORATUAL'
      Origin = 'CONTRATO.VALORATUAL'
      Precision = 18
      Size = 4
    end
    object IBQContratoVALORINICIAL: TIBBCDField
      FieldName = 'VALORINICIAL'
      Origin = 'CONTRATO.VALORINICIAL'
      Precision = 18
      Size = 4
    end
    object IBQContratoMODELOCENTRAL: TIBStringField
      FieldName = 'MODELOCENTRAL'
      Origin = 'CONTRATO.MODELOCENTRAL'
      Size = 120
    end
    object IBQContratoLOCALINSTALCENTRAL: TIBStringField
      FieldName = 'LOCALINSTALCENTRAL'
      Origin = 'CONTRATO.LOCALINSTALCENTRAL'
      Size = 400
    end
    object IBQContratoOBSCENTRAL: TIBStringField
      FieldName = 'OBSCENTRAL'
      Origin = 'CONTRATO.OBSCENTRAL'
      Size = 1000
    end
  end
  object DSPContrato: TDataSetProvider
    DataSet = IBQContrato
    Constraints = True
    Left = 244
    Top = 158
  end
  object CDSContrato: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'BAIRRO_MON'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CDCLIENTE'
        DataType = ftInteger
      end
      item
        Name = 'CDCODIFICADOR'
        DataType = ftInteger
      end
      item
        Name = 'CDCONTRATO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CDMOTIVOCANCEL'
        DataType = ftInteger
      end
      item
        Name = 'CDRECEITA'
        DataType = ftInteger
      end
      item
        Name = 'CDRECEITAITEM'
        DataType = ftInteger
      end
      item
        Name = 'CDTIPOCOBRANCA'
        DataType = ftInteger
      end
      item
        Name = 'CDTIPOCONTRATO'
        DataType = ftInteger
      end
      item
        Name = 'CEP_MON'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'CHAVE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CIDADE_MON'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CONFCHAVE'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CONFLOCACAO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DATAALTERACAO'
        DataType = ftDateTime
      end
      item
        Name = 'DATAATIVACAO'
        DataType = ftDate
      end
      item
        Name = 'DATACADASTRO'
        DataType = ftDateTime
      end
      item
        Name = 'DATAFINAL'
        DataType = ftDate
      end
      item
        Name = 'DATAINICIAL'
        DataType = ftDate
      end
      item
        Name = 'DIAREVISAO'
        DataType = ftInteger
      end
      item
        Name = 'DIAVENCIMENTO'
        DataType = ftInteger
      end
      item
        Name = 'ENDERECO_MON'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'INATIVO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'QTDPARCELAS'
        DataType = ftInteger
      end
      item
        Name = 'TOLERANCIA'
        DataType = ftInteger
      end
      item
        Name = 'UF_MON'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'VALORATUAL'
        DataType = ftBCD
        Precision = 18
        Size = 4
      end
      item
        Name = 'VALORINICIAL'
        DataType = ftBCD
        Precision = 18
        Size = 4
      end
      item
        Name = 'MODELOCENTRAL'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'LOCALINSTALCENTRAL'
        DataType = ftString
        Size = 400
      end
      item
        Name = 'OBSCENTRAL'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'IBQSetor'
        DataType = ftDataSet
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DSPContrato'
    StoreDefs = True
    BeforePost = CDSContratoBeforePost
    Left = 244
    Top = 206
    object CDSContratoDETIPOCONTRATO: TStringField
      FieldKind = fkLookup
      FieldName = 'DETIPOCONTRATO'
      LookupDataSet = CDSTipoContrato
      LookupKeyFields = 'CDTIPOCONTRATO'
      LookupResultField = 'DETIPOCONTRATO'
      KeyFields = 'CDTIPOCONTRATO'
      Lookup = True
    end
    object CDSContratoDERECEITA: TStringField
      FieldKind = fkLookup
      FieldName = 'DERECEITA'
      LookupDataSet = CDSReceita
      LookupKeyFields = 'CDCONTRATORECEITA'
      LookupResultField = 'DERECEITA'
      KeyFields = 'CDRECEITA'
      Lookup = True
    end
    object CDSContratoDETIPOCOBRANCA: TStringField
      FieldKind = fkLookup
      FieldName = 'DETIPOCOBRANCA'
      LookupDataSet = CDSTipoCobranca
      LookupKeyFields = 'CDTIPOCOBRANCA'
      LookupResultField = 'DETIPOCOBRANCA'
      KeyFields = 'CDTIPOCOBRANCA'
      Lookup = True
    end
    object CDSContratoDEMOTIVOCANCEL: TStringField
      FieldKind = fkLookup
      FieldName = 'DEMOTIVOCANCEL'
      LookupDataSet = CDSMotivoCancel
      LookupKeyFields = 'CDMOTIVOCANCEL'
      LookupResultField = 'DEMOTIVOCANCEL'
      KeyFields = 'CDMOTIVOCANCEL'
      Lookup = True
    end
    object CDSContratoCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'CONTRATO.CDCLIENTE'
      OnChange = CDSContratoCDCLIENTEChange
    end
    object CDSContratoCDCODIFICADOR: TIntegerField
      FieldName = 'CDCODIFICADOR'
      Origin = 'CONTRATO.CDCODIFICADOR'
    end
    object CDSContratoCDCONTRATO: TIntegerField
      FieldName = 'CDCONTRATO'
      Origin = 'CONTRATO.CDCONTRATO'
      Required = True
    end
    object CDSContratoCDMOTIVOCANCEL: TIntegerField
      FieldName = 'CDMOTIVOCANCEL'
      Origin = 'CONTRATO.CDMOTIVOCANCEL'
    end
    object CDSContratoCDRECEITA: TIntegerField
      FieldName = 'CDRECEITA'
      Origin = 'CONTRATO.CDRECEITA'
    end
    object CDSContratoCDRECEITAITEM: TIntegerField
      FieldName = 'CDRECEITAITEM'
      Origin = 'CONTRATO.CDRECEITAITEM'
    end
    object CDSContratoCDTIPOCOBRANCA: TIntegerField
      FieldName = 'CDTIPOCOBRANCA'
      Origin = 'CONTRATO.CDTIPOCOBRANCA'
    end
    object CDSContratoCDTIPOCONTRATO: TIntegerField
      FieldName = 'CDTIPOCONTRATO'
      Origin = 'CONTRATO.CDTIPOCONTRATO'
    end
    object CDSContratoCHAVE: TStringField
      FieldName = 'CHAVE'
      Origin = 'CONTRATO.CHAVE'
    end
    object CDSContratoCONFCHAVE: TStringField
      FieldName = 'CONFCHAVE'
      Origin = 'CONTRATO.CONFCHAVE'
      FixedChar = True
      Size = 1
    end
    object CDSContratoCONFLOCACAO: TStringField
      FieldName = 'CONFLOCACAO'
      Origin = 'CONTRATO.CONFLOCACAO'
      FixedChar = True
      Size = 1
    end
    object CDSContratoDATAALTERACAO: TDateTimeField
      FieldName = 'DATAALTERACAO'
      Origin = 'CONTRATO.DATAALTERACAO'
    end
    object CDSContratoDATAATIVACAO: TDateField
      FieldName = 'DATAATIVACAO'
      Origin = 'CONTRATO.DATAATIVACAO'
      EditMask = '!99/99/0000;1;_'
    end
    object CDSContratoDATACADASTRO: TDateTimeField
      FieldName = 'DATACADASTRO'
      Origin = 'CONTRATO.DATACADASTRO'
    end
    object CDSContratoDATAFINAL: TDateField
      FieldName = 'DATAFINAL'
      Origin = 'CONTRATO.DATAFINAL'
      EditMask = '!99/99/0000;1;_'
    end
    object CDSContratoDATAINICIAL: TDateField
      FieldName = 'DATAINICIAL'
      Origin = 'CONTRATO.DATAINICIAL'
      EditMask = '!99/99/0000;1;_'
    end
    object CDSContratoDIAREVISAO: TIntegerField
      FieldName = 'DIAREVISAO'
      Origin = 'CONTRATO.DIAREVISAO'
    end
    object CDSContratoDIAVENCIMENTO: TIntegerField
      FieldName = 'DIAVENCIMENTO'
      Origin = 'CONTRATO.DIAVENCIMENTO'
    end
    object CDSContratoINATIVO: TStringField
      FieldName = 'INATIVO'
      Origin = 'CONTRATO.INATIVO'
      FixedChar = True
      Size = 1
    end
    object CDSContratoQTDPARCELAS: TIntegerField
      FieldName = 'QTDPARCELAS'
      Origin = 'CONTRATO.QTDPARCELAS'
    end
    object CDSContratoTOLERANCIA: TIntegerField
      FieldName = 'TOLERANCIA'
      Origin = 'CONTRATO.TOLERANCIA'
    end
    object CDSContratoVALORATUAL: TBCDField
      FieldName = 'VALORATUAL'
      Origin = 'CONTRATO.VALORATUAL'
      Precision = 18
    end
    object CDSContratoVALORINICIAL: TBCDField
      FieldName = 'VALORINICIAL'
      Origin = 'CONTRATO.VALORINICIAL'
      Precision = 18
    end
    object CDSContratoBAIRRO_MON: TStringField
      DisplayWidth = 60
      FieldName = 'BAIRRO_MON'
      Origin = 'CONTRATO.BAIRRO_MON'
      Size = 60
    end
    object CDSContratoCEP_MON: TStringField
      FieldName = 'CEP_MON'
      Origin = 'CONTRATO.CEP_MON'
      Size = 9
    end
    object CDSContratoCIDADE_MON: TStringField
      DisplayWidth = 60
      FieldName = 'CIDADE_MON'
      Origin = 'CONTRATO.CIDADE_MON'
      Size = 60
    end
    object CDSContratoENDERECO_MON: TStringField
      FieldName = 'ENDERECO_MON'
      Origin = 'CONTRATO.ENDERECO_MON'
      Size = 60
    end
    object CDSContratoUF_MON: TStringField
      FieldName = 'UF_MON'
      Origin = 'CONTRATO.UF_MON'
      Size = 2
    end
    object CDSContratoMODELOCENTRAL: TStringField
      FieldName = 'MODELOCENTRAL'
      Origin = 'CONTRATO.MODELOCENTRAL'
      Size = 120
    end
    object CDSContratoLOCALINSTALCENTRAL: TStringField
      FieldName = 'LOCALINSTALCENTRAL'
      Origin = 'CONTRATO.LOCALINSTALCENTRAL'
      Size = 400
    end
    object CDSContratoOBSCENTRAL: TStringField
      FieldName = 'OBSCENTRAL'
      Origin = 'CONTRATO.OBSCENTRAL'
      Size = 1000
    end
    object CDSContratoIBQSetor: TDataSetField
      FieldName = 'IBQSetor'
    end
  end
  object DSContrato: TDataSource
    DataSet = CDSContrato
    Left = 244
    Top = 255
  end
  object IBTGenIdContrato: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 244
    Top = 302
  end
  object IBSPGenIdContrato: TIBStoredProc
    Database = DModule.IBCONAzsim
    Transaction = IBTGenIdContrato
    StoredProcName = 'SP_GEN_CONTRATO_ID'
    Left = 244
    Top = 350
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptOutput
      end>
  end
  object IBTTipoContrato: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 392
    Top = 62
  end
  object IBQTipoContrato: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTTipoContrato
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT CDTIPOCONTRATO, DETIPOCONTRATO  FROM TIPOCONTRATO')
    UniDirectional = True
    Left = 392
    Top = 13
    object IBQTipoContratoCDTIPOCONTRATO: TIntegerField
      FieldName = 'CDTIPOCONTRATO'
      Origin = 'TIPOCONTRATO.CDTIPOCONTRATO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQTipoContratoDETIPOCONTRATO: TIBStringField
      FieldName = 'DETIPOCONTRATO'
      Origin = 'TIPOCONTRATO.DETIPOCONTRATO'
      Size = 30
    end
  end
  object DSPTipoContrato: TDataSetProvider
    DataSet = IBQTipoContrato
    Constraints = True
    Left = 392
    Top = 110
  end
  object CDSTipoContrato: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPTipoContrato'
    Left = 392
    Top = 157
    object CDSTipoContratoCDTIPOCONTRATO: TIntegerField
      FieldName = 'CDTIPOCONTRATO'
      Origin = 'TIPOCONTRATO.CDTIPOCONTRATO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CDSTipoContratoDETIPOCONTRATO: TStringField
      FieldName = 'DETIPOCONTRATO'
      Origin = 'TIPOCONTRATO.DETIPOCONTRATO'
      Size = 30
    end
  end
  object IBTReceita: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 472
    Top = 13
  end
  object IBQReceita: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTReceita
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT CDCONTRATORECEITA, DERECEITA FROM CONTRATORECEITA')
    Left = 472
    Top = 62
    object IBQReceitaCDCONTRATORECEITA: TIntegerField
      FieldName = 'CDCONTRATORECEITA'
      Origin = 'CONTRATORECEITA.CDCONTRATORECEITA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQReceitaDERECEITA: TIBStringField
      FieldName = 'DERECEITA'
      Origin = 'CONTRATORECEITA.DERECEITA'
      Size = 30
    end
  end
  object DSPReceita: TDataSetProvider
    DataSet = IBQReceita
    Constraints = True
    Left = 472
    Top = 110
  end
  object CDSReceita: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPReceita'
    Left = 472
    Top = 157
    object CDSReceitaCDCONTRATORECEITA: TIntegerField
      FieldName = 'CDCONTRATORECEITA'
      Origin = 'CONTRATORECEITA.CDCONTRATORECEITA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CDSReceitaDERECEITA: TStringField
      FieldName = 'DERECEITA'
      Origin = 'CONTRATORECEITA.DERECEITA'
      Size = 30
    end
  end
  object IBTTipoCobranca: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 552
    Top = 13
  end
  object IBQTipoCobranca: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTTipoCobranca
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT CDTIPOCOBRANCA, DETIPOCOBRANCA FROM TIPOCOBRANCA')
    Left = 552
    Top = 62
    object IBQTipoCobrancaCDTIPOCOBRANCA: TIntegerField
      FieldName = 'CDTIPOCOBRANCA'
      Origin = 'TIPOCOBRANCA.CDTIPOCOBRANCA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQTipoCobrancaDETIPOCOBRANCA: TIBStringField
      FieldName = 'DETIPOCOBRANCA'
      Origin = 'TIPOCOBRANCA.DETIPOCOBRANCA'
      Size = 30
    end
  end
  object DSPTipoCobranca: TDataSetProvider
    DataSet = IBQTipoCobranca
    Constraints = True
    Left = 552
    Top = 110
  end
  object CDSTipoCobranca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPTipoCobranca'
    Left = 552
    Top = 157
    object CDSTipoCobrancaCDTIPOCOBRANCA: TIntegerField
      FieldName = 'CDTIPOCOBRANCA'
      Origin = 'TIPOCOBRANCA.CDTIPOCOBRANCA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CDSTipoCobrancaDETIPOCOBRANCA: TStringField
      FieldName = 'DETIPOCOBRANCA'
      Origin = 'TIPOCOBRANCA.DETIPOCOBRANCA'
      Size = 30
    end
  end
  object IBTTipoContato: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 647
    Top = 14
  end
  object IBQTipoContato: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTTipoContato
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT CDTIPOCONTATO, DETIPOCONTATO FROM TIPOCONTATO')
    Left = 647
    Top = 63
    object IBQTipoContatoCDTIPOCONTATO: TIntegerField
      FieldName = 'CDTIPOCONTATO'
      Origin = 'TIPOCONTATO.CDTIPOCONTATO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQTipoContatoDETIPOCONTATO: TIBStringField
      FieldName = 'DETIPOCONTATO'
      Origin = 'TIPOCONTATO.DETIPOCONTATO'
      Size = 30
    end
  end
  object DSPTipoContato: TDataSetProvider
    DataSet = IBQTipoContato
    Constraints = True
    Left = 647
    Top = 111
  end
  object CDSTipoContato: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPTipoContato'
    BeforePost = CDSContatoBeforePost
    Left = 647
    Top = 158
  end
  object IBSPProcedimento: TIBStoredProc
    Database = DModule.IBCONAzsim
    Transaction = IBTGenIdProcedimento
    StoredProcName = 'SP_GEN_PROCEDIMENTO_ID'
    Left = 740
    Top = 302
  end
  object IBTProcedimento: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 740
    Top = 14
  end
  object IBQProcedimento: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTProcedimento
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT CDPROCEDIMENTO, DEPROCEDIMENTO FROM PROCEDIMENTO ORDER BY' +
        ' CDPROCEDIMENTO;')
    UniDirectional = True
    Left = 740
    Top = 62
    object IBQProcedimentoCDPROCEDIMENTO: TIntegerField
      FieldName = 'CDPROCEDIMENTO'
      Origin = 'PROCEDIMENTO.CDPROCEDIMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQProcedimentoDEPROCEDIMENTO: TIBStringField
      FieldName = 'DEPROCEDIMENTO'
      Origin = 'PROCEDIMENTO.DEPROCEDIMENTO'
      Size = 800
    end
  end
  object DSPProcedimento: TDataSetProvider
    DataSet = IBQProcedimento
    Constraints = True
    Left = 740
    Top = 110
  end
  object DSProcedimento: TDataSource
    DataSet = CDSProcedimento
    Left = 740
    Top = 207
  end
  object IBTGenIdProcedimento: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 740
    Top = 254
  end
  object IBQSetor: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTContrato
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DSLinkContrato
    SQL.Strings = (
      
        'SELECT CDCONTRATO, LOCAL, NUMSETOR FROM SETOR WHERE CDCONTRATO =' +
        ' :CDCONTRATO  ORDER BY NUMSETOR')
    UniDirectional = True
    Left = 316
    Top = 14
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CDCONTRATO'
        ParamType = ptUnknown
        Size = 4
      end>
    object IBQSetorCDCONTRATO: TIntegerField
      FieldName = 'CDCONTRATO'
      Origin = 'SETOR.CDCONTRATO'
      Required = True
    end
    object IBQSetorLOCAL: TIBStringField
      FieldName = 'LOCAL'
      Origin = 'SETOR.LOCAL'
      Size = 100
    end
    object IBQSetorNUMSETOR: TIntegerField
      FieldName = 'NUMSETOR'
      Origin = 'SETOR.NUMSETOR'
      Required = True
    end
  end
  object CDSSetor: TClientDataSet
    Aggregates = <>
    DataSetField = CDSContratoIBQSetor
    FieldDefs = <
      item
        Name = 'CDCONTRATO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'LOCAL'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'NUMSETOR'
        Attributes = [faRequired]
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 316
    Top = 62
    object CDSSetorCDCONTRATO: TIntegerField
      FieldName = 'CDCONTRATO'
      Origin = 'SETOR.CDCONTRATO'
      Required = True
    end
    object CDSSetorLOCAL: TStringField
      FieldName = 'LOCAL'
      Origin = 'SETOR.LOCAL'
      Size = 100
    end
    object CDSSetorNUMSETOR: TIntegerField
      FieldName = 'NUMSETOR'
      Origin = 'SETOR.NUMSETOR'
      Required = True
    end
  end
  object DSSetor: TDataSource
    DataSet = CDSSetor
    Left = 316
    Top = 110
  end
  object IBQConsCliente: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTConsCliente
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT'
      #9'C.CDCLIENTE,'
      #9'C.CDFILIAL,'
      #9'C.TPPESSOA,'
      #9'C.NMCLIENTE,'
      #9'C.NMFANTASIA,'
      '    CASE '
      
        '      WHEN C.NMFANTASIA IS NULL THEN C.NMCLIENTE ELSE C.NMFANTAS' +
        'IA'
      '    END AS NOME,'
      #9'C.DOCUMENTO,'
      #9'C.INSCMUNICIPAL,'
      #9'C.ENDERECO,'
      #9'C.BAIRRO,'
      #9'C.CIDADE,'
      #9'C.UF,'
      #9'C.CEP,'
      #9'C.PONTOREF,'
      #9'C.CHAVE,'
      #9'C.KMBASE,'
      #9'C.OBSERVACAO,'
      #9'C.PROCEDIMENTOS,'
      #9'C.DATACADASTRO,'
      #9'C.DATAALTERACAO,'
      #9'C.FONE1,'
      #9'C.FONEOBS1,'
      #9'C.FONE2,'
      #9'C.FONEOBS2,'
      #9'C.FONE3,'
      #9'C.FONEOBS3,'
      #9'C.FONE4,'
      #9'C.FONEOBS4,'
      #9'C.FONE5,'
      #9'C.FONEOBS5,'
      #9'C.FONE6,'
      #9'C.FONEOBS6,'
      #9'C.FONE7,'
      #9'C.FONEOBS7,'
      #9'C.FONE8,'
      #9'C.FONEOBS8,'
      '                C.CDHABIL,'
      '                C.CDCONDOR,'
      #9'CR.CDCONTRATO,'
      #9'CR.CDCODIFICADOR,'
      #9'CR.LOCALINSTALCENTRAL,'
      #9'CR.MODELOCENTRAL'
      'FROM'
      #9'CLIENTE C'
      'JOIN CONTRATO CR ON C.CDCLIENTE = CR.CDCLIENTE;')
    UniDirectional = True
    Left = 844
    Top = 62
    object IBQConsClienteCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'CLIENTE.CDCLIENTE'
      Required = True
    end
    object IBQConsClienteNMCLIENTE: TIBStringField
      FieldName = 'NMCLIENTE'
      Origin = 'CLIENTE.NMCLIENTE'
      Size = 60
    end
    object IBQConsClienteCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = 'CLIENTE.CIDADE'
      Size = 60
    end
    object IBQConsClienteENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = 'CLIENTE.ENDERECO'
      Size = 60
    end
    object IBQConsClienteCDFILIAL: TIntegerField
      FieldName = 'CDFILIAL'
      Origin = 'CLIENTE.CDFILIAL'
    end
    object IBQConsClienteTPPESSOA: TIBStringField
      FieldName = 'TPPESSOA'
      Origin = 'CLIENTE.TPPESSOA'
      FixedChar = True
      Size = 1
    end
    object IBQConsClienteNMFANTASIA: TIBStringField
      FieldName = 'NMFANTASIA'
      Origin = 'CLIENTE.NMFANTASIA'
      Size = 256
    end
    object IBQConsClienteDOCUMENTO: TIBStringField
      FieldName = 'DOCUMENTO'
      Origin = 'CLIENTE.DOCUMENTO'
    end
    object IBQConsClienteINSCMUNICIPAL: TIBStringField
      FieldName = 'INSCMUNICIPAL'
      Origin = 'CLIENTE.INSCMUNICIPAL'
      Size = 15
    end
    object IBQConsClienteBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = 'CLIENTE.BAIRRO'
      Size = 60
    end
    object IBQConsClienteUF: TIBStringField
      FieldName = 'UF'
      Origin = 'CLIENTE.UF'
      Size = 2
    end
    object IBQConsClienteCEP: TIBStringField
      FieldName = 'CEP'
      Origin = 'CLIENTE.CEP'
      Size = 9
    end
    object IBQConsClientePONTOREF: TIBStringField
      FieldName = 'PONTOREF'
      Origin = 'CLIENTE.PONTOREF'
      Size = 200
    end
    object IBQConsClienteCHAVE: TIBStringField
      FieldName = 'CHAVE'
      Origin = 'CLIENTE.CHAVE'
      Size = 15
    end
    object IBQConsClienteKMBASE: TIBBCDField
      FieldName = 'KMBASE'
      Origin = 'CLIENTE.KMBASE'
      Precision = 18
      Size = 4
    end
    object IBQConsClienteOBSERVACAO: TIBStringField
      FieldName = 'OBSERVACAO'
      Origin = 'CLIENTE.OBSERVACAO'
      Size = 2000
    end
    object IBQConsClientePROCEDIMENTOS: TIBStringField
      FieldName = 'PROCEDIMENTOS'
      Origin = 'CLIENTE.PROCEDIMENTOS'
      Size = 2000
    end
    object IBQConsClienteDATACADASTRO: TDateTimeField
      FieldName = 'DATACADASTRO'
      Origin = 'CLIENTE.DATACADASTRO'
    end
    object IBQConsClienteDATAALTERACAO: TDateTimeField
      FieldName = 'DATAALTERACAO'
      Origin = 'CLIENTE.DATAALTERACAO'
    end
    object IBQConsClienteFONE1: TIBStringField
      FieldName = 'FONE1'
      Origin = 'CLIENTE.FONE1'
      Size = 14
    end
    object IBQConsClienteFONEOBS1: TIBStringField
      FieldName = 'FONEOBS1'
      Origin = 'CLIENTE.FONEOBS1'
      Size = 200
    end
    object IBQConsClienteFONE2: TIBStringField
      FieldName = 'FONE2'
      Origin = 'CLIENTE.FONE2'
      Size = 14
    end
    object IBQConsClienteFONEOBS2: TIBStringField
      FieldName = 'FONEOBS2'
      Origin = 'CLIENTE.FONEOBS2'
      Size = 200
    end
    object IBQConsClienteFONE3: TIBStringField
      FieldName = 'FONE3'
      Origin = 'CLIENTE.FONE3'
      Size = 14
    end
    object IBQConsClienteFONEOBS3: TIBStringField
      FieldName = 'FONEOBS3'
      Origin = 'CLIENTE.FONEOBS3'
      Size = 200
    end
    object IBQConsClienteFONE4: TIBStringField
      FieldName = 'FONE4'
      Origin = 'CLIENTE.FONE4'
      Size = 14
    end
    object IBQConsClienteFONEOBS4: TIBStringField
      FieldName = 'FONEOBS4'
      Origin = 'CLIENTE.FONEOBS4'
      Size = 200
    end
    object IBQConsClienteFONE5: TIBStringField
      FieldName = 'FONE5'
      Origin = 'CLIENTE.FONE5'
      Size = 14
    end
    object IBQConsClienteFONEOBS5: TIBStringField
      FieldName = 'FONEOBS5'
      Origin = 'CLIENTE.FONEOBS5'
      Size = 200
    end
    object IBQConsClienteFONE6: TIBStringField
      FieldName = 'FONE6'
      Origin = 'CLIENTE.FONE6'
      Size = 14
    end
    object IBQConsClienteFONEOBS6: TIBStringField
      FieldName = 'FONEOBS6'
      Origin = 'CLIENTE.FONEOBS6'
      Size = 200
    end
    object IBQConsClienteFONE7: TIBStringField
      FieldName = 'FONE7'
      Origin = 'CLIENTE.FONE7'
      Size = 14
    end
    object IBQConsClienteFONEOBS7: TIBStringField
      FieldName = 'FONEOBS7'
      Origin = 'CLIENTE.FONEOBS7'
      Size = 200
    end
    object IBQConsClienteFONE8: TIBStringField
      FieldName = 'FONE8'
      Origin = 'CLIENTE.FONE8'
      Size = 14
    end
    object IBQConsClienteFONEOBS8: TIBStringField
      FieldName = 'FONEOBS8'
      Origin = 'CLIENTE.FONEOBS8'
      Size = 200
    end
    object IBQConsClienteCDCONTRATO: TIntegerField
      FieldName = 'CDCONTRATO'
      Origin = 'CONTRATO.CDCONTRATO'
      Required = True
    end
    object IBQConsClienteCDCODIFICADOR: TIntegerField
      FieldName = 'CDCODIFICADOR'
      Origin = 'CONTRATO.CDCODIFICADOR'
    end
    object IBQConsClienteLOCALINSTALCENTRAL: TIBStringField
      FieldName = 'LOCALINSTALCENTRAL'
      Origin = 'CONTRATO.LOCALINSTALCENTRAL'
      Size = 400
    end
    object IBQConsClienteMODELOCENTRAL: TIBStringField
      FieldName = 'MODELOCENTRAL'
      Origin = 'CONTRATO.MODELOCENTRAL'
      Size = 120
    end
    object IBQConsClienteNOME: TIBStringField
      FieldName = 'NOME'
      Size = 256
    end
    object IBQConsClienteCDHABIL: TIBBCDField
      FieldName = 'CDHABIL'
      Origin = 'CLIENTE.CDHABIL'
      Precision = 18
      Size = 2
    end
    object IBQConsClienteCDCONDOR: TIBBCDField
      FieldName = 'CDCONDOR'
      Origin = 'CLIENTE.CDCONDOR'
      Precision = 18
      Size = 2
    end
  end
  object DSConsCliente: TDataSource
    DataSet = CDSConsCliente
    Left = 844
    Top = 254
  end
  object IBTConsCliente: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    Params.Strings = (
      'concurrency'
      'nowait')
    AutoStopAction = saNone
    Left = 844
    Top = 14
  end
  object CDSConsCliente: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CDCLIENTE'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NMCLIENTE'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CIDADE'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'ENDERECO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CDFILIAL'
        DataType = ftInteger
      end
      item
        Name = 'TPPESSOA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NMFANTASIA'
        DataType = ftString
        Size = 256
      end
      item
        Name = 'DOCUMENTO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'INSCMUNICIPAL'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'BAIRRO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'UF'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'PONTOREF'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'CHAVE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'KMBASE'
        DataType = ftBCD
        Precision = 18
        Size = 4
      end
      item
        Name = 'OBSERVACAO'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'PROCEDIMENTOS'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'DATACADASTRO'
        DataType = ftDateTime
      end
      item
        Name = 'DATAALTERACAO'
        DataType = ftDateTime
      end
      item
        Name = 'FONE1'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'FONEOBS1'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'FONE2'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'FONEOBS2'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'FONE3'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'FONEOBS3'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'FONE4'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'FONEOBS4'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'FONE5'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'FONEOBS5'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'FONE6'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'FONEOBS6'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'FONE7'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'FONEOBS7'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'FONE8'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'FONEOBS8'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'CDCONTRATO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CDCODIFICADOR'
        DataType = ftInteger
      end
      item
        Name = 'LOCALINSTALCENTRAL'
        DataType = ftString
        Size = 400
      end
      item
        Name = 'MODELOCENTRAL'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 256
      end
      item
        Name = 'CDHABIL'
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'CDCONDOR'
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'IBQConsSetores'
        DataType = ftDataSet
      end
      item
        Name = 'IBQConsContato'
        DataType = ftDataSet
      end
      item
        Name = 'IBQConsContrato'
        DataType = ftDataSet
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DSPConsCliente'
    StoreDefs = True
    Left = 844
    Top = 206
    object CDSConsClienteCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'CLIENTE.CDCLIENTE'
      Required = True
    end
    object CDSConsClienteNMCLIENTE: TStringField
      FieldName = 'NMCLIENTE'
      Origin = 'CLIENTE.NMCLIENTE'
      Size = 60
    end
    object CDSConsClienteCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CLIENTE.CIDADE'
      Size = 60
    end
    object CDSConsClienteENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'CLIENTE.ENDERECO'
      Size = 60
    end
    object CDSConsClienteCDFILIAL: TIntegerField
      FieldName = 'CDFILIAL'
      Origin = 'CLIENTE.CDFILIAL'
    end
    object CDSConsClienteTPPESSOA: TStringField
      FieldName = 'TPPESSOA'
      Origin = 'CLIENTE.TPPESSOA'
      FixedChar = True
      Size = 1
    end
    object CDSConsClienteNMFANTASIA: TStringField
      FieldName = 'NMFANTASIA'
      Origin = 'CLIENTE.NMFANTASIA'
      Size = 256
    end
    object CDSConsClienteDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Origin = 'CLIENTE.DOCUMENTO'
    end
    object CDSConsClienteINSCMUNICIPAL: TStringField
      FieldName = 'INSCMUNICIPAL'
      Origin = 'CLIENTE.INSCMUNICIPAL'
      Size = 15
    end
    object CDSConsClienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'CLIENTE.BAIRRO'
      Size = 60
    end
    object CDSConsClienteUF: TStringField
      FieldName = 'UF'
      Origin = 'CLIENTE.UF'
      Size = 2
    end
    object CDSConsClienteCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CLIENTE.CEP'
      Size = 9
    end
    object CDSConsClientePONTOREF: TStringField
      FieldName = 'PONTOREF'
      Origin = 'CLIENTE.PONTOREF'
      Size = 200
    end
    object CDSConsClienteCHAVE: TStringField
      FieldName = 'CHAVE'
      Origin = 'CLIENTE.CHAVE'
      Size = 15
    end
    object CDSConsClienteKMBASE: TBCDField
      FieldName = 'KMBASE'
      Origin = 'CLIENTE.KMBASE'
      Precision = 18
    end
    object CDSConsClienteOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'CLIENTE.OBSERVACAO'
      Size = 2000
    end
    object CDSConsClientePROCEDIMENTOS: TStringField
      FieldName = 'PROCEDIMENTOS'
      Origin = 'CLIENTE.PROCEDIMENTOS'
      Size = 2000
    end
    object CDSConsClienteDATACADASTRO: TDateTimeField
      FieldName = 'DATACADASTRO'
      Origin = 'CLIENTE.DATACADASTRO'
    end
    object CDSConsClienteDATAALTERACAO: TDateTimeField
      FieldName = 'DATAALTERACAO'
      Origin = 'CLIENTE.DATAALTERACAO'
    end
    object CDSConsClienteCDCONTRATO: TIntegerField
      FieldName = 'CDCONTRATO'
      Origin = 'CONTRATO.CDCONTRATO'
      Required = True
    end
    object CDSConsClienteCDCODIFICADOR: TIntegerField
      FieldName = 'CDCODIFICADOR'
      Origin = 'CONTRATO.CDCODIFICADOR'
    end
    object CDSConsClienteLOCALINSTALCENTRAL: TStringField
      FieldName = 'LOCALINSTALCENTRAL'
      Origin = 'CONTRATO.LOCALINSTALCENTRAL'
      Size = 400
    end
    object CDSConsClienteMODELOCENTRAL: TStringField
      FieldName = 'MODELOCENTRAL'
      Origin = 'CONTRATO.MODELOCENTRAL'
      Size = 120
    end
    object CDSConsClienteNOME: TStringField
      FieldName = 'NOME'
      Size = 256
    end
    object CDSConsClienteIBQConsContato: TDataSetField
      FieldName = 'IBQConsContato'
    end
    object CDSConsClienteIBQConsContrato: TDataSetField
      FieldName = 'IBQConsContrato'
    end
    object CDSConsClienteIBQConsSetores: TDataSetField
      FieldName = 'IBQConsSetores'
    end
    object CDSConsClienteFONE1: TStringField
      FieldName = 'FONE1'
      Size = 14
    end
    object CDSConsClienteFONEOBS1: TStringField
      FieldName = 'FONEOBS1'
      Size = 200
    end
    object CDSConsClienteFONE2: TStringField
      FieldName = 'FONE2'
      Size = 14
    end
    object CDSConsClienteFONEOBS2: TStringField
      FieldName = 'FONEOBS2'
      Size = 200
    end
    object CDSConsClienteFONE3: TStringField
      FieldName = 'FONE3'
      Size = 14
    end
    object CDSConsClienteFONEOBS3: TStringField
      FieldName = 'FONEOBS3'
      Size = 200
    end
    object CDSConsClienteFONE4: TStringField
      FieldName = 'FONE4'
      Size = 14
    end
    object CDSConsClienteFONEOBS4: TStringField
      FieldName = 'FONEOBS4'
      Size = 200
    end
    object CDSConsClienteFONE5: TStringField
      FieldName = 'FONE5'
      Size = 14
    end
    object CDSConsClienteFONEOBS5: TStringField
      FieldName = 'FONEOBS5'
      Size = 200
    end
    object CDSConsClienteFONE6: TStringField
      FieldName = 'FONE6'
      Size = 14
    end
    object CDSConsClienteFONEOBS6: TStringField
      FieldName = 'FONEOBS6'
      Size = 200
    end
    object CDSConsClienteFONE7: TStringField
      FieldName = 'FONE7'
      Size = 14
    end
    object CDSConsClienteFONEOBS7: TStringField
      FieldName = 'FONEOBS7'
      Size = 200
    end
    object CDSConsClienteFONE8: TStringField
      FieldName = 'FONE8'
      Size = 14
    end
    object CDSConsClienteFONEOBS8: TStringField
      FieldName = 'FONEOBS8'
      Size = 200
    end
    object CDSConsClienteCDHABIL: TBCDField
      FieldName = 'CDHABIL'
      Precision = 18
      Size = 2
    end
    object CDSConsClienteCDCONDOR: TBCDField
      FieldName = 'CDCONDOR'
      Precision = 18
      Size = 2
    end
  end
  object DSPConsCliente: TDataSetProvider
    DataSet = IBQConsCliente
    Constraints = True
    Options = [poReadOnly]
    Left = 844
    Top = 160
  end
  object IBQConsContrato: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTConsCliente
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DSLinkConsCliente
    SQL.Strings = (
      
        'SELECT BAIRRO_MON, CDCLIENTE, CDCODIFICADOR, CDCONTRATO, CDMOTIV' +
        'OCANCEL, CDRECEITA, CDRECEITAITEM, CDTIPOCOBRANCA, CDTIPOCONTRAT' +
        'O, CEP_MON, CHAVE, CIDADE_MON, CONFCHAVE, CONFLOCACAO, DATAALTER' +
        'ACAO, DATAATIVACAO, DATACADASTRO, DATAFINAL, DATAINICIAL, DIAREV' +
        'ISAO, DIAVENCIMENTO, ENDERECO_MON, INATIVO, QTDPARCELAS, TOLERAN' +
        'CIA, UF_MON, VALORATUAL, VALORINICIAL, MODELOCENTRAL, LOCALINSTA' +
        'LCENTRAL FROM CONTRATO WHERE CDCLIENTE = :CDCLIENTE;'
      ''
      '    ')
    UniDirectional = True
    Left = 938
    Top = 14
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CDCLIENTE'
        ParamType = ptUnknown
        Size = 4
      end>
    object IBQConsContratoBAIRRO_MON: TIBStringField
      FieldName = 'BAIRRO_MON'
      Origin = 'CONTRATO.BAIRRO_MON'
      Size = 30
    end
    object IBQConsContratoCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'CONTRATO.CDCLIENTE'
    end
    object IBQConsContratoCDCODIFICADOR: TIntegerField
      FieldName = 'CDCODIFICADOR'
      Origin = 'CONTRATO.CDCODIFICADOR'
    end
    object IBQConsContratoCDCONTRATO: TIntegerField
      FieldName = 'CDCONTRATO'
      Origin = 'CONTRATO.CDCONTRATO'
      Required = True
    end
    object IBQConsContratoCDMOTIVOCANCEL: TIntegerField
      FieldName = 'CDMOTIVOCANCEL'
      Origin = 'CONTRATO.CDMOTIVOCANCEL'
    end
    object IBQConsContratoCDRECEITA: TIntegerField
      FieldName = 'CDRECEITA'
      Origin = 'CONTRATO.CDRECEITA'
    end
    object IBQConsContratoCDRECEITAITEM: TIntegerField
      FieldName = 'CDRECEITAITEM'
      Origin = 'CONTRATO.CDRECEITAITEM'
    end
    object IBQConsContratoCDTIPOCOBRANCA: TIntegerField
      FieldName = 'CDTIPOCOBRANCA'
      Origin = 'CONTRATO.CDTIPOCOBRANCA'
    end
    object IBQConsContratoCDTIPOCONTRATO: TIntegerField
      FieldName = 'CDTIPOCONTRATO'
      Origin = 'CONTRATO.CDTIPOCONTRATO'
    end
    object IBQConsContratoCEP_MON: TIBStringField
      FieldName = 'CEP_MON'
      Origin = 'CONTRATO.CEP_MON'
      Size = 9
    end
    object IBQConsContratoCHAVE: TIBStringField
      FieldName = 'CHAVE'
      Origin = 'CONTRATO.CHAVE'
    end
    object IBQConsContratoCIDADE_MON: TIBStringField
      FieldName = 'CIDADE_MON'
      Origin = 'CONTRATO.CIDADE_MON'
      Size = 30
    end
    object IBQConsContratoCONFCHAVE: TIBStringField
      FieldName = 'CONFCHAVE'
      Origin = 'CONTRATO.CONFCHAVE'
      FixedChar = True
      Size = 1
    end
    object IBQConsContratoCONFLOCACAO: TIBStringField
      FieldName = 'CONFLOCACAO'
      Origin = 'CONTRATO.CONFLOCACAO'
      FixedChar = True
      Size = 1
    end
    object IBQConsContratoDATAALTERACAO: TDateTimeField
      FieldName = 'DATAALTERACAO'
      Origin = 'CONTRATO.DATAALTERACAO'
    end
    object IBQConsContratoDATAATIVACAO: TDateField
      FieldName = 'DATAATIVACAO'
      Origin = 'CONTRATO.DATAATIVACAO'
    end
    object IBQConsContratoDATACADASTRO: TDateTimeField
      FieldName = 'DATACADASTRO'
      Origin = 'CONTRATO.DATACADASTRO'
    end
    object IBQConsContratoDATAFINAL: TDateField
      FieldName = 'DATAFINAL'
      Origin = 'CONTRATO.DATAFINAL'
    end
    object IBQConsContratoDATAINICIAL: TDateField
      FieldName = 'DATAINICIAL'
      Origin = 'CONTRATO.DATAINICIAL'
    end
    object IBQConsContratoDIAREVISAO: TIntegerField
      FieldName = 'DIAREVISAO'
      Origin = 'CONTRATO.DIAREVISAO'
    end
    object IBQConsContratoDIAVENCIMENTO: TIntegerField
      FieldName = 'DIAVENCIMENTO'
      Origin = 'CONTRATO.DIAVENCIMENTO'
    end
    object IBQConsContratoENDERECO_MON: TIBStringField
      FieldName = 'ENDERECO_MON'
      Origin = 'CONTRATO.ENDERECO_MON'
      Size = 60
    end
    object IBQConsContratoINATIVO: TIBStringField
      FieldName = 'INATIVO'
      Origin = 'CONTRATO.INATIVO'
      FixedChar = True
      Size = 1
    end
    object IBQConsContratoQTDPARCELAS: TIntegerField
      FieldName = 'QTDPARCELAS'
      Origin = 'CONTRATO.QTDPARCELAS'
    end
    object IBQConsContratoTOLERANCIA: TIntegerField
      FieldName = 'TOLERANCIA'
      Origin = 'CONTRATO.TOLERANCIA'
    end
    object IBQConsContratoUF_MON: TIBStringField
      FieldName = 'UF_MON'
      Origin = 'CONTRATO.UF_MON'
      Size = 2
    end
    object IBQConsContratoVALORATUAL: TIBBCDField
      FieldName = 'VALORATUAL'
      Origin = 'CONTRATO.VALORATUAL'
      Precision = 18
      Size = 4
    end
    object IBQConsContratoVALORINICIAL: TIBBCDField
      FieldName = 'VALORINICIAL'
      Origin = 'CONTRATO.VALORINICIAL'
      Precision = 18
      Size = 4
    end
    object IBQConsContratoMODELOCENTRAL: TIBStringField
      FieldName = 'MODELOCENTRAL'
      Origin = 'CONTRATO.MODELOCENTRAL'
      Size = 120
    end
    object IBQConsContratoLOCALINSTALCENTRAL: TIBStringField
      FieldName = 'LOCALINSTALCENTRAL'
      Origin = 'CONTRATO.LOCALINSTALCENTRAL'
      Size = 400
    end
  end
  object DSLinkConsCliente: TDataSource
    DataSet = IBQConsCliente
    Left = 843
    Top = 110
  end
  object DSConsContrato: TDataSource
    DataSet = CDSConsContrato
    Left = 940
    Top = 110
  end
  object CDSConsContrato: TClientDataSet
    Aggregates = <>
    DataSetField = CDSConsClienteIBQConsContrato
    FieldDefs = <
      item
        Name = 'BAIRRO_MON'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CDCLIENTE'
        DataType = ftInteger
      end
      item
        Name = 'CDCODIFICADOR'
        DataType = ftInteger
      end
      item
        Name = 'CDCONTRATO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CDMOTIVOCANCEL'
        DataType = ftInteger
      end
      item
        Name = 'CDRECEITA'
        DataType = ftInteger
      end
      item
        Name = 'CDRECEITAITEM'
        DataType = ftInteger
      end
      item
        Name = 'CDTIPOCOBRANCA'
        DataType = ftInteger
      end
      item
        Name = 'CDTIPOCONTRATO'
        DataType = ftInteger
      end
      item
        Name = 'CEP_MON'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'CHAVE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CIDADE_MON'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CONFCHAVE'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CONFLOCACAO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DATAALTERACAO'
        DataType = ftDateTime
      end
      item
        Name = 'DATAATIVACAO'
        DataType = ftDate
      end
      item
        Name = 'DATACADASTRO'
        DataType = ftDateTime
      end
      item
        Name = 'DATAFINAL'
        DataType = ftDate
      end
      item
        Name = 'DATAINICIAL'
        DataType = ftDate
      end
      item
        Name = 'DIAREVISAO'
        DataType = ftInteger
      end
      item
        Name = 'DIAVENCIMENTO'
        DataType = ftInteger
      end
      item
        Name = 'ENDERECO_MON'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'INATIVO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'QTDPARCELAS'
        DataType = ftInteger
      end
      item
        Name = 'TOLERANCIA'
        DataType = ftInteger
      end
      item
        Name = 'UF_MON'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'VALORATUAL'
        DataType = ftBCD
        Precision = 18
        Size = 4
      end
      item
        Name = 'VALORINICIAL'
        DataType = ftBCD
        Precision = 18
        Size = 4
      end
      item
        Name = 'MODELOCENTRAL'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'LOCALINSTALCENTRAL'
        DataType = ftString
        Size = 400
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 940
    Top = 62
    object CDSConsContratoCDCODIFICADOR: TIntegerField
      FieldName = 'CDCODIFICADOR'
      Origin = 'CONTRATO.CDCODIFICADOR'
    end
    object CDSConsContratoCDCONTRATO: TIntegerField
      FieldName = 'CDCONTRATO'
      Origin = 'CONTRATO.CDCONTRATO'
      Required = True
    end
    object CDSConsContratoMODELOCENTRAL: TStringField
      FieldName = 'MODELOCENTRAL'
      Origin = 'CONTRATO.MODELOCENTRAL'
      Size = 120
    end
    object CDSConsContratoLOCALINSTALCENTRAL: TStringField
      FieldName = 'LOCALINSTALCENTRAL'
      Origin = 'CONTRATO.LOCALINSTALCENTRAL'
      Size = 400
    end
  end
  object IBQTipoCliente: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTTipoCliente
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT CDTIPOCLIENTE, DETIPOCLIENTE FROM TIPOCLIENTE')
    UniDirectional = True
    Left = 144
    Top = 302
    object IBQTipoClienteCDTIPOCLIENTE: TIntegerField
      FieldName = 'CDTIPOCLIENTE'
      Origin = 'TIPOCLIENTE.CDTIPOCLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQTipoClienteDETIPOCLIENTE: TIBStringField
      FieldName = 'DETIPOCLIENTE'
      Origin = 'TIPOCLIENTE.DETIPOCLIENTE'
      Size = 30
    end
  end
  object IBTTipoCliente: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 144
    Top = 256
  end
  object DSPTipoCliente: TDataSetProvider
    DataSet = IBQTipoCliente
    Constraints = True
    UpdateMode = upWhereChanged
    Left = 144
    Top = 352
  end
  object CDSTipoCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPTipoCliente'
    Left = 144
    Top = 400
    object CDSTipoClienteCDTIPOCLIENTE: TIntegerField
      FieldName = 'CDTIPOCLIENTE'
      Origin = 'TIPOCLIENTE.CDTIPOCLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CDSTipoClienteDETIPOCLIENTE: TStringField
      FieldName = 'DETIPOCLIENTE'
      Origin = 'TIPOCLIENTE.DETIPOCLIENTE'
      Size = 30
    end
  end
  object IBTMotivoCancel: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 396
    Top = 214
  end
  object IBQMotivoCancel: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTMotivoCancel
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT CDMOTIVOCANCEL, DEMOTIVOCANCEL FROM MOTIVOCANCEL')
    Left = 396
    Top = 263
    object IBQMotivoCancelCDMOTIVOCANCEL: TIntegerField
      FieldName = 'CDMOTIVOCANCEL'
      Origin = 'MOTIVOCANCEL.CDMOTIVOCANCEL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQMotivoCancelDEMOTIVOCANCEL: TIBStringField
      FieldName = 'DEMOTIVOCANCEL'
      Origin = 'MOTIVOCANCEL.DEMOTIVOCANCEL'
      Size = 30
    end
  end
  object DSPMotivoCancel: TDataSetProvider
    DataSet = IBQMotivoCancel
    Constraints = True
    Left = 396
    Top = 311
  end
  object CDSMotivoCancel: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPMotivoCancel'
    Left = 396
    Top = 357
    object CDSMotivoCancelCDMOTIVOCANCEL: TIntegerField
      FieldName = 'CDMOTIVOCANCEL'
      Origin = 'MOTIVOCANCEL.CDMOTIVOCANCEL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CDSMotivoCancelDEMOTIVOCANCEL: TStringField
      FieldName = 'DEMOTIVOCANCEL'
      Origin = 'MOTIVOCANCEL.DEMOTIVOCANCEL'
      Size = 30
    end
  end
  object CDSProcedimento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPProcedimento'
    BeforePost = CDSProcedimentoBeforePost
    Left = 742
    Top = 159
    object CDSProcedimentoCDPROCEDIMENTO: TIntegerField
      FieldName = 'CDPROCEDIMENTO'
      Required = True
    end
    object CDSProcedimentoDEPROCEDIMENTO: TStringField
      FieldName = 'DEPROCEDIMENTO'
      Size = 800
    end
  end
  object DSLinkContrato: TDataSource
    DataSet = IBQContrato
    Left = 247
    Top = 112
  end
  object IBTConsOrdemServico: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 1052
    Top = 14
  end
  object IBQConsOrdemServico: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTConsOrdemServico
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT DISTINCT CDORDEMSERVICO, CDCLIENTE, NMCLIENTE, DATACADAST' +
        'RO, DEORDEMSERVICO, EQUIPAMENTO FROM VORDEMSERVICOS;')
    UniDirectional = True
    Left = 1052
    Top = 62
    object IBQConsOrdemServicoCDORDEMSERVICO: TIntegerField
      FieldName = 'CDORDEMSERVICO'
      Origin = 'VORDEMSERVICOS.CDORDEMSERVICO'
    end
    object IBQConsOrdemServicoCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'VORDEMSERVICOS.CDCLIENTE'
    end
    object IBQConsOrdemServicoNMCLIENTE: TIBStringField
      FieldName = 'NMCLIENTE'
      Origin = 'VORDEMSERVICOS.NMCLIENTE'
      Size = 60
    end
    object IBQConsOrdemServicoDATACADASTRO: TDateTimeField
      FieldName = 'DATACADASTRO'
      Origin = 'VORDEMSERVICOS.DATACADASTRO'
    end
    object IBQConsOrdemServicoDEORDEMSERVICO: TIBStringField
      FieldName = 'DEORDEMSERVICO'
      Origin = 'VORDEMSERVICOS.DEORDEMSERVICO'
      Size = 800
    end
    object IBQConsOrdemServicoEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
      Origin = 'VORDEMSERVICOS.EQUIPAMENTO'
    end
  end
  object DSPConsOrdemServico: TDataSetProvider
    DataSet = IBQConsOrdemServico
    Constraints = True
    Left = 1052
    Top = 110
  end
  object DSConsOrdemServico: TDataSource
    DataSet = CDSConsOrdemServico
    Left = 1052
    Top = 207
  end
  object CDSConsOrdemServico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPConsOrdemServico'
    Left = 1052
    Top = 159
    object CDSConsOrdemServicoCDORDEMSERVICO: TIntegerField
      FieldName = 'CDORDEMSERVICO'
    end
    object CDSConsOrdemServicoCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
    end
    object CDSConsOrdemServicoNMCLIENTE: TStringField
      FieldName = 'NMCLIENTE'
      Size = 60
    end
    object CDSConsOrdemServicoDATACADASTRO: TDateTimeField
      FieldName = 'DATACADASTRO'
    end
    object CDSConsOrdemServicoDEORDEMSERVICO: TStringField
      FieldName = 'DEORDEMSERVICO'
      Size = 800
    end
    object CDSConsOrdemServicoEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
    end
  end
  object IBTRelOrdemServico: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 1052
    Top = 262
  end
  object IBQRelOrdemServico: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTRelOrdemServico
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT     CDORDEMSERVICO,'
      '    CDCLIENTE,'
      '    NMCLIENTE,'
      '    EQUIPAMENTO,'
      '    DATACADASTRO,'
      '    DEORDEMSERVICO,'
      '    ISRETRABALHO,'
      '    OBSERVACAO,'
      '    ENDERECO,'
      '    BAIRRO,'
      '    CIDADE,'
      '    FONE1,'
      '    FONEOBS1,'
      '    FONE2,'
      '    FONEOBS2,'
      '    FONE3,'
      '    FONEOBS3,'
      '    FONE4,'
      '    FONEOBS4,'
      '    FONE5,'
      '    FONEOBS5,'
      '    FONE6,'
      '    FONEOBS6,'
      '    FONE7,'
      '    FONEOBS7,'
      '    FONE8,'
      '    FONEOBS8,'
      '    ISORDEMENCERRADA,'
      '    MODELOCENTRAL,'
      '    LOCALINSTALCENTRAL,'
      '    OBSCENTRAL,'
      '    NUMSETOR,'
      '    LOCAL FROM VORDEMSERVICOS;')
    UniDirectional = True
    Left = 1052
    Top = 310
    object IBQRelOrdemServicoCDORDEMSERVICO: TIntegerField
      FieldName = 'CDORDEMSERVICO'
      Origin = 'VORDEMSERVICOS.CDORDEMSERVICO'
    end
    object IBQRelOrdemServicoCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'VORDEMSERVICOS.CDCLIENTE'
    end
    object IBQRelOrdemServicoNMCLIENTE: TIBStringField
      FieldName = 'NMCLIENTE'
      Origin = 'VORDEMSERVICOS.NMCLIENTE'
      Size = 60
    end
    object IBQRelOrdemServicoEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
      Origin = 'VORDEMSERVICOS.EQUIPAMENTO'
    end
    object IBQRelOrdemServicoDATACADASTRO: TDateTimeField
      FieldName = 'DATACADASTRO'
      Origin = 'VORDEMSERVICOS.DATACADASTRO'
    end
    object IBQRelOrdemServicoDEORDEMSERVICO: TIBStringField
      FieldName = 'DEORDEMSERVICO'
      Origin = 'VORDEMSERVICOS.DEORDEMSERVICO'
      Size = 800
    end
    object IBQRelOrdemServicoISRETRABALHO: TIntegerField
      FieldName = 'ISRETRABALHO'
      Origin = 'VORDEMSERVICOS.ISRETRABALHO'
    end
    object IBQRelOrdemServicoOBSERVACAO: TIBStringField
      FieldName = 'OBSERVACAO'
      Origin = 'VORDEMSERVICOS.OBSERVACAO'
      Size = 800
    end
    object IBQRelOrdemServicoENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = 'VORDEMSERVICOS.ENDERECO'
      Size = 60
    end
    object IBQRelOrdemServicoBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = 'VORDEMSERVICOS.BAIRRO'
      Size = 60
    end
    object IBQRelOrdemServicoCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = 'VORDEMSERVICOS.CIDADE'
      Size = 60
    end
    object IBQRelOrdemServicoFONE1: TIBStringField
      FieldName = 'FONE1'
      Origin = 'VORDEMSERVICOS.FONE1'
      Size = 14
    end
    object IBQRelOrdemServicoFONEOBS1: TIBStringField
      FieldName = 'FONEOBS1'
      Origin = 'VORDEMSERVICOS.FONEOBS1'
      Size = 200
    end
    object IBQRelOrdemServicoFONE2: TIBStringField
      FieldName = 'FONE2'
      Origin = 'VORDEMSERVICOS.FONE2'
      Size = 14
    end
    object IBQRelOrdemServicoFONEOBS2: TIBStringField
      FieldName = 'FONEOBS2'
      Origin = 'VORDEMSERVICOS.FONEOBS2'
      Size = 200
    end
    object IBQRelOrdemServicoFONE3: TIBStringField
      FieldName = 'FONE3'
      Origin = 'VORDEMSERVICOS.FONE3'
      Size = 14
    end
    object IBQRelOrdemServicoFONEOBS3: TIBStringField
      FieldName = 'FONEOBS3'
      Origin = 'VORDEMSERVICOS.FONEOBS3'
      Size = 200
    end
    object IBQRelOrdemServicoFONE4: TIBStringField
      FieldName = 'FONE4'
      Origin = 'VORDEMSERVICOS.FONE4'
      Size = 14
    end
    object IBQRelOrdemServicoFONEOBS4: TIBStringField
      FieldName = 'FONEOBS4'
      Origin = 'VORDEMSERVICOS.FONEOBS4'
      Size = 200
    end
    object IBQRelOrdemServicoFONE5: TIBStringField
      FieldName = 'FONE5'
      Origin = 'VORDEMSERVICOS.FONE5'
      Size = 14
    end
    object IBQRelOrdemServicoFONEOBS5: TIBStringField
      FieldName = 'FONEOBS5'
      Origin = 'VORDEMSERVICOS.FONEOBS5'
      Size = 200
    end
    object IBQRelOrdemServicoFONE6: TIBStringField
      FieldName = 'FONE6'
      Origin = 'VORDEMSERVICOS.FONE6'
      Size = 14
    end
    object IBQRelOrdemServicoFONEOBS6: TIBStringField
      FieldName = 'FONEOBS6'
      Origin = 'VORDEMSERVICOS.FONEOBS6'
      Size = 200
    end
    object IBQRelOrdemServicoFONE7: TIBStringField
      FieldName = 'FONE7'
      Origin = 'VORDEMSERVICOS.FONE7'
      Size = 14
    end
    object IBQRelOrdemServicoFONEOBS7: TIBStringField
      FieldName = 'FONEOBS7'
      Origin = 'VORDEMSERVICOS.FONEOBS7'
      Size = 200
    end
    object IBQRelOrdemServicoFONE8: TIBStringField
      FieldName = 'FONE8'
      Origin = 'VORDEMSERVICOS.FONE8'
      Size = 14
    end
    object IBQRelOrdemServicoFONEOBS8: TIBStringField
      FieldName = 'FONEOBS8'
      Origin = 'VORDEMSERVICOS.FONEOBS8'
      Size = 200
    end
    object IBQRelOrdemServicoISORDEMENCERRADA: TIntegerField
      FieldName = 'ISORDEMENCERRADA'
      Origin = 'VORDEMSERVICOS.ISORDEMENCERRADA'
    end
    object IBQRelOrdemServicoMODELOCENTRAL: TIBStringField
      FieldName = 'MODELOCENTRAL'
      Origin = 'VORDEMSERVICOS.MODELOCENTRAL'
      Size = 120
    end
    object IBQRelOrdemServicoLOCALINSTALCENTRAL: TIBStringField
      FieldName = 'LOCALINSTALCENTRAL'
      Origin = 'VORDEMSERVICOS.LOCALINSTALCENTRAL'
      Size = 400
    end
    object IBQRelOrdemServicoOBSCENTRAL: TIBStringField
      FieldName = 'OBSCENTRAL'
      Origin = 'VORDEMSERVICOS.OBSCENTRAL'
      Size = 1000
    end
    object IBQRelOrdemServicoNUMSETOR: TIntegerField
      FieldName = 'NUMSETOR'
      Origin = 'VORDEMSERVICOS.NUMSETOR'
    end
    object IBQRelOrdemServicoLOCAL: TIBStringField
      FieldName = 'LOCAL'
      Origin = 'VORDEMSERVICOS.LOCAL'
      Size = 100
    end
  end
  object DSPRelOrdemServico: TDataSetProvider
    DataSet = IBQRelOrdemServico
    Constraints = True
    Left = 1052
    Top = 358
  end
  object DSRelOrdemServico: TDataSource
    DataSet = CDSRelOrdemServico
    Left = 1052
    Top = 455
  end
  object CDSRelOrdemServico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPRelOrdemServico'
    Left = 1052
    Top = 407
    object CDSRelOrdemServicoCDORDEMSERVICO: TIntegerField
      FieldName = 'CDORDEMSERVICO'
    end
    object CDSRelOrdemServicoCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
    end
    object CDSRelOrdemServicoNMCLIENTE: TStringField
      FieldName = 'NMCLIENTE'
      Size = 60
    end
    object CDSRelOrdemServicoEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
    end
    object CDSRelOrdemServicoDATACADASTRO: TDateTimeField
      FieldName = 'DATACADASTRO'
    end
    object CDSRelOrdemServicoDEORDEMSERVICO: TStringField
      FieldName = 'DEORDEMSERVICO'
      Size = 800
    end
    object CDSRelOrdemServicoISRETRABALHO: TIntegerField
      FieldName = 'ISRETRABALHO'
    end
    object CDSRelOrdemServicoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 800
    end
    object CDSRelOrdemServicoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object CDSRelOrdemServicoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 60
    end
    object CDSRelOrdemServicoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 60
    end
    object CDSRelOrdemServicoFONE1: TStringField
      FieldName = 'FONE1'
      Size = 14
    end
    object CDSRelOrdemServicoFONEOBS1: TStringField
      FieldName = 'FONEOBS1'
      Size = 200
    end
    object CDSRelOrdemServicoFONE2: TStringField
      FieldName = 'FONE2'
      Size = 14
    end
    object CDSRelOrdemServicoFONEOBS2: TStringField
      FieldName = 'FONEOBS2'
      Size = 200
    end
    object CDSRelOrdemServicoFONE3: TStringField
      FieldName = 'FONE3'
      Size = 14
    end
    object CDSRelOrdemServicoFONEOBS3: TStringField
      FieldName = 'FONEOBS3'
      Size = 200
    end
    object CDSRelOrdemServicoFONE4: TStringField
      FieldName = 'FONE4'
      Size = 14
    end
    object CDSRelOrdemServicoFONEOBS4: TStringField
      FieldName = 'FONEOBS4'
      Size = 200
    end
    object CDSRelOrdemServicoFONE5: TStringField
      FieldName = 'FONE5'
      Size = 14
    end
    object CDSRelOrdemServicoFONEOBS5: TStringField
      FieldName = 'FONEOBS5'
      Size = 200
    end
    object CDSRelOrdemServicoFONE6: TStringField
      FieldName = 'FONE6'
      Size = 14
    end
    object CDSRelOrdemServicoFONEOBS6: TStringField
      FieldName = 'FONEOBS6'
      Size = 200
    end
    object CDSRelOrdemServicoFONE7: TStringField
      FieldName = 'FONE7'
      Size = 14
    end
    object CDSRelOrdemServicoFONEOBS7: TStringField
      FieldName = 'FONEOBS7'
      Size = 200
    end
    object CDSRelOrdemServicoFONE8: TStringField
      FieldName = 'FONE8'
      Size = 14
    end
    object CDSRelOrdemServicoFONEOBS8: TStringField
      FieldName = 'FONEOBS8'
      Size = 200
    end
    object CDSRelOrdemServicoISORDEMENCERRADA: TIntegerField
      FieldName = 'ISORDEMENCERRADA'
    end
    object CDSRelOrdemServicoMODELOCENTRAL: TStringField
      FieldName = 'MODELOCENTRAL'
      Size = 120
    end
    object CDSRelOrdemServicoLOCALINSTALCENTRAL: TStringField
      FieldName = 'LOCALINSTALCENTRAL'
      Size = 400
    end
    object CDSRelOrdemServicoOBSCENTRAL: TStringField
      FieldName = 'OBSCENTRAL'
      Size = 1000
    end
    object CDSRelOrdemServicoNUMSETOR: TIntegerField
      FieldName = 'NUMSETOR'
    end
    object CDSRelOrdemServicoLOCAL: TStringField
      FieldName = 'LOCAL'
      Size = 100
    end
  end
  object DSConsContato: TDataSource
    DataSet = CDSConsContato
    Left = 941
    Top = 256
  end
  object CDSConsContato: TClientDataSet
    Aggregates = <>
    DataSetField = CDSConsClienteIBQConsContato
    FieldDefs = <
      item
        Name = 'CDCLIENTECONTATO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CDCLIENTE'
        DataType = ftInteger
      end
      item
        Name = 'NMCONTATO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CDTIPOCONTATO'
        DataType = ftInteger
      end
      item
        Name = 'PARENTESCO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ENDERECO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'BAIRRO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CIDADE'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'UF'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'FONE1'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'FONE1OBS'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'FONE2'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'FONE2OBS'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'FONE3'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'FONE3OBS'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'FONE4'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'FONE4OBS'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'OBSERVACAO'
        DataType = ftString
        Size = 600
      end
      item
        Name = 'SENHA'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'CONTRASENHA'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DATANASCIMENTO'
        DataType = ftDate
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 941
    Top = 208
    object CDSConsContatoCDCLIENTECONTATO: TIntegerField
      FieldName = 'CDCLIENTECONTATO'
      Origin = 'CLIENTECONTATO.CDCLIENTECONTATO'
      Required = True
    end
    object CDSConsContatoCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'CLIENTECONTATO.CDCLIENTE'
    end
    object CDSConsContatoNMCONTATO: TStringField
      FieldName = 'NMCONTATO'
      Origin = 'CLIENTECONTATO.NMCONTATO'
      Size = 60
    end
    object CDSConsContatoCDTIPOCONTATO: TIntegerField
      FieldName = 'CDTIPOCONTATO'
      Origin = 'CLIENTECONTATO.CDTIPOCONTATO'
    end
    object CDSConsContatoPARENTESCO: TStringField
      FieldName = 'PARENTESCO'
      Origin = 'CLIENTECONTATO.PARENTESCO'
      Size = 30
    end
    object CDSConsContatoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'CLIENTECONTATO.ENDERECO'
      Size = 60
    end
    object CDSConsContatoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'CLIENTECONTATO.BAIRRO'
      Size = 30
    end
    object CDSConsContatoCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CLIENTECONTATO.CIDADE'
      Size = 30
    end
    object CDSConsContatoUF: TStringField
      FieldName = 'UF'
      Origin = 'CLIENTECONTATO.UF'
      Size = 2
    end
    object CDSConsContatoCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CLIENTECONTATO.CEP'
      Size = 9
    end
    object CDSConsContatoFONE1: TStringField
      FieldName = 'FONE1'
      Origin = 'CLIENTECONTATO.FONE1'
      Size = 13
    end
    object CDSConsContatoFONE1OBS: TStringField
      FieldName = 'FONE1OBS'
      Origin = 'CLIENTECONTATO.FONE1OBS'
      Size = 30
    end
    object CDSConsContatoFONE2: TStringField
      FieldName = 'FONE2'
      Origin = 'CLIENTECONTATO.FONE2'
      Size = 13
    end
    object CDSConsContatoFONE2OBS: TStringField
      FieldName = 'FONE2OBS'
      Origin = 'CLIENTECONTATO.FONE2OBS'
      Size = 30
    end
    object CDSConsContatoFONE3: TStringField
      FieldName = 'FONE3'
      Origin = 'CLIENTECONTATO.FONE3'
      Size = 13
    end
    object CDSConsContatoFONE3OBS: TStringField
      FieldName = 'FONE3OBS'
      Origin = 'CLIENTECONTATO.FONE3OBS'
      Size = 30
    end
    object CDSConsContatoFONE4: TStringField
      FieldName = 'FONE4'
      Origin = 'CLIENTECONTATO.FONE4'
      Size = 13
    end
    object CDSConsContatoFONE4OBS: TStringField
      FieldName = 'FONE4OBS'
      Origin = 'CLIENTECONTATO.FONE4OBS'
      Size = 30
    end
    object CDSConsContatoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'CLIENTECONTATO.OBSERVACAO'
      Size = 600
    end
    object CDSConsContatoSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'CLIENTECONTATO.SENHA'
      Size = 100
    end
    object CDSConsContatoCONTRASENHA: TStringField
      FieldName = 'CONTRASENHA'
      Origin = 'CLIENTECONTATO.CONTRASENHA'
      Size = 100
    end
    object CDSConsContatoDATANASCIMENTO: TDateField
      FieldName = 'DATANASCIMENTO'
      Origin = 'CLIENTECONTATO.DATANASCIMENTO'
    end
  end
  object IBQConsContato: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTConsCliente
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DSLinkConsCliente
    SQL.Strings = (
      
        'SELECT CDCLIENTECONTATO, CDCLIENTE, NMCONTATO, CDTIPOCONTATO, PA' +
        'RENTESCO, ENDERECO, BAIRRO, CIDADE, UF, CEP, FONE1, FONE1OBS, FO' +
        'NE2, FONE2OBS, FONE3, FONE3OBS, FONE4, FONE4OBS, OBSERVACAO, SEN' +
        'HA, CONTRASENHA, DATANASCIMENTO FROM CLIENTECONTATO WHERE CDCLIE' +
        'NTE= :CDCLIENTE;'
      ''
      '    ')
    UniDirectional = True
    Left = 939
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CDCLIENTE'
        ParamType = ptUnknown
        Size = 4
      end>
    object IBQConsContatoCDCLIENTECONTATO: TIntegerField
      FieldName = 'CDCLIENTECONTATO'
      Origin = 'CLIENTECONTATO.CDCLIENTECONTATO'
      Required = True
    end
    object IBQConsContatoCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'CLIENTECONTATO.CDCLIENTE'
    end
    object IBQConsContatoNMCONTATO: TIBStringField
      FieldName = 'NMCONTATO'
      Origin = 'CLIENTECONTATO.NMCONTATO'
      Size = 60
    end
    object IBQConsContatoCDTIPOCONTATO: TIntegerField
      FieldName = 'CDTIPOCONTATO'
      Origin = 'CLIENTECONTATO.CDTIPOCONTATO'
    end
    object IBQConsContatoPARENTESCO: TIBStringField
      FieldName = 'PARENTESCO'
      Origin = 'CLIENTECONTATO.PARENTESCO'
      Size = 30
    end
    object IBQConsContatoENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = 'CLIENTECONTATO.ENDERECO'
      Size = 60
    end
    object IBQConsContatoBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = 'CLIENTECONTATO.BAIRRO'
      Size = 30
    end
    object IBQConsContatoCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = 'CLIENTECONTATO.CIDADE'
      Size = 30
    end
    object IBQConsContatoUF: TIBStringField
      FieldName = 'UF'
      Origin = 'CLIENTECONTATO.UF'
      Size = 2
    end
    object IBQConsContatoCEP: TIBStringField
      FieldName = 'CEP'
      Origin = 'CLIENTECONTATO.CEP'
      Size = 9
    end
    object IBQConsContatoFONE1: TIBStringField
      FieldName = 'FONE1'
      Origin = 'CLIENTECONTATO.FONE1'
      Size = 13
    end
    object IBQConsContatoFONE1OBS: TIBStringField
      FieldName = 'FONE1OBS'
      Origin = 'CLIENTECONTATO.FONE1OBS'
      Size = 30
    end
    object IBQConsContatoFONE2: TIBStringField
      FieldName = 'FONE2'
      Origin = 'CLIENTECONTATO.FONE2'
      Size = 13
    end
    object IBQConsContatoFONE2OBS: TIBStringField
      FieldName = 'FONE2OBS'
      Origin = 'CLIENTECONTATO.FONE2OBS'
      Size = 30
    end
    object IBQConsContatoFONE3: TIBStringField
      FieldName = 'FONE3'
      Origin = 'CLIENTECONTATO.FONE3'
      Size = 13
    end
    object IBQConsContatoFONE3OBS: TIBStringField
      FieldName = 'FONE3OBS'
      Origin = 'CLIENTECONTATO.FONE3OBS'
      Size = 30
    end
    object IBQConsContatoFONE4: TIBStringField
      FieldName = 'FONE4'
      Origin = 'CLIENTECONTATO.FONE4'
      Size = 13
    end
    object IBQConsContatoFONE4OBS: TIBStringField
      FieldName = 'FONE4OBS'
      Origin = 'CLIENTECONTATO.FONE4OBS'
      Size = 30
    end
    object IBQConsContatoOBSERVACAO: TIBStringField
      FieldName = 'OBSERVACAO'
      Origin = 'CLIENTECONTATO.OBSERVACAO'
      Size = 600
    end
    object IBQConsContatoSENHA: TIBStringField
      FieldName = 'SENHA'
      Origin = 'CLIENTECONTATO.SENHA'
      Size = 100
    end
    object IBQConsContatoCONTRASENHA: TIBStringField
      FieldName = 'CONTRASENHA'
      Origin = 'CLIENTECONTATO.CONTRASENHA'
      Size = 100
    end
    object IBQConsContatoDATANASCIMENTO: TDateField
      FieldName = 'DATANASCIMENTO'
      Origin = 'CLIENTECONTATO.DATANASCIMENTO'
    end
  end
  object DSConsSetores: TDataSource
    DataSet = CDSConsSetores
    Left = 941
    Top = 400
  end
  object CDSConsSetores: TClientDataSet
    Aggregates = <>
    DataSetField = CDSConsClienteIBQConsSetores
    FieldDefs = <
      item
        Name = 'NUMSETOR'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'LOCAL'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'MODELOCENTRAL'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'LOCALINSTALCENTRAL'
        DataType = ftString
        Size = 400
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 941
    Top = 352
    object CDSConsSetoresNUMSETOR: TIntegerField
      FieldName = 'NUMSETOR'
      Origin = 'SETOR.NUMSETOR'
      Required = True
    end
    object CDSConsSetoresLOCAL: TStringField
      FieldName = 'LOCAL'
      Origin = 'SETOR.LOCAL'
      Size = 100
    end
    object CDSConsSetoresMODELOCENTRAL: TStringField
      FieldName = 'MODELOCENTRAL'
      Origin = 'CONTRATO.MODELOCENTRAL'
      Size = 120
    end
    object CDSConsSetoresLOCALINSTALCENTRAL: TStringField
      FieldName = 'LOCALINSTALCENTRAL'
      Origin = 'CONTRATO.LOCALINSTALCENTRAL'
      Size = 400
    end
  end
  object IBQConsSetores: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTConsCliente
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DSLinkConsCliente
    SQL.Strings = (
      
        'SELECT S.NUMSETOR, S.LOCAL, CO.MODELOCENTRAL, CO.LOCALINSTALCENT' +
        'RAL FROM SETOR S'
      'INNER JOIN CONTRATO CO ON CO.CDCONTRATO = S.CDCONTRATO'
      'WHERE CO.CDCODIFICADOR = :CDCODIFICADOR ORDER BY S.NUMSETOR;')
    UniDirectional = True
    Left = 939
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CDCODIFICADOR'
        ParamType = ptUnknown
        Size = 4
      end>
    object IBQConsSetoresNUMSETOR: TIntegerField
      FieldName = 'NUMSETOR'
      Origin = 'SETOR.NUMSETOR'
      Required = True
    end
    object IBQConsSetoresLOCAL: TIBStringField
      FieldName = 'LOCAL'
      Origin = 'SETOR.LOCAL'
      Size = 100
    end
    object IBQConsSetoresMODELOCENTRAL: TIBStringField
      FieldName = 'MODELOCENTRAL'
      Origin = 'CONTRATO.MODELOCENTRAL'
      Size = 120
    end
    object IBQConsSetoresLOCALINSTALCENTRAL: TIBStringField
      FieldName = 'LOCALINSTALCENTRAL'
      Origin = 'CONTRATO.LOCALINSTALCENTRAL'
      Size = 400
    end
  end
  object IBTRelNaoIdentificados: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 1180
    Top = 14
  end
  object DSPRelNaoIdentificados: TDataSetProvider
    DataSet = IBQRelNaoIdentificados
    Constraints = True
    Left = 1181
    Top = 110
  end
  object CDSRelNaoIdentificados: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPRelNaoIdentificados'
    Left = 1182
    Top = 159
    object CDSRelNaoIdentificadosCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Required = True
    end
    object CDSRelNaoIdentificadosNMCLIENTE: TStringField
      FieldName = 'NMCLIENTE'
      Size = 60
    end
    object CDSRelNaoIdentificadosCDCODIFICADOR: TIntegerField
      FieldName = 'CDCODIFICADOR'
    end
    object CDSRelNaoIdentificadosDATAULTIMOEVENTO: TDateTimeField
      FieldName = 'DATAULTIMOEVENTO'
    end
    object CDSRelNaoIdentificadosULTIMOEVENTO: TStringField
      FieldName = 'ULTIMOEVENTO'
      Size = 100
    end
  end
  object DSRelNaoIdentificados: TDataSource
    DataSet = CDSRelNaoIdentificados
    Left = 1183
    Top = 207
  end
  object IBQRelNaoIdentificados: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTRelNaoIdentificados
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM SP_CONS_LOGULTIMOESTADO('
      #9':NUMDIAS'
      ') ORDER BY DATAULTIMOEVENTO;')
    Left = 1181
    Top = 62
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMDIAS'
        ParamType = ptInput
      end>
  end
end
