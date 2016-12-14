unit ufrmPedFatur;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uFrmBase, FMX.Controls.Presentation, FMX.Layouts, FMX.Objects,
  FMX.ListView.Types, MultiDetailAppearanceU, FMX.ListView, FMX.Edit,System.JSON,
  FMX.ListBox;

type
  TfrmBase1 = class(TfrmBase)
    ListBox1: TListBox;
    Edit1: TEdit;
    Button1: TButton;
    ListView2: TListView;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBase1: TfrmBase1;

implementation

{$R *.fmx}

uses uFrmConexao;

procedure TfrmBase1.Button1Click(Sender: TObject);
var
  jArr     : TJSONArray;
  jObj     : TJSONObject;
  JString  : TJSONString;
  I        : Integer;
  LisItem  : TListViewItem;
begin
  inherited;
   ListView2.ClearItems;
   ListView2.BeginUpdate;
   jArr   := dtmConexao.PedFaturadoId(StrToInt(Edit1.Text));
  for I   := 0 to jArr.Count - 1 do
  begin
    jObj           := jArr.Items[I] as TJSONObject;
    LisItem        := ListView2.Items.Add;
    LisItem.Detail := jObj.GetValue('ID_CLIENTE').Value;
    LisItem.Text   := 'Código:  ' + jObj.GetValue('ID_CLIENTE').Value;
    LisItem.Data[TMultiDetailAppearanceNames.Detail1]:='Descrição:  '+ jObj.GetValue('DT_FATURAMENTO').Value;
    LisItem.Data[TMultiDetailAppearanceNames.Detail2]:='Saldo:  '+ jObj.GetValue('ID_PEDIDO'     ).Value;
  end;
  ListView2.EndUpdate;
end;

end.
