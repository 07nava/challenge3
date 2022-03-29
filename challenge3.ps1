[CmdletBinding()]
param(
        [Parameter(Mandatory=$true)][ValidateNotNullOrEmpty()] [string]$key
     )
function Get-keyvalue
{
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory=$true)][ValidateNotNullOrEmpty()] [string]$key
    )
$object = '{"x": {"y": {"z": "a"}}}'
$localkey=$key.Replace('\','')
$keycount=$localkey.Length
#Add-Type -AssemblyName System.Web.Extensions
$JS = New-Object System.Web.Script.Serialization.JavaScriptSerializer
$data = $JS.DeserializeObject($object)
if ($keycount -eq 1)
{
$keyvalue=$data.$key
echo "Input Value : $key"
echo "Output Value : $keyvalue"
}
elseif ($keycount -eq 2)
{
$key1,$key2 = $key.Split("\")
$keyvalue="$data.$key1.$key2"
echo "Input Value : $key"
echo "Output Value : $keyvalue"
}
else
{
$key1,$key2,$key3 = $key.Split("\")
$keyvalue="$data.$key1.$key2.$key3"
echo "Input Value : $key"
echo "Output Value : $keyvalue"
}

}
Get-keyvalue -key $key
