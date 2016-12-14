unit uFrmComprasPed;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uFrmBase, FMX.Controls.Presentation, FMX.Layouts, FMX.Objects, System.JSON,
  FMX.ListView.Types, FMX.ListView, MultiDetailAppearanceU;

type
  TfrmComprasPed = class(TfrmBase)
    ToolBar1: TToolBar;
    Label1: TLabel;
    ListView: TListView;
    btnBack: TButton;
    procedure FormShow(Sender: TObject);
    procedure ListViewItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure btnBackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FPedido : integer;
  end;

var
  frmComprasPed: TfrmComprasPed;

implementation

{$R *.fmx}
{$R *.iPhone.fmx IOS}
{$R *.iPhone4in.fmx IOS}
{$R *.iPhone55in.fmx IOS}
{$R *.SmXhdpiPh.fmx ANDROID}
{$R *.NmXhdpiPh.fmx ANDROID}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.LgXhdpiTb.fmx ANDROID}
{$R *.iPhone47in.fmx IOS}

uses uFrmConexao, uFrmComprasPedItens, uFrmMenuPrincipal;

procedure TfrmComprasPed.btnBackClick(Sender: TObject);
begin
  inherited;
 frmMenuPrincipal.Show;
// frmComprasPed.DisposeOf;
end;

procedure TfrmComprasPed.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
      if key = vkHardwareBack then
   begin
     frmMenuPrincipal.Show;
     key :=0;
     frmComprasPed.DisposeOf;

   end
end;

procedure TfrmComprasPed.FormShow(Sender: TObject);
var
  jArr     : TJSONArray;
  jObj     : TJSONObject;
  JString  : TJSONString;
  I        : Integer;
  LisItem  : TListViewItem;
begin
  inherited;
  {$IFDEF ANDROID}
     btnBack.Visible := false;
  {$ENDIF}
   ListView.ClearItems;
   ListView.BeginUpdate;
   jArr   := dtmConexao.ComprasPed;
  for I   := 0 to jArr.size - 1 do
  begin
    jObj           := jArr.Items[I] as TJSONObject;
    LisItem        := ListView.Items.Add;
   // FPedido        := StrToInt(jObj.GetValue('ID_PEDIDO').Value);
    LisItem.Detail := jObj.GetValue('ID_PEDIDO').Value;
    LisItem.Text   := 'Pedido:  ' + jObj.GetValue('ID_PEDIDO').Value;
    LisItem.Data[TMultiDetailAppearanceNames.Detail1]:='Valor:  '+ jObj.GetValue('VL_TOTAL').Value;
    LisItem.Data[TMultiDetailAppearanceNames.Detail2]:='Cond. Pagto.:  '+ jObj.GetValue('NM_CONDPAGTO').Value;
    LisItem.Data[TMultiDetailAppearanceNames.Detail3]:='Fornecedor:  '+ jObj.GetValue('NM_FORNECEDOR').Value;
  end;
  ListView.EndUpdate;

end;

procedure TfrmComprasPed.ListViewItemClick(const Sender: TObject;
  const AItem: TListViewItem);
 var
    i : integer;
begin
  inherited;
   i:= 0;
   FPedido := StrToInt(Copy(ListView.Selected.Text,10,6));
   i := FPedido;
   if not Assigned(frmComprasPedItens) then
   begin
    Application.CreateForm(TfrmComprasPedItens,frmComprasPedItens);
    frmComprasPedItens.Show;
   end else
   begin
     FreeAndNil(frmComprasPedItens);
     Application.CreateForm(TfrmComprasPedItens,frmComprasPedItens);
     frmComprasPedItens.Show;
   end;


end;

end.
