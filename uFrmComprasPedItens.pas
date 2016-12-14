unit uFrmComprasPedItens;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uFrmBase, FMX.ListView.Types, MultiDetailAppearanceU, FMX.ListView,
  FMX.Controls.Presentation, FMX.Layouts, FMX.Objects, System.JSON,FMX.VirtualKeyboard, FMX.Platform;

type
  TfrmComprasPedItens = class(TfrmBase)
    ToolBar1: TToolBar;
    Label1: TLabel;
    LtPedItens: TListView;
    btnBack: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmComprasPedItens: TfrmComprasPedItens;

implementation

{$R *.fmx}
{$R *.iPhone.fmx IOS}
{$R *.iPhone4in.fmx IOS}
{$R *.iPhone47in.fmx IOS}
{$R *.iPhone55in.fmx IOS}
{$R *.SmXhdpiPh.fmx ANDROID}
{$R *.NmXhdpiPh.fmx ANDROID}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.LgXhdpiTb.fmx ANDROID}

uses uFrmConexao, uFrmComprasPed;

procedure TfrmComprasPedItens.btnBackClick(Sender: TObject);
begin
  inherited;
  frmComprasPed.Show;
//  frmComprasPedItens.DisposeOf;
end;

procedure TfrmComprasPedItens.FormCreate(Sender: TObject);
var
  jArr     : TJSONArray;
  jObj     : TJSONObject;
  JString  : TJSONString;
  I        : Integer;
  LisItem  : TListViewItem;
  codigo   : string;
begin
  inherited;
  {$IFDEF ANDROID}
   btnBack.Visible := false;
  {$ENDIF}
   jArr   := dtmConexao.ComprasPedItens(frmComprasPed.FPedido);
  for I   := 0 to jArr.size - 1 do
  begin
    LtPedItens.Items.Clear;
    LtPedItens.BeginUpdate;
    jObj           := jArr.Items[I] as TJSONObject;
    LisItem        := LtPedItens.Items.Add;
    codigo         := jObj.GetValue('CODIGO').Value;
    LisItem.Detail := jObj.GetValue('CODIGO').Value;
    LisItem.Text   := 'Código:  ' + jObj.GetValue('CODIGO').Value;
    LisItem.Data[TMultiDetailAppearanceNames.Detail1]:='Produto:  '+ jObj.GetValue('NM_PRODUTO').Value;
    LisItem.Data[TMultiDetailAppearanceNames.Detail2]:='Quant.:  '+ jObj.GetValue('QUANT').Value;
    LisItem.Data[TMultiDetailAppearanceNames.Detail3]:='Total:  '+ jObj.GetValue('TOTAL').Value;
    //Destruir o FORM anterior e quando Voltar criar novamente
    LtPedItens.EndUpdate;
  end;
end;

end.
