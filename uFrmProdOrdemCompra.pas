unit uFrmProdOrdemCompra;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uFrmBase, FMX.ListView.Types, FMX.ListView, FMX.Controls.Presentation,
  FMX.Layouts, FMX.Objects,System.JSON, MultiDetailAppearanceU;

type
  TfrmProdOrdemCompra = class(TfrmBase)
    Listview: TListView;
    ToolBar1: TToolBar;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdOrdemCompra: TfrmProdOrdemCompra;

implementation

{$R *.fmx}

uses uFrmConexao, uFrmOrdemCompra;

procedure TfrmProdOrdemCompra.FormShow(Sender: TObject);
var
  jArr     : TJSONArray;
  jObj     : TJSONObject;
  JString  : TJSONString;
  I        : Integer;
  codigo   : string;
  Ltitem   : TListViewItem;
begin
  inherited;
 jArr := dtmConexao.OrdemCompraItens(frmOrdemCompra.FIdOrdem);
 Listview.ClearItems;
 Listview.BeginUpdate;
 for I := 0 to jArr.Size - 1 do
    begin
      jObj   := jArr.Items[I] as TJSONObject;
      Ltitem := Listview.Items.Add;
      Ltitem.Detail := jObj.GetValue('ID_ORDEM').Value;
      Ltitem.Text   := jObj.GetValue('ID_ORDEM').Value;
      Ltitem.Data[TMultiDetailAppearanceNames.Detail1]:= 'Setorº  ' + jObj.GetValue('NM_SETOR'  ).Value;
      Ltitem.Data[TMultiDetailAppearanceNames.Detail2]:= 'Produto:  ' + jObj.GetValue('NM_PRODUTO').Value;
      Ltitem.Data[TMultiDetailAppearanceNames.Detail3]:= 'Quantidade:  ' + jObj.GetValue('QUANT').Value;
    end;
end;
 {

   VERIFICAR A TECLA PARA VOLTAR AO FORM ANTERIOR !!
 }
end.
