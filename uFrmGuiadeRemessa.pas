unit uFrmGuiadeRemessa;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uFrmBase, FMX.Controls.Presentation, FMX.Layouts, FMX.Objects,
  FMX.ListView.Types, FMX.ListView, FMX.TabControl, FMX.DateTimeCtrls, system.JSON,
  MultiDetailAppearanceU;

type
  TFrmGuiadeRemessa = class(TfrmBase)
    ToolBar1: TToolBar;
    Label1: TLabel;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    ListView1: TListView;
    ListView2: TListView;
    Layout1: TLayout;
    DataAberto: TDateEdit;
    Button1: TButton;
    Layout2: TLayout;
    DataBaixa: TDateEdit;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGuiadeRemessa: TFrmGuiadeRemessa;

implementation

{$R *.fmx}
{$R *.SmXhdpiPh.fmx ANDROID}
{$R *.NmXhdpiPh.fmx ANDROID}
{$R *.LgXhdpiTb.fmx ANDROID}

uses uFrmConexao, uFrmMenuPrincipal;

procedure TFrmGuiadeRemessa.Button1Click(Sender: TObject);
var
  jArr   : TJSONArray;
  jObj   : TJSONObject;
  I      : integer;
  dia, mes, ano :word;
  Ltitem : TListViewItem;
begin
  inherited;
  DecodeDate(DataAberto.Date, ano, mes, dia);
  jArr := dtmConexao.GuiaRemessa('A', dia, mes, ano);
  ListView1.ClearItems;
  ListView1.BeginUpdate;
  for I := 0 to jArr.Size - 1 do
  begin
    jObj := jArr.Items[I] as TJSONObject;
    Ltitem := ListView1.Items.Add;
    Ltitem.Detail := jObj.GetValue('ID_GUIAREMESSA').Value;
    Ltitem.Text := jObj.GetValue('NM_PRODUTO').Value;
    Ltitem.Data[TMultiDetailAppearanceNames.Detail1] := 'Quant.  ' +
      jObj.GetValue('QUANT').Value;
    Ltitem.Data[TMultiDetailAppearanceNames.Detail2] := 'Recebida:  ' +
      jObj.GetValue('QUANT_RECEBIDA').Value;
    Ltitem.Data[TMultiDetailAppearanceNames.Detail3] := 'Usuario:  ' +
      jObj.GetValue('USUARIO').Value;
  end;
  ListView1.EndUpdate;
end;

procedure TFrmGuiadeRemessa.Button2Click(Sender: TObject);
var
  jArr   : TJSONArray;
  jObj   : TJSONObject;
  I      : integer;
  dia, mes, ano :word;
  Ltitem : TListViewItem;
begin
  inherited;
    DecodeDate(DataBaixa.Date,ano,mes,dia);
    jArr := dtmConexao.GuiaRemessa('B',dia,mes,ano);
    ListView2.ClearItems;
    ListView2.BeginUpdate;
    for I := 0 to jArr.Size - 1 do
    begin
      jObj := jArr.Items[I] as TJSONObject;
      Ltitem := ListView2.Items.Add;
      Ltitem.Detail := jObj.GetValue('ID_GUIAREMESSA').Value;
      Ltitem.Text := jObj.GetValue('NM_PRODUTO').Value;
      Ltitem.Data[TMultiDetailAppearanceNames.Detail1] := 'Quant.  ' +
      jObj.GetValue('QUANT').Value;
      Ltitem.Data[TMultiDetailAppearanceNames.Detail2] := 'Recebida:  ' +
      jObj.GetValue('QUANT_RECEBIDA').Value;
      Ltitem.Data[TMultiDetailAppearanceNames.Detail3] := 'Usuario:  ' +
      jObj.GetValue('USUARIO').Value;
    end;
    ListView2.EndUpdate;
  end;

procedure TFrmGuiadeRemessa.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
 if key = vkHardwareBack then
   begin
     FrmGuiadeRemessa.DisposeOf;
     frmMenuPrincipal.Show;
     key :=0;
   end;
end;

end.
