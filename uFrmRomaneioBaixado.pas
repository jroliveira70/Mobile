unit uFrmRomaneioBaixado;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uFrmBase, FMX.ListView.Types, FMX.DateTimeCtrls, FMX.ListView, FMX.Layouts,
  FMX.ListBox, FMX.Controls.Presentation, FMX.Objects,System.JSON,
  MultiDetailAppearanceU;

type
  TfrmRomaneioBaixado = class(TfrmBase)
    ToolBar1: TToolBar;
    Label1: TLabel;
    ListBox1: TListBox;
    ListView1: TListView;
    DateEdit1: TDateEdit;
    Button1: TButton;
    btnBack: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRomaneioBaixado: TfrmRomaneioBaixado;

implementation

{$R *.fmx}
{$R *.SmXhdpiPh.fmx ANDROID}
{$R *.NmXhdpiPh.fmx ANDROID}
{$R *.LgXhdpiTb.fmx ANDROID}

uses uFrmConexao, uFrmMenuPrincipal;

procedure TfrmRomaneioBaixado.Button1Click(Sender: TObject);
var
  jArr     : TJSONArray;
  jObj     : TJSONObject;
  JString  : TJSONString;
  I        : Integer;
  LisItem  : TListViewItem;
 // dia,mes,ano : integer;
  dia, mes, ano : Word;
begin
  inherited;
   DecodeDate(DateEdit1.Date,ano,mes,dia);
   ListView1.ClearItems;
   ListView1.BeginUpdate;
   jArr   := dtmConexao.RomaneioBaixado('B',dia,mes,ano);
   for I   := 0 to jArr.Count - 1 do
  begin
    jObj           := jArr.Items[I] as TJSONObject;
    LisItem        := ListView1.Items.Add;
    LisItem.Detail := jObj.GetValue('ID_ROMANEIO').Value;
    LisItem.Text   := 'Entrega:  ' + jObj.GetValue('DT_ENTREGA').Value;
    LisItem.Data[TMultiDetailAppearanceNames.Detail1]:='Doc.:  '+ jObj.GetValue('ID_ROMANEIO').Value;
    LisItem.Data[TMultiDetailAppearanceNames.Detail2]:='Valor:  '+ jObj.GetValue('VL_TOTAL').Value;
    LisItem.Data[TMultiDetailAppearanceNames.Detail3]:='Transportadora:  '+ jObj.GetValue('NM_TRANSPORTADORA').Value;
  end;
  ListView1.EndUpdate;

end;

procedure TfrmRomaneioBaixado.FormCreate(Sender: TObject);
begin
  inherited;
{$IFDEF ANDROID}
  btnBack.Visible := false;
{$ENDIF}
end;

procedure TfrmRomaneioBaixado.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
  if Key = vkHardwareBack then
  begin
    frmMenuPrincipal.Show;
    Key := 0;
    frmRomaneioBaixado.DisposeOf;

  end;
end;

end.
