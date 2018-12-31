function lpgcloud
	set usage "Usage:\nlpgcloud {server}\n\tConnect to {server}. For available servers run 'lpgcloud list'\nlpgcloud list\n\tList available GCloud servers"
	if count $argv > /dev/null
		if test $argv[1] = 'list'
			echo "devapp"
			echo "devmysql"
			echo "reports"
			echo "boomi"
			echo "services"
			echo "bigdata"
			echo "prodrr"
		else if test $argv = 'devapp'
			gcloud compute --project sturdy-yen-112617 ssh --zone us-central1-b app101
		else if test $argv = 'devmysql'
			gcloud compute --project sturdy-yen-112617 ssh --zone us-central1-b mysql101
		else if test $argv = 'boomi'
			gcloud compute --project lp-development ssh --zone us-west1-a boomi001
		else if test $argv = 'services'
			gcloud compute --project lp-prod ssh --zone us-central1-b services
		else if test $argv = 'reports'
			gcloud compute --project lp-prod ssh --zone us-central1-b reports-mysql101
		else if test $argv = 'bigdata'
			gcloud compute --project lp-bigdata ssh --zone us-central1-a container101
		else if test $argv = 'prodrr'
			gcloud compute --project lp-engineering ssh --zone us-central1-b mysql103rr
		else
			echo -e $usage
		end
	else
		echo -e $usage
	end
end
