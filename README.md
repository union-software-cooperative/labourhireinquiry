# docker-ruby-template

This project sets up a ruby development environment with a postgresql database.   Bundle install and migrating the database is left to docker runtime (via a script in app/start.docker) rather than at build time (which is a pain because everytime your gemfile changes it has to install all gems from scratch).  

```
git clone git@github.com:union-software-cooperative/docker-ruby-template.git your-project-name
```

```
cd your-project-name
```

## basic docker usage
run containers (daemonised)
```
docker-compose up -d
```

see logs
```
docker-compose logs
```

Shell into the ruby app container
```
docker-compose exec app /bin/bash
```

## Using docker-compose shortcuts
typing docker-compose all the time can be tedious so add this to your ~/.bashrc or ~/.bash_profile

The first command makes editing and reloading your bash_profile easy.

The second command makes getting this repo easy.

```
# edit your bash profile
alias bp='vim ~/.bash_profile && . ~/.bash_profile'
# Get this repo!
get-ruby() { git clone git@github.com:union-software-cooperative/docker-ruby-template.git . ; rm -rf .git ; }
# docker shortcuts
alias ds='docker stats'
alias dc='docker-compose'
alias dce='docker-compose exec'
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dcr='docker-compose run'
alias dcs='docker-compose stop'
alias dcb='docker-compose build'
alias dcps='docker-compose ps'
alias dcl='docker-compose logs'
alias dckill='docker-compose kill'
alias dps='docker ps'
alias dk='docker kill'
alias dkall='docker kill $(docker ps -q)'
alias drestart="osascript -e 'quit app \"Docker\"' && open -a Docker"
dceb() { docker-compose exec $1 /bin/bash ; }
dcub() { docker-compose up -d $1 && docker-compose exec $1 /bin/bash ; }
```

## Persisting data
Mount your pgdata and bundle data on an external docker volume, so if you rebuild or remove your db or www containers you don't loose all your data and don't have to reinstall all your gems.

## developing with docker on osx
On osx docker volume mounts to the host are suuupperrr slow.

mount your app volume like this in the override file
```
cp docker-compose.override.yml.example docker-compose.override.yml
```

```
  app:
    volumes:
      - ./app:/app:delegated
```

The override file will not actually run your app, but instead leave the container running so you can shell in and run it yourself.  This makes debugging easy.  

The short cut for running your app then shelling in is
`dcub app`

## Setup git for your new project

unlink the docker-ruby-template repo
```
rm -rf .git
```

make a new repo on github

```
git init
git remote add origin your-git-repo
git add .
git commit -m "Initial commit."
git push origin master
```
