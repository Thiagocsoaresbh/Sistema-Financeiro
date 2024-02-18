unit MonolitoFinanceiro.Model.Sistema;

interface

uses
  System.SysUtils, System.Classes, Vcl.forms;

type
  TdmSistema = class(TDataModule)
  private
    { Private declarations }
    const ARQUIVOCONFIG = 'MonolitoFinanceiro.cfg';
    function GetConfiguracao(Secao, Parametro, valorPadrao : String): String;{pega}
    procedure SetConfiguracao(Secao, Parametro, Valor : String);{grava}
  public
    { Public declarations }
    function DataUltimoAcesso : String; overload;
    procedure DataUltimoAcesso(aValue: TDateTime); overload;
    function UsuarioUltimoAcesso : String; overload;
    procedure UsuarioUltimoAcesso(aValue: String); overload;
  end;

var
  dmSistema: TdmSistema;

implementation

uses
  System.IniFiles;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule2 }

function TdmSistema.DataUltimoAcesso: String;
begin
  Result := GetConfiguracao('Acesso', 'Data', '');
end;

procedure TdmSistema.DataUltimoAcesso(aValue: TDateTime);
begin
  SetConfiguracao('Acesso', 'Date', DateTimeToStr(aValue));
end;

function TdmSistema.GetConfiguracao(Secao, Parametro,
  valorPadrao: String): String;
var
  LArquivoConfig : TIniFile;
begin
  LArquivoConfig := TIniFile.Create(ExtractFilePath(Application.ExeName) + ARQUIVOCONFIG);
  try
    Result := LArquivoConfig.ReadString(Secao, Parametro, valorPadrao);
  finally
    LArquivoConfig.Free;
  end;
end;

procedure TdmSistema.SetConfiguracao(Secao, Parametro, Valor: String);
var
  LArquivoConfig : TIniFile;
begin
  LArquivoConfig := TIniFile.Create(ExtractFilePath(Application.ExeName) + ARQUIVOCONFIG);
  try
    LArquivoConfig.WriteString(Secao, Parametro, Valor);
  finally
    LArquivoConfig.Free;
  end;
end;

function TdmSistema.UsuarioUltimoAcesso: String;
begin
  Result := GetConfiguracao('Acesso', 'Usuario', '');
end;

procedure TdmSistema.UsuarioUltimoAcesso(aValue: String);
begin
  SetConfiguracao('Acesso', 'Usuario', aValue);
end;

end.
