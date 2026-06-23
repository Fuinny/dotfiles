# Environment Setup
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/Users/fuinny/.dotnet/tools:$PATH"

# Homebrew settings
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_UPGRADE_GREEDY_CASKS=1

# Opt-out of Microsoft .NET telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# Aliases
alias cs="csharprepl"
alias pip="pip3"
alias python="python3"
alias privacy-reset="tccutil reset All"
alias startup-reset="sudo sfltool resetbtm"
alias quarantine-reset="sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"
alias update="sudo softwareupdate -i -a && brew update && brew upgrade && brew upgrade --cask --greedy && brew autoremove && brew cleanup -s"
