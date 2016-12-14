unit uFrmPersonalizar;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uFrmBase, FMX.ListBox, FMX.Layouts, FMX.Controls.Presentation, FMX.Objects;

type
  TFrmPersonalizar = class(TfrmBase)
    ToolBar1: TToolBar;
    Label1: TLabel;
    ListBox1: TListBox;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    stAmakrits: TStyleBook;
    stAquaGraphite: TStyleBook;
    stBlend: TStyleBook;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    swAmakrits: TSwitch;
    swAqua: TSwitch;
    swBlend: TSwitch;
    Switch4: TSwitch;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPersonalizar: TFrmPersonalizar;

implementation

{$R *.fmx}
{$R *.SmXhdpiPh.fmx ANDROID}

end.
