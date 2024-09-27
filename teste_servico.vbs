Dim serviceNameStart
Dim objWMIService, colServices, objService
Dim services, stopResult

serviceNameStart = "firebird"  ' Substitua por uma parte do nome desejada
services = ""

' Conectar ao serviço WMI
Set objWMIService = GetObject("winmgmts:\\.\root\cimv2")
Set colServices = objWMIService.ExecQuery("SELECT * FROM Win32_Service WHERE State = 'Running'")

' Iterar pelos serviços
For Each objService In colServices
    If LCase(Left(objService.Name, Len(serviceNameStart))) = LCase(serviceNameStart) Then
        services = services & objService.Name & vbCrLf

        ' Tentar parar o serviço
        stopResult = objService.StopService()
        If stopResult = 0 Then
            services = services & " (Parado com sucesso)" & vbCrLf
        Else
            services = services & " (Falha ao parar, código de erro: " & stopResult & ")" & vbCrLf
        End If
    End If
Next

' Exibir os resultados
If services <> "" Then
    MsgBox "Serviços ativos que começam com """ & serviceNameStart & """ e seus resultados: " & vbCrLf & services
Else
    MsgBox "Nenhum serviço ativo encontrado que comece com """ & serviceNameStart & """."
End If
