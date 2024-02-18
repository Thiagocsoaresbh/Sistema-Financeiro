unit MonolitoFinanceiro.View.Usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MonolitoFinanceiro.View.CadastroPadrao,
  Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.WinXPanels, Vcl.WinXCtrls, Vcl.Menus;

type
  TfrmUsuarios = class(TfrmCadastroPadrao)
    edtNome: TEdit;
    edtLogin: TEdit;
    tsStatus: TToggleSwitch;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    PopupMenu1: TPopupMenu;
    mnLimparSenha: TMenuItem;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure mnLimparSenhaClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure Pesquisar; override;
  end;

var
  frmUsuarios: TfrmUsuarios;

implementation

uses
  MonolitoFinanceiro.Model.Usuarios,
  MonolitoFinanceiro.Utilitarios,
  BCrypt;

{$R *.dfm}

procedure TfrmUsuarios.btnAlterarClick(Sender: TObject);
begin
  inherited;
  edtNome.Text := dmUsuarios.cdsUsuariosnome.AsString;
  edtLogin.Text := dmUsuarios.cdsUsuarioslogin.AsString;

  tsStatus.State := tssOn;
  if dmUsuarios.cdsUsuariosstatus.AsString = 'B' then
    tsStatus.State := tssOff;

end;

procedure TfrmUsuarios.btnFecharClick(Sender: TObject);
begin
  inherited;
  dmUsuarios.cdsUsuarios.Cancel;

end;

procedure TfrmUsuarios.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  Pesquisar;

end;

procedure TfrmUsuarios.btnSalvarClick(Sender: TObject);
var
  LStatus : String;
begin
  if Trim(edtNome.Text) = '' then
  begin
    edtNome.SetFocus;{o edtnome ja vem selecionado}
    Application.MessageBox('O campo nome não pode ser vazio.', 'Atenção', MB_OK + MB_ICONWARNING); {tipo da janela}
    abort;
  end;
  if Trim(edtLogin.Text) = '' then
  begin
    edtLogin.SetFocus;{o edtnome ja vem selecionado}
    Application.MessageBox('O campo login não pode ser vazio.', 'Atenção', MB_OK + MB_ICONWARNING); {tipo da janela}
    abort;
  end;

  if dmUsuarios.TemLoginCadastrado(Trim(edtLogin.Text), dmUsuarios.cdsUsuarios.FieldByName('ID').AsString) then
    begin
      edtLogin.SetFocus;
      Application.MessageBox(PWideChar(Format('O login %s já está cadastrado.', [edtLogin.Text])),'Atenção', MB_OK + MB_ICONWARNING);
      abort;
    end;


  LStatus := 'A';

  if tsStatus.State = tssOff then
    LStatus := 'B';

  if dmUsuarios.cdsUsuarios.State in [dsInsert] then
  begin
    dmUsuarios.cdsUsuariosid.AsString := TUtilitarios.GetID;
    dmUsuarios.cdsUsuariosdata_cadastro.AsDateTime := now;
    dmUsuarios.cdsUsuariossenha.AsString := TBCrypt.GenerateHash(dmUsuarios.TEMP_PASSWORD);
    dmUsuarios.cdsUsuariossenha_temporaria.AsString := 'S';
  end;

  dmUsuarios.cdsUsuariosnome.AsString := Trim(edtNome.Text);
  dmUsuarios.cdsUsuarioslogin.AsString := Trim(edtLogin.Text);
  dmUsuarios.cdsUsuariosstatus.AsString := LStatus;
  inherited;

end;

procedure TfrmUsuarios.mnLimparSenhaClick(Sender: TObject);
begin
  inherited;
  if not DataSource1.DataSet.IsEmpty then
  begin
    dmUsuarios.LimparSenha(DataSource1.DataSet.FieldByName('ID').AsString);
    Application.MessageBox(PWideChar(Format('Foi definida a senha padrão para o usuário "%s"', [DataSource1.DataSet.FieldByName('NOME').AsString])), 'Atenção', MB_OK + MB_ICONINFORMATION);
  end;
end;

procedure TfrmUsuarios.Pesquisar;
var
  FiltroPesquisa : String;
begin
  FiltroPesquisa := TUtilitarios.LikeFind(edtPesquisar.Text, dbgCadastro);
  dmUsuarios.cdsUsuarios.Close;
  dmUsuarios.cdsUsuarios.CommandText := 'Select * from usuarios where 1 = 1' + FiltroPesquisa;
  dmUsuarios.cdsUsuarios.Open;
  inherited;{chama o método na classe ancestral}
end;

end.
