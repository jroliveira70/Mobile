unit uFrmConexao;

interface

uses
  System.SysUtils, System.Classes, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, System.JSON;

type
  TdtmConexao = class(TDataModule)
    RestConect: TRESTClient;
    RestReq   : TRESTRequest;
    RestResp  : TRESTResponse;
  private
    { Private declarations }
    FCodigo : string;
    procedure SetCodigo(const Value: string);
  public
    { Public declarations }
   procedure ResetConection;
   function BuscarProduto(codigo:string;tipo:string):TJSONArray;
   function OrdemCompraAberto(status : string):TJSONArray;
   function OrdemCompraItens(id :integer):TJSONArray;
   function GetUsuario(usuario:string;senha:string):Boolean;
   function ComprasPed:TJSONArray;
   function ComprasPedItens(id:integer):TJSONArray;
   function RomaneioBaixado(status:string;dia,mes,ano:integer):TJSONArray;
   function RomaneioAberto(status:string;dia,mes,ano:integer):TJSONArray;
   function GuiaRemessa(status:string;dia,mes,ano:integer):TJSONArray;
   function PedFaturadoId(id:integer):TJSONArray;
   property Codigo:string read FCodigo write SetCodigo;
   function DupliEmitidas(empresa,dia,mes,ano:integer):TJSONArray;
  end;

//const  BASE_URL : string ='http://200.222.102.212:8080/datasnap/rest/TMobile/';
//const  BASE_URL : string ='http://10.0.1.66:8080/datasnap/rest/TMobile/';
const  BASE_URL : string ='http://10.0.2.6:8080/datasnap/rest/TMobile/';

var
  dtmConexao: TdtmConexao;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TdtmConexao }

function TdtmConexao.BuscarProduto(codigo: string;tipo:string): TJSONArray;
begin
 ResetConection;
 RestConect.BaseURL := BASE_URL;
 RestReq.Resource   := 'BuscarProduto/{codigo}/{tipo}';
 RestReq.Params.ParameterByName('codigo').Value := codigo;
 RestReq.Params.ParameterByName('tipo'  ).Value := tipo;
 RestReq.Execute;
 Result :=  RESTResp.JSONValue as TJSONArray;
end;

function TdtmConexao.ComprasPed: TJSONArray;
begin
 ResetConection;
 RestConect.BaseURL := BASE_URL;
 RestReq.Resource   := 'ComprasPed/';
 RestReq.Execute;
 Result :=  RESTResp.JSONValue as TJSONArray;
end;

function TdtmConexao.ComprasPedItens(id: integer): TJSONArray;
begin
 ResetConection;
 RestConect.BaseURL := BASE_URL;
 RestReq.Resource   := 'ComprasPedItens/{id}';
 RestReq.Params.ParameterByName('id').Value :=IntToStr(id);
 RestReq.Execute;
 Result :=  RESTResp.JSONValue as TJSONArray;
end;

function TdtmConexao.DupliEmitidas(empresa, dia, mes, ano: integer): TJSONArray;
begin
 ResetConection;
 RestConect.BaseURL := BASE_URL;
 RestReq.Resource   := 'DupliEmitidas/{empresa}/{dia}/{mes}/{ano}';
 RestReq.Params.ParameterByName('empresa').Value :=IntToStr(empresa);
 RestReq.Params.ParameterByName('dia'    ).Value :=IntToStr(dia);
 RestReq.Params.ParameterByName('mes'    ).Value :=IntToStr(mes);
 RestReq.Params.ParameterByName('ano'    ).Value :=IntToStr(ano);
 RestReq.Execute;
 Result :=  RESTResp.JSONValue as TJSONArray;
end;

function TdtmConexao.GetUsuario(usuario, senha: string): Boolean;
var
 JObject : TJSONObject;
 JArray  : TJSONArray;
 Valor   : Integer;
  I      : Integer;
