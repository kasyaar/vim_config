Set-PSReadLineOption -EditMode Emac
New-Alias vim nvim
New-Alias gvim nvim-qt
New-Alias g git
New-Alias i identify
Remove-Alias rm
New-Alias wrm Remove-Item
Remove-Alias mv
New-Alias wmv Move-Item
Remove-Alias ls
New-Alias wls Get-ChildItem
$env:EDITOR="vim"
function prompt {
    # $out="`e[94m[$(Get-Location)\]`e[00m`r`n$("+"*(Get-Location -Stack).Count)`e[32m>`e[0m "

    $loc = $executionContext.SessionState.Path.CurrentLocation;

    $out="`e[94m[$(Get-Location)\]`e[00m`r`n$("+"*(Get-Location -Stack).Count)`e[32m>`e[0m "
    if ($loc.Provider.Name -eq "FileSystem") {
        $out += "$([char]27)]9;9;`"$($loc.ProviderPath)`"$([char]27)\"
    }
    # $out += "$(($nestedPromptLevel + 1)) ";
    return $out
}

