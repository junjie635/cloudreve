docker build --no-cache -f go1.22.1/Dockerfile -t go1.22.1 .
git clone --recurse-submodules https://gitclone.com/github.com/cloudreve/Cloudreve.git
cp Dockerfile Cloudreve/Dockerfile
docker build --no-cache -f Cloudreve/Dockerfile -t cloudreve .
# docker run --rm -p 5212:5212 cloudreve
docker-compose up