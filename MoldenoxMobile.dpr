program MoldenoxMobile;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFrmBase in 'uFrmBase.pas' {frmBase},
  uLogin in 'uLogin.pas' {frmLogin},
  uFrmMenu in 'uFrmMenu.pas' {frmMenu},
  uFrmConexao in 'uFrmConexao.pas' {dtmConexao: TDataModule},
  uFrmPcpProduto in 'uFrmPcpProduto.pas' {frmPcpProdutos},
  uFrmLogin in 'uFrmLogin.pas' {frmLoginBase},
  uFrmOrdemCompra in 'uFrmOrdemCompra.pas' {frmOrdemCompra},
  MultiDetailAppearanceU in '..\..\..\..\Public\Documents\Embarcadero\Studio\16.0\Samples\Object Pascal\Mobile Samples\User Interface\ListView\SampleListViewMultiDetailAppearance\MultiDetailAppearanceU.pas',
  uFrmProdOrdemCompra in 'uFrmProdOrdemCompra.pas' {frmProdOrdemCompra},
  uFrmComprasPed in 'uFrmComprasPed.pas' {frmComprasPed},
  uFrmComprasPedItens in 'uFrmComprasPedItens.pas' {frmComprasPedItens},
  uFrmMenuPrincipal in 'uFrmMenuPrincipal.pas' {frmMenuPrincipal},
  uFrmPcpProdComprado in 'uFrmPcpProdComprado.pas' {frmPcpProdComprados},
  uFrmPcpOrdemCompra in 'uFrmPcpOrdemCompra.pas' {frmPcpOrdemCompra},
  uFrmRomaneioBaixado in 'uFrmRomaneioBaixado.pas' {frmRomaneioBaixado},
  uFrmRomaneioAberto in 'uFrmRomaneioAberto.pas' {frmRomaneioAberto},
  uFrmGuiadeRemessa in 'uFrmGuiadeRemessa.pas' {FrmGuiadeRemessa},
  uFrmPersonalizar in 'uFrmPersonalizar.pas' {FrmPersonalizar},
  ufrmPedFatur in 'ufrmPedFatur.pas' {frmBase1},
  uFrmAjuda in 'uFrmAjuda.pas' {frmAjuda};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmLoginBase, frmLoginBase);
  Application.CreateForm(TdtmConexao, dtmConexao);
  Application.CreateForm(TfrmAjuda, frmAjuda);
  Application.Run;
end.
