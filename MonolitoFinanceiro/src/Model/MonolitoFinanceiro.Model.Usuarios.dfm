object dmUsuarios: TdmUsuarios
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 480
  Width = 640
  object fdqUsuarios: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 32
    Top = 32
  end
  object cdsUsuarios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsuarios'
    Left = 192
    Top = 32
    object cdsUsuariosid: TStringField
      FieldName = 'id'
      Size = 36
    end
    object cdsUsuariosnome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object cdsUsuarioslogin: TStringField
      FieldName = 'login'
    end
    object cdsUsuariossenha: TStringField
      FieldName = 'senha'
      Size = 60
    end
    object cdsUsuariosstatus: TStringField
      FieldName = 'status'
      Size = 1
    end
    object cdsUsuariosdata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
    object cdsUsuariossenha_temporaria: TStringField
      FieldName = 'senha_temporaria'
      Size = 1
    end
  end
  object dspUsuarios: TDataSetProvider
    DataSet = fdqUsuarios
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 112
    Top = 32
  end
end
