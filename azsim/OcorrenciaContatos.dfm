object FOConsOcorrenciasContatos: TFOConsOcorrenciasContatos
  Left = 35
  Top = 101
  Width = 1307
  Height = 244
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Contatos'
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
  PixelsPerInch = 96
  TextHeight = 13
  object PCGrids: TPageControl
    Left = 0
    Top = 0
    Width = 1299
    Height = 217
    ActivePage = TSContatos
    Align = alClient
    Style = tsFlatButtons
    TabIndex = 0
    TabOrder = 0
    TabStop = False
    object TSContatos: TTabSheet
      Caption = '&Contatos'
      object DBGContatos: TDBGrid
        Left = 0
        Top = 0
        Width = 1291
        Height = 186
        Align = alClient
        DefaultDrawing = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGContatosDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'NMCONTATO'
            Title.Caption = 'Nome'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PARENTESCO'
            Title.Caption = 'Parentesco/Cargo'
            Width = 109
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATANASCIMENTO'
            Title.Caption = 'Data Nasc.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SENHA'
            Title.Caption = 'Senha'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTRASENHA'
            Title.Caption = 'Contra-Senha'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FONE1'
            Title.Caption = 'Fone - 1'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FONE1OBS'
            Title.Caption = 'Observa'#231#227'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FONE2'
            Title.Caption = 'Fone - 2'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FONE2OBS'
            Title.Caption = 'Observa'#231#227'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FONE3'
            Title.Caption = 'Fone - 3'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FONE3OBS'
            Title.Caption = 'Observa'#231#227'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FONE4'
            Title.Caption = 'Fone - 4'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FONE4OBS'
            Title.Caption = 'Observa'#231#227'o'
            Visible = True
          end>
      end
    end
    object TSEventos: TTabSheet
      Caption = '&Eventos'
      ImageIndex = 1
      object Label34: TLabel
        Left = 352
        Top = 56
        Width = 251
        Height = 24
        Caption = 'Recurso em desenvolvimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
    end
    object TSSetores: TTabSheet
      Caption = '&Setores'
      ImageIndex = 2
      object Label35: TLabel
        Left = 352
        Top = 56
        Width = 251
        Height = 24
        Caption = 'Recurso em desenvolvimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
    end
    object TSCameras: TTabSheet
      Caption = 'C'#226'meras &Online'
      ImageIndex = 3
      object Label36: TLabel
        Left = 352
        Top = 56
        Width = 251
        Height = 24
        Caption = 'Recurso em desenvolvimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
    end
  end
end
