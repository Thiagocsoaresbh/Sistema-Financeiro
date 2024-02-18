unit MonolitoFinanceiro.Model.Conexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TdmConexao = class(TDataModule)
    FDConexao: TFDConnection;
    FDTransaction: TFDTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    const ARQUIVOCONFIG = 'MonolitoFinanceiro.cfg';
  public
    { Public declarations }
    procedure CarregarConfig;
    procedure Conectar;
    procedure Desconectar;
  end;

var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TdmConexao.CarregarConfig;
var
  ParametroNome: String;
  ParametroValor: String;
  contador: Integer;
  ListaParametros: TStringList;{objeto que permite trabalharmos com lista}
begin
  FDConexao.Params.Clear;{Limpa os parametros da conexao}
  if not FileExists(ARQUIVOCONFIG) then
    raise Exception.Create('Arquivo de configuração não encontrado');
  ListaParametros := TStringList.Create;
  {adicionando parametros na conexao}
  try
    ListaParametros.LoadFromFile(ARQUIVOCONFIG);
    for contador := 0 to Pred(ListaParametros.Count) do  {ou ListaParametros.Count - 1 )}
    begin
      if ListaParametros[contador].IndexOf('=') > 0 then
      begin
        ParametroNome := ListaParametros[contador].Split(['='])[0].Trim; {split retorna um array}
        ParametroValor := ListaParametros[contador].Split(['='])[1].Trim; {trim retira os espaços}
        FDConexao.Params.Add(ParametroNome + '=' + ParametroValor);
      end;
    end;
      
  finally
    ListaParametros.Free;
  end;

end;

procedure TdmConexao.Conectar;
begin
  FDConexao.Connected;
end;

procedure TdmConexao.DataModuleCreate(Sender: TObject);
begin
  CarregarConfig;
  Conectar;
end;

procedure TdmConexao.Desconectar;
begin
  FDConexao.Connected := False;
end;

end.
