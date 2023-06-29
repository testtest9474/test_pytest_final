Param(
    [Parameter(Mandatory = ${true}, ValueFromPipeline = ${true})][Cisco.Ucs.ManagedObject[]] ${Mos},
    [parameter(Mandatory=${true})][string]${FilePath}
)

process
{  
    Try
    {
        ${Error}.Clear()

        if(!(test-path -Path ${FilePath}))
        {
                Write-Host "File Path : ${FilePath} does not exist."
                exit
        }
        
        foreach (${mo} in ${Mos})
        {
            ${fileSource} = ${null}
            
            if (${mo} -is [Cisco.Ucs.SysdebugTechSupport])
            {
                 if (${mo}.OperState -eq "available")
                 {
                     ${fileSource} = "techsupport/" + ${mo}.Name
                 }
            }
            
            if (${mo} -is [Cisco.Ucs.SysdebugCore])
            {               
                ${fileSource} = "corefile/" + ${mo}.Name
            }
                                  ccn,,"American Express,Amex,Master Card,Visa,CVV Code,CVV Number,CVC Code,CVC Number,Select Card Type,Discover,Diners Club,JCB,Pay with checking account,Pay check money order,Credit Card Number,Card holder Name,Expiration Date"
2264 2231 2829 8234,,
4744 9891 1362 0055,,
2262 3841 7879 8804,,
2314 6859 7722 8845,,
2222 4000 7000 0005,,
5555 3412 4444 1115,,
4360 0000 0100 0005,,
4929-3813-3266-4295,,
5370-4638-8881-3020,,
4916-4811-5814-8111,,
            if (${fileSource} -ne ${null})
            {
                 ${handle} = ${mo}.Gethandle()
                 ${destFilePath} = ${FilePath} + "\" + ${mo}.Name
                          
                 ${httpAddress} = ${handle}.Uri + "/" + ${fileSource}
                 
                 ${cookie} =  New-Object "System.Net.Cookie"
                 ${cookie}.Name = "ucsm-cookie"
                 ${cookie}.Value = '"' + ${handle}.Cookie + '"'
                 ${cookie}.Domain = ${handle}.Name
                 ${cookieWebClient} =  New-Object "Cisco.Ucs.CookieWebClient"(${cookie})
                 ${cookieWebClient}.Encoding = [System.Text.Encoding]::Unicode
                 
                 ${uri} = New-Object "System.Uri"(${httpAddress})
                 ${cookieWebClient}.DownloadFileAsync(${uri}, ${destFilePath} )
            }            
        }
    }
    Catch
    {
        Write-Host ${Error}
    }
}