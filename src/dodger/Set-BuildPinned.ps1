function Set-BuildPinned
{
  [CmdletBinding()]
  Param(
      [Parameter(Mandatory=$true)]
      [string] $BuildId,
      [Parameter(Mandatory=$true)]
      [string] $User,
      [Parameter(Mandatory=$true)]
      [string] $Password
  )
  Process
  {
      $locator = "id:$BuildId"
      $url = "https://teamcity.unic.com/httpAuth/app/rest/builds/$locator/pin"
      $authInfo = $user + ":" + $password
      $authInfo = [System.Convert]::ToBase64String([System.Text.Encoding]::Default.GetBytes($authInfo))
      $request = [System.Net.WebRequest]::Create($url)

      $request.Headers["Authorization"] = "Basic " + $authInfo
      $request.Method = "PUT"
      $request.GetResponse()
  }
}
