function synergy
	set usage "Usage:\n\tsynergy stop\n\tsynergy start"
	if count $argv > /dev/null
		if test $argv[1] = 'stop'
			launchctl unload /Library/LaunchAgents/com.symless.synergy.synergy-service.plist
			sudo killall synergy-core
		else if test $argv = 'start'
			launchctl load /Library/LaunchAgents/com.symless.synergy.synergy-service.plist
		else
			echo -e $usage
		end
	else
		echo -e $usage
	end
end
