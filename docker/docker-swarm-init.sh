$ docker swarm init
# Swarm initialized: current node (5gjwiy8e3l4pqrvrz6ixplrnw) is now a manager.
# 
# To add a worker to this swarm, run the following command:
# 
#     docker swarm join --token SWMTKN-1-1dxvinedorsqgxc0nb7rg3vpgsmmcs7mwn2onebnccev05ca7l-8vdamkos52tcxo0qzhhis0aoe 172.16.3.16:2377
#     
#     To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.

$ docker swarm join-token manager
#To add a manager to this swarm, run the following command:
#
#    docker swarm join --token SWMTKN-1-1dxvinedorsqgxc0nb7rg3vpgsmmcs7mwn2onebnccev05ca7l-ezkliq4p4g67hqc6275dktro8 172.16.3.16:2377

$ docker swarm join-token worker
#To add a worker to this swarm, run the following command:
#
#    docker swarm join --token SWMTKN-1-1dxvinedorsqgxc0nb7rg3vpgsmmcs7mwn2onebnccev05ca7l-8vdamkos52tcxo0qzhhis0aoe 172.16.3.16:2377
