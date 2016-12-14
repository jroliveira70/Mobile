object dtmConexao: TdtmConexao
  OldCreateOrder = False
  Height = 360
  Width = 467
  object RestConect: TRESTClient
    Params = <>
    HandleRedirects = True
    Left = 48
    Top = 32
  end
  object RestReq: TRESTRequest
    Client = RestConect
    Params = <>
    Response = RestResp
    SynchronizedEvents = False
    Left = 48
    Top = 96
  end
  object RestResp: TRESTResponse
    Left = 56
    Top = 168
  end
end
