object DM: TDM
  OldCreateOrder = False
  Height = 168
  Width = 198
  object MemPessoa: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 25
    Top = 16
    object MemPessoaPES_ID: TIntegerField
      FieldName = 'PES_ID'
      Origin = 'PES_ID'
      Required = True
    end
    object MemPessoaPES_RAZAOSOCIAL: TStringField
      FieldName = 'PES_RAZAOSOCIAL'
      Origin = 'PES_RAZAOSOCIAL'
      Size = 100
    end
    object MemPessoaPES_FANTASIA: TStringField
      FieldName = 'PES_FANTASIA'
      Origin = 'PES_FANTASIA'
      Size = 30
    end
    object MemPessoaPES_ATIVOINATIVO: TStringField
      FieldName = 'PES_ATIVOINATIVO'
      Origin = 'PES_ATIVOINATIVO'
      Size = 1
    end
    object MemPessoaPES_CPFCNPJ: TStringField
      FieldName = 'PES_CPFCNPJ'
      Origin = 'PES_CPFCNPJ'
      Size = 50
    end
    object MemPessoaPES_RGINSCR: TStringField
      FieldName = 'PES_RGINSCR'
      Origin = 'PES_RGINSCR'
      Size = 50
    end
    object MemPessoaPES_FISICAJURIDICA: TStringField
      FieldName = 'PES_FISICAJURIDICA'
      Origin = 'PES_FISICAJURIDICA'
      Size = 1
    end
    object MemPessoaPES_DTNASCIMENTO: TSQLTimeStampField
      FieldName = 'PES_DTNASCIMENTO'
      Origin = 'PES_DTNASCIMENTO'
    end
    object MemPessoaPES_DTCADASTRO: TSQLTimeStampField
      FieldName = 'PES_DTCADASTRO'
      Origin = 'PES_DTCADASTRO'
    end
    object MemPessoaPES_SITE: TStringField
      FieldName = 'PES_SITE'
      Origin = 'PES_SITE'
      Size = 200
    end
    object MemPessoaPES_USUARIO_CAD: TStringField
      FieldName = 'PES_USUARIO_CAD'
      Origin = 'PES_USUARIO_CAD'
      Size = 30
    end
    object MemPessoaPES_TELEFONE: TStringField
      FieldName = 'PES_TELEFONE'
      Origin = 'PES_TELEFONE'
    end
    object MemPessoaPES_CELULAR: TStringField
      FieldName = 'PES_CELULAR'
      Origin = 'PES_CELULAR'
    end
    object MemPessoaPES_EMAIL: TStringField
      FieldName = 'PES_EMAIL'
      Origin = 'PES_EMAIL'
      Size = 100
    end
    object MemPessoaPES_COND_PAGTO_PADRAO: TIntegerField
      FieldName = 'PES_COND_PAGTO_PADRAO'
      Origin = 'PES_COND_PAGTO_PADRAO'
    end
    object MemPessoaPES_LIMITE_CREDITO: TFMTBCDField
      FieldName = 'PES_LIMITE_CREDITO'
      Origin = 'PES_LIMITE_CREDITO'
      Precision = 18
      Size = 2
    end
    object MemPessoaPES_DTALTERACAO: TSQLTimeStampField
      FieldName = 'PES_DTALTERACAO'
      Origin = 'PES_DTALTERACAO'
    end
    object MemPessoaPES_DTSINCRONISMO: TSQLTimeStampField
      FieldName = 'PES_DTSINCRONISMO'
      Origin = 'PES_DTSINCRONISMO'
    end
    object MemPessoaGUID_CONTROLE: TStringField
      FieldName = 'GUID_CONTROLE'
      Origin = 'GUID_CONTROLE'
      Size = 50
    end
  end
end
