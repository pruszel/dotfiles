function dockerr
    switch "$argv"
        ## Start Docker for Mac app
        case start
            __dockerr_start

        ## Quit Docker for Mac app
        case quit q
            osascript -e 'quit app "Docker"'
        
        ## Run php-apache container
        case "run php"
            echo "Starting php:7.2-apache container"
            docker run -d -p 80:80 --name (basename $PWD) -v "$PWD":/var/www/html php:7.2-apache

        ## Stop all running containers
        case "stopall"
            docker stop (docker ps -a -q)
            echo "All containers stopped."
        
        ## Remove all stopped containers
        case "cleanup"
            docker rm (docker ps -a -q)
            echo "All stopped containers removed."
            
        case \*
            __dockerr_usage
    end
end

function __dockerr_usage
    echo "Usage: dockerr [options] arguments..."
    echo "Arguments:"
    echo "start : Start Docker for Mac app"
    echo "quit : Quit Docker for Mac app"
    echo "run php : Run php-apache container"
    echo "stop -a : Stop all running containers"
    echo "cleanup : Remove all stopped containers"
end

function __dockerr_start
    set dockerIsRunning (ps aux | grep Docker.app | wc -l)
    if test $dockerIsRunning -gt 1
        echo "Docker is already running."
    else
        open -a /Users/peter/Applications/Docker.app
        echo "Docker started."
    end
end

