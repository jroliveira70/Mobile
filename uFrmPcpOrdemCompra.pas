unit uFrmPcpOrdemCompra;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uFrmBase, FMX.Controls.Presentation, FMX.Layouts, FMX.Objects,
  FMX.ListView.Types, FMX.ListView, MultiDetailAppearanceU, system.JSON;

type
  TfrmPcpOrdemCompra = class(TfrmBase)
    ToolBar1: TToolBar;
    Label1: TLabel;
    ListView: TListView;
    btnBack: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure btnBackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPcpOrdemCompra: TfrmPcpOrdemCompra;

implementation

{$R *.fmx}
{$R *.iPhone.fmx IOS}
{$R *.SmXhdpiPh.fmx ANDROID}

uses uFrmConexao, uFrmMenuPrincipal;
{$R *.SmXhdpiPh.fmx ANDROID}

procedure TfrmPcpOrdemCompra.btnBackClick(Sender: TObject);
begin
  inherited;
  frmPcpOrdemCompra.DisposeOf;
  frmMenuPrincipal.Show;
end;

procedure TfrmPcpOrdemCompra.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
    if key = vkHardwareBack then
   begin
     frmPcpOrdemCompra.DisposeOf;
     frmMenuPrincipal.Show;
     key :=0;
   end;
end;

procedure TfrmPcpOrdemCompra.FormShow(Sender: TObject);
var
  jArr: TJSONArray;
  jObj: TJSONObject;
  JString: TJSONString;
  I: integer;
  codigo: string;
  Ltitem: TListViewItem;
begin
  inherited;
{$IFDEF ANDROID}
  btnBack.Visible := false;
{$ENDIF}
  jArr := dtmConexao.OrdemCompraAberto('A');
  ListView.ClearItems;
  ListView.BeginUpdate;
  for I := 0 to jArr.Size - 1 do
  begin
    jObj := jArr.Items[I] as TJSONObject;
    Ltitem := ListView.Items.Add;
    Ltitem.Detail := jObj.GetValue('ID_ORDEM').Value;
    Ltitem.Text := jObj.GetValue('ID_ORDEM').Value;
    Ltitem.Data[TMultiDetailAppearanceNames.Detail1] := 'Ordem Nº  ' +
      jObj.GetValue('ID_ORDEM').Value;
    Ltitem.Data[TMultiDetailAppearanceNames.Detail2] := 'Emissão:  ' +
      jObj.GetValue('DT_EMISSAO').Value;
  end;
  ListView.EndUpdate;
end;

end.

