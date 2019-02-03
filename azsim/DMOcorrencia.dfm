object fdmOcorrencia: TfdmOcorrencia
  OldCreateOrder = False
  Left = 189
  Top = 273
  Height = 392
  Width = 938
  object DSLinkCliente: TDataSource
    DataSet = IBQCliente
    Left = 511
    Top = 64
  end
  object IBTCliente: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 511
    Top = 12
  end
  object DSContato: TDataSource
    DataSet = CDSContato
    Left = 439
    Top = 222
  end
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
    Left = 439
    Top = 115
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
    ReadOnly = True
    Left = 439
    Top = 169
    object CDSContatoNMCONTATO: TStringField
      FieldName = 'NMCONTATO'
      Origin = 'CLIENTECONTATO.NMCONTATO'
      Required = True
      Size = 60
    end
    object CDSContatoCDTIPOCONTATO: TIntegerField
      FieldName = 'CDTIPOCONTATO'
      Origin = 'CLIENTECONTATO.CDTIPOCONTATO'
      Required = True
    end
    object CDSContatoPARENTESCO: TStringField
      FieldName = 'PARENTESCO'
      Origin = 'CLIENTECONTATO.PARENTESCO'
      Size = 30
    end
    object CDSContatoFONE1: TStringField
      FieldName = 'FONE1'
      Origin = 'CLIENTECONTATO.FONE1'
      Size = 13
    end
    object CDSContatoFONE1OBS: TStringField
      FieldName = 'FONE1OBS'
      Origin = 'CLIENTECONTATO.FONE1OBS'
      Size = 30
    end
    object CDSContatoFONE2: TStringField
      FieldName = 'FONE2'
      Origin = 'CLIENTECONTATO.FONE2'
      Size = 13
    end
    object CDSContatoFONE2OBS: TStringField
      FieldName = 'FONE2OBS'
      Origin = 'CLIENTECONTATO.FONE2OBS'
      Size = 30
    end
    object CDSContatoFONE3: TStringField
      FieldName = 'FONE3'
      Origin = 'CLIENTECONTATO.FONE3'
      Size = 13
    end
    object CDSContatoFONE3OBS: TStringField
      FieldName = 'FONE3OBS'
      Origin = 'CLIENTECONTATO.FONE3OBS'
      Size = 30
    end
    object CDSContatoFONE4: TStringField
      FieldName = 'FONE4'
      Origin = 'CLIENTECONTATO.FONE4'
      Size = 13
    end
    object CDSContatoFONE4OBS: TStringField
      FieldName = 'FONE4OBS'
      Origin = 'CLIENTECONTATO.FONE4OBS'
      Size = 30
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
  object DSCliente: TDataSource
    DataSet = CDSCliente
    Left = 511
    Top = 274
  end
  object IBQCliente: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTCliente
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT C.CDCLIENTE, C.NMCLIENTE, C.NMFANTASIA, C.ENDERECO, C.BAI' +
        'RRO, C.CIDADE, C.PONTOREF, '
      
        '    C.FONE1, C.FONEOBS1, C.FONE2, C.FONEOBS2, C.FONE3,C.FONEOBS3' +
        ',C.FONE4,C.FONEOBS4,'
      
        '    C.FONE5,C.FONEOBS5,C.FONE6,C.FONEOBS6,  C.FONE7,C.FONEOBS7,C' +
        '.FONE8,C.FONEOBS8, C.OBSERVACAO'
      'FROM CLIENTE C WHERE C.CDCLIENTE = :CDCLIENTE;')
    UniDirectional = True
    Left = 511
    Top = 116
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CDCLIENTE'
        ParamType = ptUnknown
      end>
    object IBQClienteCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'CLIENTE.CDCLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQClienteNMCLIENTE: TIBStringField
      FieldName = 'NMCLIENTE'
      Origin = 'CLIENTE.NMCLIENTE'
      Size = 60
    end
    object IBQClienteENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = 'CLIENTE.ENDERECO'
      Size = 60
    end
    object IBQClienteBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = 'CLIENTE.BAIRRO'
      Size = 60
    end
    object IBQClienteCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = 'CLIENTE.CIDADE'
      Size = 60
    end
    object IBQClientePONTOREF: TIBStringField
      FieldName = 'PONTOREF'
      Origin = 'CLIENTE.PONTOREF'
      Size = 200
    end
    object IBQClienteNMFANTASIA: TIBStringField
      FieldName = 'NMFANTASIA'
      Origin = 'CLIENTE.NMFANTASIA'
      Size = 256
    end
    object IBQClienteFONE1: TIBStringField
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
      FieldName = 'FONE8'
      Origin = 'CLIENTE.FONE8'
      Size = 14
    end
    object IBQClienteFONEOBS8: TIBStringField
      FieldName = 'FONEOBS8'
      Origin = 'CLIENTE.FONEOBS8'
      Size = 200
    end
    object IBQClienteOBSERVACAO: TIBStringField
      FieldName = 'OBSERVACAO'
      Origin = 'CLIENTE.OBSERVACAO'
      Size = 2000
    end
  end
  object DSPCliente: TDataSetProvider
    DataSet = IBQCliente
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 511
    Top = 169
  end
  object CDSCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPCliente'
    ReadOnly = True
    Left = 511
    Top = 221
    object CDSClienteCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Required = True
    end
    object CDSClienteNMCLIENTE: TStringField
      FieldName = 'NMCLIENTE'
      Size = 60
    end
    object CDSClienteENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object CDSClienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 60
    end
    object CDSClienteCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 60
    end
    object CDSClientePONTOREF: TStringField
      FieldName = 'PONTOREF'
      Size = 200
    end
    object CDSClienteOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 2000
    end
    object CDSClienteIBQContato: TDataSetField
      FieldName = 'IBQContato'
    end
    object CDSClienteNMFANTASIA: TStringField
      FieldName = 'NMFANTASIA'
      Size = 256
    end
    object CDSClienteFONE1: TStringField
      FieldName = 'FONE1'
      Size = 14
    end
    object CDSClienteFONEOBS1: TStringField
      FieldName = 'FONEOBS1'
      Size = 200
    end
    object CDSClienteFONE2: TStringField
      FieldName = 'FONE2'
      Size = 14
    end
    object CDSClienteFONEOBS2: TStringField
      FieldName = 'FONEOBS2'
      Size = 200
    end
    object CDSClienteFONE3: TStringField
      FieldName = 'FONE3'
      Size = 14
    end
    object CDSClienteFONEOBS3: TStringField
      FieldName = 'FONEOBS3'
      Size = 200
    end
    object CDSClienteFONE4: TStringField
      FieldName = 'FONE4'
      Size = 14
    end
    object CDSClienteFONEOBS4: TStringField
      FieldName = 'FONEOBS4'
      Size = 200
    end
    object CDSClienteFONE5: TStringField
      FieldName = 'FONE5'
      Size = 14
    end
    object CDSClienteFONEOBS5: TStringField
      FieldName = 'FONEOBS5'
      Size = 200
    end
    object CDSClienteFONE6: TStringField
      FieldName = 'FONE6'
      Size = 14
    end
    object CDSClienteFONEOBS6: TStringField
      FieldName = 'FONEOBS6'
      Size = 200
    end
    object CDSClienteFONE7: TStringField
      FieldName = 'FONE7'
      Size = 14
    end
    object CDSClienteFONEOBS7: TStringField
      FieldName = 'FONEOBS7'
      Size = 200
    end
    object CDSClienteFONE8: TStringField
      FieldName = 'FONE8'
      Size = 14
    end
    object CDSClienteFONEOBS8: TStringField
      FieldName = 'FONEOBS8'
      Size = 200
    end
  end
  object CDSAgente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPAgente'
    Left = 104
    Top = 179
    object CDSAgenteCDUSUARIO: TIntegerField
      FieldName = 'CDUSUARIO'
      Origin = 'USUARIO.CDUSUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CDSAgenteLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = 'USUARIO.LOGIN'
    end
  end
  object DSPAgente: TDataSetProvider
    DataSet = IBQAgente
    Constraints = True
    Left = 104
    Top = 123
  end
  object IBQAgente: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTAgente
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT CDUSUARIO, LOGIN FROM USUARIO WHERE CDTIPOUSUARIO = 2 ORD' +
        'ER BY LOGIN')
    UniDirectional = True
    Left = 104
    Top = 67
    object IBQAgenteCDUSUARIO: TIntegerField
      FieldName = 'CDUSUARIO'
      Origin = 'USUARIO.CDUSUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQAgenteLOGIN: TIBStringField
      FieldName = 'LOGIN'
      Origin = 'USUARIO.LOGIN'
    end
  end
  object IBTAgente: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 104
    Top = 11
  end
  object IBTOperador: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 192
    Top = 11
  end
  object IBQOperador: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTOperador
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT CDUSUARIO, LOGIN FROM USUARIO WHERE CDTIPOUSUARIO = 1 ORD' +
        'ER BY LOGIN')
    UniDirectional = True
    Left = 192
    Top = 63
    object IntegerField9: TIntegerField
      FieldName = 'CDUSUARIO'
      Origin = 'USUARIO.CDUSUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQOperadorLOGIN: TIBStringField
      FieldName = 'LOGIN'
      Origin = 'USUARIO.LOGIN'
    end
  end
  object DSPOperador: TDataSetProvider
    DataSet = IBQOperador
    Constraints = True
    Left = 192
    Top = 115
  end
  object CDSOperador: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPOperador'
    Left = 192
    Top = 168
    object IntegerField10: TIntegerField
      FieldName = 'CDUSUARIO'
      Origin = 'USUARIO.CDUSUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CDSOperadorLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = 'USUARIO.LOGIN'
    end
  end
  object IBTSetores: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 274
    Top = 13
  end
  object IBTOcorrencia: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 355
    Top = 13
  end
  object DSSetores: TDataSource
    DataSet = CDSSetores
    Left = 274
    Top = 223
  end
  object DSOcorrencia: TDataSource
    DataSet = CDSOcorrencia
    Left = 355
    Top = 65
  end
  object IBQOcorrencia: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTOcorrencia
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      
        '    O.CDOCORRENCIA, O.CDOCORRENCIAPAI, O.PORTACOM, O.NREVENTO, O' +
        '.TIPOCTX, O.CTX, O.EQUIPAMENTO, O.STATUS || '#39'.'#39' || REPLACE(O.REF' +
        'ERENCIA, '#39'F'#39', '#39'*'#39') AS STATUS, '
      
        '    O.DESTATUS, O.NUMSETOR, O.LOCAL, O.CDCLIENTE, O.CDORDEMSERVI' +
        'CO, O.DATACADASTRO, O.DATAEVENTO,'
      '    CASE'
      '       WHEN DATAATENDIMENTO IS NULL THEN CURRENT_TIMESTAMP'
      '       ELSE  DATAATENDIMENTO'
      
        '    END AS DATAATENDIMENTO, O.CDAGENTE, O.CDOPERADORABERTURA, O.' +
        'CDOPERADORENCERRAMENTO, O.HORASAIDAEMP, O.HORASAIDALOCAL, '
      
        '    O.HORAABERTURALACRE, O.KMSAIDA, O.HORACHEGADALOCAL, O.HORACH' +
        'EGADAEMP, O.LACRE, O.KMRETORNO, O.TEMPODESOLOCAMENTO, '
      
        '    O.TEMPORETORNO, O.TEMPOATENDIMENTO, O.KMTOTALPERCORRIDO, O.R' +
        'ESUMO, O.CDTIPOOCORRENCIA, O.CDSUBTIPOOCORRENCIA, '
      
        '    O.OCORRENCIAPOLICIAL, O.ISOCORRENCIAPOLICIAL, O.DATAENCERRAM' +
        'ENTO, O.ISOCORRENCIAENCERRADA, CN.CHAVE'
      
        'FROM OCORRENCIA O  LEFT JOIN CONTRATO CN ON O.EQUIPAMENTO = CN.C' +
        'DCODIFICADOR WHERE O.CDOCORRENCIA = :CDOCORRENCIA;')
    UniDirectional = True
    Left = 355
    Top = 117
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CDOCORRENCIA'
        ParamType = ptUnknown
      end>
    object IBQOcorrenciaCDOCORRENCIA: TIntegerField
      FieldName = 'CDOCORRENCIA'
      Origin = 'OCORRENCIA.CDOCORRENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQOcorrenciaCDOCORRENCIAPAI: TIntegerField
      FieldName = 'CDOCORRENCIAPAI'
      Origin = 'OCORRENCIA.CDOCORRENCIAPAI'
    end
    object IBQOcorrenciaPORTACOM: TIntegerField
      FieldName = 'PORTACOM'
      Origin = 'OCORRENCIA.PORTACOM'
    end
    object IBQOcorrenciaNREVENTO: TIntegerField
      FieldName = 'NREVENTO'
      Origin = 'OCORRENCIA.NREVENTO'
    end
    object IBQOcorrenciaTIPOCTX: TIBStringField
      FieldName = 'TIPOCTX'
      Origin = 'OCORRENCIA.TIPOCTX'
      Size = 3
    end
    object IBQOcorrenciaCTX: TIntegerField
      FieldName = 'CTX'
      Origin = 'OCORRENCIA.CTX'
    end
    object IBQOcorrenciaEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
      Origin = 'OCORRENCIA.EQUIPAMENTO'
    end
    object IBQOcorrenciaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Size = 4
    end
    object IBQOcorrenciaDESTATUS: TIBStringField
      FieldName = 'DESTATUS'
      Origin = 'OCORRENCIA.DESTATUS'
      Size = 70
    end
    object IBQOcorrenciaNUMSETOR: TIntegerField
      FieldName = 'NUMSETOR'
      Origin = 'OCORRENCIA.NUMSETOR'
    end
    object IBQOcorrenciaLOCAL: TIBStringField
      FieldName = 'LOCAL'
      Origin = 'OCORRENCIA.LOCAL'
      Size = 100
    end
    object IBQOcorrenciaCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'OCORRENCIA.CDCLIENTE'
    end
    object IBQOcorrenciaCDORDEMSERVICO: TIntegerField
      FieldName = 'CDORDEMSERVICO'
      Origin = 'OCORRENCIA.CDORDEMSERVICO'
    end
    object IBQOcorrenciaDATACADASTRO: TDateTimeField
      FieldName = 'DATACADASTRO'
      Origin = 'OCORRENCIA.DATACADASTRO'
    end
    object IBQOcorrenciaDATAEVENTO: TDateTimeField
      DisplayWidth = 20
      FieldName = 'DATAEVENTO'
      Origin = 'OCORRENCIA.DATAEVENTO'
    end
    object IBQOcorrenciaDATAATENDIMENTO: TDateTimeField
      FieldName = 'DATAATENDIMENTO'
    end
    object IBQOcorrenciaCDAGENTE: TIntegerField
      FieldName = 'CDAGENTE'
      Origin = 'OCORRENCIA.CDAGENTE'
    end
    object IBQOcorrenciaCDOPERADORABERTURA: TIntegerField
      FieldName = 'CDOPERADORABERTURA'
      Origin = 'OCORRENCIA.CDOPERADORABERTURA'
    end
    object IBQOcorrenciaCDOPERADORENCERRAMENTO: TIntegerField
      FieldName = 'CDOPERADORENCERRAMENTO'
      Origin = 'OCORRENCIA.CDOPERADORENCERRAMENTO'
    end
    object IBQOcorrenciaHORASAIDAEMP: TTimeField
      FieldName = 'HORASAIDAEMP'
      Origin = 'OCORRENCIA.HORASAIDAEMP'
    end
    object IBQOcorrenciaHORASAIDALOCAL: TTimeField
      FieldName = 'HORASAIDALOCAL'
      Origin = 'OCORRENCIA.HORASAIDALOCAL'
    end
    object IBQOcorrenciaHORAABERTURALACRE: TTimeField
      FieldName = 'HORAABERTURALACRE'
      Origin = 'OCORRENCIA.HORAABERTURALACRE'
    end
    object IBQOcorrenciaKMSAIDA: TIBBCDField
      FieldName = 'KMSAIDA'
      Origin = 'OCORRENCIA.KMSAIDA'
      Precision = 18
      Size = 4
    end
    object IBQOcorrenciaHORACHEGADALOCAL: TTimeField
      FieldName = 'HORACHEGADALOCAL'
      Origin = 'OCORRENCIA.HORACHEGADALOCAL'
    end
    object IBQOcorrenciaHORACHEGADAEMP: TTimeField
      FieldName = 'HORACHEGADAEMP'
      Origin = 'OCORRENCIA.HORACHEGADAEMP'
    end
    object IBQOcorrenciaLACRE: TIBStringField
      FieldName = 'LACRE'
      Origin = 'OCORRENCIA.LACRE'
    end
    object IBQOcorrenciaKMRETORNO: TIBBCDField
      FieldName = 'KMRETORNO'
      Origin = 'OCORRENCIA.KMRETORNO'
      Precision = 18
      Size = 4
    end
    object IBQOcorrenciaTEMPODESOLOCAMENTO: TTimeField
      FieldName = 'TEMPODESOLOCAMENTO'
      Origin = 'OCORRENCIA.TEMPODESOLOCAMENTO'
    end
    object IBQOcorrenciaTEMPORETORNO: TTimeField
      FieldName = 'TEMPORETORNO'
      Origin = 'OCORRENCIA.TEMPORETORNO'
    end
    object IBQOcorrenciaTEMPOATENDIMENTO: TTimeField
      FieldName = 'TEMPOATENDIMENTO'
      Origin = 'OCORRENCIA.TEMPOATENDIMENTO'
    end
    object IBQOcorrenciaKMTOTALPERCORRIDO: TIBBCDField
      FieldName = 'KMTOTALPERCORRIDO'
      Origin = 'OCORRENCIA.KMTOTALPERCORRIDO'
      Precision = 18
      Size = 4
    end
    object IBQOcorrenciaCDTIPOOCORRENCIA: TIntegerField
      FieldName = 'CDTIPOOCORRENCIA'
      Origin = 'OCORRENCIA.CDTIPOOCORRENCIA'
    end
    object IBQOcorrenciaCDSUBTIPOOCORRENCIA: TIntegerField
      FieldName = 'CDSUBTIPOOCORRENCIA'
      Origin = 'OCORRENCIA.CDSUBTIPOOCORRENCIA'
    end
    object IBQOcorrenciaOCORRENCIAPOLICIAL: TIBStringField
      FieldName = 'OCORRENCIAPOLICIAL'
      Origin = 'OCORRENCIA.OCORRENCIAPOLICIAL'
      Size = 1000
    end
    object IBQOcorrenciaISOCORRENCIAPOLICIAL: TIntegerField
      FieldName = 'ISOCORRENCIAPOLICIAL'
      Origin = 'OCORRENCIA.ISOCORRENCIAPOLICIAL'
    end
    object IBQOcorrenciaDATAENCERRAMENTO: TDateTimeField
      FieldName = 'DATAENCERRAMENTO'
      Origin = 'OCORRENCIA.DATAENCERRAMENTO'
    end
    object IBQOcorrenciaISOCORRENCIAENCERRADA: TIntegerField
      FieldName = 'ISOCORRENCIAENCERRADA'
      Origin = 'OCORRENCIA.ISOCORRENCIAENCERRADA'
    end
    object IBQOcorrenciaCHAVE: TIBStringField
      FieldName = 'CHAVE'
      Origin = 'CONTRATO.CHAVE'
    end
    object IBQOcorrenciaRESUMO: TIBStringField
      FieldName = 'RESUMO'
      Origin = 'OCORRENCIA.RESUMO'
      Size = 2000
    end
  end
  object IBQSetores: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTSetores
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT S.NUMSETOR, S.LOCAL, CO.MODELOCENTRAL, CO.LOCALINSTALCENT' +
        'RAL FROM SETOR S'
      'INNER JOIN CONTRATO CO ON CO.CDCONTRATO = S.CDCONTRATO'
      'WHERE CO.CDCODIFICADOR = :CDCODIFICADOR ORDER BY S.NUMSETOR;')
    UniDirectional = True
    Left = 274
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CDCODIFICADOR'
        ParamType = ptUnknown
      end>
    object IBQSetoresLOCAL: TIBStringField
      FieldName = 'LOCAL'
      Origin = 'SETOR.LOCAL'
      Size = 100
    end
    object IBQSetoresNUMSETOR: TIntegerField
      FieldName = 'NUMSETOR'
      Origin = 'SETOR.NUMSETOR'
      Required = True
    end
    object IBQSetoresMODELOCENTRAL: TIBStringField
      FieldName = 'MODELOCENTRAL'
      Origin = 'CONTRATO.MODELOCENTRAL'
      Size = 120
    end
    object IBQSetoresLOCALINSTALCENTRAL: TIBStringField
      FieldName = 'LOCALINSTALCENTRAL'
      Origin = 'CONTRATO.LOCALINSTALCENTRAL'
      Size = 400
    end
  end
  object DSPSetores: TDataSetProvider
    DataSet = IBQSetores
    Constraints = True
    Left = 274
    Top = 117
  end
  object DSPOcorrencia: TDataSetProvider
    DataSet = IBQOcorrencia
    Constraints = True
    UpdateMode = upWhereKeyOnly
    OnGetTableName = DSPOcorrenciaGetTableName
    Left = 355
    Top = 169
  end
  object CDSOcorrencia: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CDOCORRENCIA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CDOCORRENCIAPAI'
        DataType = ftInteger
      end
      item
        Name = 'PORTACOM'
        DataType = ftInteger
      end
      item
        Name = 'NREVENTO'
        DataType = ftInteger
      end
      item
        Name = 'TIPOCTX'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CTX'
        DataType = ftInteger
      end
      item
        Name = 'EQUIPAMENTO'
        DataType = ftInteger
      end
      item
        Name = 'STATUS'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'DESTATUS'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'NUMSETOR'
        DataType = ftInteger
      end
      item
        Name = 'LOCAL'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'CDCLIENTE'
        DataType = ftInteger
      end
      item
        Name = 'CDORDEMSERVICO'
        DataType = ftInteger
      end
      item
        Name = 'DATACADASTRO'
        DataType = ftDateTime
      end
      item
        Name = 'DATAEVENTO'
        DataType = ftDateTime
      end
      item
        Name = 'DATAATENDIMENTO'
        DataType = ftDateTime
      end
      item
        Name = 'CDAGENTE'
        DataType = ftInteger
      end
      item
        Name = 'CDOPERADORABERTURA'
        DataType = ftInteger
      end
      item
        Name = 'CDOPERADORENCERRAMENTO'
        DataType = ftInteger
      end
      item
        Name = 'HORASAIDAEMP'
        DataType = ftTime
      end
      item
        Name = 'HORASAIDALOCAL'
        DataType = ftTime
      end
      item
        Name = 'HORAABERTURALACRE'
        DataType = ftTime
      end
      item
        Name = 'KMSAIDA'
        DataType = ftBCD
        Precision = 18
        Size = 4
      end
      item
        Name = 'HORACHEGADALOCAL'
        DataType = ftTime
      end
      item
        Name = 'HORACHEGADAEMP'
        DataType = ftTime
      end
      item
        Name = 'LACRE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'KMRETORNO'
        DataType = ftBCD
        Precision = 18
        Size = 4
      end
      item
        Name = 'TEMPODESOLOCAMENTO'
        DataType = ftTime
      end
      item
        Name = 'TEMPORETORNO'
        DataType = ftTime
      end
      item
        Name = 'TEMPOATENDIMENTO'
        DataType = ftTime
      end
      item
        Name = 'KMTOTALPERCORRIDO'
        DataType = ftBCD
        Precision = 18
        Size = 4
      end
      item
        Name = 'CDTIPOOCORRENCIA'
        DataType = ftInteger
      end
      item
        Name = 'CDSUBTIPOOCORRENCIA'
        DataType = ftInteger
      end
      item
        Name = 'OCORRENCIAPOLICIAL'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'ISOCORRENCIAPOLICIAL'
        DataType = ftInteger
      end
      item
        Name = 'DATAENCERRAMENTO'
        DataType = ftDateTime
      end
      item
        Name = 'ISOCORRENCIAENCERRADA'
        DataType = ftInteger
      end
      item
        Name = 'CHAVE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RESUMO'
        DataType = ftString
        Size = 2000
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DSPOcorrencia'
    StoreDefs = True
    Left = 355
    Top = 222
    object CDSOcorrenciaCDOCORRENCIA: TIntegerField
      FieldName = 'CDOCORRENCIA'
      Required = True
    end
    object CDSOcorrenciaCDOCORRENCIAPAI: TIntegerField
      FieldName = 'CDOCORRENCIAPAI'
    end
    object CDSOcorrenciaPORTACOM: TIntegerField
      FieldName = 'PORTACOM'
      ReadOnly = True
    end
    object CDSOcorrenciaNREVENTO: TIntegerField
      FieldName = 'NREVENTO'
      ReadOnly = True
    end
    object CDSOcorrenciaTIPOCTX: TStringField
      FieldName = 'TIPOCTX'
      ReadOnly = True
      Size = 3
    end
    object CDSOcorrenciaCTX: TIntegerField
      FieldName = 'CTX'
      ReadOnly = True
    end
    object CDSOcorrenciaEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
      ReadOnly = True
    end
    object CDSOcorrenciaSTATUS: TStringField
      FieldName = 'STATUS'
      ReadOnly = True
      Size = 4
    end
    object CDSOcorrenciaDESTATUS: TStringField
      FieldName = 'DESTATUS'
      ReadOnly = True
      Size = 70
    end
    object CDSOcorrenciaNUMSETOR: TIntegerField
      FieldName = 'NUMSETOR'
      ReadOnly = True
    end
    object CDSOcorrenciaLOCAL: TStringField
      FieldName = 'LOCAL'
      ReadOnly = True
      Size = 100
    end
    object CDSOcorrenciaCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
    end
    object CDSOcorrenciaCDORDEMSERVICO: TIntegerField
      FieldName = 'CDORDEMSERVICO'
    end
    object CDSOcorrenciaDATACADASTRO: TDateTimeField
      FieldName = 'DATACADASTRO'
    end
    object CDSOcorrenciaDATAEVENTO: TDateTimeField
      DisplayWidth = 20
      FieldName = 'DATAEVENTO'
      DisplayFormat = 'dd/mm/yyyy hh:mm'
      EditMask = '99/99/9999 99:99;1;_'
    end
    object CDSOcorrenciaDATAATENDIMENTO: TDateTimeField
      FieldName = 'DATAATENDIMENTO'
      DisplayFormat = 'dd/mm/yyyy hh:mm'
      EditMask = '99/99/9999 99:99;1;_'
    end
    object CDSOcorrenciaCDAGENTE: TIntegerField
      FieldName = 'CDAGENTE'
    end
    object CDSOcorrenciaCDOPERADORABERTURA: TIntegerField
      FieldName = 'CDOPERADORABERTURA'
    end
    object CDSOcorrenciaCDOPERADORENCERRAMENTO: TIntegerField
      FieldName = 'CDOPERADORENCERRAMENTO'
    end
    object CDSOcorrenciaHORASAIDAEMP: TTimeField
      FieldName = 'HORASAIDAEMP'
      DisplayFormat = 'hh:mm'
      EditMask = '!90:00;1;_'
    end
    object CDSOcorrenciaHORASAIDALOCAL: TTimeField
      FieldName = 'HORASAIDALOCAL'
      DisplayFormat = 'hh:mm'
      EditMask = '!90:00;1;_'
    end
    object CDSOcorrenciaHORAABERTURALACRE: TTimeField
      FieldName = 'HORAABERTURALACRE'
      DisplayFormat = 'hh:mm'
      EditMask = '!90:00;1;_'
    end
    object CDSOcorrenciaKMSAIDA: TBCDField
      FieldName = 'KMSAIDA'
      Precision = 18
    end
    object CDSOcorrenciaHORACHEGADALOCAL: TTimeField
      FieldName = 'HORACHEGADALOCAL'
      DisplayFormat = 'hh:mm'
      EditMask = '!90:00;1;_'
    end
    object CDSOcorrenciaHORACHEGADAEMP: TTimeField
      FieldName = 'HORACHEGADAEMP'
      DisplayFormat = 'hh:mm'
      EditMask = '!90:00;1;_'
    end
    object CDSOcorrenciaLACRE: TStringField
      FieldName = 'LACRE'
    end
    object CDSOcorrenciaKMRETORNO: TBCDField
      FieldName = 'KMRETORNO'
      Precision = 18
    end
    object CDSOcorrenciaTEMPODESOLOCAMENTO: TTimeField
      FieldName = 'TEMPODESOLOCAMENTO'
    end
    object CDSOcorrenciaTEMPORETORNO: TTimeField
      FieldName = 'TEMPORETORNO'
    end
    object CDSOcorrenciaTEMPOATENDIMENTO: TTimeField
      FieldName = 'TEMPOATENDIMENTO'
    end
    object CDSOcorrenciaKMTOTALPERCORRIDO: TBCDField
      FieldName = 'KMTOTALPERCORRIDO'
      Precision = 18
    end
    object CDSOcorrenciaCDTIPOOCORRENCIA: TIntegerField
      FieldName = 'CDTIPOOCORRENCIA'
    end
    object CDSOcorrenciaCDSUBTIPOOCORRENCIA: TIntegerField
      FieldName = 'CDSUBTIPOOCORRENCIA'
    end
    object CDSOcorrenciaOCORRENCIAPOLICIAL: TStringField
      FieldName = 'OCORRENCIAPOLICIAL'
      Size = 1000
    end
    object CDSOcorrenciaISOCORRENCIAPOLICIAL: TIntegerField
      FieldName = 'ISOCORRENCIAPOLICIAL'
    end
    object CDSOcorrenciaDATAENCERRAMENTO: TDateTimeField
      FieldName = 'DATAENCERRAMENTO'
    end
    object CDSOcorrenciaISOCORRENCIAENCERRADA: TIntegerField
      FieldName = 'ISOCORRENCIAENCERRADA'
    end
    object CDSOcorrenciaCHAVE: TStringField
      FieldName = 'CHAVE'
      ReadOnly = True
    end
    object CDSOcorrenciaNMAGENTE: TStringField
      FieldKind = fkLookup
      FieldName = 'NMAGENTE'
      LookupDataSet = CDSAgente
      LookupKeyFields = 'CDUSUARIO'
      LookupResultField = 'LOGIN'
      KeyFields = 'CDAGENTE'
      Lookup = True
    end
    object CDSOcorrenciaNMOPERADORA: TStringField
      FieldKind = fkLookup
      FieldName = 'NMOPERADORA'
      LookupDataSet = CDSOperador
      LookupKeyFields = 'CDUSUARIO'
      LookupResultField = 'LOGIN'
      KeyFields = 'CDOPERADORABERTURA'
      Lookup = True
    end
    object CDSOcorrenciaDETIPOOCORRENCIA: TStringField
      FieldKind = fkLookup
      FieldName = 'DETIPOOCORRENCIA'
      LookupDataSet = CDSTipoOcorrencia
      LookupKeyFields = 'CDTIPOOCORRENCIA'
      LookupResultField = 'DETIPOOCORRENCIA'
      KeyFields = 'CDTIPOOCORRENCIA'
      Lookup = True
    end
    object CDSOcorrenciaDESUBTIPOOCORRENCIA: TStringField
      FieldKind = fkLookup
      FieldName = 'DESUBTIPOOCORRENCIA'
      LookupDataSet = CDSSubTipoOcorrencia
      LookupKeyFields = 'CDSUBTIPOOCORRENCIA'
      LookupResultField = 'DESUBTIPOOCORRENCIA'
      KeyFields = 'CDSUBTIPOOCORRENCIA'
      Lookup = True
    end
    object CDSOcorrenciaRESUMO: TStringField
      FieldName = 'RESUMO'
      Size = 2000
    end
  end
  object CDSSetores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPSetores'
    Left = 274
    Top = 169
    object CDSSetoresLOCAL: TStringField
      FieldName = 'LOCAL'
      Size = 100
    end
    object CDSSetoresNUMSETOR: TIntegerField
      FieldName = 'NUMSETOR'
      Required = True
    end
    object CDSSetoresMODELOCENTRAL: TStringField
      FieldName = 'MODELOCENTRAL'
      Size = 120
    end
    object CDSSetoresLOCALINSTALCENTRAL: TStringField
      FieldName = 'LOCALINSTALCENTRAL'
      Size = 400
    end
  end
  object IBSPGenIdOcorrencia: TIBStoredProc
    Database = DModule.IBCONAzsim
    Transaction = IBTGenIdOcorrencia
    StoredProcName = 'SP_GEN_OCORRENCIA_ID'
    Left = 42
    Top = 293
  end
  object IBTGenIdOcorrencia: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 43
    Top = 237
  end
  object IBTSubTipoOcorrencia: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 731
    Top = 14
  end
  object IBTTipoOcorrencia: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 611
    Top = 13
  end
  object IBQTipoOcorrencia: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTTipoOcorrencia
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT CDTIPOOCORRENCIA, DETIPOOCORRENCIA FROM TIPOOCORRENCIA OR' +
        'DER BY DETIPOOCORRENCIA;')
    UniDirectional = True
    Left = 611
    Top = 65
    object IBQTipoOcorrenciaCDTIPOOCORRENCIA: TIntegerField
      FieldName = 'CDTIPOOCORRENCIA'
      Origin = 'TIPOOCORRENCIA.CDTIPOOCORRENCIA'
      Required = True
    end
    object IBQTipoOcorrenciaDETIPOOCORRENCIA: TIBStringField
      FieldName = 'DETIPOOCORRENCIA'
      Origin = 'TIPOOCORRENCIA.DETIPOOCORRENCIA'
      Size = 30
    end
  end
  object IBQSubTipoOcorrencia: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTSubTipoOcorrencia
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT CDSUBTIPOOCORRENCIA, CDTIPOOCORRENCIA, DESUBTIPOOCORRENCI' +
        'A FROM SUBTIPOOCORRENCIA ORDER BY DESUBTIPOOCORRENCIA;')
    UniDirectional = True
    Left = 731
    Top = 66
    object IBQSubTipoOcorrenciaCDSUBTIPOOCORRENCIA: TIntegerField
      FieldName = 'CDSUBTIPOOCORRENCIA'
      Origin = 'SUBTIPOOCORRENCIA.CDSUBTIPOOCORRENCIA'
      Required = True
    end
    object IBQSubTipoOcorrenciaCDTIPOOCORRENCIA: TIntegerField
      FieldName = 'CDTIPOOCORRENCIA'
      Origin = 'SUBTIPOOCORRENCIA.CDTIPOOCORRENCIA'
    end
    object IBQSubTipoOcorrenciaDESUBTIPOOCORRENCIA: TIBStringField
      FieldName = 'DESUBTIPOOCORRENCIA'
      Origin = 'SUBTIPOOCORRENCIA.DESUBTIPOOCORRENCIA'
      Size = 100
    end
  end
  object DSPSubTipoOcorrencia: TDataSetProvider
    DataSet = IBQSubTipoOcorrencia
    Constraints = True
    Left = 731
    Top = 118
  end
  object DSPTipoOcorrencia: TDataSetProvider
    DataSet = IBQTipoOcorrencia
    Constraints = True
    Left = 611
    Top = 117
  end
  object CDSTipoOcorrencia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPTipoOcorrencia'
    Left = 611
    Top = 170
    object CDSTipoOcorrenciaCDTIPOOCORRENCIA: TIntegerField
      FieldName = 'CDTIPOOCORRENCIA'
      Origin = 'TIPOOCORRENCIA.CDTIPOOCORRENCIA'
      Required = True
    end
    object CDSTipoOcorrenciaDETIPOOCORRENCIA: TStringField
      FieldName = 'DETIPOOCORRENCIA'
      Origin = 'TIPOOCORRENCIA.DETIPOOCORRENCIA'
      Size = 30
    end
  end
  object CDSSubTipoOcorrencia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPSubTipoOcorrencia'
    Left = 731
    Top = 170
    object CDSSubTipoOcorrenciaCDSUBTIPOOCORRENCIA: TIntegerField
      FieldName = 'CDSUBTIPOOCORRENCIA'
      Origin = 'SUBTIPOOCORRENCIA.CDSUBTIPOOCORRENCIA'
      Required = True
    end
    object CDSSubTipoOcorrenciaCDTIPOOCORRENCIA: TIntegerField
      FieldName = 'CDTIPOOCORRENCIA'
      Origin = 'SUBTIPOOCORRENCIA.CDTIPOOCORRENCIA'
    end
    object CDSSubTipoOcorrenciaDESUBTIPOOCORRENCIA: TStringField
      FieldName = 'DESUBTIPOOCORRENCIA'
      Origin = 'SUBTIPOOCORRENCIA.DESUBTIPOOCORRENCIA'
      Size = 100
    end
  end
  object DSProcedimeto: TDataSource
    DataSet = CDSProcedimento
    Left = 845
    Top = 222
  end
  object IBTProcedimento: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 845
    Top = 14
  end
  object IBQProcedimeto: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTProcedimento
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT CDCLIENTE, PROCEDIMENTOS FROM CLIENTE WHERE CDCLIENTE = :' +
        'CDCLIENTE;')
    UniDirectional = True
    Left = 845
    Top = 66
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CDCLIENTE'
        ParamType = ptUnknown
        Size = 4
      end>
    object IBQProcedimetoCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'CLIENTE.CDCLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQProcedimetoPROCEDIMENTOS: TIBStringField
      FieldName = 'PROCEDIMENTOS'
      Origin = 'CLIENTE.PROCEDIMENTOS'
      Size = 2000
    end
  end
  object DSPProcedimento: TDataSetProvider
    DataSet = IBQProcedimeto
    Constraints = True
    Left = 845
    Top = 118
  end
  object CDSProcedimento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPProcedimento'
    Left = 845
    Top = 170
    object CDSProcedimentoCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Required = True
    end
    object CDSProcedimentoPROCEDIMENTOS: TStringField
      FieldName = 'PROCEDIMENTOS'
      Size = 2000
    end
  end
end
