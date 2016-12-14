unit uFrmLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uFrmBase, FMX.Controls.Presentation, FMX.Layouts, FMX.Objects, FMX.Edit;//FMX.Helpers.Android,Androidapi.Helpers;

type
  TfrmLoginBase = class(TfrmBase)
    Layout1: TLayout;
    btnEntrar: TButton;
    cxUsuario: TEdit;
    cxSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    Layout2: TLayout;
    Label3: TLabel;
    lberro: TLabel;
    procedure btnEntrarClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLoginBase: TfrmLoginBase;

implementation

{$R *.fmx}
{$R *.iPhone.fmx IOS}
{$R *.iPhone4in.fmx IOS}
{$R *.iPhone47in.fmx IOS}
{$R *.SmXhdpiPh.fmx ANDROID}
{$R *.NmXhdpiPh.fmx ANDROID}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.LgXhdpiTb.fmx ANDROID}

uses uFrmConexao, uFrmMenu, uFrmMenuPrincipal;//FMX.Helpers.Android,Androidapi.Helpers;

procedure TfrmLoginBase.btnEntrarClick(Sender: TObject);
begin
  inherited;
 if dtmConexao.GetUsuario(cxUsuario.Text,cxSenha.Text)= true then
 begin
    if not Assigned(frmMenuPrincipal) then
    begin
      Application.CreateForm(TfrmMenuPrincipal,frmMenuPrincipal);
      frmMenuPrincipal.Show;
    //frmLoginBase.DisposeOf;
    end else
    begin
      frmMenu.DisposeOf;
      Application.CreateForm(TfrmMenuPrincipal,frmMenuPrincipal);
      frmMenuPrincipal.Show;
    end;
 end else
  begin
  lberro.Opacity := 1;
  lbErro.Enabled := true;
  end;
end;

procedure TfrmLoginBase.Button1Click(Sender: TObject);
begin
  inherited;
 //close;
end;

procedure TfrmLoginBase.Button2Click(Sender: TObject);
begin
  inherited;
 cxUsuario.text := '';
 cxSenha.Text := '';
end;
 {
 CanClose := False;
  MessageDlg('Deseja realmente fechar a aplicação desenvolvida no Delphi XE7?',
    System.UITypes.TMsgDlgType.mtInformation,
    [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo], 0,
    procedure(const BotaoPressionado: TModalResult)
      begin
        case BotaoPressionado of
          mrYes: begin
              SharedActivity.Finish;
            end;
          mrNo: begin
              ShowMessage('Você respondeu não');
            end;
        end;
      end
    );
 }
procedure TfrmLoginBase.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

  inherited;
  {
  begin

    CanClose := False;

    MessageDlg
      ('Deseja realmente fechar o Moldenox Mobile 1.0?',

      System.UITypes.TMsgDlgType.mtInformation,

      [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo], 0,

      procedure(const BotaoPressionado: TModalResult)

      begin

        case BotaoPressionado of

          mrYes:
            begin

             SharedActivity.Finish;
             Application.Terminate;
            end;

          mrNo:
            begin

              ShowMessage('Moldenox Mobile - Entre com Usuario e Senha');

            end;

        end;

      end

      );

  end;
    }
end;

procedure TfrmLoginBase.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
  var
  Fechar : Boolean;

begin
 {
  if Key = vkHardwareBack then
      begin
        key := 0;
        FormCloseQuery(Sender, Fechar);
      end;
      }
end;


end.