begin
  ResetConection;
  RestConect.BaseURL := BASE_URL;
  RestReq.Resource := 'VerificaUser/{usuario}/{senha}';
  RestReq.Params.ParameterByName('usuario').Value := usuario;
  RestReq.Params.ParameterByName('senha'  ).Value := senha;
  RestReq.Execute;
  JArray := RestResp.JSONValue as TJSONArray;
  if JArray.Count >= 1 then
   Result := true else
   Result := false;
end;

function TdtmConexao.GuiaRemessa(status: string; dia, mes,
  ano: integer): TJSONArray;
begin
 ResetConection;
 RestConect.BaseURL := BASE_URL;
 RestReq.Resource   := 'GuiaRemessa/{status}/{dia}/{mes}/{ano}';
 RestReq.Params.ParameterByName('status').Value := status;
 RestReq.Params.ParameterByName('dia'   ).Value :=IntToStr(dia);
 RestReq.Params.ParameterByName('mes'   ).Value :=IntToStr(mes);
 RestReq.Params.ParameterByName('ano'   ).Value :=IntToStr(ano);
 RestReq.Execute;
 Result :=  RESTResp.JSONValue as TJSONArray;
end;

function TdtmConexao.OrdemCompraAberto(status: string): TJSONArray;
begin
 ResetConection;
 RestConect.BaseURL := BASE_URL;
 RestReq.Resource   := 'OrdemCompra/{status}';
 RestReq.Params.ParameterByName('status').Value := status;
 RestReq.Execute;
 Result :=  RESTResp.JSONValue as TJSONArray;
end;

function TdtmConexao.OrdemCompraItens(id: integer): TJSONArray;
begin
 ResetConection;
 RestConect.BaseURL := BASE_URL;
 RestReq.Resource   := 'OrdemCompraItens/{id}';
 RestReq.Params.ParameterByName('id').Value :=IntToStr(id);
 RestReq.Execute;
 Result :=  RESTResp.JSONValue as TJSONArray;
end;

function TdtmConexao.PedFaturadoId(id: integer): TJSONArray;
begin
 ResetConection;
 RestConect.BaseURL := BASE_URL;
 RestReq.Resource   := 'PedFaturadoid/{id}';
 RestReq.Params.ParameterByName('id').Value :=IntToStr(id);
 RestReq.Execute;
 Result :=  RESTResp.JSONValue as TJSONArray;
end;

procedure TdtmConexao.ResetConection;
begin
  RestReq.ResetToDefaults;
  RestConect.ResetToDefaults;
  RestResp.ResetToDefaults;
  RestConect.BaseURL := BASE_URL;
end;

function TdtmConexao.RomaneioAberto(status: string; dia, mes,
  ano: integer): TJSONArray;
begin
 ResetConection;
 RestConect.BaseURL := BASE_URL;
 RestReq.Resource   := 'RomaneioAberto/{status}/{dia}/{mes}/{ano}';
 RestReq.Params.ParameterByName('status').Value := status;
 RestReq.Params.ParameterByName('dia'   ).Value :=IntToStr(dia);
 RestReq.Params.ParameterByName('mes'   ).Value :=IntToStr(mes);
 RestReq.Params.ParameterByName('ano'   ).Value :=IntToStr(ano);
 RestReq.Execute;
 Result :=  RESTResp.JSONValue as TJSONArray;
end;

function TdtmConexao.RomaneioBaixado(status: string; dia, mes,
  ano: integer): TJSONArray;
begin
 ResetConection;
 RestConect.BaseURL := BASE_URL;
 RestReq.Resource   := 'Romaneio/{status}/{dia}/{mes}/{ano}';
 RestReq.Params.ParameterByName('status').Value := status;
 RestReq.Params.ParameterByName('dia'   ).Value :=IntToStr(dia);
 RestReq.Params.ParameterByName('mes'   ).Value :=IntToStr(mes);
 RestReq.Params.ParameterByName('ano'   ).Value :=IntToStr(ano);
 RestReq.Execute;
 Result :=  RESTResp.JSONValue as TJSONArray;
end;

procedure TdtmConexao.SetCodigo(const Value: string);
begin
  FCodigo := Value;
end;

end.
