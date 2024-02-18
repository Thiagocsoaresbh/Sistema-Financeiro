object frmRedefinirSenha: TfrmRedefinirSenha
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Redefinir Senha'
  ClientHeight = 354
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 21
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 121
    Align = alTop
    BevelOuter = bvNone
    Padding.Top = 30
    TabOrder = 0
    ExplicitTop = -6
    object LabNomeAplicacao: TLabel
      Left = 0
      Top = 67
      Width = 628
      Height = 25
      Align = alTop
      Alignment = taCenter
      Caption = 'Informe a sua nova senha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clDefault
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 216
    end
    object lblUsuario: TLabel
      Left = 0
      Top = 30
      Width = 628
      Height = 37
      Align = alTop
      Alignment = taCenter
      Caption = 'Usu'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 99
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 121
    Width = 628
    Height = 283
    Align = alTop
    BevelOuter = bvNone
    Padding.Left = 60
    Padding.Right = 60
    TabOrder = 1
    ExplicitWidth = 534
    object Panel3: TPanel
      Left = 60
      Top = 0
      Width = 508
      Height = 80
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitWidth = 418
      object Label3: TLabel
        Left = 0
        Top = 0
        Width = 508
        Height = 25
        Align = alTop
        Caption = 'Senha:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 56
      end
      object edtSenha: TEdit
        Left = 0
        Top = 25
        Width = 508
        Height = 29
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitWidth = 418
      end
    end
    object Panel4: TPanel
      Left = 60
      Top = 80
      Width = 508
      Height = 80
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Panel4'
      TabOrder = 1
      ExplicitWidth = 418
      object Label2: TLabel
        Left = 0
        Top = 0
        Width = 508
        Height = 25
        Align = alTop
        Caption = 'Confirme a senha:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 152
      end
      object edtConfirmarSenha: TEdit
        Left = 0
        Top = 25
        Width = 508
        Height = 29
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 0
        ExplicitWidth = 418
      end
    end
    object Panel5: TPanel
      Left = 60
      Top = 160
      Width = 508
      Height = 33
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object btnConfirmar: TButton
        Left = 401
        Top = 0
        Width = 107
        Height = 33
        Align = alRight
        Caption = 'Confirmar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = btnConfirmarClick
        ExplicitLeft = 400
        ExplicitTop = 1
        ExplicitHeight = 47
      end
      object Button1: TButton
        Left = 0
        Top = 0
        Width = 107
        Height = 33
        Align = alLeft
        Caption = 'Cancelar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = Button1Click
        ExplicitLeft = 269
        ExplicitTop = 1
        ExplicitHeight = 47
      end
    end
  end
end
